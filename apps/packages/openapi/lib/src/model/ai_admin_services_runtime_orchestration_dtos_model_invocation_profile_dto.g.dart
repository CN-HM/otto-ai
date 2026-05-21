// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_runtime_orchestration_dtos_model_invocation_profile_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto
    extends AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto {
  @override
  final String? stage;
  @override
  final String? profileId;
  @override
  final String? modelType;
  @override
  final String? modelCode;
  @override
  final String? modelName;
  @override
  final String? providerCode;
  @override
  final AiAdminEntitiesProviderType? providerType;
  @override
  final String? providerName;
  @override
  final String? providerFamily;
  @override
  final String? invocationMode;
  @override
  final bool? supportsStreamingInput;
  @override
  final bool? supportsStreamingOutput;
  @override
  final int? firstPacketTimeoutMs;
  @override
  final int? streamIdleTimeoutMs;
  @override
  final String? capabilitySource;
  @override
  final BuiltList<String>? capabilityTags;

  factory _$AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto(
          [void Function(
                  AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder)?
              updates]) =>
      (AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto._(
      {this.stage,
      this.profileId,
      this.modelType,
      this.modelCode,
      this.modelName,
      this.providerCode,
      this.providerType,
      this.providerName,
      this.providerFamily,
      this.invocationMode,
      this.supportsStreamingInput,
      this.supportsStreamingOutput,
      this.firstPacketTimeoutMs,
      this.streamIdleTimeoutMs,
      this.capabilitySource,
      this.capabilityTags})
      : super._();
  @override
  AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto rebuild(
          void Function(
                  AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder
      toBuilder() =>
          AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto &&
        stage == other.stage &&
        profileId == other.profileId &&
        modelType == other.modelType &&
        modelCode == other.modelCode &&
        modelName == other.modelName &&
        providerCode == other.providerCode &&
        providerType == other.providerType &&
        providerName == other.providerName &&
        providerFamily == other.providerFamily &&
        invocationMode == other.invocationMode &&
        supportsStreamingInput == other.supportsStreamingInput &&
        supportsStreamingOutput == other.supportsStreamingOutput &&
        firstPacketTimeoutMs == other.firstPacketTimeoutMs &&
        streamIdleTimeoutMs == other.streamIdleTimeoutMs &&
        capabilitySource == other.capabilitySource &&
        capabilityTags == other.capabilityTags;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, stage.hashCode);
    _$hash = $jc(_$hash, profileId.hashCode);
    _$hash = $jc(_$hash, modelType.hashCode);
    _$hash = $jc(_$hash, modelCode.hashCode);
    _$hash = $jc(_$hash, modelName.hashCode);
    _$hash = $jc(_$hash, providerCode.hashCode);
    _$hash = $jc(_$hash, providerType.hashCode);
    _$hash = $jc(_$hash, providerName.hashCode);
    _$hash = $jc(_$hash, providerFamily.hashCode);
    _$hash = $jc(_$hash, invocationMode.hashCode);
    _$hash = $jc(_$hash, supportsStreamingInput.hashCode);
    _$hash = $jc(_$hash, supportsStreamingOutput.hashCode);
    _$hash = $jc(_$hash, firstPacketTimeoutMs.hashCode);
    _$hash = $jc(_$hash, streamIdleTimeoutMs.hashCode);
    _$hash = $jc(_$hash, capabilitySource.hashCode);
    _$hash = $jc(_$hash, capabilityTags.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto')
          ..add('stage', stage)
          ..add('profileId', profileId)
          ..add('modelType', modelType)
          ..add('modelCode', modelCode)
          ..add('modelName', modelName)
          ..add('providerCode', providerCode)
          ..add('providerType', providerType)
          ..add('providerName', providerName)
          ..add('providerFamily', providerFamily)
          ..add('invocationMode', invocationMode)
          ..add('supportsStreamingInput', supportsStreamingInput)
          ..add('supportsStreamingOutput', supportsStreamingOutput)
          ..add('firstPacketTimeoutMs', firstPacketTimeoutMs)
          ..add('streamIdleTimeoutMs', streamIdleTimeoutMs)
          ..add('capabilitySource', capabilitySource)
          ..add('capabilityTags', capabilityTags))
        .toString();
  }
}

class AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder
    implements
        Builder<
            AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto,
            AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder> {
  _$AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto? _$v;

  String? _stage;
  String? get stage => _$this._stage;
  set stage(String? stage) => _$this._stage = stage;

  String? _profileId;
  String? get profileId => _$this._profileId;
  set profileId(String? profileId) => _$this._profileId = profileId;

  String? _modelType;
  String? get modelType => _$this._modelType;
  set modelType(String? modelType) => _$this._modelType = modelType;

  String? _modelCode;
  String? get modelCode => _$this._modelCode;
  set modelCode(String? modelCode) => _$this._modelCode = modelCode;

  String? _modelName;
  String? get modelName => _$this._modelName;
  set modelName(String? modelName) => _$this._modelName = modelName;

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

  String? _invocationMode;
  String? get invocationMode => _$this._invocationMode;
  set invocationMode(String? invocationMode) =>
      _$this._invocationMode = invocationMode;

  bool? _supportsStreamingInput;
  bool? get supportsStreamingInput => _$this._supportsStreamingInput;
  set supportsStreamingInput(bool? supportsStreamingInput) =>
      _$this._supportsStreamingInput = supportsStreamingInput;

  bool? _supportsStreamingOutput;
  bool? get supportsStreamingOutput => _$this._supportsStreamingOutput;
  set supportsStreamingOutput(bool? supportsStreamingOutput) =>
      _$this._supportsStreamingOutput = supportsStreamingOutput;

  int? _firstPacketTimeoutMs;
  int? get firstPacketTimeoutMs => _$this._firstPacketTimeoutMs;
  set firstPacketTimeoutMs(int? firstPacketTimeoutMs) =>
      _$this._firstPacketTimeoutMs = firstPacketTimeoutMs;

  int? _streamIdleTimeoutMs;
  int? get streamIdleTimeoutMs => _$this._streamIdleTimeoutMs;
  set streamIdleTimeoutMs(int? streamIdleTimeoutMs) =>
      _$this._streamIdleTimeoutMs = streamIdleTimeoutMs;

  String? _capabilitySource;
  String? get capabilitySource => _$this._capabilitySource;
  set capabilitySource(String? capabilitySource) =>
      _$this._capabilitySource = capabilitySource;

  ListBuilder<String>? _capabilityTags;
  ListBuilder<String> get capabilityTags =>
      _$this._capabilityTags ??= ListBuilder<String>();
  set capabilityTags(ListBuilder<String>? capabilityTags) =>
      _$this._capabilityTags = capabilityTags;

  AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder() {
    AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto._defaults(
        this);
  }

  AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _stage = $v.stage;
      _profileId = $v.profileId;
      _modelType = $v.modelType;
      _modelCode = $v.modelCode;
      _modelName = $v.modelName;
      _providerCode = $v.providerCode;
      _providerType = $v.providerType;
      _providerName = $v.providerName;
      _providerFamily = $v.providerFamily;
      _invocationMode = $v.invocationMode;
      _supportsStreamingInput = $v.supportsStreamingInput;
      _supportsStreamingOutput = $v.supportsStreamingOutput;
      _firstPacketTimeoutMs = $v.firstPacketTimeoutMs;
      _streamIdleTimeoutMs = $v.streamIdleTimeoutMs;
      _capabilitySource = $v.capabilitySource;
      _capabilityTags = $v.capabilityTags?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto other) {
    _$v = other
        as _$AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto build() =>
      _build();

  _$AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto _build() {
    _$AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto._(
            stage: stage,
            profileId: profileId,
            modelType: modelType,
            modelCode: modelCode,
            modelName: modelName,
            providerCode: providerCode,
            providerType: providerType,
            providerName: providerName,
            providerFamily: providerFamily,
            invocationMode: invocationMode,
            supportsStreamingInput: supportsStreamingInput,
            supportsStreamingOutput: supportsStreamingOutput,
            firstPacketTimeoutMs: firstPacketTimeoutMs,
            streamIdleTimeoutMs: streamIdleTimeoutMs,
            capabilitySource: capabilitySource,
            capabilityTags: _capabilityTags?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'capabilityTags';
        _capabilityTags?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto',
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
