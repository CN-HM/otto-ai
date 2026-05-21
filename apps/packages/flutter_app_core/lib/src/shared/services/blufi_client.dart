import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:pointycastle/export.dart';

import '../models/device_models.dart';
import 'app_logger.dart';
import 'ble_support.dart';

enum BlufiWifiConnectionState {
  success,
  fail,
  connecting,
  noIp,
  unknown,
}

class BlufiProvisioningResult {
  const BlufiProvisioningResult({
    required this.state,
    required this.message,
    this.opMode,
    this.staSsid,
    this.staBssid,
  });

  final BlufiWifiConnectionState state;
  final String message;
  final int? opMode;
  final String? staSsid;
  final String? staBssid;

  bool get isSuccess => state == BlufiWifiConnectionState.success;
}

class BlufiClient {
  BlufiClient({
    required this.deviceId,
    required this.logger,
  });

  static final FlutterReactiveBle _ble = FlutterReactiveBle();
  static final Uuid serviceUuid = Uuid.parse('0000FFFF-0000-1000-8000-00805F9B34FB');

  static const int _defaultPackageLength = 80;
  static const int _minPackageLength = 6;
  static const int _packageHeaderLength = 4;
  static const int _directionOutput = 0;

  static const int _opModeSta = 0x01;

  static const int _packageTypeCtrl = 0x00;
  static const int _packageTypeData = 0x01;

  static const int _ctrlSubtypeAck = 0x00;
  static const int _ctrlSubtypeSetSecMode = 0x01;
  static const int _ctrlSubtypeSetOpMode = 0x02;
  static const int _ctrlSubtypeConnectWifi = 0x03;
  static const int _ctrlSubtypeGetWifiList = 0x09;

  static const int _dataSubtypeNeg = 0x00;
  static const int _dataSubtypeStaWifiSsid = 0x02;
  static const int _dataSubtypeStaWifiPassword = 0x03;
  static const int _dataSubtypeWifiConnectionState = 0x0f;
  static const int _dataSubtypeWifiList = 0x11;
  static const int _dataSubtypeError = 0x12;
  static const int _dataSubtypeCustomData = 0x13;

  static const int _negSetSecTotalLen = 0x00;
  static const int _negSetSecAllData = 0x01;

  static const int _infoTypeSoftApAuthMode = 0x07;
  static const int _infoTypeSoftApChannel = 0x08;
  static const int _infoTypeStaBssid = 0x01;
  static const int _infoTypeStaSsid = 0x02;

  static const int _frameCtrlEncryptedBit = 0;
  static const int _frameCtrlChecksumBit = 1;
  static const int _frameCtrlDataDirectionBit = 2;
  static const int _frameCtrlRequireAckBit = 3;
  static const int _frameCtrlFragBit = 4;

  static const String _dhP =
      'cf5cf5c38419a724957ff5dd323b9c45c3cdd261eb740f69aa94b8bb1a5c9640'
      '9153bd76b24222d03274e4725a5406092e9e82e9135c643cae98132b0d95f7d6'
      '5347c68afc1e677da90e51bbab5f5cf429c291b4ba39c6b2dc5e8c7231e46aa7'
      '728e87664532cdf547be20c9a3fa8342be6e34371a27c06f7dc0edddd2f86373';
  static const String _dhG = '2';

  final String deviceId;
  final AppLogger logger;

  Characteristic? _writeCharacteristic;
  Characteristic? _notificationCharacteristic;
  StreamSubscription<List<int>>? _notificationSubscription;
  StreamSubscription<ConnectionStateUpdate>? _connectionSubscription;

  final Queue<int> _ackQueue = Queue<int>();
  final Queue<Uint8List> _devicePublicKeyQueue = Queue<Uint8List>();

  Completer<void>? _ackWaiter;
  Completer<void>? _devicePublicKeyWaiter;
  Completer<BlufiProvisioningResult>? _wifiResultCompleter;
  Completer<List<ProvisioningWifiNetwork>>? _wifiListCompleter;

  _BlufiNotificationFrame? _pendingNotificationFrame;

  int _packageLengthLimit = _defaultPackageLength;
  int _sendSequence = 0;
  int _readSequence = -1;
  bool _encrypted = false;
  bool _checksum = false;
  Uint8List? _secretKey;
  bool _connectedHere = false;
  bool _writeWithoutResponse = false;
  DeviceConnectionState _connectionState = DeviceConnectionState.disconnected;

  static const int _maxProvisionRetries = 2;
  static const int _maxWifiScanRetries = 1;

  Future<BlufiProvisioningResult> provisionWifi({
    required String ssid,
    required String password,
    Uint8List? customData,
  }) async {
    final normalizedSsid = ssid.trim();
    if (normalizedSsid.isEmpty) {
      throw StateError('Wi‑Fi 名称不能为空');
    }

    Object? lastError;
    for (var attempt = 0; attempt <= _maxProvisionRetries; attempt++) {
      final isRetry = attempt > 0;
      if (isRetry) {
        await logger.warning(
          'BlufiClient',
          'Retrying BLUFI provisioning attempt=${attempt + 1} deviceId=$deviceId error=$lastError',
        );
        await Future<void>.delayed(Duration(milliseconds: 600 * attempt));
      }
      try {
        _resetSessionState();
        await _connect();
        await _discoverProfile();
        await _subscribeNotifications();
        await _negotiateSecurity();
        await _postDeviceMode(_opModeSta);
        await _postStaWifiInfo(normalizedSsid, password, customData: customData);
        final result = await _waitForWifiResult();
        await logger.info(
          'BlufiClient',
          'BluFi provisioning completed for deviceId=$deviceId, state=${result.state.name}, message=${result.message} attempt=${attempt + 1}',
        );
        return result;
      } catch (error) {
        lastError = error;
        await _cleanup();
        if (attempt >= _maxProvisionRetries) {
          rethrow;
        }
      }
    }
    throw lastError!;
  }

