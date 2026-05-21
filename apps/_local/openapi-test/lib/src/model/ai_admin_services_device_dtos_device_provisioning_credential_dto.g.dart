// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_device_dtos_device_provisioning_credential_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto
    extends AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto {
  @override
  final String? deviceEntityId;
  @override
  final String? deviceId;
  @override
  final String? credentialId;
  @override
  final String? credentialSecret;
  @override
  final String? provisioningServiceUuid;
  @override
  final String? provisioningCharacteristicUuid;
  @override
  final String? envelopeJson;
  @override
  final String? message;

  factory _$AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto(
          [void Function(
                  AiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoBuilder)?
              updates]) =>
      (AiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto._(
      {this.deviceEntityId,
      this.deviceId,
      this.credentialId,
      this.credentialSecret,
      this.provisioningServiceUuid,
      this.provisioningCharacteristicUuid,
      this.envelopeJson,
      this.message})
      : super._();
  @override
  AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto rebuild(
          void Function(
                  AiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoBuilder toBuilder() =>
      AiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto &&
        deviceEntityId == other.deviceEntityId &&
        deviceId == other.deviceId &&
        credentialId == other.credentialId &&
        credentialSecret == other.credentialSecret &&
        provisioningServiceUuid == other.provisioningServiceUuid &&
        provisioningCharacteristicUuid ==
            other.provisioningCharacteristicUuid &&
        envelopeJson == other.envelopeJson &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, deviceEntityId.hashCode);
    _$hash = $jc(_$hash, deviceId.hashCode);
    _$hash = $jc(_$hash, credentialId.hashCode);
    _$hash = $jc(_$hash, credentialSecret.hashCode);
    _$hash = $jc(_$hash, provisioningServiceUuid.hashCode);
    _$hash = $jc(_$hash, provisioningCharacteristicUuid.hashCode);
    _$hash = $jc(_$hash, envelopeJson.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto')
          ..add('deviceEntityId', deviceEntityId)
          ..add('deviceId', deviceId)
          ..add('credentialId', credentialId)
          ..add('credentialSecret', credentialSecret)
          ..add('provisioningServiceUuid', provisioningServiceUuid)
          ..add(
              'provisioningCharacteristicUuid', provisioningCharacteristicUuid)
          ..add('envelopeJson', envelopeJson)
          ..add('message', message))
        .toString();
  }
}

class AiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoBuilder
    implements
        Builder<AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto,
            AiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoBuilder> {
  _$AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto? _$v;

  String? _deviceEntityId;
  String? get deviceEntityId => _$this._deviceEntityId;
  set deviceEntityId(String? deviceEntityId) =>
      _$this._deviceEntityId = deviceEntityId;

  String? _deviceId;
  String? get deviceId => _$this._deviceId;
  set deviceId(String? deviceId) => _$this._deviceId = deviceId;

  String? _credentialId;
  String? get credentialId => _$this._credentialId;
  set credentialId(String? credentialId) => _$this._credentialId = credentialId;

  String? _credentialSecret;
  String? get credentialSecret => _$this._credentialSecret;
  set credentialSecret(String? credentialSecret) =>
      _$this._credentialSecret = credentialSecret;

  String? _provisioningServiceUuid;
  String? get provisioningServiceUuid => _$this._provisioningServiceUuid;
  set provisioningServiceUuid(String? provisioningServiceUuid) =>
      _$this._provisioningServiceUuid = provisioningServiceUuid;

  String? _provisioningCharacteristicUuid;
  String? get provisioningCharacteristicUuid =>
      _$this._provisioningCharacteristicUuid;
  set provisioningCharacteristicUuid(String? provisioningCharacteristicUuid) =>
      _$this._provisioningCharacteristicUuid = provisioningCharacteristicUuid;

  String? _envelopeJson;
  String? get envelopeJson => _$this._envelopeJson;
  set envelopeJson(String? envelopeJson) => _$this._envelopeJson = envelopeJson;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  AiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoBuilder() {
    AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto._defaults(this);
  }

  AiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _deviceEntityId = $v.deviceEntityId;
      _deviceId = $v.deviceId;
      _credentialId = $v.credentialId;
      _credentialSecret = $v.credentialSecret;
      _provisioningServiceUuid = $v.provisioningServiceUuid;
      _provisioningCharacteristicUuid = $v.provisioningCharacteristicUuid;
      _envelopeJson = $v.envelopeJson;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto other) {
    _$v = other as _$AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto build() => _build();

  _$AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto._(
          deviceEntityId: deviceEntityId,
          deviceId: deviceId,
          credentialId: credentialId,
          credentialSecret: credentialSecret,
          provisioningServiceUuid: provisioningServiceUuid,
          provisioningCharacteristicUuid: provisioningCharacteristicUuid,
          envelopeJson: envelopeJson,
          message: message,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
