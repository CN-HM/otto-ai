// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_runtime_execution_dtos_tts_synthesis_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto
    extends AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto {
  @override
  final String? invocationMode;
  @override
  final String? contentType;
  @override
  final String? format;
  @override
  final String? audioBase64;
  @override
  final int? audioSize;
  @override
  final String? rawResponseJson;
  @override
  final AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto? stageTrace;

  factory _$AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto(
          [void Function(
                  AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder)?
              updates]) =>
      (AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto._(
      {this.invocationMode,
      this.contentType,
      this.format,
      this.audioBase64,
      this.audioSize,
      this.rawResponseJson,
      this.stageTrace})
      : super._();
  @override
  AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto rebuild(
          void Function(
                  AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder
      toBuilder() =>
          AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto &&
        invocationMode == other.invocationMode &&
        contentType == other.contentType &&
        format == other.format &&
        audioBase64 == other.audioBase64 &&
        audioSize == other.audioSize &&
        rawResponseJson == other.rawResponseJson &&
        stageTrace == other.stageTrace;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, invocationMode.hashCode);
    _$hash = $jc(_$hash, contentType.hashCode);
    _$hash = $jc(_$hash, format.hashCode);
    _$hash = $jc(_$hash, audioBase64.hashCode);
    _$hash = $jc(_$hash, audioSize.hashCode);
    _$hash = $jc(_$hash, rawResponseJson.hashCode);
    _$hash = $jc(_$hash, stageTrace.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto')
          ..add('invocationMode', invocationMode)
          ..add('contentType', contentType)
          ..add('format', format)
          ..add('audioBase64', audioBase64)
          ..add('audioSize', audioSize)
          ..add('rawResponseJson', rawResponseJson)
          ..add('stageTrace', stageTrace))
        .toString();
  }
}

class AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder
    implements
        Builder<AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto,
            AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder> {
  _$AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto? _$v;

  String? _invocationMode;
  String? get invocationMode => _$this._invocationMode;
  set invocationMode(String? invocationMode) =>
      _$this._invocationMode = invocationMode;

  String? _contentType;
  String? get contentType => _$this._contentType;
  set contentType(String? contentType) => _$this._contentType = contentType;

  String? _format;
  String? get format => _$this._format;
  set format(String? format) => _$this._format = format;

  String? _audioBase64;
  String? get audioBase64 => _$this._audioBase64;
  set audioBase64(String? audioBase64) => _$this._audioBase64 = audioBase64;

  int? _audioSize;
  int? get audioSize => _$this._audioSize;
  set audioSize(int? audioSize) => _$this._audioSize = audioSize;

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

  AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder() {
    AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto._defaults(this);
  }

  AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _invocationMode = $v.invocationMode;
      _contentType = $v.contentType;
      _format = $v.format;
      _audioBase64 = $v.audioBase64;
      _audioSize = $v.audioSize;
      _rawResponseJson = $v.rawResponseJson;
      _stageTrace = $v.stageTrace?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto other) {
    _$v = other as _$AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto build() =>
      _build();

  _$AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto _build() {
    _$AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto._(
            invocationMode: invocationMode,
            contentType: contentType,
            format: format,
            audioBase64: audioBase64,
            audioSize: audioSize,
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
            r'AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto',
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
