// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_runtime_orchestration_dtos_conversation_orchestration_plan_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto
    extends AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto {
  @override
  final String? agentRoleId;
  @override
  final String? agentRoleCode;
  @override
  final String? agentRoleName;
  @override
  final String? agentRoleVersion;
  @override
  final String? agentRoleReleaseId;
  @override
  final String? agentRoleConfigSource;
  @override
  final String? pipelineTemplateId;
  @override
  final String? requestedInvocationMode;
  @override
  final String? effectiveInvocationMode;
  @override
  final String? fallbackMode;
  @override
  final BuiltList<String>? baselineNodes;
  @override
  final BuiltList<String>? enabledStages;
  @override
  final BuiltList<String>? disabledStages;
  @override
  final BuiltList<String>? providerRoute;
  @override
  final bool? usesMixedProviders;
  @override
  final AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto? vad;
  @override
  final AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto? asr;
  @override
  final AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto? llm;
  @override
  final AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto? tts;
  @override
  final BuiltList<String>? warnings;

  factory _$AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto(
          [void Function(
                  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder)?
              updates]) =>
      (AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto._(
      {this.agentRoleId,
      this.agentRoleCode,
      this.agentRoleName,
      this.agentRoleVersion,
      this.agentRoleReleaseId,
      this.agentRoleConfigSource,
      this.pipelineTemplateId,
      this.requestedInvocationMode,
      this.effectiveInvocationMode,
      this.fallbackMode,
      this.baselineNodes,
      this.enabledStages,
      this.disabledStages,
      this.providerRoute,
      this.usesMixedProviders,
      this.vad,
      this.asr,
      this.llm,
      this.tts,
      this.warnings})
      : super._();
  @override
  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto rebuild(
          void Function(
                  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder
      toBuilder() =>
          AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto &&
        agentRoleId == other.agentRoleId &&
        agentRoleCode == other.agentRoleCode &&
        agentRoleName == other.agentRoleName &&
        agentRoleVersion == other.agentRoleVersion &&
        agentRoleReleaseId == other.agentRoleReleaseId &&
        agentRoleConfigSource == other.agentRoleConfigSource &&
        pipelineTemplateId == other.pipelineTemplateId &&
        requestedInvocationMode == other.requestedInvocationMode &&
        effectiveInvocationMode == other.effectiveInvocationMode &&
        fallbackMode == other.fallbackMode &&
        baselineNodes == other.baselineNodes &&
        enabledStages == other.enabledStages &&
        disabledStages == other.disabledStages &&
        providerRoute == other.providerRoute &&
        usesMixedProviders == other.usesMixedProviders &&
        vad == other.vad &&
        asr == other.asr &&
        llm == other.llm &&
        tts == other.tts &&
        warnings == other.warnings;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, agentRoleId.hashCode);
    _$hash = $jc(_$hash, agentRoleCode.hashCode);
    _$hash = $jc(_$hash, agentRoleName.hashCode);
    _$hash = $jc(_$hash, agentRoleVersion.hashCode);
    _$hash = $jc(_$hash, agentRoleReleaseId.hashCode);
    _$hash = $jc(_$hash, agentRoleConfigSource.hashCode);
    _$hash = $jc(_$hash, pipelineTemplateId.hashCode);
    _$hash = $jc(_$hash, requestedInvocationMode.hashCode);
    _$hash = $jc(_$hash, effectiveInvocationMode.hashCode);
    _$hash = $jc(_$hash, fallbackMode.hashCode);
    _$hash = $jc(_$hash, baselineNodes.hashCode);
    _$hash = $jc(_$hash, enabledStages.hashCode);
    _$hash = $jc(_$hash, disabledStages.hashCode);
    _$hash = $jc(_$hash, providerRoute.hashCode);
    _$hash = $jc(_$hash, usesMixedProviders.hashCode);
    _$hash = $jc(_$hash, vad.hashCode);
    _$hash = $jc(_$hash, asr.hashCode);
    _$hash = $jc(_$hash, llm.hashCode);
    _$hash = $jc(_$hash, tts.hashCode);
    _$hash = $jc(_$hash, warnings.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto')
          ..add('agentRoleId', agentRoleId)
          ..add('agentRoleCode', agentRoleCode)
          ..add('agentRoleName', agentRoleName)
          ..add('agentRoleVersion', agentRoleVersion)
          ..add('agentRoleReleaseId', agentRoleReleaseId)
          ..add('agentRoleConfigSource', agentRoleConfigSource)
          ..add('pipelineTemplateId', pipelineTemplateId)
          ..add('requestedInvocationMode', requestedInvocationMode)
          ..add('effectiveInvocationMode', effectiveInvocationMode)
          ..add('fallbackMode', fallbackMode)
          ..add('baselineNodes', baselineNodes)
          ..add('enabledStages', enabledStages)
          ..add('disabledStages', disabledStages)
          ..add('providerRoute', providerRoute)
          ..add('usesMixedProviders', usesMixedProviders)
          ..add('vad', vad)
          ..add('asr', asr)
          ..add('llm', llm)
          ..add('tts', tts)
          ..add('warnings', warnings))
        .toString();
  }
}

class AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder
    implements
        Builder<
            AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto,
            AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder> {
  _$AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto?
      _$v;

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

  String? _agentRoleVersion;
  String? get agentRoleVersion => _$this._agentRoleVersion;
  set agentRoleVersion(String? agentRoleVersion) =>
      _$this._agentRoleVersion = agentRoleVersion;

  String? _agentRoleReleaseId;
  String? get agentRoleReleaseId => _$this._agentRoleReleaseId;
  set agentRoleReleaseId(String? agentRoleReleaseId) =>
      _$this._agentRoleReleaseId = agentRoleReleaseId;

  String? _agentRoleConfigSource;
  String? get agentRoleConfigSource => _$this._agentRoleConfigSource;
  set agentRoleConfigSource(String? agentRoleConfigSource) =>
      _$this._agentRoleConfigSource = agentRoleConfigSource;

  String? _pipelineTemplateId;
  String? get pipelineTemplateId => _$this._pipelineTemplateId;
  set pipelineTemplateId(String? pipelineTemplateId) =>
      _$this._pipelineTemplateId = pipelineTemplateId;

  String? _requestedInvocationMode;
  String? get requestedInvocationMode => _$this._requestedInvocationMode;
  set requestedInvocationMode(String? requestedInvocationMode) =>
      _$this._requestedInvocationMode = requestedInvocationMode;

  String? _effectiveInvocationMode;
  String? get effectiveInvocationMode => _$this._effectiveInvocationMode;
  set effectiveInvocationMode(String? effectiveInvocationMode) =>
      _$this._effectiveInvocationMode = effectiveInvocationMode;

  String? _fallbackMode;
  String? get fallbackMode => _$this._fallbackMode;
  set fallbackMode(String? fallbackMode) => _$this._fallbackMode = fallbackMode;

  ListBuilder<String>? _baselineNodes;
  ListBuilder<String> get baselineNodes =>
      _$this._baselineNodes ??= ListBuilder<String>();
  set baselineNodes(ListBuilder<String>? baselineNodes) =>
      _$this._baselineNodes = baselineNodes;

  ListBuilder<String>? _enabledStages;
  ListBuilder<String> get enabledStages =>
      _$this._enabledStages ??= ListBuilder<String>();
  set enabledStages(ListBuilder<String>? enabledStages) =>
      _$this._enabledStages = enabledStages;

  ListBuilder<String>? _disabledStages;
  ListBuilder<String> get disabledStages =>
      _$this._disabledStages ??= ListBuilder<String>();
  set disabledStages(ListBuilder<String>? disabledStages) =>
      _$this._disabledStages = disabledStages;

  ListBuilder<String>? _providerRoute;
  ListBuilder<String> get providerRoute =>
      _$this._providerRoute ??= ListBuilder<String>();
  set providerRoute(ListBuilder<String>? providerRoute) =>
      _$this._providerRoute = providerRoute;

  bool? _usesMixedProviders;
  bool? get usesMixedProviders => _$this._usesMixedProviders;
  set usesMixedProviders(bool? usesMixedProviders) =>
      _$this._usesMixedProviders = usesMixedProviders;

  AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder? _vad;
  AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder
      get vad => _$this._vad ??=
          AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder();
  set vad(
          AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder?
              vad) =>
      _$this._vad = vad;

  AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder? _asr;
  AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder
      get asr => _$this._asr ??=
          AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder();
  set asr(
          AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder?
              asr) =>
      _$this._asr = asr;

  AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder? _llm;
  AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder
      get llm => _$this._llm ??=
          AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder();
  set llm(
          AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder?
              llm) =>
      _$this._llm = llm;

  AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder? _tts;
  AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder
      get tts => _$this._tts ??=
          AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder();
  set tts(
          AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder?
              tts) =>
      _$this._tts = tts;

  ListBuilder<String>? _warnings;
  ListBuilder<String> get warnings =>
      _$this._warnings ??= ListBuilder<String>();
  set warnings(ListBuilder<String>? warnings) => _$this._warnings = warnings;

  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder() {
    AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto
        ._defaults(this);
  }

  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _agentRoleId = $v.agentRoleId;
      _agentRoleCode = $v.agentRoleCode;
      _agentRoleName = $v.agentRoleName;
      _agentRoleVersion = $v.agentRoleVersion;
      _agentRoleReleaseId = $v.agentRoleReleaseId;
      _agentRoleConfigSource = $v.agentRoleConfigSource;
      _pipelineTemplateId = $v.pipelineTemplateId;
      _requestedInvocationMode = $v.requestedInvocationMode;
      _effectiveInvocationMode = $v.effectiveInvocationMode;
      _fallbackMode = $v.fallbackMode;
      _baselineNodes = $v.baselineNodes?.toBuilder();
      _enabledStages = $v.enabledStages?.toBuilder();
      _disabledStages = $v.disabledStages?.toBuilder();
      _providerRoute = $v.providerRoute?.toBuilder();
      _usesMixedProviders = $v.usesMixedProviders;
      _vad = $v.vad?.toBuilder();
      _asr = $v.asr?.toBuilder();
      _llm = $v.llm?.toBuilder();
      _tts = $v.tts?.toBuilder();
      _warnings = $v.warnings?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto
          other) {
    _$v = other
        as _$AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto
      build() => _build();

  _$AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto
      _build() {
    _$AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto
              ._(
            agentRoleId: agentRoleId,
            agentRoleCode: agentRoleCode,
            agentRoleName: agentRoleName,
            agentRoleVersion: agentRoleVersion,
            agentRoleReleaseId: agentRoleReleaseId,
            agentRoleConfigSource: agentRoleConfigSource,
            pipelineTemplateId: pipelineTemplateId,
            requestedInvocationMode: requestedInvocationMode,
            effectiveInvocationMode: effectiveInvocationMode,
            fallbackMode: fallbackMode,
            baselineNodes: _baselineNodes?.build(),
            enabledStages: _enabledStages?.build(),
            disabledStages: _disabledStages?.build(),
            providerRoute: _providerRoute?.build(),
            usesMixedProviders: usesMixedProviders,
            vad: _vad?.build(),
            asr: _asr?.build(),
            llm: _llm?.build(),
            tts: _tts?.build(),
            warnings: _warnings?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'baselineNodes';
        _baselineNodes?.build();
        _$failedField = 'enabledStages';
        _enabledStages?.build();
        _$failedField = 'disabledStages';
        _disabledStages?.build();
        _$failedField = 'providerRoute';
        _providerRoute?.build();

        _$failedField = 'vad';
        _vad?.build();
        _$failedField = 'asr';
        _asr?.build();
        _$failedField = 'llm';
        _llm?.build();
        _$failedField = 'tts';
        _tts?.build();
        _$failedField = 'warnings';
        _warnings?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto',
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
