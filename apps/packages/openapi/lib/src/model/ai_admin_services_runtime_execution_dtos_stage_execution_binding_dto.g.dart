// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_runtime_execution_dtos_stage_execution_binding_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto
    extends AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto {
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
  final String? capabilitySource;
  @override
  final BuiltList<String>? capabilityTags;
  @override
  final String? adapterCode;
  @override
  final String? adapterName;
  @override
  final bool? isResolved;
  @override
  final String? resolutionMode;
  @override
  final String? resolutionDetail;
  @override
  final BuiltList<String>? warnings;

  factory _$AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto(
          [void Function(
                  AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDtoBuilder)?
              updates]) =>
      (AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto._(
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
      this.capabilitySource,
      this.capabilityTags,
      this.adapterCode,
      this.adapterName,
      this.isResolved,
      this.resolutionMode,
      this.resolutionDetail,
      this.warnings})
      : super._();
  @override
  AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto rebuild(
          void Function(
                  AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDtoBuilder
      toBuilder() =>
          AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto &&
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
        capabilitySource == other.capabilitySource &&
        capabilityTags == other.capabilityTags &&
        adapterCode == other.adapterCode &&
        adapterName == other.adapterName &&
        isResolved == other.isResolved &&
        resolutionMode == other.resolutionMode &&
        resolutionDetail == other.resolutionDetail &&
        warnings == other.warnings;
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
    _$hash = $jc(_$hash, capabilitySource.hashCode);
    _$hash = $jc(_$hash, capabilityTags.hashCode);
    _$hash = $jc(_$hash, adapterCode.hashCode);
    _$hash = $jc(_$hash, adapterName.hashCode);
    _$hash = $jc(_$hash, isResolved.hashCode);
    _$hash = $jc(_$hash, resolutionMode.hashCode);
    _$hash = $jc(_$hash, resolutionDetail.hashCode);
    _$hash = $jc(_$hash, warnings.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto')
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
          ..add('capabilitySource', capabilitySource)
          ..add('capabilityTags', capabilityTags)
          ..add('adapterCode', adapterCode)
          ..add('adapterName', adapterName)
          ..add('isResolved', isResolved)
          ..add('resolutionMode', resolutionMode)
          ..add('resolutionDetail', resolutionDetail)
          ..add('warnings', warnings))
        .toString();
  }
}

class AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDtoBuilder
    implements
        Builder<AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto,
            AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDtoBuilder> {
  _$AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto? _$v;

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

  String? _capabilitySource;
  String? get capabilitySource => _$this._capabilitySource;
  set capabilitySource(String? capabilitySource) =>
      _$this._capabilitySource = capabilitySource;

  ListBuilder<String>? _capabilityTags;
  ListBuilder<String> get capabilityTags =>
      _$this._capabilityTags ??= ListBuilder<String>();
  set capabilityTags(ListBuilder<String>? capabilityTags) =>
      _$this._capabilityTags = capabilityTags;

  String? _adapterCode;
  String? get adapterCode => _$this._adapterCode;
  set adapterCode(String? adapterCode) => _$this._adapterCode = adapterCode;

  String? _adapterName;
  String? get adapterName => _$this._adapterName;
  set adapterName(String? adapterName) => _$this._adapterName = adapterName;

  bool? _isResolved;
  bool? get isResolved => _$this._isResolved;
  set isResolved(bool? isResolved) => _$this._isResolved = isResolved;

  String? _resolutionMode;
  String? get resolutionMode => _$this._resolutionMode;
  set resolutionMode(String? resolutionMode) =>
      _$this._resolutionMode = resolutionMode;

  String? _resolutionDetail;
  String? get resolutionDetail => _$this._resolutionDetail;
  set resolutionDetail(String? resolutionDetail) =>
      _$this._resolutionDetail = resolutionDetail;

  ListBuilder<String>? _warnings;
  ListBuilder<String> get warnings =>
      _$this._warnings ??= ListBuilder<String>();
  set warnings(ListBuilder<String>? warnings) => _$this._warnings = warnings;

  AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDtoBuilder() {
    AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto._defaults(this);
  }

  AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDtoBuilder
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
      _capabilitySource = $v.capabilitySource;
      _capabilityTags = $v.capabilityTags?.toBuilder();
      _adapterCode = $v.adapterCode;
      _adapterName = $v.adapterName;
      _isResolved = $v.isResolved;
      _resolutionMode = $v.resolutionMode;
      _resolutionDetail = $v.resolutionDetail;
      _warnings = $v.warnings?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto other) {
    _$v =
        other as _$AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto build() =>
      _build();

  _$AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto _build() {
    _$AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto._(
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
            capabilitySource: capabilitySource,
            capabilityTags: _capabilityTags?.build(),
            adapterCode: adapterCode,
            adapterName: adapterName,
            isResolved: isResolved,
            resolutionMode: resolutionMode,
            resolutionDetail: resolutionDetail,
            warnings: _warnings?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'capabilityTags';
        _capabilityTags?.build();

        _$failedField = 'warnings';
        _warnings?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto',
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
