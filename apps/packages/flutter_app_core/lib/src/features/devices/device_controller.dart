import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../features/auth/auth_controller.dart';
import '../../shared/models/device_models.dart';
import '../../shared/services/app_logger.dart';
import '../../shared/services/ble_support.dart';
import '../../shared/services/ble_service.dart';
import '../../shared/services/device_api_service.dart';

class DeviceController extends ChangeNotifier {
  DeviceController({
    required AuthController authController,
    required DeviceApiService api,
    required BleService bleService,
    required AppLogger logger,
  })  : _authController = authController,
        _api = api,
        _bleService = bleService,
        _logger = logger,
        _lastAuthenticated = authController.isAuthenticated {
    _authController.addListener(_handleAuthChanged);
  }

  final AuthController _authController;
  final DeviceApiService _api;
  final BleService _bleService;
  final AppLogger _logger;
  bool _lastAuthenticated;

  List<DeviceInfo> _devices = const [];
  List<BluetoothDeviceInfo> _discoveredDevices = const [];
  bool _isLoading = false;
  bool _isScanning = false;
  bool _hasLoaded = false;
  String _statusMessage = '';
  bool _shouldOpenBlePermissionSettings = false;

  List<DeviceInfo> get devices => _devices;
  List<BluetoothDeviceInfo> get discoveredDevices => _discoveredDevices;
  bool get isLoading => _isLoading;
  bool get isScanning => _isScanning;
  bool get hasLoaded => _hasLoaded;
  String get statusMessage => _statusMessage;
  bool get shouldOpenBlePermissionSettings => _shouldOpenBlePermissionSettings;

  static final RegExp _macAddressPattern = RegExp(r'^[0-9A-F]{12}$');

