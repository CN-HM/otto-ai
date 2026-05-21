// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_runtime_execution_dtos_asr_recognition_request_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto
    extends AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto {
  @override
  final String? audioBase64;
  @override
  final String? audioFormat;
  @override
  final String? language;
  @override
  final BuiltMap<String, JsonObject?>? extraOptions;

  factory _$AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto(
          [void Function(
                  AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDtoBuilder)?
              updates]) =>
      (AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto._(
      {this.audioBase64, this.audioFormat, this.language, this.extraOptions})
      : super._();
  @override
  AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto rebuild(
          void Function(
                  AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDtoBuilder
      toBuilder() =>
          AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto &&
        audioBase64 == other.audioBase64 &&
        audioFormat == other.audioFormat &&
        language == other.language &&
        extraOptions == other.extraOptions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, audioBase64.hashCode);
    _$hash = $jc(_$hash, audioFormat.hashCode);
    _$hash = $jc(_$hash, language.hashCode);
    _$hash = $jc(_$hash, extraOptions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto')
          ..add('audioBase64', audioBase64)
          ..add('audioFormat', audioFormat)
          ..add('language', language)
          ..add('extraOptions', extraOptions))
        .toString();
  }
}

class AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDtoBuilder
    implements
        Builder<AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto,
            AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDtoBuilder> {
  _$AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto? _$v;

  String? _audioBase64;
  String? get audioBase64 => _$this._audioBase64;
  set audioBase64(String? audioBase64) => _$this._audioBase64 = audioBase64;

  String? _audioFormat;
  String? get audioFormat => _$this._audioFormat;
  set audioFormat(String? audioFormat) => _$this._audioFormat = audioFormat;

  String? _language;
  String? get language => _$this._language;
  set language(String? language) => _$this._language = language;

  MapBuilder<String, JsonObject?>? _extraOptions;
  MapBuilder<String, JsonObject?> get extraOptions =>
      _$this._extraOptions ??= MapBuilder<String, JsonObject?>();
  set extraOptions(MapBuilder<String, JsonObject?>? extraOptions) =>
      _$this._extraOptions = extraOptions;

  AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDtoBuilder() {
    AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto._defaults(this);
  }

  AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDtoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _audioBase64 = $v.audioBase64;
      _audioFormat = $v.audioFormat;
      _language = $v.language;
      _extraOptions = $v.extraOptions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto other) {
    _$v =
        other as _$AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto build() =>
      _build();

  _$AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto _build() {
    _$AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto._(
            audioBase64: audioBase64,
            audioFormat: audioFormat,
            language: language,
            extraOptions: _extraOptions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'extraOptions';
        _extraOptions?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto',
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
