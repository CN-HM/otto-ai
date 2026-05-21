import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:permission_handler/permission_handler.dart';

class BleUserException implements Exception {
  const BleUserException(this.message, {this.shouldOpenSettings = false});

  final String message;
  final bool shouldOpenSettings;

  @override
  String toString() => message;
}

class BleUserFeedback {
  const BleUserFeedback({
    required this.message,
    this.shouldOpenSettings = false,
  });

  final String message;
  final bool shouldOpenSettings;
}

class BleSupport {
  BleSupport._();

  static Future<void> ensureReady(
    FlutterReactiveBle ble, {
    String? debugCategory,
  }) async {
    _debugLog(debugCategory, 'ensureReady start platform=$defaultTargetPlatform initialStatus=${ble.status}');
    await ble.initialize();
    _debugLog(debugCategory, 'ble.initialize completed status=${ble.status}');
    await _requestPermissionsIfNeeded(ble, debugCategory: debugCategory);

    final status = await _resolveStatus(ble, debugCategory: debugCategory);
    _debugLog(debugCategory, 'ensureReady resolved status=$status');
    if (status == BleStatus.ready) {
      return;
    }
    if (status == BleStatus.unsupported) {
      throw const BleUserException('此设备不支持蓝牙');
    }
    if (status == BleStatus.unauthorized) {
      final shouldOpenSettings = await _shouldOpenSettingsForPermissions();
      throw BleUserException(
        shouldOpenSettings ? '蓝牙权限已被拒绝，请到系统设置中开启后再试' : '请授予蓝牙权限',
        shouldOpenSettings: shouldOpenSettings,
      );
    }
    if (status == BleStatus.poweredOff) {
      throw const BleUserException('请先开启蓝牙');
    }
    if (status == BleStatus.locationServicesDisabled) {
      throw const BleUserException('请开启定位服务');
    }

    throw const BleUserException('蓝牙暂不可用，请稍后重试');
  }

  static BleUserFeedback describeError(
    Object error, {
    required String fallbackMessage,
  }) {
    if (error is BleUserException) {
      return BleUserFeedback(
        message: error.message,
        shouldOpenSettings: error.shouldOpenSettings,
      );
    }
    if (error is StateError) {
      return BleUserFeedback(
        message: error.message.isNotEmpty ? error.message : fallbackMessage,
      );
    }

    final message = error.toString().trim();
    return BleUserFeedback(
      message: message.isNotEmpty ? message : fallbackMessage,
    );
  }

  static Future<void> _requestPermissionsIfNeeded(
    FlutterReactiveBle ble, {
    String? debugCategory,
  }) async {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) {
      _debugLog(debugCategory, 'skip permission request platform=$defaultTargetPlatform isWeb=$kIsWeb');
      return;
    }

    _debugLog(debugCategory, 'requesting bluetooth permissions');
    await _requestPermissions(
      [
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      ],
      debugCategory: debugCategory,
    );

    final status = await _resolveStatus(ble, debugCategory: debugCategory);
    _debugLog(debugCategory, 'status after bluetooth permissions=$status');
    if (status == BleStatus.unauthorized) {
      _debugLog(debugCategory, 'requesting location permission because status is unauthorized');
      await _requestPermissions(
        [
        Permission.locationWhenInUse,
        ],
        debugCategory: debugCategory,
      );
    }
  }

  static Future<void> _requestPermissions(
    List<Permission> permissions, {
    String? debugCategory,
  }) async {
    final pendingPermissions = <Permission>[];
    for (final permission in permissions) {
      final status = await permission.status;
      _debugLog(debugCategory, 'permission status ${permission.toString()}=$status');
      if (!status.isGranted) {
        pendingPermissions.add(permission);
      }
    }

    if (pendingPermissions.isEmpty) {
      _debugLog(debugCategory, 'all requested permissions already granted');
      return;
    }

    final result = await pendingPermissions.request();
    _debugLog(debugCategory, 'permission request result=$result');
  }

  static Future<bool> _shouldOpenSettingsForPermissions() async {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) {
      return false;
    }

    final statuses = <PermissionStatus>[
      await Permission.bluetoothScan.status,
      await Permission.bluetoothConnect.status,
      await Permission.locationWhenInUse.status,
    ];

    return statuses.any((status) => status.isPermanentlyDenied || status.isRestricted);
  }

  static Future<BleStatus> _resolveStatus(
    FlutterReactiveBle ble, {
    String? debugCategory,
  }) async {
    var status = ble.status;
    _debugLog(debugCategory, 'resolveStatus initial=$status');
    if (status != BleStatus.unknown) {
      return status;
    }

    try {
      status = await ble.statusStream
          .firstWhere((value) => value != BleStatus.unknown)
          .timeout(const Duration(seconds: 5));
      _debugLog(debugCategory, 'resolveStatus stream value=$status');
    } on TimeoutException {
      _debugLog(debugCategory, 'resolveStatus timeout after 5 seconds');
      throw const BleUserException('蓝牙初始化超时，请稍后重试');
    }

    return status;
  }

  static void _debugLog(String? category, String message) {
    if (!kDebugMode || category == null || category.isEmpty) {
      return;
    }
    debugPrint('${DateTime.now().toIso8601String()} [BLE-DIAG][$category] $message');
  }
}
