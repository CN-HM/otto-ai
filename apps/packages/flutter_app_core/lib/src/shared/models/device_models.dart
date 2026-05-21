class DeviceInfo {
  const DeviceInfo({
    required this.id,
    required this.macAddress,
    required this.alias,
    required this.agentRoleId,
    required this.agentRoleName,
    required this.agentRoleReleaseId,
    required this.agentRoleVersion,
    required this.board,
    required this.appVersion,
    required this.isOnline,
    required this.lastConnectedAt,
    required this.autoUpdate,
  });

  final String? id;
  final String? macAddress;
  final String? alias;
  final String? agentRoleId;
  final String? agentRoleName;
  final String? agentRoleReleaseId;
  final String? agentRoleVersion;
  final String? board;
  final String? appVersion;
  final bool isOnline;
  final DateTime? lastConnectedAt;
  final int autoUpdate;

  factory DeviceInfo.fromJson(Map<String, dynamic> json) {
    return DeviceInfo(
      id: json['id']?.toString(),
      macAddress: json['macAddress'] as String?,
      alias: json['alias'] as String?,
      agentRoleId: json['agentRoleId']?.toString(),
      agentRoleName: json['agentRoleName'] as String?,
      agentRoleReleaseId: json['agentRoleReleaseId']?.toString(),
      agentRoleVersion: json['agentRoleVersion']?.toString(),
      board: json['board'] as String?,
      appVersion: json['appVersion'] as String?,
      isOnline: json['isOnline'] == true,
      lastConnectedAt: _parseDateTime(json['lastConnectedAt']),
      autoUpdate: (json['autoUpdate'] as num?)?.toInt() ?? 0,
    );
  }
}

class DeviceProvisioningRequest {
  DeviceProvisioningRequest({
    this.macAddress,
    this.alias,
    this.board,
    this.appVersion,
    this.agentRoleId,
    this.agentRoleReleaseId,
    this.rotateCredential = true,
  });

  final String? macAddress;
  final String? alias;
  final String? board;
  final String? appVersion;
  final String? agentRoleId;
  final String? agentRoleReleaseId;
  final bool rotateCredential;

  Map<String, dynamic> toJson() => {
        if (macAddress != null) 'macAddress': macAddress,
        if (alias != null) 'alias': alias,
        if (board != null) 'board': board,
        if (appVersion != null) 'appVersion': appVersion,
        if (agentRoleId != null) 'agentRoleId': agentRoleId,
        if (agentRoleReleaseId != null) 'agentRoleReleaseId': agentRoleReleaseId,
        'rotateCredential': rotateCredential,
      };
}

class DeviceProvisioningCredential {
  const DeviceProvisioningCredential({
    required this.deviceEntityId,
    required this.deviceId,
    required this.credentialId,
    required this.credentialSecret,
    required this.envelopeJson,
    required this.message,
  });

  final String? deviceEntityId;
  final String? deviceId;
  final String? credentialId;
  final String? credentialSecret;
  final String? envelopeJson;
  final String? message;

  factory DeviceProvisioningCredential.fromJson(Map<String, dynamic> json) {
    return DeviceProvisioningCredential(
      deviceEntityId: json['deviceEntityId']?.toString(),
      deviceId: json['deviceId']?.toString(),
      credentialId: json['credentialId']?.toString(),
      credentialSecret: json['credentialSecret']?.toString(),
      envelopeJson: json['envelopeJson']?.toString(),
      message: json['message']?.toString(),
    );
  }
}

class DeviceUpdateRequest {
  DeviceUpdateRequest({
    this.alias,
    this.agentRoleId,
    this.agentRoleReleaseId,
    this.autoUpdate,
  });

  final String? alias;
  final String? agentRoleId;
  final String? agentRoleReleaseId;
  final int? autoUpdate;

  Map<String, dynamic> toJson() => {
        if (alias != null) 'alias': alias,
        if (agentRoleId != null) 'agentRoleId': agentRoleId,
        if (agentRoleReleaseId != null) 'agentRoleReleaseId': agentRoleReleaseId,
        if (autoUpdate != null) 'autoUpdate': autoUpdate,
      };
}

class BluetoothDeviceInfo {
  const BluetoothDeviceInfo({
    required this.id,
    required this.name,
    required this.macAddress,
    required this.rssi,
    required this.isConnected,
  });

  final String id;
  final String name;
  final String macAddress;
  final int rssi;
  final bool isConnected;
}

class ProvisioningWifiNetwork {
  const ProvisioningWifiNetwork({
    required this.ssid,
    required this.rssi,
  });

  final String ssid;
  final int rssi;
}

DateTime? _parseDateTime(dynamic value) {
  if (value is String && value.isNotEmpty) {
    return DateTime.tryParse(value);
  }

  return null;
}
