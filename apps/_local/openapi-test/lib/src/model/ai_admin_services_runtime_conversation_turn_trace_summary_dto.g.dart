// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_runtime_conversation_turn_trace_summary_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesRuntimeConversationTurnTraceSummaryDto
    extends AiAdminServicesRuntimeConversationTurnTraceSummaryDto {
  @override
  final DateTime? recordedAtUtc;
  @override
  final String? sessionId;
  @override
  final String? deviceId;
  @override
  final bool? succeeded;
  @override
  final int? stageCount;
  @override
  final int? failedStageCount;
  @override
  final int? fallbackStageCount;
  @override
  final String? outcome;
  @override
  final String? failureReason;
  @override
  final String? errorCode;

  factory _$AiAdminServicesRuntimeConversationTurnTraceSummaryDto(
          [void Function(
                  AiAdminServicesRuntimeConversationTurnTraceSummaryDtoBuilder)?
              updates]) =>
      (AiAdminServicesRuntimeConversationTurnTraceSummaryDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesRuntimeConversationTurnTraceSummaryDto._(
      {this.recordedAtUtc,
      this.sessionId,
      this.deviceId,
      this.succeeded,
      this.stageCount,
      this.failedStageCount,
      this.fallbackStageCount,
      this.outcome,
      this.failureReason,
      this.errorCode})
      : super._();
  @override
  AiAdminServicesRuntimeConversationTurnTraceSummaryDto rebuild(
          void Function(
                  AiAdminServicesRuntimeConversationTurnTraceSummaryDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesRuntimeConversationTurnTraceSummaryDtoBuilder toBuilder() =>
      AiAdminServicesRuntimeConversationTurnTraceSummaryDtoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesRuntimeConversationTurnTraceSummaryDto &&
        recordedAtUtc == other.recordedAtUtc &&
        sessionId == other.sessionId &&
        deviceId == other.deviceId &&
        succeeded == other.succeeded &&
        stageCount == other.stageCount &&
        failedStageCount == other.failedStageCount &&
        fallbackStageCount == other.fallbackStageCount &&
        outcome == other.outcome &&
        failureReason == other.failureReason &&
        errorCode == other.errorCode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, recordedAtUtc.hashCode);
    _$hash = $jc(_$hash, sessionId.hashCode);
    _$hash = $jc(_$hash, deviceId.hashCode);
    _$hash = $jc(_$hash, succeeded.hashCode);
    _$hash = $jc(_$hash, stageCount.hashCode);
    _$hash = $jc(_$hash, failedStageCount.hashCode);
    _$hash = $jc(_$hash, fallbackStageCount.hashCode);
    _$hash = $jc(_$hash, outcome.hashCode);
    _$hash = $jc(_$hash, failureReason.hashCode);
    _$hash = $jc(_$hash, errorCode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesRuntimeConversationTurnTraceSummaryDto')
          ..add('recordedAtUtc', recordedAtUtc)
          ..add('sessionId', sessionId)
          ..add('deviceId', deviceId)
          ..add('succeeded', succeeded)
          ..add('stageCount', stageCount)
          ..add('failedStageCount', failedStageCount)
          ..add('fallbackStageCount', fallbackStageCount)
          ..add('outcome', outcome)
          ..add('failureReason', failureReason)
          ..add('errorCode', errorCode))
        .toString();
  }
}

class AiAdminServicesRuntimeConversationTurnTraceSummaryDtoBuilder
    implements
        Builder<AiAdminServicesRuntimeConversationTurnTraceSummaryDto,
            AiAdminServicesRuntimeConversationTurnTraceSummaryDtoBuilder> {
  _$AiAdminServicesRuntimeConversationTurnTraceSummaryDto? _$v;

  DateTime? _recordedAtUtc;
  DateTime? get recordedAtUtc => _$this._recordedAtUtc;
  set recordedAtUtc(DateTime? recordedAtUtc) =>
      _$this._recordedAtUtc = recordedAtUtc;

  String? _sessionId;
  String? get sessionId => _$this._sessionId;
  set sessionId(String? sessionId) => _$this._sessionId = sessionId;

  String? _deviceId;
  String? get deviceId => _$this._deviceId;
  set deviceId(String? deviceId) => _$this._deviceId = deviceId;

  bool? _succeeded;
  bool? get succeeded => _$this._succeeded;
  set succeeded(bool? succeeded) => _$this._succeeded = succeeded;

  int? _stageCount;
  int? get stageCount => _$this._stageCount;
  set stageCount(int? stageCount) => _$this._stageCount = stageCount;

  int? _failedStageCount;
  int? get failedStageCount => _$this._failedStageCount;
  set failedStageCount(int? failedStageCount) =>
      _$this._failedStageCount = failedStageCount;

  int? _fallbackStageCount;
  int? get fallbackStageCount => _$this._fallbackStageCount;
  set fallbackStageCount(int? fallbackStageCount) =>
      _$this._fallbackStageCount = fallbackStageCount;

  String? _outcome;
  String? get outcome => _$this._outcome;
  set outcome(String? outcome) => _$this._outcome = outcome;

  String? _failureReason;
  String? get failureReason => _$this._failureReason;
  set failureReason(String? failureReason) =>
      _$this._failureReason = failureReason;

  String? _errorCode;
  String? get errorCode => _$this._errorCode;
  set errorCode(String? errorCode) => _$this._errorCode = errorCode;

  AiAdminServicesRuntimeConversationTurnTraceSummaryDtoBuilder() {
    AiAdminServicesRuntimeConversationTurnTraceSummaryDto._defaults(this);
  }

  AiAdminServicesRuntimeConversationTurnTraceSummaryDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _recordedAtUtc = $v.recordedAtUtc;
      _sessionId = $v.sessionId;
      _deviceId = $v.deviceId;
      _succeeded = $v.succeeded;
      _stageCount = $v.stageCount;
      _failedStageCount = $v.failedStageCount;
      _fallbackStageCount = $v.fallbackStageCount;
      _outcome = $v.outcome;
      _failureReason = $v.failureReason;
      _errorCode = $v.errorCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesRuntimeConversationTurnTraceSummaryDto other) {
    _$v = other as _$AiAdminServicesRuntimeConversationTurnTraceSummaryDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesRuntimeConversationTurnTraceSummaryDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesRuntimeConversationTurnTraceSummaryDto build() => _build();

  _$AiAdminServicesRuntimeConversationTurnTraceSummaryDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesRuntimeConversationTurnTraceSummaryDto._(
          recordedAtUtc: recordedAtUtc,
          sessionId: sessionId,
          deviceId: deviceId,
          succeeded: succeeded,
          stageCount: stageCount,
          failedStageCount: failedStageCount,
          fallbackStageCount: fallbackStageCount,
          outcome: outcome,
          failureReason: failureReason,
          errorCode: errorCode,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
