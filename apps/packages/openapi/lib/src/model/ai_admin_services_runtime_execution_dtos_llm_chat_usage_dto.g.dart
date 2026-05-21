// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_runtime_execution_dtos_llm_chat_usage_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto
    extends AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto {
  @override
  final int? promptTokens;
  @override
  final int? completionTokens;
  @override
  final int? totalTokens;

  factory _$AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto(
          [void Function(
                  AiAdminServicesRuntimeExecutionDtosLlmChatUsageDtoBuilder)?
              updates]) =>
      (AiAdminServicesRuntimeExecutionDtosLlmChatUsageDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto._(
      {this.promptTokens, this.completionTokens, this.totalTokens})
      : super._();
  @override
  AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto rebuild(
          void Function(
                  AiAdminServicesRuntimeExecutionDtosLlmChatUsageDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesRuntimeExecutionDtosLlmChatUsageDtoBuilder toBuilder() =>
      AiAdminServicesRuntimeExecutionDtosLlmChatUsageDtoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto &&
        promptTokens == other.promptTokens &&
        completionTokens == other.completionTokens &&
        totalTokens == other.totalTokens;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, promptTokens.hashCode);
    _$hash = $jc(_$hash, completionTokens.hashCode);
    _$hash = $jc(_$hash, totalTokens.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto')
          ..add('promptTokens', promptTokens)
          ..add('completionTokens', completionTokens)
          ..add('totalTokens', totalTokens))
        .toString();
  }
}

class AiAdminServicesRuntimeExecutionDtosLlmChatUsageDtoBuilder
    implements
        Builder<AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto,
            AiAdminServicesRuntimeExecutionDtosLlmChatUsageDtoBuilder> {
  _$AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto? _$v;

  int? _promptTokens;
  int? get promptTokens => _$this._promptTokens;
  set promptTokens(int? promptTokens) => _$this._promptTokens = promptTokens;

  int? _completionTokens;
  int? get completionTokens => _$this._completionTokens;
  set completionTokens(int? completionTokens) =>
      _$this._completionTokens = completionTokens;

  int? _totalTokens;
  int? get totalTokens => _$this._totalTokens;
  set totalTokens(int? totalTokens) => _$this._totalTokens = totalTokens;

  AiAdminServicesRuntimeExecutionDtosLlmChatUsageDtoBuilder() {
    AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto._defaults(this);
  }

  AiAdminServicesRuntimeExecutionDtosLlmChatUsageDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _promptTokens = $v.promptTokens;
      _completionTokens = $v.completionTokens;
      _totalTokens = $v.totalTokens;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto other) {
    _$v = other as _$AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto;
  }

  @override
  void update(
      void Function(AiAdminServicesRuntimeExecutionDtosLlmChatUsageDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto build() => _build();

  _$AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto._(
          promptTokens: promptTokens,
          completionTokens: completionTokens,
          totalTokens: totalTokens,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
