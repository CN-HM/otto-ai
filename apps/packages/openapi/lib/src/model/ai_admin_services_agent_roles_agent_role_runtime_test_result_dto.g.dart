// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_agent_roles_agent_role_runtime_test_result_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto
    extends AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto {
  @override
  final String? sessionId;
  @override
  final String? inputMode;
  @override
  final String? agentRoleId;
  @override
  final String? agentRoleCode;
  @override
  final String? agentRoleName;
  @override
  final String? agentRoleReleaseId;
  @override
  final String? agentRoleVersion;
  @override
  final String? runtimeConfigSource;
  @override
  final String? deviceId;
  @override
  final String? transcript;
  @override
  final String? replyText;
  @override
  final AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto? asrStage;
  @override
  final AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto?
      memoryRetrievalStage;
  @override
  final AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto?
      knowledgeRetrievalStage;
  @override
  final AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto? llmStage;
  @override
  final AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto? ttsStage;
  @override
  final AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto?
      memoryExtractionStage;
  @override
  final AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto? asr;
  @override
  final AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto? knowledge;
  @override
  final AiAdminServicesMemoryDtosMemoryRuntimeContextDto? memoryBefore;
  @override
  final AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto? llm;
  @override
  final AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto? tts;
  @override
  final int? memoryChangedCount;
  @override
  final AiAdminServicesMemoryDtosMemoryRuntimeContextDto? memoryAfter;
  @override
  final BuiltList<AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto>?
      stageTraces;
  @override
  final BuiltList<String>? warnings;

  factory _$AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto(
          [void Function(
                  AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDtoBuilder)?
              updates]) =>
      (AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto._(
      {this.sessionId,
      this.inputMode,
      this.agentRoleId,
      this.agentRoleCode,
      this.agentRoleName,
      this.agentRoleReleaseId,
      this.agentRoleVersion,
      this.runtimeConfigSource,
      this.deviceId,
      this.transcript,
      this.replyText,
      this.asrStage,
      this.memoryRetrievalStage,
      this.knowledgeRetrievalStage,
      this.llmStage,
      this.ttsStage,
      this.memoryExtractionStage,
      this.asr,
      this.knowledge,
      this.memoryBefore,
      this.llm,
      this.tts,
      this.memoryChangedCount,
      this.memoryAfter,
      this.stageTraces,
      this.warnings})
      : super._();
  @override
  AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto rebuild(
          void Function(
                  AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDtoBuilder toBuilder() =>
      AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDtoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto &&
        sessionId == other.sessionId &&
        inputMode == other.inputMode &&
        agentRoleId == other.agentRoleId &&
        agentRoleCode == other.agentRoleCode &&
        agentRoleName == other.agentRoleName &&
        agentRoleReleaseId == other.agentRoleReleaseId &&
        agentRoleVersion == other.agentRoleVersion &&
        runtimeConfigSource == other.runtimeConfigSource &&
        deviceId == other.deviceId &&
        transcript == other.transcript &&
        replyText == other.replyText &&
        asrStage == other.asrStage &&
        memoryRetrievalStage == other.memoryRetrievalStage &&
        knowledgeRetrievalStage == other.knowledgeRetrievalStage &&
        llmStage == other.llmStage &&
        ttsStage == other.ttsStage &&
        memoryExtractionStage == other.memoryExtractionStage &&
        asr == other.asr &&
        knowledge == other.knowledge &&
        memoryBefore == other.memoryBefore &&
        llm == other.llm &&
        tts == other.tts &&
        memoryChangedCount == other.memoryChangedCount &&
        memoryAfter == other.memoryAfter &&
        stageTraces == other.stageTraces &&
        warnings == other.warnings;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, sessionId.hashCode);
    _$hash = $jc(_$hash, inputMode.hashCode);
    _$hash = $jc(_$hash, agentRoleId.hashCode);
    _$hash = $jc(_$hash, agentRoleCode.hashCode);
    _$hash = $jc(_$hash, agentRoleName.hashCode);
    _$hash = $jc(_$hash, agentRoleReleaseId.hashCode);
    _$hash = $jc(_$hash, agentRoleVersion.hashCode);
    _$hash = $jc(_$hash, runtimeConfigSource.hashCode);
    _$hash = $jc(_$hash, deviceId.hashCode);
    _$hash = $jc(_$hash, transcript.hashCode);
    _$hash = $jc(_$hash, replyText.hashCode);
    _$hash = $jc(_$hash, asrStage.hashCode);
    _$hash = $jc(_$hash, memoryRetrievalStage.hashCode);
    _$hash = $jc(_$hash, knowledgeRetrievalStage.hashCode);
    _$hash = $jc(_$hash, llmStage.hashCode);
    _$hash = $jc(_$hash, ttsStage.hashCode);
    _$hash = $jc(_$hash, memoryExtractionStage.hashCode);
    _$hash = $jc(_$hash, asr.hashCode);
    _$hash = $jc(_$hash, knowledge.hashCode);
    _$hash = $jc(_$hash, memoryBefore.hashCode);
    _$hash = $jc(_$hash, llm.hashCode);
    _$hash = $jc(_$hash, tts.hashCode);
    _$hash = $jc(_$hash, memoryChangedCount.hashCode);
    _$hash = $jc(_$hash, memoryAfter.hashCode);
    _$hash = $jc(_$hash, stageTraces.hashCode);
    _$hash = $jc(_$hash, warnings.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto')
          ..add('sessionId', sessionId)
          ..add('inputMode', inputMode)
          ..add('agentRoleId', agentRoleId)
          ..add('agentRoleCode', agentRoleCode)
          ..add('agentRoleName', agentRoleName)
          ..add('agentRoleReleaseId', agentRoleReleaseId)
          ..add('agentRoleVersion', agentRoleVersion)
          ..add('runtimeConfigSource', runtimeConfigSource)
          ..add('deviceId', deviceId)
          ..add('transcript', transcript)
          ..add('replyText', replyText)
          ..add('asrStage', asrStage)
          ..add('memoryRetrievalStage', memoryRetrievalStage)
          ..add('knowledgeRetrievalStage', knowledgeRetrievalStage)
          ..add('llmStage', llmStage)
          ..add('ttsStage', ttsStage)
          ..add('memoryExtractionStage', memoryExtractionStage)
          ..add('asr', asr)
          ..add('knowledge', knowledge)
          ..add('memoryBefore', memoryBefore)
          ..add('llm', llm)
          ..add('tts', tts)
          ..add('memoryChangedCount', memoryChangedCount)
          ..add('memoryAfter', memoryAfter)
          ..add('stageTraces', stageTraces)
          ..add('warnings', warnings))
        .toString();
  }
}

class AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDtoBuilder
    implements
        Builder<AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto,
            AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDtoBuilder> {
  _$AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto? _$v;

  String? _sessionId;
  String? get sessionId => _$this._sessionId;
  set sessionId(String? sessionId) => _$this._sessionId = sessionId;

  String? _inputMode;
  String? get inputMode => _$this._inputMode;
  set inputMode(String? inputMode) => _$this._inputMode = inputMode;

  String? _agentRoleId;
  String? get agentRoleId => _$this._agentRoleId;
  set agentRoleId(String? agentRoleId) => _$this._agentRoleId = agentRoleId;

  String? _agentRoleCode;
  String? get agentRoleCode => _$this._agentRoleCode;
  set agentRoleCode(String? agentRoleCode) =>
      _$this._agentRoleCode = agentRoleCode;

  String? _agentRoleName;
  String? get agentRoleName => _$this._agentRoleName;
  set agentRoleName(String? agentRoleName) =>
      _$this._agentRoleName = agentRoleName;

  String? _agentRoleReleaseId;
  String? get agentRoleReleaseId => _$this._agentRoleReleaseId;
  set agentRoleReleaseId(String? agentRoleReleaseId) =>
      _$this._agentRoleReleaseId = agentRoleReleaseId;

  String? _agentRoleVersion;
  String? get agentRoleVersion => _$this._agentRoleVersion;
  set agentRoleVersion(String? agentRoleVersion) =>
      _$this._agentRoleVersion = agentRoleVersion;

  String? _runtimeConfigSource;
  String? get runtimeConfigSource => _$this._runtimeConfigSource;
  set runtimeConfigSource(String? runtimeConfigSource) =>
      _$this._runtimeConfigSource = runtimeConfigSource;

  String? _deviceId;
  String? get deviceId => _$this._deviceId;
  set deviceId(String? deviceId) => _$this._deviceId = deviceId;

  String? _transcript;
  String? get transcript => _$this._transcript;
  set transcript(String? transcript) => _$this._transcript = transcript;

  String? _replyText;
  String? get replyText => _$this._replyText;
  set replyText(String? replyText) => _$this._replyText = replyText;

  AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder? _asrStage;
  AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder get asrStage =>
      _$this._asrStage ??=
          AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder();
  set asrStage(
          AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder?
              asrStage) =>
      _$this._asrStage = asrStage;

  AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder?
      _memoryRetrievalStage;
  AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder
      get memoryRetrievalStage => _$this._memoryRetrievalStage ??=
          AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder();
  set memoryRetrievalStage(
          AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder?
              memoryRetrievalStage) =>
      _$this._memoryRetrievalStage = memoryRetrievalStage;

  AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder?
      _knowledgeRetrievalStage;
  AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder
      get knowledgeRetrievalStage => _$this._knowledgeRetrievalStage ??=
          AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder();
  set knowledgeRetrievalStage(
          AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder?
              knowledgeRetrievalStage) =>
      _$this._knowledgeRetrievalStage = knowledgeRetrievalStage;

  AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder? _llmStage;
  AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder get llmStage =>
      _$this._llmStage ??=
          AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder();
  set llmStage(
          AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder?
              llmStage) =>
      _$this._llmStage = llmStage;

  AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder? _ttsStage;
  AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder get ttsStage =>
      _$this._ttsStage ??=
          AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder();
  set ttsStage(
          AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder?
              ttsStage) =>
      _$this._ttsStage = ttsStage;

  AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder?
      _memoryExtractionStage;
  AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder
      get memoryExtractionStage => _$this._memoryExtractionStage ??=
          AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder();
  set memoryExtractionStage(
          AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder?
              memoryExtractionStage) =>
      _$this._memoryExtractionStage = memoryExtractionStage;

  AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder? _asr;
  AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder get asr =>
      _$this._asr ??=
          AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder();
  set asr(
          AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder?
              asr) =>
      _$this._asr = asr;

  AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDtoBuilder? _knowledge;
  AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDtoBuilder
      get knowledge => _$this._knowledge ??=
          AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDtoBuilder();
  set knowledge(
          AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDtoBuilder?
              knowledge) =>
      _$this._knowledge = knowledge;

  AiAdminServicesMemoryDtosMemoryRuntimeContextDtoBuilder? _memoryBefore;
  AiAdminServicesMemoryDtosMemoryRuntimeContextDtoBuilder get memoryBefore =>
      _$this._memoryBefore ??=
          AiAdminServicesMemoryDtosMemoryRuntimeContextDtoBuilder();
  set memoryBefore(
          AiAdminServicesMemoryDtosMemoryRuntimeContextDtoBuilder?
              memoryBefore) =>
      _$this._memoryBefore = memoryBefore;

  AiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder? _llm;
  AiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder get llm =>
      _$this._llm ??=
          AiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder();
  set llm(AiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder? llm) =>
      _$this._llm = llm;

  AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder? _tts;
  AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder get tts =>
      _$this._tts ??=
          AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder();
  set tts(
          AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder?
              tts) =>
      _$this._tts = tts;

  int? _memoryChangedCount;
  int? get memoryChangedCount => _$this._memoryChangedCount;
  set memoryChangedCount(int? memoryChangedCount) =>
      _$this._memoryChangedCount = memoryChangedCount;

  AiAdminServicesMemoryDtosMemoryRuntimeContextDtoBuilder? _memoryAfter;
  AiAdminServicesMemoryDtosMemoryRuntimeContextDtoBuilder get memoryAfter =>
      _$this._memoryAfter ??=
          AiAdminServicesMemoryDtosMemoryRuntimeContextDtoBuilder();
  set memoryAfter(
          AiAdminServicesMemoryDtosMemoryRuntimeContextDtoBuilder?
              memoryAfter) =>
      _$this._memoryAfter = memoryAfter;

  ListBuilder<AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto>?
      _stageTraces;
  ListBuilder<AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto>
      get stageTraces => _$this._stageTraces ??= ListBuilder<
          AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto>();
  set stageTraces(
          ListBuilder<
                  AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto>?
              stageTraces) =>
      _$this._stageTraces = stageTraces;

  ListBuilder<String>? _warnings;
  ListBuilder<String> get warnings =>
      _$this._warnings ??= ListBuilder<String>();
  set warnings(ListBuilder<String>? warnings) => _$this._warnings = warnings;

  AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDtoBuilder() {
    AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto._defaults(this);
  }

  AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sessionId = $v.sessionId;
      _inputMode = $v.inputMode;
      _agentRoleId = $v.agentRoleId;
      _agentRoleCode = $v.agentRoleCode;
      _agentRoleName = $v.agentRoleName;
      _agentRoleReleaseId = $v.agentRoleReleaseId;
      _agentRoleVersion = $v.agentRoleVersion;
      _runtimeConfigSource = $v.runtimeConfigSource;
      _deviceId = $v.deviceId;
      _transcript = $v.transcript;
      _replyText = $v.replyText;
      _asrStage = $v.asrStage?.toBuilder();
      _memoryRetrievalStage = $v.memoryRetrievalStage?.toBuilder();
      _knowledgeRetrievalStage = $v.knowledgeRetrievalStage?.toBuilder();
      _llmStage = $v.llmStage?.toBuilder();
      _ttsStage = $v.ttsStage?.toBuilder();
      _memoryExtractionStage = $v.memoryExtractionStage?.toBuilder();
      _asr = $v.asr?.toBuilder();
      _knowledge = $v.knowledge?.toBuilder();
      _memoryBefore = $v.memoryBefore?.toBuilder();
      _llm = $v.llm?.toBuilder();
      _tts = $v.tts?.toBuilder();
      _memoryChangedCount = $v.memoryChangedCount;
      _memoryAfter = $v.memoryAfter?.toBuilder();
      _stageTraces = $v.stageTraces?.toBuilder();
      _warnings = $v.warnings?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto other) {
    _$v = other as _$AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto build() => _build();

  _$AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto _build() {
    _$AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto._(
            sessionId: sessionId,
            inputMode: inputMode,
            agentRoleId: agentRoleId,
            agentRoleCode: agentRoleCode,
            agentRoleName: agentRoleName,
            agentRoleReleaseId: agentRoleReleaseId,
            agentRoleVersion: agentRoleVersion,
            runtimeConfigSource: runtimeConfigSource,
            deviceId: deviceId,
            transcript: transcript,
            replyText: replyText,
            asrStage: _asrStage?.build(),
            memoryRetrievalStage: _memoryRetrievalStage?.build(),
            knowledgeRetrievalStage: _knowledgeRetrievalStage?.build(),
            llmStage: _llmStage?.build(),
            ttsStage: _ttsStage?.build(),
            memoryExtractionStage: _memoryExtractionStage?.build(),
            asr: _asr?.build(),
            knowledge: _knowledge?.build(),
            memoryBefore: _memoryBefore?.build(),
            llm: _llm?.build(),
            tts: _tts?.build(),
            memoryChangedCount: memoryChangedCount,
            memoryAfter: _memoryAfter?.build(),
            stageTraces: _stageTraces?.build(),
            warnings: _warnings?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'asrStage';
        _asrStage?.build();
        _$failedField = 'memoryRetrievalStage';
        _memoryRetrievalStage?.build();
        _$failedField = 'knowledgeRetrievalStage';
        _knowledgeRetrievalStage?.build();
        _$failedField = 'llmStage';
        _llmStage?.build();
        _$failedField = 'ttsStage';
        _ttsStage?.build();
        _$failedField = 'memoryExtractionStage';
        _memoryExtractionStage?.build();
        _$failedField = 'asr';
        _asr?.build();
        _$failedField = 'knowledge';
        _knowledge?.build();
        _$failedField = 'memoryBefore';
        _memoryBefore?.build();
        _$failedField = 'llm';
        _llm?.build();
        _$failedField = 'tts';
        _tts?.build();

        _$failedField = 'memoryAfter';
        _memoryAfter?.build();
        _$failedField = 'stageTraces';
        _stageTraces?.build();
        _$failedField = 'warnings';
        _warnings?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto',
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