  Future<List<ProvisioningWifiNetwork>> scanWifiNetworks() async {
    Object? lastError;
    for (var attempt = 0; attempt <= _maxWifiScanRetries; attempt++) {
      final isRetry = attempt > 0;
      if (isRetry) {
        await logger.warning(
          'BlufiClient',
          'Retrying BLUFI Wi-Fi scan attempt=${attempt + 1} deviceId=$deviceId error=$lastError',
        );
        await Future<void>.delayed(Duration(milliseconds: 500 * attempt));
      }
      try {
        _resetSessionState();
        _wifiListCompleter = Completer<List<ProvisioningWifiNetwork>>();
        await _connect();
        await _discoverProfile();
        await _subscribeNotifications();
        await _negotiateSecurity();
        await Future<void>.delayed(const Duration(milliseconds: 150));
        await _requestWifiList();
        final result = await _waitForWifiList();
        await logger.info(
          'BlufiClient',
          'Loaded Wi-Fi scan list for deviceId=$deviceId, count=${result.length} attempt=${attempt + 1}',
        );
        return result;
      } catch (error) {
        lastError = error;
        await _cleanup();
        if (attempt >= _maxWifiScanRetries) {
          rethrow;
        }
      }
    }
    throw lastError!;
  }

  void _resetSessionState() {
    _writeCharacteristic = null;
    _notificationCharacteristic = null;
    _ackQueue.clear();
    _devicePublicKeyQueue.clear();
    _ackWaiter = null;
    _devicePublicKeyWaiter = null;
    _wifiResultCompleter = Completer<BlufiProvisioningResult>();
    _wifiListCompleter = null;
    _pendingNotificationFrame = null;
    _packageLengthLimit = _defaultPackageLength;
    _sendSequence = 0;
    _readSequence = -1;
    _encrypted = false;
    _checksum = false;
    _secretKey = null;
    _connectedHere = false;
    _writeWithoutResponse = false;
    _connectionState = DeviceConnectionState.disconnected;
  }

  Future<void> _connect() async {
    await BleSupport.ensureReady(_ble);
    if (await _isDeviceConnected()) {
      return;
    }

    final connectedCompleter = Completer<void>();
    _connectedHere = true;
    _connectionSubscription = _ble
        .connectToDevice(
          id: deviceId,
          connectionTimeout: const Duration(seconds: 15),
        )
        .listen(
          (update) {
            _connectionState = update.connectionState;
            if (update.connectionState == DeviceConnectionState.connected && !connectedCompleter.isCompleted) {
              connectedCompleter.complete();
              return;
            }

            if (update.connectionState == DeviceConnectionState.disconnected && !connectedCompleter.isCompleted) {
              connectedCompleter.completeError(StateError('设备连接失败，请重试'));
            }
          },
          onError: (Object error, StackTrace stackTrace) {
            if (!connectedCompleter.isCompleted) {
              connectedCompleter.completeError(StateError('设备连接失败，请重试'));
            }
            unawaited(logger.error('BlufiClient', 'Connect stream failed', error, stackTrace));
          },
          cancelOnError: false,
        );

    await connectedCompleter.future;
    await logger.info('BlufiClient', 'Connected to BLE deviceId=$deviceId');
    await Future<void>.delayed(const Duration(milliseconds: 600));

    var mtu = 23;
    try {
      mtu = await _ble.requestMtu(deviceId: deviceId, mtu: 247);
      await logger.info('BlufiClient', 'Requested MTU for deviceId=$deviceId, mtu=$mtu');
    } catch (error, stackTrace) {
      await logger.warning('BlufiClient', 'requestMtu skipped for deviceId=$deviceId: $error');
      await logger.error('BlufiClient', 'requestMtu detail', error, stackTrace);
    }

    final derivedLimit = mtu - 3;
    if (derivedLimit >= _minPackageLength) {
      _packageLengthLimit = min(_defaultPackageLength, derivedLimit);
    }
  }

  Future<bool> _isDeviceConnected() async {
    return _connectionState == DeviceConnectionState.connected;
  }

