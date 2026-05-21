// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_memory_dtos_runtime_signal_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesMemoryDtosRuntimeSignalDto
    extends AiAdminServicesMemoryDtosRuntimeSignalDto {
  @override
  final String? id;
  @override
  final String? signalType;
  @override
  final String? signalCode;
  @override
  final String? severity;
  @override
  final String? status;
  @override
  final int? userId;
  @override
  final String? deviceId;
  @override
  final String? agentRoleId;
  @override
  final String? sessionId;
  @override
  final String? sourceRunId;
  @override
  final String? sourceText;
  @override
  final String? payloadJson;
  @override
  final String? scheduledAt;
  @override
  final String? processedAt;
  @override
  final String? dedupeKey;
  @override
  final int? retryCount;
  @override
  final String? errorMessage;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  factory _$AiAdminServicesMemoryDtosRuntimeSignalDto(
          [void Function(AiAdminServicesMemoryDtosRuntimeSignalDtoBuilder)?
              updates]) =>
      (AiAdminServicesMemoryDtosRuntimeSignalDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesMemoryDtosRuntimeSignalDto._(
      {this.id,
      this.signalType,
      this.signalCode,
      this.severity,
      this.status,
      this.userId,
      this.deviceId,
      this.agentRoleId,
      this.sessionId,
      this.sourceRunId,
      this.sourceText,
      this.payloadJson,
      this.scheduledAt,
      this.processedAt,
      this.dedupeKey,
      this.retryCount,
      this.errorMessage,
      this.createdAt,
      this.updatedAt})
      : super._();
  @override
  AiAdminServicesMemoryDtosRuntimeSignalDto rebuild(
          void Function(AiAdminServicesMemoryDtosRuntimeSignalDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesMemoryDtosRuntimeSignalDtoBuilder toBuilder() =>
      AiAdminServicesMemoryDtosRuntimeSignalDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesMemoryDtosRuntimeSignalDto &&
        id == other.id &&
        signalType == other.signalType &&
        signalCode == other.signalCode &&
        severity == other.severity &&
        status == other.status &&
        userId == other.userId &&
        deviceId == other.deviceId &&
        agentRoleId == other.agentRoleId &&
        sessionId == other.sessionId &&
        sourceRunId == other.sourceRunId &&
        sourceText == other.sourceText &&
        payloadJson == other.payloadJson &&
        scheduledAt == other.scheduledAt &&
        processedAt == other.processedAt &&
        dedupeKey == other.dedupeKey &&
        retryCount == other.retryCount &&
        errorMessage == other.errorMessage &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, signalType.hashCode);
    _$hash = $jc(_$hash, signalCode.hashCode);
    _$hash = $jc(_$hash, severity.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, deviceId.hashCode);
    _$hash = $jc(_$hash, agentRoleId.hashCode);
    _$hash = $jc(_$hash, sessionId.hashCode);
    _$hash = $jc(_$hash, sourceRunId.hashCode);
    _$hash = $jc(_$hash, sourceText.hashCode);
    _$hash = $jc(_$hash, payloadJson.hashCode);
    _$hash = $jc(_$hash, scheduledAt.hashCode);
    _$hash = $jc(_$hash, processedAt.hashCode);
    _$hash = $jc(_$hash, dedupeKey.hashCode);
    _$hash = $jc(_$hash, retryCount.hashCode);
    _$hash = $jc(_$hash, errorMessage.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesMemoryDtosRuntimeSignalDto')
          ..add('id', id)
          ..add('signalType', signalType)
          ..add('signalCode', signalCode)
          ..add('severity', severity)
          ..add('status', status)
          ..add('userId', userId)
          ..add('deviceId', deviceId)
          ..add('agentRoleId', agentRoleId)
          ..add('sessionId', sessionId)
          ..add('sourceRunId', sourceRunId)
          ..add('sourceText', sourceText)
          ..add('payloadJson', payloadJson)
          ..add('scheduledAt', scheduledAt)
          ..add('processedAt', processedAt)
          ..add('dedupeKey', dedupeKey)
          ..add('retryCount', retryCount)
          ..add('errorMessage', errorMessage)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class AiAdminServicesMemoryDtosRuntimeSignalDtoBuilder
    implements
        Builder<AiAdminServicesMemoryDtosRuntimeSignalDto,
            AiAdminServicesMemoryDtosRuntimeSignalDtoBuilder> {
  _$AiAdminServicesMemoryDtosRuntimeSignalDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _signalType;
  String? get signalType => _$this._signalType;
  set signalType(String? signalType) => _$this._signalType = signalType;

  String? _signalCode;
  String? get signalCode => _$this._signalCode;
  set signalCode(String? signalCode) => _$this._signalCode = signalCode;

  String? _severity;
  String? get severity => _$this._severity;
  set severity(String? severity) => _$this._severity = severity;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  String? _deviceId;
  String? get deviceId => _$this._deviceId;
  set deviceId(String? deviceId) => _$this._deviceId = deviceId;

  String? _agentRoleId;
  String? get agentRoleId => _$this._agentRoleId;
  set agentRoleId(String? agentRoleId) => _$this._agentRoleId = agentRoleId;

  String? _sessionId;
  String? get sessionId => _$this._sessionId;
  set sessionId(String? sessionId) => _$this._sessionId = sessionId;

  String? _sourceRunId;
  String? get sourceRunId => _$this._sourceRunId;
  set sourceRunId(String? sourceRunId) => _$this._sourceRunId = sourceRunId;

  String? _sourceText;
  String? get sourceText => _$this._sourceText;
  set sourceText(String? sourceText) => _$this._sourceText = sourceText;

  String? _payloadJson;
  String? get payloadJson => _$this._payloadJson;
  set payloadJson(String? payloadJson) => _$this._payloadJson = payloadJson;

  String? _scheduledAt;
  String? get scheduledAt => _$this._scheduledAt;
  set scheduledAt(String? scheduledAt) => _$this._scheduledAt = scheduledAt;

  String? _processedAt;
  String? get processedAt => _$this._processedAt;
  set processedAt(String? processedAt) => _$this._processedAt = processedAt;

  String? _dedupeKey;
  String? get dedupeKey => _$this._dedupeKey;
  set dedupeKey(String? dedupeKey) => _$this._dedupeKey = dedupeKey;

  int? _retryCount;
  int? get retryCount => _$this._retryCount;
  set retryCount(int? retryCount) => _$this._retryCount = retryCount;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  AiAdminServicesMemoryDtosRuntimeSignalDtoBuilder() {
    AiAdminServicesMemoryDtosRuntimeSignalDto._defaults(this);
  }

  AiAdminServicesMemoryDtosRuntimeSignalDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _signalType = $v.signalType;
      _signalCode = $v.signalCode;
      _severity = $v.severity;
      _status = $v.status;
      _userId = $v.userId;
      _deviceId = $v.deviceId;
      _agentRoleId = $v.agentRoleId;
      _sessionId = $v.sessionId;
      _sourceRunId = $v.sourceRunId;
      _sourceText = $v.sourceText;
      _payloadJson = $v.payloadJson;
      _scheduledAt = $v.scheduledAt;
      _processedAt = $v.processedAt;
      _dedupeKey = $v.dedupeKey;
      _retryCount = $v.retryCount;
      _errorMessage = $v.errorMessage;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesMemoryDtosRuntimeSignalDto other) {
    _$v = other as _$AiAdminServicesMemoryDtosRuntimeSignalDto;
  }

  @override
  void update(
      void Function(AiAdminServicesMemoryDtosRuntimeSignalDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesMemoryDtosRuntimeSignalDto build() => _build();

  _$AiAdminServicesMemoryDtosRuntimeSignalDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesMemoryDtosRuntimeSignalDto._(
          id: id,
          signalType: signalType,
          signalCode: signalCode,
          severity: severity,
          status: status,
          userId: userId,
          deviceId: deviceId,
          agentRoleId: agentRoleId,
          sessionId: sessionId,
          sourceRunId: sourceRunId,
          sourceText: sourceText,
          payloadJson: payloadJson,
          scheduledAt: scheduledAt,
          processedAt: processedAt,
          dedupeKey: dedupeKey,
          retryCount: retryCount,
          errorMessage: errorMessage,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
