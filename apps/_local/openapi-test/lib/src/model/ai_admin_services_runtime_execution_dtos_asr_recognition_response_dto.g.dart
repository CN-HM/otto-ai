// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_runtime_execution_dtos_asr_recognition_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto
    extends AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto {
  @override
  final String? invocationMode;
  @override
  final String? transcript;
  @override
  final String? rawResponseJson;
  @override
  final AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto? stageTrace;

  factory _$AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto(
          [void Function(
                  AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder)?
              updates]) =>
      (AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto._(
      {this.invocationMode,
      this.transcript,
      this.rawResponseJson,
      this.stageTrace})
      : super._();
  @override
  AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto rebuild(
          void Function(
                  AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder
      toBuilder() =>
          AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto &&
        invocationMode == other.invocationMode &&
        transcript == other.transcript &&
        rawResponseJson == other.rawResponseJson &&
        stageTrace == other.stageTrace;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, invocationMode.hashCode);
    _$hash = $jc(_$hash, transcript.hashCode);
    _$hash = $jc(_$hash, rawResponseJson.hashCode);
    _$hash = $jc(_$hash, stageTrace.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto')
          ..add('invocationMode', invocationMode)
          ..add('transcript', transcript)
          ..add('rawResponseJson', rawResponseJson)
          ..add('stageTrace', stageTrace))
        .toString();
  }
}

class AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder
    implements
        Builder<AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto,
            AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder> {
  _$AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto? _$v;

  String? _invocationMode;
  String? get invocationMode => _$this._invocationMode;
  set invocationMode(String? invocationMode) =>
      _$this._invocationMode = invocationMode;

  String? _transcript;
  String? get transcript => _$this._transcript;
  set transcript(String? transcript) => _$this._transcript = transcript;

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

  AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder() {
    AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto._defaults(
        this);
  }

  AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _invocationMode = $v.invocationMode;
      _transcript = $v.transcript;
      _rawResponseJson = $v.rawResponseJson;
      _stageTrace = $v.stageTrace?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto other) {
    _$v =
        other as _$AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto build() =>
      _build();

  _$AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto _build() {
    _$AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto._(
            invocationMode: invocationMode,
            transcript: transcript,
            rawResponseJson: rawResponseJson,
            stageTrace: _stageTrace?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'stageTrace';
        _stageTrace?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto',
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