  Future<void> _discoverProfile() async {
    Service? blufiService;
    List<Service> services = const [];
    for (var attempt = 1; attempt <= 4; attempt++) {
      await _ble.discoverAllServices(deviceId);
      services = await _ble.getDiscoveredServices(deviceId);
      await logger.info(
        'BlufiClient',
        'Discovered services attempt=$attempt for deviceId=$deviceId: ${_describeServices(services)}',
      );

      for (final service in services) {
        if (_sameUuid(service.id, serviceUuid)) {
          blufiService = service;
          break;
        }
      }

      if (blufiService != null) {
        break;
      }

      if (attempt < 4) {
        await Future<void>.delayed(Duration(milliseconds: 450 * attempt));
      }
    }

    if (blufiService == null) {
      throw StateError('未能找到设备的网络配置入口，请确认设备已进入待连接状态后重试');
    }

    for (final characteristic in blufiService.characteristics) {
      if (_writeCharacteristic == null && (characteristic.isWritableWithResponse || characteristic.isWritableWithoutResponse)) {
        _writeCharacteristic = characteristic;
      }
    }

    for (final characteristic in blufiService.characteristics) {
      if (characteristic == _writeCharacteristic) {
        continue;
      }
      if (_notificationCharacteristic == null && characteristic.isNotifiable) {
        _notificationCharacteristic = characteristic;
        break;
      }
    }

    if (_notificationCharacteristic == null) {
      for (final characteristic in blufiService.characteristics) {
        if (characteristic == _writeCharacteristic) {
          continue;
        }
        if (characteristic.isIndicatable) {
          _notificationCharacteristic = characteristic;
          break;
        }
      }
    }

    if (_notificationCharacteristic == null) {
      for (final characteristic in blufiService.characteristics) {
        if (characteristic.isNotifiable || characteristic.isIndicatable) {
          _notificationCharacteristic = characteristic;
          break;
        }
      }
    }

    if (_writeCharacteristic == null || _notificationCharacteristic == null) {
      throw StateError('设备暂时无法完成连接，请重启设备后重试');
    }

    _writeWithoutResponse = _writeCharacteristic!.isWritableWithoutResponse;
    if (!_writeWithoutResponse) {
      await logger.warning(
        'BlufiClient',
        'BLUFI characteristic does not support write-without-response, falling back to write-with-response which may cause GATT 133 on some devices',
      );
    }
    await logger.info(
      'BlufiClient',
      'Using BLUFI characteristics deviceId=$deviceId write=${_writeCharacteristic!.id} notify=${_notificationCharacteristic!.id} withoutResponse=$_writeWithoutResponse packageLimit=$_packageLengthLimit',
    );
  }

  Future<void> _subscribeNotifications() async {
    final characteristic = _notificationCharacteristic;
    if (characteristic == null) {
      throw StateError('设备暂时没有准备好，请稍后重试');
    }

    _notificationSubscription = characteristic.subscribe().listen(
      (value) {
        unawaited(_handleNotification(Uint8List.fromList(value)));
      },
      onError: (Object error, StackTrace stackTrace) {
        unawaited(logger.error('BlufiClient', 'Notification stream failed', error, stackTrace));
      },
    );

    await logger.info('BlufiClient', 'BLUFI notifications enabled for deviceId=$deviceId');
  }

  Future<void> _handleNotification(Uint8List raw) async {
    try {
      await logger.info(
        'BlufiClient',
        'Notification raw deviceId=$deviceId bytes=${raw.length} hex=${_hex(raw)}',
      );
      final frame = _parseNotification(raw);
      if (frame == null) {
        await logger.info(
          'BlufiClient',
          'Notification fragment buffered deviceId=$deviceId bytes=${raw.length}',
        );
        return;
      }

      await logger.info(
        'BlufiClient',
        'Notification parsed deviceId=$deviceId packageType=${frame.packageType} subType=${frame.subType} payloadBytes=${frame.data.length} hex=${_hex(frame.data)}',
      );

      switch (frame.packageType) {
        case _packageTypeCtrl:
          if (frame.subType == _ctrlSubtypeAck) {
            final ack = frame.data.isNotEmpty ? frame.data.first : -1;
            _ackQueue.add(ack);
            _ackWaiter?.complete();
            _ackWaiter = null;
            await logger.info('BlufiClient', 'Received ACK for sequence=$ack deviceId=$deviceId');
          }
          break;
        case _packageTypeData:
          await _handleDataFrame(frame);
          break;
      }
    } catch (error, stackTrace) {
      await logger.error('BlufiClient', 'Parse BLUFI notification failed', error, stackTrace);
      if (_wifiResultCompleter != null && !_wifiResultCompleter!.isCompleted) {
        _wifiResultCompleter!.completeError(StateError('设备返回的信息无法识别，请重试'));
      }
      if (_wifiListCompleter != null && !_wifiListCompleter!.isCompleted) {
        _wifiListCompleter!.completeError(StateError('读取附近网络失败，请重试'));
      }
    }
  }

  Future<void> _handleDataFrame(_BlufiNotificationFrame frame) async {
    switch (frame.subType) {
      case _dataSubtypeNeg:
        _devicePublicKeyQueue.add(frame.data);
        _devicePublicKeyWaiter?.complete();
        _devicePublicKeyWaiter = null;
        await logger.info('BlufiClient', 'Received device public key bytes=${frame.data.length}');
        return;
      case _dataSubtypeWifiConnectionState:
        final report = _parseWifiConnectionReport(frame.data);
        await logger.info('BlufiClient', 'Received Wi‑Fi report state=${report.state.name} message=${report.message}');
        if (report.state != BlufiWifiConnectionState.connecting && _wifiResultCompleter != null && !_wifiResultCompleter!.isCompleted) {
          _wifiResultCompleter!.complete(report);
        }
        return;
      case _dataSubtypeWifiList:
        final wifiList = _parseWifiList(frame.data);
        await logger.info('BlufiClient', 'Received Wi‑Fi list count=${wifiList.length}');
        if (_wifiListCompleter != null && !_wifiListCompleter!.isCompleted) {
          _wifiListCompleter!.complete(wifiList);
        }
        return;
      case _dataSubtypeError:
        final code = frame.data.isNotEmpty ? frame.data.first : 0xff;
        final message = _describeErrorCode(code);
        await logger.warning('BlufiClient', 'Received BLUFI error code=$code message=$message');
        if (_wifiResultCompleter != null && !_wifiResultCompleter!.isCompleted) {
          _wifiResultCompleter!.completeError(StateError(message));
        }
        if (_wifiListCompleter != null && !_wifiListCompleter!.isCompleted) {
          _wifiListCompleter!.completeError(StateError(message));
        }
        return;
    }
  }

