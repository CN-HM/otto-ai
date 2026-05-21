// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_runtime_execution_dtos_tts_synthesis_request_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto
    extends AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto {
  @override
  final String? text;
  @override
  final String? voice;
  @override
  final String? responseFormat;
  @override
  final double? speed;
  @override
  final BuiltMap<String, JsonObject?>? extraOptions;

  factory _$AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto(
          [void Function(
                  AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDtoBuilder)?
              updates]) =>
      (AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto._(
      {this.text,
      this.voice,
      this.responseFormat,
      this.speed,
      this.extraOptions})
      : super._();
  @override
  AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto rebuild(
          void Function(
                  AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDtoBuilder
      toBuilder() =>
          AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto &&
        text == other.text &&
        voice == other.voice &&
        responseFormat == other.responseFormat &&
        speed == other.speed &&
        extraOptions == other.extraOptions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jc(_$hash, voice.hashCode);
    _$hash = $jc(_$hash, responseFormat.hashCode);
    _$hash = $jc(_$hash, speed.hashCode);
    _$hash = $jc(_$hash, extraOptions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto')
          ..add('text', text)
          ..add('voice', voice)
          ..add('responseFormat', responseFormat)
          ..add('speed', speed)
          ..add('extraOptions', extraOptions))
        .toString();
  }
}

class AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDtoBuilder
    implements
        Builder<AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto,
            AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDtoBuilder> {
  _$AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  String? _voice;
  String? get voice => _$this._voice;
  set voice(String? voice) => _$this._voice = voice;

  String? _responseFormat;
  String? get responseFormat => _$this._responseFormat;
  set responseFormat(String? responseFormat) =>
      _$this._responseFormat = responseFormat;

  double? _speed;
  double? get speed => _$this._speed;
  set speed(double? speed) => _$this._speed = speed;

  MapBuilder<String, JsonObject?>? _extraOptions;
  MapBuilder<String, JsonObject?> get extraOptions =>
      _$this._extraOptions ??= MapBuilder<String, JsonObject?>();
  set extraOptions(MapBuilder<String, JsonObject?>? extraOptions) =>
      _$this._extraOptions = extraOptions;

  AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDtoBuilder() {
    AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto._defaults(this);
  }

  AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _voice = $v.voice;
      _responseFormat = $v.responseFormat;
      _speed = $v.speed;
      _extraOptions = $v.extraOptions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto other) {
    _$v = other as _$AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto build() => _build();

  _$AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto _build() {
    _$AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto._(
            text: text,
            voice: voice,
            responseFormat: responseFormat,
            speed: speed,
            extraOptions: _extraOptions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'extraOptions';
        _extraOptions?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto',
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
