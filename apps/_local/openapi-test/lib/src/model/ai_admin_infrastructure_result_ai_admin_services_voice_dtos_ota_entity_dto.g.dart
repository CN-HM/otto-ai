// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_voice_dtos_ota_entity_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDto
    extends AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesVoiceDtosOtaEntityDto? data;

  factory _$AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDto rebuild(
          void Function(
                  AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDto &&
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
            r'AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDtoBuilder
    implements
        Builder<AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDto,
            AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDto? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesVoiceDtosOtaEntityDtoBuilder? _data;
  AiAdminServicesVoiceDtosOtaEntityDtoBuilder get data =>
      _$this._data ??= AiAdminServicesVoiceDtosOtaEntityDtoBuilder();
  set data(AiAdminServicesVoiceDtosOtaEntityDtoBuilder? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDtoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDto._defaults(
        this);
  }

  AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDtoBuilder
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
      AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDto other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDto build() =>
      _build();

  _$AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDto _build() {
    _$AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDto._(
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
            r'AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDto',
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
