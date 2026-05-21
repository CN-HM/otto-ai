// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_device_dtos_iot_device_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDto
    extends AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesDeviceDtosIotDeviceDto? data;

  factory _$AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDto rebuild(
          void Function(
                  AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDto &&
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
            r'AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDto,
            AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDto? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesDeviceDtosIotDeviceDtoBuilder? _data;
  AiAdminServicesDeviceDtosIotDeviceDtoBuilder get data =>
      _$this._data ??= AiAdminServicesDeviceDtosIotDeviceDtoBuilder();
  set data(AiAdminServicesDeviceDtosIotDeviceDtoBuilder? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDtoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDto._defaults(
        this);
  }

  AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDtoBuilder
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
      AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDto other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDto build() =>
      _build();

  _$AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDto _build() {
    _$AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDto._(
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
            r'AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDto',
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