  _BlufiNotificationFrame? _parseNotification(Uint8List response) {
    if (response.length < 4) {
      throw StateError('设备返回的信息不完整，请重试');
    }

    final sequence = response[2];
    final expectedSequence = _readSequence + 1;
    if (sequence != expectedSequence) {
      throw StateError('设备返回的信息顺序异常，请重试');
    }
    _readSequence = sequence;

    final typeValue = response[0];
    final frameCtrl = response[1];
    final dataLen = response[3];
    final encrypted = _isFlagSet(frameCtrl, _frameCtrlEncryptedBit);
    final hasChecksum = _isFlagSet(frameCtrl, _frameCtrlChecksumBit);
    final hasFrag = _isFlagSet(frameCtrl, _frameCtrlFragBit);

    final expectedLength = 4 + dataLen + (hasChecksum ? 2 : 0);
    if (response.length < expectedLength) {
      throw StateError('设备返回的信息不完整，请重试');
    }

    var dataBytes = Uint8List.fromList(response.sublist(4, 4 + dataLen));
    if (encrypted) {
      final key = _secretKey;
      if (key == null) {
        throw StateError('设备连接过程被中断，请重试');
      }
      dataBytes = _aesCfbCrypt(key, _buildIv(sequence), dataBytes, encrypt: false);
    }

    if (hasChecksum) {
      final responseHigh = response[4 + dataLen + 1];
      final responseLow = response[4 + dataLen];
      final checksumInput = Uint8List.fromList(<int>[sequence, dataLen, ...dataBytes]);
      final calculated = _crc16Be(checksumInput);
      final calculatedHigh = (calculated >> 8) & 0xff;
      final calculatedLow = calculated & 0xff;
      if (responseHigh != calculatedHigh || responseLow != calculatedLow) {
        throw StateError('设备返回的信息校验失败，请重试');
      }
    }

    final packageType = typeValue & 0x03;
    final subType = (typeValue & 0xfc) >> 2;
    var dataOffset = 0;
    if (hasFrag) {
      if (dataBytes.length < 2) {
        throw StateError('设备返回的信息不完整，请重试');
      }
      dataOffset = 2;
    }

    final currentFrame = _pendingNotificationFrame;
    if (currentFrame == null) {
      _pendingNotificationFrame = _BlufiNotificationFrame(
        typeValue: typeValue,
        packageType: packageType,
        subType: subType,
        data: Uint8List.fromList(dataBytes.sublist(dataOffset)),
      );
    } else {
      if (currentFrame.typeValue != typeValue || currentFrame.subType != subType) {
        throw StateError('设备返回的信息不完整，请重试');
      }
      currentFrame.addData(dataBytes.sublist(dataOffset));
    }

    if (hasFrag) {
      return null;
    }

    final result = _pendingNotificationFrame!;
    _pendingNotificationFrame = null;
    return result;
  }

  Future<void> _negotiateSecurity() async {
    final session = _BlufiDhSession.create();
    final typeValue = _getTypeValue(_packageTypeData, _dataSubtypeNeg);

    final totalLenPayload = Uint8List.fromList(<int>[
      _negSetSecTotalLen,
      (session.payload.length >> 8) & 0xff,
      session.payload.length & 0xff,
    ]);

    final totalLenPosted = await _post(false, false, false, typeValue, totalLenPayload);
    if (!totalLenPosted) {
      throw StateError('建立设备连接失败，请重试');
    }

    await Future<void>.delayed(const Duration(milliseconds: 10));

    final allDataPayload = Uint8List.fromList(<int>[
      _negSetSecAllData,
      ...session.payload,
    ]);
    final allDataPosted = await _post(false, false, false, typeValue, allDataPayload);
    if (!allDataPosted) {
      throw StateError('建立设备连接失败，请重试');
    }

    final devicePublicKey = await _waitForDevicePublicKey();
    _secretKey = _md5Bytes(session.computeSharedSecret(devicePublicKey));

    final secModePayload = Uint8List.fromList(<int>[
      (1 << 1) | (1 << 5),
    ]);
    final setSecurityPosted = await _post(
      false,
      true,
      false,
      _getTypeValue(_packageTypeCtrl, _ctrlSubtypeSetSecMode),
      secModePayload,
    );
    if (!setSecurityPosted) {
      throw StateError('建立设备连接失败，请重试');
    }

    _encrypted = true;
    _checksum = false;
    await logger.info('BlufiClient', 'BLUFI security negotiated for deviceId=$deviceId');
  }

  Future<void> _postDeviceMode(int deviceMode) async {
    final posted = await _post(
      _encrypted,
      _checksum,
      true,
      _getTypeValue(_packageTypeCtrl, _ctrlSubtypeSetOpMode),
      Uint8List.fromList(<int>[deviceMode]),
    );
    if (!posted) {
      throw StateError('设备网络设置失败，请重试');
    }
  }

