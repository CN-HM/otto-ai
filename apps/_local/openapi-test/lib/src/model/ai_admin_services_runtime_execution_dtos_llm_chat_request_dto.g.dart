// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_runtime_execution_dtos_llm_chat_request_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto
    extends AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto {
  @override
  final String? systemPrompt;
  @override
  final BuiltList<AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto>?
      messages;
  @override
  final bool? stream;
  @override
  final double? temperature;
  @override
  final int? maxTokens;
  @override
  final double? topP;
  @override
  final BuiltMap<String, JsonObject?>? extraOptions;

  factory _$AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto(
          [void Function(
                  AiAdminServicesRuntimeExecutionDtosLlmChatRequestDtoBuilder)?
              updates]) =>
      (AiAdminServicesRuntimeExecutionDtosLlmChatRequestDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto._(
      {this.systemPrompt,
      this.messages,
      this.stream,
      this.temperature,
      this.maxTokens,
      this.topP,
      this.extraOptions})
      : super._();
  @override
  AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto rebuild(
          void Function(
                  AiAdminServicesRuntimeExecutionDtosLlmChatRequestDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesRuntimeExecutionDtosLlmChatRequestDtoBuilder toBuilder() =>
      AiAdminServicesRuntimeExecutionDtosLlmChatRequestDtoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto &&
        systemPrompt == other.systemPrompt &&
        messages == other.messages &&
        stream == other.stream &&
        temperature == other.temperature &&
        maxTokens == other.maxTokens &&
        topP == other.topP &&
        extraOptions == other.extraOptions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, systemPrompt.hashCode);
    _$hash = $jc(_$hash, messages.hashCode);
    _$hash = $jc(_$hash, stream.hashCode);
    _$hash = $jc(_$hash, temperature.hashCode);
    _$hash = $jc(_$hash, maxTokens.hashCode);
    _$hash = $jc(_$hash, topP.hashCode);
    _$hash = $jc(_$hash, extraOptions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto')
          ..add('systemPrompt', systemPrompt)
          ..add('messages', messages)
          ..add('stream', stream)
          ..add('temperature', temperature)
          ..add('maxTokens', maxTokens)
          ..add('topP', topP)
          ..add('extraOptions', extraOptions))
        .toString();
  }
}

class AiAdminServicesRuntimeExecutionDtosLlmChatRequestDtoBuilder
    implements
        Builder<AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto,
            AiAdminServicesRuntimeExecutionDtosLlmChatRequestDtoBuilder> {
  _$AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto? _$v;

  String? _systemPrompt;
  String? get systemPrompt => _$this._systemPrompt;
  set systemPrompt(String? systemPrompt) => _$this._systemPrompt = systemPrompt;

  ListBuilder<AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto>? _messages;
  ListBuilder<AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto>
      get messages => _$this._messages ??=
          ListBuilder<AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto>();
  set messages(
          ListBuilder<AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto>?
              messages) =>
      _$this._messages = messages;

  bool? _stream;
  bool? get stream => _$this._stream;
  set stream(bool? stream) => _$this._stream = stream;

  double? _temperature;
  double? get temperature => _$this._temperature;
  set temperature(double? temperature) => _$this._temperature = temperature;

  int? _maxTokens;
  int? get maxTokens => _$this._maxTokens;
  set maxTokens(int? maxTokens) => _$this._maxTokens = maxTokens;

  double? _topP;
  double? get topP => _$this._topP;
  set topP(double? topP) => _$this._topP = topP;

  MapBuilder<String, JsonObject?>? _extraOptions;
  MapBuilder<String, JsonObject?> get extraOptions =>
      _$this._extraOptions ??= MapBuilder<String, JsonObject?>();
  set extraOptions(MapBuilder<String, JsonObject?>? extraOptions) =>
      _$this._extraOptions = extraOptions;

  AiAdminServicesRuntimeExecutionDtosLlmChatRequestDtoBuilder() {
    AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto._defaults(this);
  }

  AiAdminServicesRuntimeExecutionDtosLlmChatRequestDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _systemPrompt = $v.systemPrompt;
      _messages = $v.messages?.toBuilder();
      _stream = $v.stream;
      _temperature = $v.temperature;
      _maxTokens = $v.maxTokens;
      _topP = $v.topP;
      _extraOptions = $v.extraOptions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto other) {
    _$v = other as _$AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesRuntimeExecutionDtosLlmChatRequestDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto build() => _build();

  _$AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto _build() {
    _$AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto._(
            systemPrompt: systemPrompt,
            messages: _messages?.build(),
            stream: stream,
            temperature: temperature,
            maxTokens: maxTokens,
            topP: topP,
            extraOptions: _extraOptions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'messages';
        _messages?.build();

        _$failedField = 'extraOptions';
        _extraOptions?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto',
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
