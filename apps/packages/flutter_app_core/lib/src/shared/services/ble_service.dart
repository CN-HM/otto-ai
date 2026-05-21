import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

import '../models/device_models.dart';
import 'app_logger.dart';
import 'ble_support.dart';
import 'blufi_client.dart';

class BleService {
  BleService({required this.logger});

  static const int _maxDiscoveredDevices = 24;
  static const int _emitIntervalMilliseconds = 350;
  static const int _rssiUpdateThreshold = 6;
  static const int _deviceRefreshIntervalMilliseconds = 1500;
  static const String _unknownDeviceName = 'Unknown';
  static final FlutterReactiveBle _ble = FlutterReactiveBle();

  final AppLogger logger;
  final Map<String, BluetoothDeviceInfo> _devicesById = <String, BluetoothDeviceInfo>{};
  final Map<String, int> _lastDeviceUpdateAtById = <String, int>{};
  StreamSubscription<DiscoveredDevice>? _scanSubscription;
  Timer? _emitTimer;
  Timer? _scanTimer;
  Timer? _diagnosticTimer;
  Completer<void>? _activeScanCompleter;
  void Function(List<BluetoothDeviceInfo>)? _onChanged;
  bool _devicesChanged = false;
  bool _isScanning = false;
  int _scanSessionId = 0;
  final Stopwatch _scanStopwatch = Stopwatch();
  int _scanRawResultCount = 0;
  int _scanAcceptedResultCount = 0;
  int _scanIgnoredResultCount = 0;
  int _scanEmitCount = 0;
  int? _firstScanResultAtMilliseconds;

  List<BluetoothDeviceInfo> get devices => List.unmodifiable(_orderedDevices());

  Future<void> startScan({required void Function(List<BluetoothDeviceInfo>) onChanged}) async {
    try {
      _debugLog('startScan requested active=$_isScanning previousSession=$_scanSessionId devices=${_devicesById.length}');
      await stopScan();
      await BleSupport.ensureReady(_ble, debugCategory: 'BleService');
      _devicesById.clear();
      _lastDeviceUpdateAtById.clear();
      _devicesChanged = false;
      _onChanged = onChanged;
      _resetScanDiagnostics();
      final scanMode = defaultTargetPlatform == TargetPlatform.android
          ? ScanMode.balanced
          : ScanMode.lowLatency;

      final scanCompleter = Completer<void>();
      _activeScanCompleter = scanCompleter;
      final scanSessionId = ++_scanSessionId;
      _isScanning = true;
      _scanStopwatch
        ..reset()
        ..start();
      _startDiagnosticHeartbeat(scanSessionId, scanMode);
      _debugLog('scan session=$scanSessionId ready status=${_ble.status} scanMode=$scanMode');

      _scanSubscription = _ble.scanForDevices(
        withServices: const [],
        scanMode: scanMode,
      ).listen(
        (result) {
          if (scanSessionId != _scanSessionId) {
            return;
          }
          try {
            _scanRawResultCount++;
            _firstScanResultAtMilliseconds ??= _scanElapsedMilliseconds;
            if (_shouldLogScanResult(_scanRawResultCount)) {
              final name = result.name.trim().isNotEmpty ? result.name.trim() : _unknownDeviceName;
              _debugLog(
                'raw result session=$scanSessionId index=$_scanRawResultCount id=${result.id} name=$name rssi=${result.rssi}',
              );
            }
            if (_registerScanResult(result)) {
              _scanAcceptedResultCount++;
              if (_shouldLogScanResult(_scanAcceptedResultCount)) {
                final name = result.name.trim().isNotEmpty ? result.name.trim() : _unknownDeviceName;
                _debugLog(
                  'accepted result session=$scanSessionId index=$_scanAcceptedResultCount devices=${_devicesById.length} id=${result.id} name=$name rssi=${result.rssi}',
                );
              }
              _devicesChanged = true;
              _scheduleEmit();
            } else {
              _scanIgnoredResultCount++;
            }
          } catch (error, stackTrace) {
            unawaited(logger.error('BleService', 'Error in scan results callback', error, stackTrace));
          }
        },
        onError: (error, stackTrace) {
          _debugLog('scan stream error session=$scanSessionId error=$error');
          unawaited(logger.error('BleService', 'Scan stream error', error, stackTrace));
          if (!scanCompleter.isCompleted) {
            scanCompleter.completeError(error, stackTrace);
          }
          unawaited(_finishScan(scanSessionId, reason: 'stream-error'));
        },
        onDone: () {
          _debugLog('scan stream completed session=$scanSessionId');
          unawaited(logger.info('BleService', 'Scan stream completed'));
          unawaited(_finishScan(scanSessionId, reason: 'stream-done'));
        },
        cancelOnError: false,
      );

      _scanTimer = Timer(const Duration(seconds: 12), () {
        _debugLog('scan timeout reached session=$scanSessionId elapsedMs=$_scanElapsedMilliseconds');
        unawaited(_finishScan(scanSessionId, reason: 'timeout'));
      });
      await logger.info(
        'BleService',
        'BLE scan started',
      );
      await scanCompleter.future;
      await logger.info('BleService', 'BLE scan finished discovered=${_devicesById.length}');
    } catch (error, stackTrace) {
      await logger.error('BleService', 'Failed to start scan', error, stackTrace);
      rethrow;
    }
  }

