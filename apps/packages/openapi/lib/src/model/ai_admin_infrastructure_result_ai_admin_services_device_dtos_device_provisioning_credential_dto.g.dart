// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_device_dtos_device_provisioning_credential_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDto
    extends AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto? data;

  factory _$AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDto
      rebuild(
              void Function(
                      AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDto &&
        code == other.code &&
        msg == other.msg &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, msg.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDto,
            AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDto?
      _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoBuilder? _data;
  AiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoBuilder get data =>
      _$this._data ??=
          AiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoBuilder();
  set data(
          AiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoBuilder?
              data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _msg = $v.msg;
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDto
      build() => _build();

  _$AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDto
      _build() {
    _$AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDto
              ._(
            code: code,
            msg: msg,
            data: _data?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDto',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