  Future<void> _postStaWifiInfo(
    String ssid,
    String password, {
    Uint8List? customData,
  }) async {
    await logger.info(
      'BlufiClient',
      'Preparing Wi‑Fi credentials deviceId=$deviceId ssid=$ssid passwordLength=${password.length} customDataBytes=${customData?.length ?? 0}',
    );

    final ssidPosted = await _post(
      _encrypted,
      _checksum,
      false,
      _getTypeValue(_packageTypeData, _dataSubtypeStaWifiSsid),
      Uint8List.fromList(utf8.encode(ssid)),
    );
    if (!ssidPosted) {
      throw StateError('发送网络名称失败，请重试');
    }

    await Future<void>.delayed(const Duration(milliseconds: 10));

    final passwordPosted = await _post(
      _encrypted,
      _checksum,
      false,
      _getTypeValue(_packageTypeData, _dataSubtypeStaWifiPassword),
      Uint8List.fromList(utf8.encode(password)),
    );
    if (!passwordPosted) {
      throw StateError('发送网络密码失败，请重试');
    }

    await Future<void>.delayed(const Duration(milliseconds: 10));

    if (customData != null && customData.isNotEmpty) {
      final customDataPosted = await _post(
        _encrypted,
        _checksum,
        false,
        _getTypeValue(_packageTypeData, _dataSubtypeCustomData),
        customData,
      );
      if (!customDataPosted) {
        throw StateError('同步设备信息失败，请重试');
      }
      await logger.info(
        'BlufiClient',
        'Sent BLUFI custom data bytes=${customData.length} deviceId=$deviceId',
      );
      await Future<void>.delayed(const Duration(milliseconds: 10));
    }

    final connectPosted = await _post(
      _encrypted,
      _checksum,
      false,
      _getTypeValue(_packageTypeCtrl, _ctrlSubtypeConnectWifi),
      null,
    );
    if (!connectPosted) {
      throw StateError('发送连接请求失败，请重试');
    }
  }

  Future<void> _requestWifiList() async {
    await logger.info('BlufiClient', 'Requesting Wi‑Fi list for deviceId=$deviceId');
    final requestPosted = await _post(
      false,
      false,
      true,
      _getTypeValue(_packageTypeCtrl, _ctrlSubtypeGetWifiList),
      null,
    );
    if (!requestPosted) {
      throw StateError('读取附近网络失败，请重试');
    }
  }

  Future<BlufiProvisioningResult> _waitForWifiResult() async {
    final completer = _wifiResultCompleter;
    if (completer == null) {
      throw StateError('设备连接尚未开始，请重试');
    }

    try {
      return await completer.future.timeout(const Duration(seconds: 40));
    } on TimeoutException {
      throw StateError('等待设备连接结果超时，请确认设备靠近路由器后重试');
    }
  }

  Future<List<ProvisioningWifiNetwork>> _waitForWifiList() async {
    final completer = _wifiListCompleter;
    if (completer == null) {
      throw StateError('读取附近网络尚未开始，请重试');
    }

    try {
      return await completer.future.timeout(const Duration(seconds: 20));
    } on TimeoutException {
      throw StateError('读取附近网络超时，请重试');
    }
  }

  Future<Uint8List> _waitForDevicePublicKey() async {
    try {
      while (true) {
        if (_devicePublicKeyQueue.isNotEmpty) {
          return _devicePublicKeyQueue.removeFirst();
        }
        _devicePublicKeyWaiter ??= Completer<void>();
        await _devicePublicKeyWaiter!.future.timeout(const Duration(seconds: 15));
        _devicePublicKeyWaiter = null;
      }
    } on TimeoutException {
      throw StateError('设备响应超时，请重试');
    }
  }

  Future<bool> _waitForAck(int sequence) async {
    try {
      final deadline = DateTime.now().add(const Duration(seconds: 12));
      while (DateTime.now().isBefore(deadline)) {
        if (_ackQueue.isNotEmpty) {
          return _ackQueue.removeFirst() == sequence;
        }
        _ackWaiter ??= Completer<void>();
        final remaining = deadline.difference(DateTime.now());
        if (remaining.isNegative || remaining == Duration.zero) {
          break;
        }
        await _ackWaiter!.future.timeout(remaining);
        _ackWaiter = null;
      }
    } on TimeoutException {
      return false;
    }
    return false;
  }

  Future<bool> _post(
    bool encrypt,
    bool checksum,
    bool requireAck,
    int type,
    Uint8List? data,
  ) {
    if (data == null || data.isEmpty) {
      return _postNonData(encrypt, checksum, requireAck, type);
    }
    return _postContainData(encrypt, checksum, requireAck, type, data);
  }

  Future<bool> _postNonData(
    bool encrypt,
    bool checksum,
    bool requireAck,
    int type,
  ) async {
    final frameCtrl = _getFrameCtrlValue(encrypt, checksum, _directionOutput, requireAck, false);
    final sequence = _generateSendSequence();
    final postBytes = _getPostBytes(type, frameCtrl, sequence, 0, null);
    await _gattWrite(postBytes);
    return !requireAck || await _waitForAck(sequence);
  }

