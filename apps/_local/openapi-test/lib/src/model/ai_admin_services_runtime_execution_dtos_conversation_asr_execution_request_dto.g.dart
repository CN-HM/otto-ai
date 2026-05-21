// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_runtime_execution_dtos_conversation_asr_execution_request_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto
    extends AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto {
  @override
  final AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto?
      orchestration;
  @override
  final AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto? request;

  factory _$AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto(
          [void Function(
                  AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDtoBuilder)?
              updates]) =>
      (AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto._(
      {this.orchestration, this.request})
      : super._();
  @override
  AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto rebuild(
          void Function(
                  AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDtoBuilder
      toBuilder() =>
          AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto &&
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
            r'AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto')
          ..add('orchestration', orchestration)
          ..add('request', request))
        .toString();
  }
}

class AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDtoBuilder
    implements
        Builder<
            AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto,
            AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDtoBuilder> {
  _$AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto? _$v;

  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDtoBuilder?
      _orchestration;
  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDtoBuilder
      get orchestration => _$this._orchestration ??=
          AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDtoBuilder();
  set orchestration(
          AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDtoBuilder?
              orchestration) =>
      _$this._orchestration = orchestration;

  AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDtoBuilder? _request;
  AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDtoBuilder
      get request => _$this._request ??=
          AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDtoBuilder();
  set request(
          AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDtoBuilder?
              request) =>
      _$this._request = request;

  AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDtoBuilder() {
    AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto
        ._defaults(this);
  }

  AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDtoBuilder
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
      AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto
          other) {
    _$v = other
        as _$AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto
      build() => _build();

  _$AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto
      _build() {
    _$AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto
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
            r'AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto',
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
