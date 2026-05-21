// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_runtime_execution_dtos_llm_chat_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDto
    extends AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto? data;

  factory _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDto
      rebuild(
              void Function(
                      AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDto &&
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
            r'AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDto,
            AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDto?
      _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder? _data;
  AiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder get data =>
      _$this._data ??=
          AiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder();
  set data(
          AiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder
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
      AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDto
      build() => _build();

  _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDto
      _build() {
    _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDto
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
            r'AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDto',
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