  Future<bool> _postContainData(
    bool encrypt,
    bool checksum,
    bool requireAck,
    int type,
    Uint8List data,
  ) async {
    final allDataQueue = Queue<int>.from(data);
    final currentChunk = <int>[];

    while (allDataQueue.isNotEmpty) {
      currentChunk.add(allDataQueue.removeFirst());
      var postDataLengthLimit = _packageLengthLimit - _packageHeaderLength;
      if (checksum) {
        postDataLengthLimit -= 1;
      }
      if (currentChunk.length >= postDataLengthLimit) {
        final frag = allDataQueue.isNotEmpty;
        if (frag) {
          final frameCtrl = _getFrameCtrlValue(encrypt, checksum, _directionOutput, requireAck, true);
          final sequence = _generateSendSequence();
          final totalLength = currentChunk.length + allDataQueue.length;
          final postData = Uint8List.fromList(<int>[
            totalLength & 0xff,
            (totalLength >> 8) & 0xff,
            ...currentChunk,
          ]);
          final postBytes = _getPostBytes(type, frameCtrl, sequence, postData.length, postData);
          await _gattWrite(postBytes);
          currentChunk.clear();
          if (requireAck && !await _waitForAck(sequence)) {
            return false;
          }
          await Future<void>.delayed(const Duration(milliseconds: 10));
        }
      }
    }

    if (currentChunk.isNotEmpty) {
      final frameCtrl = _getFrameCtrlValue(encrypt, checksum, _directionOutput, requireAck, false);
      final sequence = _generateSendSequence();
      final postBytes = _getPostBytes(type, frameCtrl, sequence, currentChunk.length, Uint8List.fromList(currentChunk));
      await _gattWrite(postBytes);
      return !requireAck || await _waitForAck(sequence);
    }

    return true;
  }

  Uint8List _getPostBytes(
    int type,
    int frameCtrl,
    int sequence,
    int dataLength,
    Uint8List? data,
  ) {
    Uint8List? checksumBytes;
    if (_isFlagSet(frameCtrl, _frameCtrlChecksumBit)) {
      final checksumInput = Uint8List.fromList(<int>[
        sequence & 0xff,
        dataLength & 0xff,
        if (data != null) ...data,
      ]);
      final checksum = _crc16Be(checksumInput);
      checksumBytes = Uint8List.fromList(<int>[
        checksum & 0xff,
        (checksum >> 8) & 0xff,
      ]);
    }

    var frameData = data;
    if (_isFlagSet(frameCtrl, _frameCtrlEncryptedBit) && data != null) {
      final key = _secretKey;
      if (key == null) {
        throw StateError('设备连接尚未准备好，请重试');
      }
      frameData = _aesCfbCrypt(key, _buildIv(sequence), data, encrypt: true);
    }

    return Uint8List.fromList(<int>[
      type & 0xff,
      frameCtrl & 0xff,
      sequence & 0xff,
      dataLength & 0xff,
      if (frameData != null) ...frameData,
      if (checksumBytes != null) ...checksumBytes,
    ]);
  }

  Future<void> _gattWrite(Uint8List data) async {
    final characteristic = _writeCharacteristic;
    if (characteristic == null) {
      throw StateError('设备当前无法接收网络设置，请重试');
    }

    await logger.info(
      'BlufiClient',
      'Write BLUFI frame deviceId=$deviceId bytes=${data.length} seq=${data.length >= 3 ? data[2] : -1} type=${data.isNotEmpty ? data[0] : -1} fc=${data.length >= 2 ? data[1] : -1} withoutResponse=$_writeWithoutResponse hex=${_hex(data)}',
    );

    Object? lastError;
    for (var attempt = 0; attempt <= 2; attempt++) {
      if (attempt > 0) {
        await logger.warning(
          'BlufiClient',
          'Retrying GATT write attempt=${attempt + 1} deviceId=$deviceId error=$lastError',
        );
        await Future<void>.delayed(Duration(milliseconds: 80 * attempt));
      }
      try {
        await characteristic.write(data, withResponse: !_writeWithoutResponse);
        return;
      } catch (error) {
        lastError = error;
        if (attempt >= 2) {
          await logger.error('BlufiClient', 'GATT write failed after 3 attempts', error, StackTrace.current);
          throw StateError('发送数据到设备失败，请靠近设备后重试');
        }
      }
    }
  }

  int _getTypeValue(int type, int subtype) {
    return (subtype << 2) | type;
  }

  int _getFrameCtrlValue(
    bool encrypted,
    bool checksum,
    int direction,
    bool requireAck,
    bool frag,
  ) {
    var frame = 0;
    if (encrypted) {
      frame |= (1 << _frameCtrlEncryptedBit);
    }
    if (checksum) {
      frame |= (1 << _frameCtrlChecksumBit);
    }
    if (direction == 1) {
      frame |= (1 << _frameCtrlDataDirectionBit);
    }
    if (requireAck) {
      frame |= (1 << _frameCtrlRequireAckBit);
    }
    if (frag) {
      frame |= (1 << _frameCtrlFragBit);
    }
    return frame;
  }

  int _generateSendSequence() {
    final sequence = _sendSequence;
    _sendSequence = (_sendSequence + 1) & 0xff;
    return sequence;
  }

  bool _isFlagSet(int value, int bit) {
    return ((value >> bit) & 0x01) == 0x01;
  }

