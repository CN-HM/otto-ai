// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_runtime_conversation_runtime_trace_snapshot_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto
    extends AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto {
  @override
  final int? totalStageCount;
  @override
  final int? successfulStageCount;
  @override
  final int? failedStageCount;
  @override
  final int? fallbackStageCount;
  @override
  final BuiltList<AiAdminServicesRuntimeConversationStageAggregateDto>?
      stageAggregates;
  @override
  final BuiltList<AiAdminServicesRuntimeConversationTurnTraceSummaryDto>?
      recentTurns;

  factory _$AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto(
          [void Function(
                  AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDtoBuilder)?
              updates]) =>
      (AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto._(
      {this.totalStageCount,
      this.successfulStageCount,
      this.failedStageCount,
      this.fallbackStageCount,
      this.stageAggregates,
      this.recentTurns})
      : super._();
  @override
  AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto rebuild(
          void Function(
                  AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDtoBuilder
      toBuilder() =>
          AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto &&
        totalStageCount == other.totalStageCount &&
        successfulStageCount == other.successfulStageCount &&
        failedStageCount == other.failedStageCount &&
        fallbackStageCount == other.fallbackStageCount &&
        stageAggregates == other.stageAggregates &&
        recentTurns == other.recentTurns;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, totalStageCount.hashCode);
    _$hash = $jc(_$hash, successfulStageCount.hashCode);
    _$hash = $jc(_$hash, failedStageCount.hashCode);
    _$hash = $jc(_$hash, fallbackStageCount.hashCode);
    _$hash = $jc(_$hash, stageAggregates.hashCode);
    _$hash = $jc(_$hash, recentTurns.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto')
          ..add('totalStageCount', totalStageCount)
          ..add('successfulStageCount', successfulStageCount)
          ..add('failedStageCount', failedStageCount)
          ..add('fallbackStageCount', fallbackStageCount)
          ..add('stageAggregates', stageAggregates)
          ..add('recentTurns', recentTurns))
        .toString();
  }
}

class AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDtoBuilder
    implements
        Builder<AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto,
            AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDtoBuilder> {
  _$AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto? _$v;

  int? _totalStageCount;
  int? get totalStageCount => _$this._totalStageCount;
  set totalStageCount(int? totalStageCount) =>
      _$this._totalStageCount = totalStageCount;

  int? _successfulStageCount;
  int? get successfulStageCount => _$this._successfulStageCount;
  set successfulStageCount(int? successfulStageCount) =>
      _$this._successfulStageCount = successfulStageCount;

  int? _failedStageCount;
  int? get failedStageCount => _$this._failedStageCount;
  set failedStageCount(int? failedStageCount) =>
      _$this._failedStageCount = failedStageCount;

  int? _fallbackStageCount;
  int? get fallbackStageCount => _$this._fallbackStageCount;
  set fallbackStageCount(int? fallbackStageCount) =>
      _$this._fallbackStageCount = fallbackStageCount;

  ListBuilder<AiAdminServicesRuntimeConversationStageAggregateDto>?
      _stageAggregates;
  ListBuilder<AiAdminServicesRuntimeConversationStageAggregateDto>
      get stageAggregates => _$this._stageAggregates ??=
          ListBuilder<AiAdminServicesRuntimeConversationStageAggregateDto>();
  set stageAggregates(
          ListBuilder<AiAdminServicesRuntimeConversationStageAggregateDto>?
              stageAggregates) =>
      _$this._stageAggregates = stageAggregates;

  ListBuilder<AiAdminServicesRuntimeConversationTurnTraceSummaryDto>?
      _recentTurns;
  ListBuilder<AiAdminServicesRuntimeConversationTurnTraceSummaryDto>
      get recentTurns => _$this._recentTurns ??=
          ListBuilder<AiAdminServicesRuntimeConversationTurnTraceSummaryDto>();
  set recentTurns(
          ListBuilder<AiAdminServicesRuntimeConversationTurnTraceSummaryDto>?
              recentTurns) =>
      _$this._recentTurns = recentTurns;

  AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDtoBuilder() {
    AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto._defaults(this);
  }

  AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _totalStageCount = $v.totalStageCount;
      _successfulStageCount = $v.successfulStageCount;
      _failedStageCount = $v.failedStageCount;
      _fallbackStageCount = $v.fallbackStageCount;
      _stageAggregates = $v.stageAggregates?.toBuilder();
      _recentTurns = $v.recentTurns?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto other) {
    _$v = other as _$AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto build() => _build();

  _$AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto _build() {
    _$AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto._(
            totalStageCount: totalStageCount,
            successfulStageCount: successfulStageCount,
            failedStageCount: failedStageCount,
            fallbackStageCount: fallbackStageCount,
            stageAggregates: _stageAggregates?.build(),
            recentTurns: _recentTurns?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'stageAggregates';
        _stageAggregates?.build();
        _$failedField = 'recentTurns';
        _recentTurns?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto',
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
