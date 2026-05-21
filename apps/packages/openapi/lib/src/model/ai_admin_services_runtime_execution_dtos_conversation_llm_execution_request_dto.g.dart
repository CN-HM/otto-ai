// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_runtime_execution_dtos_conversation_llm_execution_request_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto
    extends AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto {
  @override
  final AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto?
      orchestration;
  @override
  final AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto? request;

  factory _$AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto(
          [void Function(
                  AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDtoBuilder)?
              updates]) =>
      (AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto._(
      {this.orchestration, this.request})
      : super._();
  @override
  AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto rebuild(
          void Function(
                  AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDtoBuilder
      toBuilder() =>
          AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto &&
        orchestration == other.orchestration &&
        request == other.request;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, orchestration.hashCode);
    _$hash = $jc(_$hash, request.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto')
          ..add('orchestration', orchestration)
          ..add('request', request))
        .toString();
  }
}

class AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDtoBuilder
    implements
        Builder<
            AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto,
            AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDtoBuilder> {
  _$AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto? _$v;

  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDtoBuilder?
      _orchestration;
  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDtoBuilder
      get orchestration => _$this._orchestration ??=
          AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDtoBuilder();
  set orchestration(
          AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDtoBuilder?
              orchestration) =>
      _$this._orchestration = orchestration;

  AiAdminServicesRuntimeExecutionDtosLlmChatRequestDtoBuilder? _request;
  AiAdminServicesRuntimeExecutionDtosLlmChatRequestDtoBuilder get request =>
      _$this._request ??=
          AiAdminServicesRuntimeExecutionDtosLlmChatRequestDtoBuilder();
  set request(
          AiAdminServicesRuntimeExecutionDtosLlmChatRequestDtoBuilder?
              request) =>
      _$this._request = request;

  AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDtoBuilder() {
    AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto
        ._defaults(this);
  }

  AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDtoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _orchestration = $v.orchestration?.toBuilder();
      _request = $v.request?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto
          other) {
    _$v = other
        as _$AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto
      build() => _build();

  _$AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto
      _build() {
    _$AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto
              ._(
            orchestration: _orchestration?.build(),
            request: _request?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'orchestration';
        _orchestration?.build();
        _$failedField = 'request';
        _request?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto',
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