  Uint8List _buildIv(int sequence) {
    final iv = Uint8List(16);
    iv[0] = sequence & 0xff;
    return iv;
  }

  Uint8List _aesCfbCrypt(
    Uint8List key,
    Uint8List iv,
    Uint8List input, {
    required bool encrypt,
  }) {
    final engine = AESEngine()..init(true, KeyParameter(key));
    final output = Uint8List(input.length);
    final state = Uint8List.fromList(iv);
    final block = Uint8List(16);

    for (var index = 0; index < input.length; index++) {
      final blockOffset = index % 16;
      if (blockOffset == 0) {
        engine.processBlock(state, 0, block, 0);
      }
      final value = input[index] ^ block[blockOffset];
      output[index] = value;
      state[blockOffset] = encrypt ? value : input[index];
    }

    return output;
  }

  Uint8List _md5Bytes(Uint8List data) {
    final digest = MD5Digest();
    return digest.process(data);
  }

  int _crc16Be(Uint8List data) {
    var crc = 0;
    for (final byte in data) {
      crc ^= (byte & 0xff) << 8;
      for (var bit = 0; bit < 8; bit++) {
        if ((crc & 0x8000) != 0) {
          crc = ((crc << 1) ^ 0x1021) & 0xffff;
        } else {
          crc = (crc << 1) & 0xffff;
        }
      }
    }
    return crc & 0xffff;
  }

  List<ProvisioningWifiNetwork> _parseWifiList(Uint8List data) {
    final queue = Queue<int>.from(data);
    final result = <ProvisioningWifiNetwork>[];
    while (queue.isNotEmpty) {
      final length = queue.removeFirst();
      if (length <= 1 || queue.length < length) {
        break;
      }

      final rssi = queue.removeFirst();
      final ssidBytes = <int>[];
      for (var index = 0; index < length - 1; index++) {
        ssidBytes.add(queue.removeFirst());
      }

      final ssid = utf8.decode(ssidBytes, allowMalformed: true).trim();
      if (ssid.isEmpty) {
        continue;
      }

      result.add(
        ProvisioningWifiNetwork(
          ssid: ssid,
          rssi: rssi > 127 ? rssi - 256 : rssi,
        ),
      );
    }

    result.sort((left, right) => right.rssi.compareTo(left.rssi));
    return result;
  }

  BlufiProvisioningResult _parseWifiConnectionReport(Uint8List data) {
    if (data.length < 3) {
      return const BlufiProvisioningResult(
        state: BlufiWifiConnectionState.unknown,
        message: '设备返回的连接状态不完整，请重试',
      );
    }

    final opMode = data[0];
    final staState = data[1];

    String? staSsid;
    String? staBssid;
    var index = 3;
    while (index + 1 < data.length) {
      final infoType = data[index];
      final length = data[index + 1];
      index += 2;
      if (index + length > data.length) {
        break;
      }
      final value = data.sublist(index, index + length);
      index += length;
      if (infoType == _infoTypeStaSsid) {
        staSsid = utf8.decode(value, allowMalformed: true);
      } else if (infoType == _infoTypeStaBssid) {
        staBssid = _formatMac(Uint8List.fromList(value));
      } else if (infoType == _infoTypeSoftApAuthMode || infoType == _infoTypeSoftApChannel) {
        continue;
      }
    }

    switch (staState) {
      case 0x00:
        return BlufiProvisioningResult(
          state: BlufiWifiConnectionState.success,
          message: staSsid == null || staSsid.isEmpty ? '网络连接成功' : '设备已连接到 $staSsid',
          opMode: opMode,
          staSsid: staSsid,
          staBssid: staBssid,
        );
      case 0x01:
        return BlufiProvisioningResult(
          state: BlufiWifiConnectionState.fail,
          message: '连接失败，请检查 Wi‑Fi 名称和密码',
          opMode: opMode,
          staSsid: staSsid,
          staBssid: staBssid,
        );
      case 0x02:
        return BlufiProvisioningResult(
          state: BlufiWifiConnectionState.connecting,
          message: '设备正在连接，请稍候',
          opMode: opMode,
          staSsid: staSsid,
          staBssid: staBssid,
        );
      case 0x03:
        return BlufiProvisioningResult(
          state: BlufiWifiConnectionState.noIp,
          message: '设备已连上网络，正在获取地址',
          opMode: opMode,
          staSsid: staSsid,
          staBssid: staBssid,
        );
      default:
        return BlufiProvisioningResult(
          state: BlufiWifiConnectionState.unknown,
          message: '设备返回了未识别的连接状态，请稍后查看是否已连网',
          opMode: opMode,
          staSsid: staSsid,
          staBssid: staBssid,
        );
    }
  }

  String _describeErrorCode(int code) {
    switch (code) {
      case 0:
        return '设备连接异常，请重试';
      case 1:
        return '设备返回的信息校验失败，请重试';
      case 2:
        return '设备连接异常，请重试';
      case 3:
        return '设备连接异常，请重试';
      case 4:
        return '设备初始化失败，请重启设备后重试';
      case 5:
        return '设备暂时忙碌，请稍后重试';
      case 6:
        return '设备连接参数异常，请重试';
      case 7:
        return '设备读取网络参数失败，请重试';
      case 8:
        return '设备初始化失败，请重启设备后重试';
      case 9:
        return '发送到设备的信息有误，请重试';
      case 10:
        return '设备处理信息失败，请重试';
      case 11:
        return '设备未扫描到可用网络，请确认路由器已开启 2.4G Wi‑Fi';
      case 12:
        return '设备状态异常，请重试';
      default:
        return '设备返回异常，请重试';
    }
  }

