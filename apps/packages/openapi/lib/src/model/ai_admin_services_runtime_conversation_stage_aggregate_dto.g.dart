// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_runtime_conversation_stage_aggregate_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesRuntimeConversationStageAggregateDto
    extends AiAdminServicesRuntimeConversationStageAggregateDto {
  @override
  final String? stage;
  @override
  final int? totalCount;
  @override
  final int? successfulCount;
  @override
  final int? failedCount;
  @override
  final int? fallbackCount;
  @override
  final DateTime? lastSeenAtUtc;

  factory _$AiAdminServicesRuntimeConversationStageAggregateDto(
          [void Function(
                  AiAdminServicesRuntimeConversationStageAggregateDtoBuilder)?
              updates]) =>
      (AiAdminServicesRuntimeConversationStageAggregateDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesRuntimeConversationStageAggregateDto._(
      {this.stage,
      this.totalCount,
      this.successfulCount,
      this.failedCount,
      this.fallbackCount,
      this.lastSeenAtUtc})
      : super._();
  @override
  AiAdminServicesRuntimeConversationStageAggregateDto rebuild(
          void Function(
                  AiAdminServicesRuntimeConversationStageAggregateDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesRuntimeConversationStageAggregateDtoBuilder toBuilder() =>
      AiAdminServicesRuntimeConversationStageAggregateDtoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesRuntimeConversationStageAggregateDto &&
        stage == other.stage &&
        totalCount == other.totalCount &&
        successfulCount == other.successfulCount &&
        failedCount == other.failedCount &&
        fallbackCount == other.fallbackCount &&
        lastSeenAtUtc == other.lastSeenAtUtc;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, stage.hashCode);
    _$hash = $jc(_$hash, totalCount.hashCode);
    _$hash = $jc(_$hash, successfulCount.hashCode);
    _$hash = $jc(_$hash, failedCount.hashCode);
    _$hash = $jc(_$hash, fallbackCount.hashCode);
    _$hash = $jc(_$hash, lastSeenAtUtc.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesRuntimeConversationStageAggregateDto')
          ..add('stage', stage)
          ..add('totalCount', totalCount)
          ..add('successfulCount', successfulCount)
          ..add('failedCount', failedCount)
          ..add('fallbackCount', fallbackCount)
          ..add('lastSeenAtUtc', lastSeenAtUtc))
        .toString();
  }
}

class AiAdminServicesRuntimeConversationStageAggregateDtoBuilder
    implements
        Builder<AiAdminServicesRuntimeConversationStageAggregateDto,
            AiAdminServicesRuntimeConversationStageAggregateDtoBuilder> {
  _$AiAdminServicesRuntimeConversationStageAggregateDto? _$v;

  String? _stage;
  String? get stage => _$this._stage;
  set stage(String? stage) => _$this._stage = stage;

  int? _totalCount;
  int? get totalCount => _$this._totalCount;
  set totalCount(int? totalCount) => _$this._totalCount = totalCount;

  int? _successfulCount;
  int? get successfulCount => _$this._successfulCount;
  set successfulCount(int? successfulCount) =>
      _$this._successfulCount = successfulCount;

  int? _failedCount;
  int? get failedCount => _$this._failedCount;
  set failedCount(int? failedCount) => _$this._failedCount = failedCount;

  int? _fallbackCount;
  int? get fallbackCount => _$this._fallbackCount;
  set fallbackCount(int? fallbackCount) =>
      _$this._fallbackCount = fallbackCount;

  DateTime? _lastSeenAtUtc;
  DateTime? get lastSeenAtUtc => _$this._lastSeenAtUtc;
  set lastSeenAtUtc(DateTime? lastSeenAtUtc) =>
      _$this._lastSeenAtUtc = lastSeenAtUtc;

  AiAdminServicesRuntimeConversationStageAggregateDtoBuilder() {
    AiAdminServicesRuntimeConversationStageAggregateDto._defaults(this);
  }

  AiAdminServicesRuntimeConversationStageAggregateDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _stage = $v.stage;
      _totalCount = $v.totalCount;
      _successfulCount = $v.successfulCount;
      _failedCount = $v.failedCount;
      _fallbackCount = $v.fallbackCount;
      _lastSeenAtUtc = $v.lastSeenAtUtc;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesRuntimeConversationStageAggregateDto other) {
    _$v = other as _$AiAdminServicesRuntimeConversationStageAggregateDto;
  }

  @override
  void update(
      void Function(AiAdminServicesRuntimeConversationStageAggregateDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesRuntimeConversationStageAggregateDto build() => _build();

  _$AiAdminServicesRuntimeConversationStageAggregateDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesRuntimeConversationStageAggregateDto._(
          stage: stage,
          totalCount: totalCount,
          successfulCount: successfulCount,
          failedCount: failedCount,
          fallbackCount: fallbackCount,
          lastSeenAtUtc: lastSeenAtUtc,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
