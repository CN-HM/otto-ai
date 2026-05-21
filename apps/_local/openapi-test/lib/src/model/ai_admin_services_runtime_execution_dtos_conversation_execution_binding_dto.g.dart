// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_runtime_execution_dtos_conversation_execution_binding_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto
    extends AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto {
  @override
  final AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto?
      orchestration;
  @override
  final BuiltList<String>? adapterRoute;
  @override
  final bool? usesMixedAdapters;
  @override
  final bool? isFullyResolved;
  @override
  final BuiltList<String>? missingStages;
  @override
  final AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto? asr;
  @override
  final AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto? llm;
  @override
  final AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto? tts;
  @override
  final BuiltList<String>? warnings;

  factory _$AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto(
          [void Function(
                  AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoBuilder)?
              updates]) =>
      (AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto._(
      {this.orchestration,
      this.adapterRoute,
      this.usesMixedAdapters,
      this.isFullyResolved,
      this.missingStages,
      this.asr,
      this.llm,
      this.tts,
      this.warnings})
      : super._();
  @override
  AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto rebuild(
          void Function(
                  AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoBuilder
      toBuilder() =>
          AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto &&
        orchestration == other.orchestration &&
        adapterRoute == other.adapterRoute &&
        usesMixedAdapters == other.usesMixedAdapters &&
        isFullyResolved == other.isFullyResolved &&
        missingStages == other.missingStages &&
        asr == other.asr &&
        llm == other.llm &&
        tts == other.tts &&
        warnings == other.warnings;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, orchestration.hashCode);
    _$hash = $jc(_$hash, adapterRoute.hashCode);
    _$hash = $jc(_$hash, usesMixedAdapters.hashCode);
    _$hash = $jc(_$hash, isFullyResolved.hashCode);
    _$hash = $jc(_$hash, missingStages.hashCode);
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
            r'AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto')
          ..add('orchestration', orchestration)
          ..add('adapterRoute', adapterRoute)
          ..add('usesMixedAdapters', usesMixedAdapters)
          ..add('isFullyResolved', isFullyResolved)
          ..add('missingStages', missingStages)
          ..add('asr', asr)
          ..add('llm', llm)
          ..add('tts', tts)
          ..add('warnings', warnings))
        .toString();
  }
}

class AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoBuilder
    implements
        Builder<
            AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto,
            AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoBuilder> {
  _$AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto? _$v;

  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder?
      _orchestration;
  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder
      get orchestration => _$this._orchestration ??=
          AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder();
  set orchestration(
          AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder?
              orchestration) =>
      _$this._orchestration = orchestration;

  ListBuilder<String>? _adapterRoute;
  ListBuilder<String> get adapterRoute =>
      _$this._adapterRoute ??= ListBuilder<String>();
  set adapterRoute(ListBuilder<String>? adapterRoute) =>
      _$this._adapterRoute = adapterRoute;

  bool? _usesMixedAdapters;
  bool? get usesMixedAdapters => _$this._usesMixedAdapters;
  set usesMixedAdapters(bool? usesMixedAdapters) =>
      _$this._usesMixedAdapters = usesMixedAdapters;

  bool? _isFullyResolved;
  bool? get isFullyResolved => _$this._isFullyResolved;
  set isFullyResolved(bool? isFullyResolved) =>
      _$this._isFullyResolved = isFullyResolved;

  ListBuilder<String>? _missingStages;
  ListBuilder<String> get missingStages =>
      _$this._missingStages ??= ListBuilder<String>();
  set missingStages(ListBuilder<String>? missingStages) =>
      _$this._missingStages = missingStages;

  AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDtoBuilder? _asr;
  AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDtoBuilder get asr =>
      _$this._asr ??=
          AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDtoBuilder();
  set asr(
          AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDtoBuilder?
              asr) =>
      _$this._asr = asr;

  AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDtoBuilder? _llm;
  AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDtoBuilder get llm =>
      _$this._llm ??=
          AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDtoBuilder();
  set llm(
          AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDtoBuilder?
              llm) =>
      _$this._llm = llm;

  AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDtoBuilder? _tts;
  AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDtoBuilder get tts =>
      _$this._tts ??=
          AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDtoBuilder();
  set tts(
          AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDtoBuilder?
              tts) =>
      _$this._tts = tts;

  ListBuilder<String>? _warnings;
  ListBuilder<String> get warnings =>
      _$this._warnings ??= ListBuilder<String>();
  set warnings(ListBuilder<String>? warnings) => _$this._warnings = warnings;

  AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoBuilder() {
    AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto
        ._defaults(this);
  }

  AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _orchestration = $v.orchestration?.toBuilder();
      _adapterRoute = $v.adapterRoute?.toBuilder();
      _usesMixedAdapters = $v.usesMixedAdapters;
      _isFullyResolved = $v.isFullyResolved;
      _missingStages = $v.missingStages?.toBuilder();
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
      AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto
          other) {
    _$v = other
        as _$AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto build() =>
      _build();

  _$AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto
      _build() {
    _$AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto
              ._(
            orchestration: _orchestration?.build(),
            adapterRoute: _adapterRoute?.build(),
            usesMixedAdapters: usesMixedAdapters,
            isFullyResolved: isFullyResolved,
            missingStages: _missingStages?.build(),
            asr: _asr?.build(),
            llm: _llm?.build(),
            tts: _tts?.build(),
            warnings: _warnings?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'orchestration';
        _orchestration?.build();
        _$failedField = 'adapterRoute';
        _adapterRoute?.build();

        _$failedField = 'missingStages';
        _missingStages?.build();
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
            r'AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto',
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
