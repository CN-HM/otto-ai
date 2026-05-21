// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_admin_dtos_admin_system_settings_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto
    extends AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesAdminDtosAdminSystemSettingsDto? data;

  factory _$AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto rebuild(
          void Function(
                  AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto &&
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
            r'AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto,
            AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto?
      _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder? _data;
  AiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder get data =>
      _$this._data ??= AiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder();
  set data(AiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder
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
      AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto
      build() => _build();

  _$AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto
      _build() {
    _$AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto
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
            r'AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto',
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
