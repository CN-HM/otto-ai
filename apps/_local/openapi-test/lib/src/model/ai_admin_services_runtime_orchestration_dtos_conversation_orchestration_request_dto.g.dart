// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_runtime_orchestration_dtos_conversation_orchestration_request_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto
    extends AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto {
  @override
  final String? agentRoleId;
  @override
  final String? agentRoleCode;
  @override
  final String? agentRoleReleaseId;
  @override
  final String? sessionId;
  @override
  final String? deviceId;
  @override
  final String? pipelineTemplateId;
  @override
  final String? vadProfileId;
  @override
  final String? asrProfileId;
  @override
  final String? llmProfileId;
  @override
  final String? ttsProfileId;
  @override
  final String? requestedInvocationMode;
  @override
  final bool? preferStreaming;

  factory _$AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto(
          [void Function(
                  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDtoBuilder)?
              updates]) =>
      (AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto._(
      {this.agentRoleId,
      this.agentRoleCode,
      this.agentRoleReleaseId,
      this.sessionId,
      this.deviceId,
      this.pipelineTemplateId,
      this.vadProfileId,
      this.asrProfileId,
      this.llmProfileId,
      this.ttsProfileId,
      this.requestedInvocationMode,
      this.preferStreaming})
      : super._();
  @override
  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto
      rebuild(
              void Function(
                      AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDtoBuilder
      toBuilder() =>
          AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto &&
        agentRoleId == other.agentRoleId &&
        agentRoleCode == other.agentRoleCode &&
        agentRoleReleaseId == other.agentRoleReleaseId &&
        sessionId == other.sessionId &&
        deviceId == other.deviceId &&
        pipelineTemplateId == other.pipelineTemplateId &&
        vadProfileId == other.vadProfileId &&
        asrProfileId == other.asrProfileId &&
        llmProfileId == other.llmProfileId &&
        ttsProfileId == other.ttsProfileId &&
        requestedInvocationMode == other.requestedInvocationMode &&
        preferStreaming == other.preferStreaming;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, agentRoleId.hashCode);
    _$hash = $jc(_$hash, agentRoleCode.hashCode);
    _$hash = $jc(_$hash, agentRoleReleaseId.hashCode);
    _$hash = $jc(_$hash, sessionId.hashCode);
    _$hash = $jc(_$hash, deviceId.hashCode);
    _$hash = $jc(_$hash, pipelineTemplateId.hashCode);
    _$hash = $jc(_$hash, vadProfileId.hashCode);
    _$hash = $jc(_$hash, asrProfileId.hashCode);
    _$hash = $jc(_$hash, llmProfileId.hashCode);
    _$hash = $jc(_$hash, ttsProfileId.hashCode);
    _$hash = $jc(_$hash, requestedInvocationMode.hashCode);
    _$hash = $jc(_$hash, preferStreaming.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto')
          ..add('agentRoleId', agentRoleId)
          ..add('agentRoleCode', agentRoleCode)
          ..add('agentRoleReleaseId', agentRoleReleaseId)
          ..add('sessionId', sessionId)
          ..add('deviceId', deviceId)
          ..add('pipelineTemplateId', pipelineTemplateId)
          ..add('vadProfileId', vadProfileId)
          ..add('asrProfileId', asrProfileId)
          ..add('llmProfileId', llmProfileId)
          ..add('ttsProfileId', ttsProfileId)
          ..add('requestedInvocationMode', requestedInvocationMode)
          ..add('preferStreaming', preferStreaming))
        .toString();
  }
}

class AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDtoBuilder
    implements
        Builder<
            AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto,
            AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDtoBuilder> {
  _$AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto?
      _$v;

  String? _agentRoleId;
  String? get agentRoleId => _$this._agentRoleId;
  set agentRoleId(String? agentRoleId) => _$this._agentRoleId = agentRoleId;

  String? _agentRoleCode;
  String? get agentRoleCode => _$this._agentRoleCode;
  set agentRoleCode(String? agentRoleCode) =>
      _$this._agentRoleCode = agentRoleCode;

  String? _agentRoleReleaseId;
  String? get agentRoleReleaseId => _$this._agentRoleReleaseId;
  set agentRoleReleaseId(String? agentRoleReleaseId) =>
      _$this._agentRoleReleaseId = agentRoleReleaseId;

  String? _sessionId;
  String? get sessionId => _$this._sessionId;
  set sessionId(String? sessionId) => _$this._sessionId = sessionId;

  String? _deviceId;
  String? get deviceId => _$this._deviceId;
  set deviceId(String? deviceId) => _$this._deviceId = deviceId;

  String? _pipelineTemplateId;
  String? get pipelineTemplateId => _$this._pipelineTemplateId;
  set pipelineTemplateId(String? pipelineTemplateId) =>
      _$this._pipelineTemplateId = pipelineTemplateId;

  String? _vadProfileId;
  String? get vadProfileId => _$this._vadProfileId;
  set vadProfileId(String? vadProfileId) => _$this._vadProfileId = vadProfileId;

  String? _asrProfileId;
  String? get asrProfileId => _$this._asrProfileId;
  set asrProfileId(String? asrProfileId) => _$this._asrProfileId = asrProfileId;

  String? _llmProfileId;
  String? get llmProfileId => _$this._llmProfileId;
  set llmProfileId(String? llmProfileId) => _$this._llmProfileId = llmProfileId;

  String? _ttsProfileId;
  String? get ttsProfileId => _$this._ttsProfileId;
  set ttsProfileId(String? ttsProfileId) => _$this._ttsProfileId = ttsProfileId;

  String? _requestedInvocationMode;
  String? get requestedInvocationMode => _$this._requestedInvocationMode;
  set requestedInvocationMode(String? requestedInvocationMode) =>
      _$this._requestedInvocationMode = requestedInvocationMode;

  bool? _preferStreaming;
  bool? get preferStreaming => _$this._preferStreaming;
  set preferStreaming(bool? preferStreaming) =>
      _$this._preferStreaming = preferStreaming;

  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDtoBuilder() {
    AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto
        ._defaults(this);
  }

  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDtoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _agentRoleId = $v.agentRoleId;
      _agentRoleCode = $v.agentRoleCode;
      _agentRoleReleaseId = $v.agentRoleReleaseId;
      _sessionId = $v.sessionId;
      _deviceId = $v.deviceId;
      _pipelineTemplateId = $v.pipelineTemplateId;
      _vadProfileId = $v.vadProfileId;
      _asrProfileId = $v.asrProfileId;
      _llmProfileId = $v.llmProfileId;
      _ttsProfileId = $v.ttsProfileId;
      _requestedInvocationMode = $v.requestedInvocationMode;
      _preferStreaming = $v.preferStreaming;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto
          other) {
    _$v = other
        as _$AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto
      build() => _build();

  _$AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto
      _build() {
    final _$result = _$v ??
        _$AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto
            ._(
          agentRoleId: agentRoleId,
          agentRoleCode: agentRoleCode,
          agentRoleReleaseId: agentRoleReleaseId,
          sessionId: sessionId,
          deviceId: deviceId,
          pipelineTemplateId: pipelineTemplateId,
          vadProfileId: vadProfileId,
          asrProfileId: asrProfileId,
          llmProfileId: llmProfileId,
          ttsProfileId: ttsProfileId,
          requestedInvocationMode: requestedInvocationMode,
          preferStreaming: preferStreaming,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
