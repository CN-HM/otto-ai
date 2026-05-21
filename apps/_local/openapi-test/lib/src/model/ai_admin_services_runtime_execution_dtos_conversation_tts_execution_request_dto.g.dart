// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_runtime_execution_dtos_conversation_tts_execution_request_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto
    extends AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto {
  @override
  final AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto?
      orchestration;
  @override
  final AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto? request;

  factory _$AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto(
          [void Function(
                  AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDtoBuilder)?
              updates]) =>
      (AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto._(
      {this.orchestration, this.request})
      : super._();
  @override
  AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto rebuild(
          void Function(
                  AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDtoBuilder
      toBuilder() =>
          AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto &&
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
            r'AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto')
          ..add('orchestration', orchestration)
          ..add('request', request))
        .toString();
  }
}

class AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDtoBuilder
    implements
        Builder<
            AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto,
            AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDtoBuilder> {
  _$AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto? _$v;

  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDtoBuilder?
      _orchestration;
  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDtoBuilder
      get orchestration => _$this._orchestration ??=
          AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDtoBuilder();
  set orchestration(
          AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDtoBuilder?
              orchestration) =>
      _$this._orchestration = orchestration;

  AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDtoBuilder? _request;
  AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDtoBuilder
      get request => _$this._request ??=
          AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDtoBuilder();
  set request(
          AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDtoBuilder?
              request) =>
      _$this._request = request;

  AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDtoBuilder() {
    AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto
        ._defaults(this);
  }

  AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDtoBuilder
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
      AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto
          other) {
    _$v = other
        as _$AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto
      build() => _build();

  _$AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto
      _build() {
    _$AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto
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
            r'AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto',
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