  Future<void> stopScan() async {
    _debugLog(
      'stopScan requested session=$_scanSessionId active=$_isScanning raw=$_scanRawResultCount accepted=$_scanAcceptedResultCount ignored=$_scanIgnoredResultCount devices=${_devicesById.length}',
    );
    _scanSessionId++;
    _scanTimer?.cancel();
    _scanTimer = null;
    _emitTimer?.cancel();
    _emitTimer = null;
    _diagnosticTimer?.cancel();
    _diagnosticTimer = null;
    await _scanSubscription?.cancel();
    _scanSubscription = null;
    _isScanning = false;
    _scanStopwatch.stop();
    _emitPendingChanges();
    if (_activeScanCompleter != null && !_activeScanCompleter!.isCompleted) {
      _activeScanCompleter!.complete();
    }
    _activeScanCompleter = null;
    _onChanged = null;
    _debugLog(
      'stopScan completed session=$_scanSessionId elapsedMs=$_scanElapsedMilliseconds emits=$_scanEmitCount devices=${_devicesById.length}',
    );
  }

  Future<BlufiProvisioningResult> provisionWifi(
    String deviceId, {
    required String ssid,
    required String password,
    List<int>? customData,
  }) async {
    try {
      if (_isScanning) {
        await stopScan();
        await logger.info('BleService', 'Stopped scan before BLUFI provisioning for deviceId=$deviceId');
      }

      return await BlufiClient(
        deviceId: deviceId,
        logger: logger,
      ).provisionWifi(
        ssid: ssid,
        password: password,
        customData: customData == null ? null : Uint8List.fromList(customData),
      );
    } catch (error, stackTrace) {
      await logger.error('BleService', 'BluFi provisioning failed', error, stackTrace);
      rethrow;
    }
  }

  Future<List<ProvisioningWifiNetwork>> fetchWifiNetworks(String deviceId) async {
    try {
      if (_isScanning) {
        await stopScan();
        await logger.info('BleService', 'Stopped scan before BLUFI Wi-Fi scan for deviceId=$deviceId');
      }

      return await BlufiClient(
        deviceId: deviceId,
        logger: logger,
      ).scanWifiNetworks();
    } catch (error, stackTrace) {
      await logger.error('BleService', 'BluFi Wi-Fi scan failed', error, stackTrace);
      rethrow;
    }
  }

  bool _registerScanResult(DiscoveredDevice result) {
    final id = result.id;
    final displayName = result.name.trim().isNotEmpty ? result.name.trim() : _unknownDeviceName;
    final nowMilliseconds = DateTime.now().millisecondsSinceEpoch;
    final deviceInfo = BluetoothDeviceInfo(
      id: id,
      name: displayName,
      macAddress: _displayAddress(id),
      rssi: result.rssi,
      isConnected: false,
    );
    final existing = _devicesById[id];
    if (existing == null) {
      if (_devicesById.length >= _maxDiscoveredDevices) {
        final weakestDevice = _devicesById.entries.reduce(
          (current, candidate) => candidate.value.rssi < current.value.rssi ? candidate : current,
        );
        if (deviceInfo.rssi <= weakestDevice.value.rssi) {
          return false;
        }
        _devicesById.remove(weakestDevice.key);
        _lastDeviceUpdateAtById.remove(weakestDevice.key);
      }
      _devicesById[id] = deviceInfo;
      _lastDeviceUpdateAtById[id] = nowMilliseconds;
      return true;
    }

    final lastUpdateAt = _lastDeviceUpdateAtById[id] ?? 0;
    final nameImproved = existing.name == _unknownDeviceName && deviceInfo.name != _unknownDeviceName;
    final addressChanged = existing.macAddress != deviceInfo.macAddress;
    final signalChanged = (existing.rssi - deviceInfo.rssi).abs() >= _rssiUpdateThreshold;
    final refreshDue = nowMilliseconds - lastUpdateAt >= _deviceRefreshIntervalMilliseconds;
    if (!nameImproved && !addressChanged && !(signalChanged && refreshDue)) {
      return false;
    }
    if (existing.name == deviceInfo.name &&
        existing.macAddress == deviceInfo.macAddress &&
        existing.rssi == deviceInfo.rssi &&
        existing.isConnected == deviceInfo.isConnected) {
      return false;
    }

    _devicesById[id] = deviceInfo;
    _lastDeviceUpdateAtById[id] = nowMilliseconds;
    return true;
  }

