// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_runtime_execution_dtos_llm_chat_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto
    extends AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto {
  @override
  final String? invocationMode;
  @override
  final String? providerResponseId;
  @override
  final String? model;
  @override
  final String? text;
  @override
  final String? finishReason;
  @override
  final AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto? usage;
  @override
  final String? rawResponseJson;
  @override
  final AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto? stageTrace;

  factory _$AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto(
          [void Function(
                  AiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder)?
              updates]) =>
      (AiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto._(
      {this.invocationMode,
      this.providerResponseId,
      this.model,
      this.text,
      this.finishReason,
      this.usage,
      this.rawResponseJson,
      this.stageTrace})
      : super._();
  @override
  AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto rebuild(
          void Function(
                  AiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder toBuilder() =>
      AiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto &&
        invocationMode == other.invocationMode &&
        providerResponseId == other.providerResponseId &&
        model == other.model &&
        text == other.text &&
        finishReason == other.finishReason &&
        usage == other.usage &&
        rawResponseJson == other.rawResponseJson &&
        stageTrace == other.stageTrace;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, invocationMode.hashCode);
    _$hash = $jc(_$hash, providerResponseId.hashCode);
    _$hash = $jc(_$hash, model.hashCode);
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jc(_$hash, finishReason.hashCode);
    _$hash = $jc(_$hash, usage.hashCode);
    _$hash = $jc(_$hash, rawResponseJson.hashCode);
    _$hash = $jc(_$hash, stageTrace.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto')
          ..add('invocationMode', invocationMode)
          ..add('providerResponseId', providerResponseId)
          ..add('model', model)
          ..add('text', text)
          ..add('finishReason', finishReason)
          ..add('usage', usage)
          ..add('rawResponseJson', rawResponseJson)
          ..add('stageTrace', stageTrace))
        .toString();
  }
}

class AiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder
    implements
        Builder<AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto,
            AiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder> {
  _$AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto? _$v;

  String? _invocationMode;
  String? get invocationMode => _$this._invocationMode;
  set invocationMode(String? invocationMode) =>
      _$this._invocationMode = invocationMode;

  String? _providerResponseId;
  String? get providerResponseId => _$this._providerResponseId;
  set providerResponseId(String? providerResponseId) =>
      _$this._providerResponseId = providerResponseId;

  String? _model;
  String? get model => _$this._model;
  set model(String? model) => _$this._model = model;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  String? _finishReason;
  String? get finishReason => _$this._finishReason;
  set finishReason(String? finishReason) => _$this._finishReason = finishReason;

  AiAdminServicesRuntimeExecutionDtosLlmChatUsageDtoBuilder? _usage;
  AiAdminServicesRuntimeExecutionDtosLlmChatUsageDtoBuilder get usage =>
      _$this._usage ??=
          AiAdminServicesRuntimeExecutionDtosLlmChatUsageDtoBuilder();
  set usage(AiAdminServicesRuntimeExecutionDtosLlmChatUsageDtoBuilder? usage) =>
      _$this._usage = usage;

  String? _rawResponseJson;
  String? get rawResponseJson => _$this._rawResponseJson;
  set rawResponseJson(String? rawResponseJson) =>
      _$this._rawResponseJson = rawResponseJson;

  AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDtoBuilder? _stageTrace;
  AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDtoBuilder
      get stageTrace => _$this._stageTrace ??=
          AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDtoBuilder();
  set stageTrace(
          AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDtoBuilder?
              stageTrace) =>
      _$this._stageTrace = stageTrace;

  AiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder() {
    AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto._defaults(this);
  }

  AiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _invocationMode = $v.invocationMode;
      _providerResponseId = $v.providerResponseId;
      _model = $v.model;
      _text = $v.text;
      _finishReason = $v.finishReason;
      _usage = $v.usage?.toBuilder();
      _rawResponseJson = $v.rawResponseJson;
      _stageTrace = $v.stageTrace?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto other) {
    _$v = other as _$AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto build() => _build();

  _$AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto _build() {
    _$AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto._(
            invocationMode: invocationMode,
            providerResponseId: providerResponseId,
            model: model,
            text: text,
            finishReason: finishReason,
            usage: _usage?.build(),
            rawResponseJson: rawResponseJson,
            stageTrace: _stageTrace?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'usage';
        _usage?.build();

        _$failedField = 'stageTrace';
        _stageTrace?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto',
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