  Future<void> loadDevices({bool force = false}) async {
    if (_isLoading) {
      return;
    }

    if (!force && _hasLoaded) {
      return;
    }

    final token = _authController.token;
    if (token == null || token.isEmpty) {
      _statusMessage = '未登录';
      notifyListeners();
      return;
    }

    _isLoading = true;
    _statusMessage = '加载设备列表...';
    notifyListeners();

    try {
      await _refreshDevices(token, updateStatusMessage: true);
    } catch (error, stackTrace) {
      await _logger.error('DeviceController', 'Load devices failed', error, stackTrace);
      _devices = const [];
      _hasLoaded = false;
      _statusMessage = '加载设备列表失败';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> startScan() async {
    final emitDuringScan = kIsWeb || defaultTargetPlatform != TargetPlatform.android;
    _isScanning = true;
    _discoveredDevices = const [];
    _statusMessage = '正在扫描设备...';
    _shouldOpenBlePermissionSettings = false;
    notifyListeners();

    try {
      await _bleService.startScan(
        onChanged: (devices) {
          _discoveredDevices = devices;
          _statusMessage = devices.isEmpty ? '扫描中...' : '发现 ${devices.length} 台设备';
          if (emitDuringScan) {
            notifyListeners();
          }
        },
      );
      _statusMessage = _discoveredDevices.isEmpty ? '未发现设备' : '扫描完成';
      return true;
    } catch (error, stackTrace) {
      await _logger.error('DeviceController', 'Scan failed', error, stackTrace);
      final feedback = BleSupport.describeError(
        error,
        fallbackMessage: '蓝牙扫描失败',
      );
      _statusMessage = feedback.message;
      _shouldOpenBlePermissionSettings = feedback.shouldOpenSettings;
      return false;
    } finally {
      _isScanning = false;
      notifyListeners();
    }
  }

  Future<void> stopScan() async {
    await _bleService.stopScan();
    _isScanning = false;
    _statusMessage = '已停止扫描';
    _shouldOpenBlePermissionSettings = false;
    notifyListeners();
  }

  Future<bool> provisionDevice(
    BluetoothDeviceInfo device, {
    required String ssid,
    required String password,
    String? agentRoleId,
    String? agentRoleReleaseId,
  }) async {
    final normalizedSsid = ssid.trim();
    if (normalizedSsid.isEmpty) {
      _statusMessage = 'Wi‑Fi 名称不能为空';
      notifyListeners();
      return false;
    }

    final token = _authController.token;
    final normalizedMac = _normalizeMacAddress(device.macAddress);
    List<int>? customData;
    String? completionNote;

    _isLoading = true;
    _shouldOpenBlePermissionSettings = false;
    notifyListeners();

    try {
      if (normalizedMac != null) {
        if (token == null || token.isEmpty) {
          _statusMessage = '未登录';
          return false;
        }

        _statusMessage = '正在获取设备凭证...';
        notifyListeners();

        final response = await _api.issueProvisioningCredential(
          DeviceProvisioningRequest(
            macAddress: normalizedMac,
            alias: device.name,
            agentRoleId: agentRoleId,
            agentRoleReleaseId: agentRoleReleaseId,
          ),
          token,
        );

        await _logger.info(
          'DeviceController',
          'issueProvisioningCredential response: code=${response.code}, deviceEntityId=${response.data?.deviceEntityId ?? 'null'}, credentialId=${response.data?.credentialId ?? 'null'}, mac=$normalizedMac, message=${response.msg}',
        );

        if (response.isUnauthorized) {
          _statusMessage = response.msg.isNotEmpty ? response.msg : '登录状态已失效，请重新登录';
          await _authController.handleUnauthorized(_statusMessage);
          return false;
        }

        if (!response.isSuccess || response.data == null) {
          _statusMessage = response.msg.isNotEmpty ? response.msg : '设备凭证获取失败，请稍后重试';
          return false;
        }

        final envelopeJson = response.data!.envelopeJson;
        if (envelopeJson == null || envelopeJson.isEmpty) {
          _statusMessage = '设备凭证数据异常，请稍后重试';
          return false;
        }

        customData = utf8.encode(envelopeJson);
        completionNote = '设备信息已同步';
      } else {
        completionNote = '网络配置已完成，设备信息将在后续自动补充';
        await _logger.warning(
          'DeviceController',
          'Proceeding with Wi-Fi-only BluFi provisioning because deviceId=${device.id} cannot be normalized to a MAC address',
        );
      }

      _statusMessage = '正在连接设备并发送网络配置...';
      notifyListeners();

      final result = await _bleService.provisionWifi(
        device.id,
        ssid: normalizedSsid,
        password: password,
        customData: customData,
      );

      if (result.isSuccess) {
        _statusMessage = '${result.message}；$completionNote';
        return true;
      }

      _statusMessage = result.message;
      return false;
    } catch (error, stackTrace) {
      await _logger.error('DeviceController', 'Provision device failed', error, stackTrace);
      final feedback = BleSupport.describeError(
        error,
        fallbackMessage: '设备连接失败，请重试',
      );
      _statusMessage = feedback.message;
      _shouldOpenBlePermissionSettings = feedback.shouldOpenSettings;
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<List<ProvisioningWifiNetwork>> loadProvisioningWifiNetworks(BluetoothDeviceInfo device) async {
    try {
      _shouldOpenBlePermissionSettings = false;
      final networks = await _bleService.fetchWifiNetworks(device.id);
      await _logger.info(
        'DeviceController',
        'Loaded BLUFI Wi-Fi networks for deviceId=${device.id}, count=${networks.length}',
      );
      return networks;
    } catch (error, stackTrace) {
      await _logger.error('DeviceController', 'Load provisioning Wi-Fi networks failed', error, stackTrace);
      final feedback = BleSupport.describeError(
        error,
        fallbackMessage: '读取设备附近 Wi‑Fi 列表失败',
      );
      _statusMessage = feedback.message;
      _shouldOpenBlePermissionSettings = feedback.shouldOpenSettings;
      rethrow;
    }
  }

  Future<bool> updateDeviceAgentRole(DeviceInfo device, String? agentRoleId, {String? agentRoleReleaseId}) async {
    final token = _authController.token;
    if (token == null || token.isEmpty || device.id == null) {
      _statusMessage = '未登录';
      notifyListeners();
      return false;
    }

    _isLoading = true;
    _statusMessage = (agentRoleId == null || agentRoleId.isEmpty) ? '正在取消智能体角色关联...' : '正在绑定智能体角色...';
    notifyListeners();

    try {
      final response = await _api.updateDevice(
        device.id!,
        DeviceUpdateRequest(
          agentRoleId: agentRoleId ?? '',
          agentRoleReleaseId: agentRoleId == null || agentRoleId.isEmpty ? '' : agentRoleReleaseId,
        ),
        token,
      );

      if (response.isSuccess) {
        await _refreshDevices(token);
        _statusMessage = (agentRoleId == null || agentRoleId.isEmpty) ? '已取消智能体角色关联' : '已绑定智能体角色';
        return true;
      }

      if (response.isUnauthorized) {
        _statusMessage = response.msg.isNotEmpty ? response.msg : '登录状态已失效，请重新登录';
        await _authController.handleUnauthorized(_statusMessage);
        return false;
      }

      _statusMessage = response.msg.isNotEmpty ? response.msg : '绑定智能体角色失败';
      return false;
    } catch (error, stackTrace) {
      await _logger.error('DeviceController', 'Update device agent role failed', error, stackTrace);
      _statusMessage = '绑定智能体角色失败';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> unbindDevice(DeviceInfo device) async {
    final token = _authController.token;
    if (token == null || token.isEmpty || device.id == null) {
      _statusMessage = '未登录';
      notifyListeners();
      return false;
    }

    _isLoading = true;
    notifyListeners();

    try {
      final response = await _api.deleteDevice(device.id!, token);

      if (response.isSuccess) {
        await _refreshDevices(token);
        _statusMessage = '已解绑';
        return true;
      }

      if (response.isUnauthorized) {
        _statusMessage = response.msg.isNotEmpty ? response.msg : '登录状态已失效，请重新登录';
        await _authController.handleUnauthorized(_statusMessage);
        return false;
      }

      _statusMessage = response.msg.isNotEmpty ? response.msg : '解绑失败';
      return false;
    } catch (error, stackTrace) {
      await _logger.error('DeviceController', 'Unbind failed', error, stackTrace);
      _statusMessage = '解绑失败';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _authController.removeListener(_handleAuthChanged);
    super.dispose();
  }

  void _handleAuthChanged() {
    final isAuthenticated = _authController.isAuthenticated;
    if (_lastAuthenticated == isAuthenticated) {
      return;
    }

    _lastAuthenticated = isAuthenticated;
    if (!isAuthenticated) {
      unawaited(_bleService.stopScan());
      _resetState();
      return;
    }

    _devices = const [];
    _discoveredDevices = const [];
    _hasLoaded = false;
    _statusMessage = '';
    _shouldOpenBlePermissionSettings = false;
    notifyListeners();
  }

  void _resetState() {
    _devices = const [];
    _discoveredDevices = const [];
    _isLoading = false;
    _isScanning = false;
    _hasLoaded = false;
    _statusMessage = '';
    _shouldOpenBlePermissionSettings = false;
    notifyListeners();
  }

  Future<void> _refreshDevices(
    String token, {
    bool updateStatusMessage = false,
  }) async {
    final response = await _api.getDevices(token);
    final firstDevice = response.data?.isNotEmpty == true ? response.data!.first : null;
    await _logger.info(
      'DeviceController',
      'loadDevices response: code=${response.code}, count=${response.data?.length ?? 0}, message=${response.msg}, firstId=${firstDevice?.id ?? 'null'}, firstMac=${firstDevice?.macAddress ?? 'null'}, firstAgentRoleId=${firstDevice?.agentRoleId ?? 'null'}',
    );

    if (response.isSuccess) {
      _devices = response.data ?? const [];
      _hasLoaded = true;
      if (updateStatusMessage) {
        _statusMessage = _devices.isEmpty ? '暂无设备，可通过 BLE 配网下发设备凭证' : '已绑定 ${_devices.length} 台设备';
      }
      return;
    }

    if (response.isUnauthorized) {
      _devices = const [];
      _hasLoaded = false;
      _statusMessage = response.msg.isNotEmpty ? response.msg : '登录状态已失效，请重新登录';
      await _authController.handleUnauthorized(_statusMessage);
      return;
    }

    _devices = const [];
    _hasLoaded = false;
    _statusMessage = response.msg.isNotEmpty ? response.msg : '加载设备列表失败';
  }

  String? _normalizeMacAddress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }

    final compact = value.trim().toUpperCase().replaceAll(':', '').replaceAll('-', '').replaceAll('_', '');
    if (!_macAddressPattern.hasMatch(compact)) {
      return null;
    }

    final segments = <String>[];
    for (var index = 0; index < compact.length; index += 2) {
      segments.add(compact.substring(index, index + 2));
    }
    return segments.join(':');
  }
 }
