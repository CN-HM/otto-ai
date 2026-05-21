// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_voice_dtos_tts_voice_sync_result_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDto
    extends AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesVoiceDtosTtsVoiceSyncResultDto? data;

  factory _$AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDto rebuild(
          void Function(
                  AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDto &&
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
            r'AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDto,
            AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDto?
      _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesVoiceDtosTtsVoiceSyncResultDtoBuilder? _data;
  AiAdminServicesVoiceDtosTtsVoiceSyncResultDtoBuilder get data =>
      _$this._data ??= AiAdminServicesVoiceDtosTtsVoiceSyncResultDtoBuilder();
  set data(AiAdminServicesVoiceDtosTtsVoiceSyncResultDtoBuilder? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDtoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDtoBuilder
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
      AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDto
      build() => _build();

  _$AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDto
      _build() {
    _$AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDto
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
            r'AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDto',
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