  void _scheduleEmit() {
    if (_emitTimer != null) {
      return;
    }
    _debugLog('schedule emit session=$_scanSessionId devices=${_devicesById.length}');
    _emitTimer = Timer(
      const Duration(milliseconds: _emitIntervalMilliseconds),
      () {
        _emitTimer = null;
        _emitPendingChanges();
      },
    );
  }

  void _emitPendingChanges() {
    if (!_devicesChanged) {
      return;
    }
    final orderedDevices = _orderedDevices();
    _scanEmitCount++;
    if (_shouldLogEmit(_scanEmitCount)) {
      _debugLog(
        'emit session=$_scanSessionId index=$_scanEmitCount devices=${orderedDevices.length} elapsedMs=$_scanElapsedMilliseconds',
      );
    }
    _onChanged?.call(List.unmodifiable(orderedDevices));
    _devicesChanged = false;
  }

  List<BluetoothDeviceInfo> _orderedDevices() {
    final devices = _devicesById.values.toList(growable: false);
    devices.sort((left, right) {
      final leftUnknown = left.name == _unknownDeviceName;
      final rightUnknown = right.name == _unknownDeviceName;
      if (leftUnknown != rightUnknown) {
        return leftUnknown ? 1 : -1;
      }
      final bySignal = right.rssi.compareTo(left.rssi);
      if (bySignal != 0) {
        return bySignal;
      }
      final byName = left.name.compareTo(right.name);
      if (byName != 0) {
        return byName;
      }
      return left.id.compareTo(right.id);
    });
    return devices;
  }

  Future<void> _finishScan(int scanSessionId, {required String reason}) async {
    if (scanSessionId != _scanSessionId) {
      return;
    }
    if (!_isScanning && _scanSubscription == null) {
      return;
    }

    _debugLog(
      'finishScan begin session=$scanSessionId reason=$reason elapsedMs=$_scanElapsedMilliseconds raw=$_scanRawResultCount accepted=$_scanAcceptedResultCount ignored=$_scanIgnoredResultCount emits=$_scanEmitCount devices=${_devicesById.length}',
    );

    _scanTimer?.cancel();
    _scanTimer = null;
    _emitTimer?.cancel();
    _emitTimer = null;
    _diagnosticTimer?.cancel();
    _diagnosticTimer = null;
    _scanStopwatch.stop();
    try {
      await _scanSubscription?.cancel();
      _scanSubscription = null;
      _isScanning = false;
    } catch (error, stackTrace) {
      await logger.error('BleService', 'Stop scan failed', error, stackTrace);
    } finally {
      _emitPendingChanges();
      if (_activeScanCompleter != null && !_activeScanCompleter!.isCompleted) {
        _activeScanCompleter!.complete();
      }
      _activeScanCompleter = null;
      _onChanged = null;
      _debugLog(
        'finishScan end session=$scanSessionId reason=$reason elapsedMs=$_scanElapsedMilliseconds raw=$_scanRawResultCount accepted=$_scanAcceptedResultCount ignored=$_scanIgnoredResultCount emits=$_scanEmitCount devices=${_devicesById.length}',
      );
    }
  }

  void _startDiagnosticHeartbeat(int scanSessionId, ScanMode scanMode) {
    _diagnosticTimer?.cancel();
    _diagnosticTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (scanSessionId != _scanSessionId || !_isScanning) {
        return;
      }
      _debugLog(
        'heartbeat session=$scanSessionId scanMode=$scanMode elapsedMs=$_scanElapsedMilliseconds raw=$_scanRawResultCount accepted=$_scanAcceptedResultCount ignored=$_scanIgnoredResultCount emits=$_scanEmitCount devices=${_devicesById.length} firstResultAtMs=${_firstScanResultAtMilliseconds?.toString() ?? 'none'}',
      );
    });
  }

  void _resetScanDiagnostics() {
    _diagnosticTimer?.cancel();
    _diagnosticTimer = null;
    _scanStopwatch
      ..stop()
      ..reset();
    _scanRawResultCount = 0;
    _scanAcceptedResultCount = 0;
    _scanIgnoredResultCount = 0;
    _scanEmitCount = 0;
    _firstScanResultAtMilliseconds = null;
  }

  int get _scanElapsedMilliseconds => _scanStopwatch.elapsedMilliseconds;

  bool _shouldLogScanResult(int count) {
    return count <= 3 || count == 10 || count % 25 == 0;
  }

  bool _shouldLogEmit(int count) {
    return count <= 3 || count % 10 == 0;
  }

  void _debugLog(String message) {
    if (!kDebugMode) {
      return;
    }
    debugPrint('${DateTime.now().toIso8601String()} [BLE-DIAG] $message');
  }

  String _displayAddress(String value) {
    final compact = value.replaceAll(':', '').replaceAll('-', '').replaceAll('_', '').toUpperCase();
    if (compact.length != 12) {
      return value;
    }

    final chunks = <String>[];
    for (var index = 0; index < compact.length; index += 2) {
      chunks.add(compact.substring(index, index + 2));
    }
    return chunks.join(':');
  }
}
