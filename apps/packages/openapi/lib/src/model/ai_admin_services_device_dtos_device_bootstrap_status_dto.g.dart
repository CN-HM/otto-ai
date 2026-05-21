// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_device_dtos_device_bootstrap_status_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesDeviceDtosDeviceBootstrapStatusDto
    extends AiAdminServicesDeviceDtosDeviceBootstrapStatusDto {
  @override
  final String? deviceEntityId;
  @override
  final String? deviceId;
  @override
  final bool? isBound;
  @override
  final String? agentRoleId;
  @override
  final String? message;

  factory _$AiAdminServicesDeviceDtosDeviceBootstrapStatusDto(
          [void Function(
                  AiAdminServicesDeviceDtosDeviceBootstrapStatusDtoBuilder)?
              updates]) =>
      (AiAdminServicesDeviceDtosDeviceBootstrapStatusDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesDeviceDtosDeviceBootstrapStatusDto._(
      {this.deviceEntityId,
      this.deviceId,
      this.isBound,
      this.agentRoleId,
      this.message})
      : super._();
  @override
  AiAdminServicesDeviceDtosDeviceBootstrapStatusDto rebuild(
          void Function(
                  AiAdminServicesDeviceDtosDeviceBootstrapStatusDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesDeviceDtosDeviceBootstrapStatusDtoBuilder toBuilder() =>
      AiAdminServicesDeviceDtosDeviceBootstrapStatusDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesDeviceDtosDeviceBootstrapStatusDto &&
        deviceEntityId == other.deviceEntityId &&
        deviceId == other.deviceId &&
        isBound == other.isBound &&
        agentRoleId == other.agentRoleId &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, deviceEntityId.hashCode);
    _$hash = $jc(_$hash, deviceId.hashCode);
    _$hash = $jc(_$hash, isBound.hashCode);
    _$hash = $jc(_$hash, agentRoleId.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesDeviceDtosDeviceBootstrapStatusDto')
          ..add('deviceEntityId', deviceEntityId)
          ..add('deviceId', deviceId)
          ..add('isBound', isBound)
          ..add('agentRoleId', agentRoleId)
          ..add('message', message))
        .toString();
  }
}

class AiAdminServicesDeviceDtosDeviceBootstrapStatusDtoBuilder
    implements
        Builder<AiAdminServicesDeviceDtosDeviceBootstrapStatusDto,
            AiAdminServicesDeviceDtosDeviceBootstrapStatusDtoBuilder> {
  _$AiAdminServicesDeviceDtosDeviceBootstrapStatusDto? _$v;

  String? _deviceEntityId;
  String? get deviceEntityId => _$this._deviceEntityId;
  set deviceEntityId(String? deviceEntityId) =>
      _$this._deviceEntityId = deviceEntityId;

  String? _deviceId;
  String? get deviceId => _$this._deviceId;
  set deviceId(String? deviceId) => _$this._deviceId = deviceId;

  bool? _isBound;
  bool? get isBound => _$this._isBound;
  set isBound(bool? isBound) => _$this._isBound = isBound;

  String? _agentRoleId;
  String? get agentRoleId => _$this._agentRoleId;
  set agentRoleId(String? agentRoleId) => _$this._agentRoleId = agentRoleId;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  AiAdminServicesDeviceDtosDeviceBootstrapStatusDtoBuilder() {
    AiAdminServicesDeviceDtosDeviceBootstrapStatusDto._defaults(this);
  }

  AiAdminServicesDeviceDtosDeviceBootstrapStatusDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _deviceEntityId = $v.deviceEntityId;
      _deviceId = $v.deviceId;
      _isBound = $v.isBound;
      _agentRoleId = $v.agentRoleId;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesDeviceDtosDeviceBootstrapStatusDto other) {
    _$v = other as _$AiAdminServicesDeviceDtosDeviceBootstrapStatusDto;
  }

  @override
  void update(
      void Function(AiAdminServicesDeviceDtosDeviceBootstrapStatusDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesDeviceDtosDeviceBootstrapStatusDto build() => _build();

  _$AiAdminServicesDeviceDtosDeviceBootstrapStatusDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesDeviceDtosDeviceBootstrapStatusDto._(
          deviceEntityId: deviceEntityId,
          deviceId: deviceId,
          isBound: isBound,
          agentRoleId: agentRoleId,
          message: message,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