  String _describeServices(List<Service> services) {
    if (services.isEmpty) {
      return 'none';
    }
    return services
        .map(
          (service) => '${service.id}[${service.characteristics.map((characteristic) => characteristic.id).join(',')}]',
        )
        .join('; ');
  }

  bool _sameUuid(Uuid left, Uuid right) {
    return left.toString().toLowerCase() == right.toString().toLowerCase();
  }

  String _formatMac(Uint8List bytes) {
    return bytes.map((value) => value.toRadixString(16).padLeft(2, '0')).join(':').toUpperCase();
  }

  String _hex(Uint8List bytes) {
    if (bytes.isEmpty) {
      return '';
    }
    return bytes.map((value) => value.toRadixString(16).padLeft(2, '0')).join(' ');
  }

  Future<void> _cleanup() async {
    try {
      await _notificationSubscription?.cancel();
      _notificationSubscription = null;
    } catch (error, stackTrace) {
      await logger.error('BlufiClient', 'Disable notifications failed', error, stackTrace);
    }

    try {
      if (_connectedHere && await _isDeviceConnected()) {
        await _connectionSubscription?.cancel();
        _connectionSubscription = null;
        _connectionState = DeviceConnectionState.disconnected;
        await logger.info('BlufiClient', 'Disconnected BLE deviceId=$deviceId');
      } else {
        await _connectionSubscription?.cancel();
        _connectionSubscription = null;
      }
    } catch (error, stackTrace) {
      await logger.error('BlufiClient', 'Disconnect failed', error, stackTrace);
    }
  }
}

class _BlufiNotificationFrame {
  _BlufiNotificationFrame({
    required this.typeValue,
    required this.packageType,
    required this.subType,
    required Uint8List data,
  }) : _data = <int>[...data];

  final int typeValue;
  final int packageType;
  final int subType;
  final List<int> _data;

  Uint8List get data => Uint8List.fromList(_data);

  void addData(List<int> value) {
    _data.addAll(value);
  }
}

class _BlufiDhSession {
  _BlufiDhSession._({
    required this.p,
    required this.g,
    required this.privateKey,
    required this.publicKey,
  });

  factory _BlufiDhSession.create() {
    final p = BigInt.parse(BlufiClient._dhP, radix: 16);
    final g = BigInt.parse(BlufiClient._dhG, radix: 10);
    final keyLength = (p.bitLength + 7) ~/ 8;
    final random = Random.secure();

    BigInt privateKey;
    do {
      privateKey = _randomBigInt(random, keyLength);
    } while (privateKey <= BigInt.one || privateKey >= (p - BigInt.one));

    final publicKey = g.modPow(privateKey, p);
    return _BlufiDhSession._(
      p: p,
      g: g,
      privateKey: privateKey,
      publicKey: publicKey,
    );
  }

  final BigInt p;
  final BigInt g;
  final BigInt privateKey;
  final BigInt publicKey;

  Uint8List get payload {
    final pBytes = _bigIntToBytes(p, minLength: 128);
    final gBytes = _bigIntToBytes(g, minLength: 1);
    final publicKeyBytes = _bigIntToBytes(publicKey, minLength: 128);
    return Uint8List.fromList(<int>[
      (pBytes.length >> 8) & 0xff,
      pBytes.length & 0xff,
      ...pBytes,
      (gBytes.length >> 8) & 0xff,
      gBytes.length & 0xff,
      ...gBytes,
      (publicKeyBytes.length >> 8) & 0xff,
      publicKeyBytes.length & 0xff,
      ...publicKeyBytes,
    ]);
  }

  Uint8List computeSharedSecret(Uint8List peerPublicKeyBytes) {
    final peerPublicKey = _bytesToBigInt(peerPublicKeyBytes);
    final sharedSecret = peerPublicKey.modPow(privateKey, p);
    return _bigIntToBytes(sharedSecret, minLength: 128);
  }

  static BigInt _randomBigInt(Random random, int byteLength) {
    final bytes = Uint8List(byteLength);
    for (var index = 0; index < byteLength; index++) {
      bytes[index] = random.nextInt(256);
    }
    return _bytesToBigInt(bytes);
  }

  static BigInt _bytesToBigInt(Uint8List bytes) {
    if (bytes.isEmpty) {
      return BigInt.zero;
    }
    final hex = bytes.map((value) => value.toRadixString(16).padLeft(2, '0')).join();
    return BigInt.parse(hex, radix: 16);
  }

  static Uint8List _bigIntToBytes(BigInt value, {required int minLength}) {
    var hex = value.toRadixString(16);
    if (hex.length.isOdd) {
      hex = '0$hex';
    }
    final raw = Uint8List.fromList(
      List<int>.generate(hex.length ~/ 2, (index) => int.parse(hex.substring(index * 2, index * 2 + 2), radix: 16)),
    );
    if (raw.length == minLength) {
      return raw;
    }
    if (raw.length > minLength) {
      return Uint8List.fromList(raw.sublist(raw.length - minLength));
    }
    final result = Uint8List(minLength);
    result.setRange(minLength - raw.length, minLength, raw);
    return result;
  }
}
