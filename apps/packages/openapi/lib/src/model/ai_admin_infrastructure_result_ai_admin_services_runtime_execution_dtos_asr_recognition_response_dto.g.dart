// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_runtime_execution_dtos_asr_recognition_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto
    extends AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto? data;

  factory _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto
      rebuild(
              void Function(
                      AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto &&
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
            r'AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto,
            AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto?
      _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder? _data;
  AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder
      get data => _$this._data ??=
          AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder();
  set data(
          AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder?
              data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder
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
      AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto
      build() => _build();

  _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto
      _build() {
    _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto
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
            r'AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto',
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
