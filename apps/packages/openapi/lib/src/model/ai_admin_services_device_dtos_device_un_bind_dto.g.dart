// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_device_dtos_device_un_bind_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesDeviceDtosDeviceUnBindDto
    extends AiAdminServicesDeviceDtosDeviceUnBindDto {
  @override
  final String? deviceId;

  factory _$AiAdminServicesDeviceDtosDeviceUnBindDto(
          [void Function(AiAdminServicesDeviceDtosDeviceUnBindDtoBuilder)?
              updates]) =>
      (AiAdminServicesDeviceDtosDeviceUnBindDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesDeviceDtosDeviceUnBindDto._({this.deviceId}) : super._();
  @override
  AiAdminServicesDeviceDtosDeviceUnBindDto rebuild(
          void Function(AiAdminServicesDeviceDtosDeviceUnBindDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesDeviceDtosDeviceUnBindDtoBuilder toBuilder() =>
      AiAdminServicesDeviceDtosDeviceUnBindDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesDeviceDtosDeviceUnBindDto &&
        deviceId == other.deviceId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, deviceId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesDeviceDtosDeviceUnBindDto')
          ..add('deviceId', deviceId))
        .toString();
  }
}

class AiAdminServicesDeviceDtosDeviceUnBindDtoBuilder
    implements
        Builder<AiAdminServicesDeviceDtosDeviceUnBindDto,
            AiAdminServicesDeviceDtosDeviceUnBindDtoBuilder> {
  _$AiAdminServicesDeviceDtosDeviceUnBindDto? _$v;

  String? _deviceId;
  String? get deviceId => _$this._deviceId;
  set deviceId(String? deviceId) => _$this._deviceId = deviceId;

  AiAdminServicesDeviceDtosDeviceUnBindDtoBuilder() {
    AiAdminServicesDeviceDtosDeviceUnBindDto._defaults(this);
  }

  AiAdminServicesDeviceDtosDeviceUnBindDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _deviceId = $v.deviceId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesDeviceDtosDeviceUnBindDto other) {
    _$v = other as _$AiAdminServicesDeviceDtosDeviceUnBindDto;
  }

  @override
  void update(
      void Function(AiAdminServicesDeviceDtosDeviceUnBindDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesDeviceDtosDeviceUnBindDto build() => _build();

  _$AiAdminServicesDeviceDtosDeviceUnBindDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesDeviceDtosDeviceUnBindDto._(
          deviceId: deviceId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
