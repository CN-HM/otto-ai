// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_runtime_execution_dtos_stage_execution_trace_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto
    extends AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto {
  @override
  final String? sessionId;
  @override
  final String? deviceId;
  @override
  final String? agentRoleId;
  @override
  final String? agentRoleCode;
  @override
  final String? agentRoleVersion;
  @override
  final String? agentRoleReleaseId;
  @override
  final String? agentRoleConfigSource;
  @override
  final String? stage;
  @override
  final String? requestedInvocationMode;
  @override
  final String? plannedInvocationMode;
  @override
  final String? actualInvocationMode;
  @override
  final String? fallbackMode;
  @override
  final String? fallbackReason;
  @override
  final String? failureReason;
  @override
  final String? profileId;
  @override
  final String? providerCode;
  @override
  final AiAdminEntitiesProviderType? providerType;
  @override
  final String? providerName;
  @override
  final String? providerFamily;
  @override
  final String? capabilitySource;
  @override
  final BuiltList<String>? capabilityTags;
  @override
  final bool? succeeded;
  @override
  final int? durationMs;
  @override
  final String? errorCode;
  @override
  final String? errorMessage;

  factory _$AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto(
          [void Function(
                  AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDtoBuilder)?
              updates]) =>
      (AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto._(
      {this.sessionId,
      this.deviceId,
      this.agentRoleId,
      this.agentRoleCode,
      this.agentRoleVersion,
      this.agentRoleReleaseId,
      this.agentRoleConfigSource,
      this.stage,
      this.requestedInvocationMode,
      this.plannedInvocationMode,
      this.actualInvocationMode,
      this.fallbackMode,
      this.fallbackReason,
      this.failureReason,
      this.profileId,
      this.providerCode,
      this.providerType,
      this.providerName,
      this.providerFamily,
      this.capabilitySource,
      this.capabilityTags,
      this.succeeded,
      this.durationMs,
      this.errorCode,
      this.errorMessage})
      : super._();
  @override
  AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto rebuild(
          void Function(
                  AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDtoBuilder
      toBuilder() =>
          AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto &&
        sessionId == other.sessionId &&
        deviceId == other.deviceId &&
        agentRoleId == other.agentRoleId &&
        agentRoleCode == other.agentRoleCode &&
        agentRoleVersion == other.agentRoleVersion &&
        agentRoleReleaseId == other.agentRoleReleaseId &&
        agentRoleConfigSource == other.agentRoleConfigSource &&
        stage == other.stage &&
        requestedInvocationMode == other.requestedInvocationMode &&
        plannedInvocationMode == other.plannedInvocationMode &&
        actualInvocationMode == other.actualInvocationMode &&
        fallbackMode == other.fallbackMode &&
        fallbackReason == other.fallbackReason &&
        failureReason == other.failureReason &&
        profileId == other.profileId &&
        providerCode == other.providerCode &&
        providerType == other.providerType &&
        providerName == other.providerName &&
        providerFamily == other.providerFamily &&
        capabilitySource == other.capabilitySource &&
        capabilityTags == other.capabilityTags &&
        succeeded == other.succeeded &&
        durationMs == other.durationMs &&
        errorCode == other.errorCode &&
        errorMessage == other.errorMessage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, sessionId.hashCode);
    _$hash = $jc(_$hash, deviceId.hashCode);
    _$hash = $jc(_$hash, agentRoleId.hashCode);
    _$hash = $jc(_$hash, agentRoleCode.hashCode);
    _$hash = $jc(_$hash, agentRoleVersion.hashCode);
    _$hash = $jc(_$hash, agentRoleReleaseId.hashCode);
    _$hash = $jc(_$hash, agentRoleConfigSource.hashCode);
    _$hash = $jc(_$hash, stage.hashCode);
    _$hash = $jc(_$hash, requestedInvocationMode.hashCode);
    _$hash = $jc(_$hash, plannedInvocationMode.hashCode);
    _$hash = $jc(_$hash, actualInvocationMode.hashCode);
    _$hash = $jc(_$hash, fallbackMode.hashCode);
    _$hash = $jc(_$hash, fallbackReason.hashCode);
    _$hash = $jc(_$hash, failureReason.hashCode);
    _$hash = $jc(_$hash, profileId.hashCode);
    _$hash = $jc(_$hash, providerCode.hashCode);
    _$hash = $jc(_$hash, providerType.hashCode);
    _$hash = $jc(_$hash, providerName.hashCode);
    _$hash = $jc(_$hash, providerFamily.hashCode);
    _$hash = $jc(_$hash, capabilitySource.hashCode);
    _$hash = $jc(_$hash, capabilityTags.hashCode);
    _$hash = $jc(_$hash, succeeded.hashCode);
    _$hash = $jc(_$hash, durationMs.hashCode);
    _$hash = $jc(_$hash, errorCode.hashCode);
    _$hash = $jc(_$hash, errorMessage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto')
          ..add('sessionId', sessionId)
          ..add('deviceId', deviceId)
          ..add('agentRoleId', agentRoleId)
          ..add('agentRoleCode', agentRoleCode)
          ..add('agentRoleVersion', agentRoleVersion)
          ..add('agentRoleReleaseId', agentRoleReleaseId)
          ..add('agentRoleConfigSource', agentRoleConfigSource)
          ..add('stage', stage)
          ..add('requestedInvocationMode', requestedInvocationMode)
          ..add('plannedInvocationMode', plannedInvocationMode)
          ..add('actualInvocationMode', actualInvocationMode)
          ..add('fallbackMode', fallbackMode)
          ..add('fallbackReason', fallbackReason)
          ..add('failureReason', failureReason)
          ..add('profileId', profileId)
          ..add('providerCode', providerCode)
          ..add('providerType', providerType)
          ..add('providerName', providerName)
          ..add('providerFamily', providerFamily)
          ..add('capabilitySource', capabilitySource)
          ..add('capabilityTags', capabilityTags)
          ..add('succeeded', succeeded)
          ..add('durationMs', durationMs)
          ..add('errorCode', errorCode)
          ..add('errorMessage', errorMessage))
        .toString();
  }
}

class AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDtoBuilder
    implements
        Builder<AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto,
            AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDtoBuilder> {
  _$AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto? _$v;

  String? _sessionId;
  String? get sessionId => _$this._sessionId;
  set sessionId(String? sessionId) => _$this._sessionId = sessionId;

  String? _deviceId;
  String? get deviceId => _$this._deviceId;
  set deviceId(String? deviceId) => _$this._deviceId = deviceId;

  String? _agentRoleId;
  String? get agentRoleId => _$this._agentRoleId;
  set agentRoleId(String? agentRoleId) => _$this._agentRoleId = agentRoleId;

  String? _agentRoleCode;
  String? get agentRoleCode => _$this._agentRoleCode;
  set agentRoleCode(String? agentRoleCode) =>
      _$this._agentRoleCode = agentRoleCode;

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

  String? _stage;
  String? get stage => _$this._stage;
  set stage(String? stage) => _$this._stage = stage;

  String? _requestedInvocationMode;
  String? get requestedInvocationMode => _$this._requestedInvocationMode;
  set requestedInvocationMode(String? requestedInvocationMode) =>
      _$this._requestedInvocationMode = requestedInvocationMode;

  String? _plannedInvocationMode;
  String? get plannedInvocationMode => _$this._plannedInvocationMode;
  set plannedInvocationMode(String? plannedInvocationMode) =>
      _$this._plannedInvocationMode = plannedInvocationMode;

  String? _actualInvocationMode;
  String? get actualInvocationMode => _$this._actualInvocationMode;
  set actualInvocationMode(String? actualInvocationMode) =>
      _$this._actualInvocationMode = actualInvocationMode;

  String? _fallbackMode;
  String? get fallbackMode => _$this._fallbackMode;
  set fallbackMode(String? fallbackMode) => _$this._fallbackMode = fallbackMode;

  String? _fallbackReason;
  String? get fallbackReason => _$this._fallbackReason;
  set fallbackReason(String? fallbackReason) =>
      _$this._fallbackReason = fallbackReason;

  String? _failureReason;
  String? get failureReason => _$this._failureReason;
  set failureReason(String? failureReason) =>
      _$this._failureReason = failureReason;

  String? _profileId;
  String? get profileId => _$this._profileId;
  set profileId(String? profileId) => _$this._profileId = profileId;

  String? _providerCode;
  String? get providerCode => _$this._providerCode;
  set providerCode(String? providerCode) => _$this._providerCode = providerCode;

  AiAdminEntitiesProviderType? _providerType;
  AiAdminEntitiesProviderType? get providerType => _$this._providerType;
  set providerType(AiAdminEntitiesProviderType? providerType) =>
      _$this._providerType = providerType;

  String? _providerName;
  String? get providerName => _$this._providerName;
  set providerName(String? providerName) => _$this._providerName = providerName;

  String? _providerFamily;
  String? get providerFamily => _$this._providerFamily;
  set providerFamily(String? providerFamily) =>
      _$this._providerFamily = providerFamily;

  String? _capabilitySource;
  String? get capabilitySource => _$this._capabilitySource;
  set capabilitySource(String? capabilitySource) =>
      _$this._capabilitySource = capabilitySource;

  ListBuilder<String>? _capabilityTags;
  ListBuilder<String> get capabilityTags =>
      _$this._capabilityTags ??= ListBuilder<String>();
  set capabilityTags(ListBuilder<String>? capabilityTags) =>
      _$this._capabilityTags = capabilityTags;

  bool? _succeeded;
  bool? get succeeded => _$this._succeeded;
  set succeeded(bool? succeeded) => _$this._succeeded = succeeded;

  int? _durationMs;
  int? get durationMs => _$this._durationMs;
  set durationMs(int? durationMs) => _$this._durationMs = durationMs;

  String? _errorCode;
  String? get errorCode => _$this._errorCode;
  set errorCode(String? errorCode) => _$this._errorCode = errorCode;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDtoBuilder() {
    AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto._defaults(this);
  }

  AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sessionId = $v.sessionId;
      _deviceId = $v.deviceId;
      _agentRoleId = $v.agentRoleId;
      _agentRoleCode = $v.agentRoleCode;
      _agentRoleVersion = $v.agentRoleVersion;
      _agentRoleReleaseId = $v.agentRoleReleaseId;
      _agentRoleConfigSource = $v.agentRoleConfigSource;
      _stage = $v.stage;
      _requestedInvocationMode = $v.requestedInvocationMode;
      _plannedInvocationMode = $v.plannedInvocationMode;
      _actualInvocationMode = $v.actualInvocationMode;
      _fallbackMode = $v.fallbackMode;
      _fallbackReason = $v.fallbackReason;
      _failureReason = $v.failureReason;
      _profileId = $v.profileId;
      _providerCode = $v.providerCode;
      _providerType = $v.providerType;
      _providerName = $v.providerName;
      _providerFamily = $v.providerFamily;
      _capabilitySource = $v.capabilitySource;
      _capabilityTags = $v.capabilityTags?.toBuilder();
      _succeeded = $v.succeeded;
      _durationMs = $v.durationMs;
      _errorCode = $v.errorCode;
      _errorMessage = $v.errorMessage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto other) {
    _$v = other as _$AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto build() => _build();

  _$AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto _build() {
    _$AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto._(
            sessionId: sessionId,
            deviceId: deviceId,
            agentRoleId: agentRoleId,
            agentRoleCode: agentRoleCode,
            agentRoleVersion: agentRoleVersion,
            agentRoleReleaseId: agentRoleReleaseId,
            agentRoleConfigSource: agentRoleConfigSource,
            stage: stage,
            requestedInvocationMode: requestedInvocationMode,
            plannedInvocationMode: plannedInvocationMode,
            actualInvocationMode: actualInvocationMode,
            fallbackMode: fallbackMode,
            fallbackReason: fallbackReason,
            failureReason: failureReason,
            profileId: profileId,
            providerCode: providerCode,
            providerType: providerType,
            providerName: providerName,
            providerFamily: providerFamily,
            capabilitySource: capabilitySource,
            capabilityTags: _capabilityTags?.build(),
            succeeded: succeeded,
            durationMs: durationMs,
            errorCode: errorCode,
            errorMessage: errorMessage,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'capabilityTags';
        _capabilityTags?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto',
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
