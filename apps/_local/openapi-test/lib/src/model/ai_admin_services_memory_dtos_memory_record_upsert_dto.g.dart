// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_memory_dtos_memory_record_upsert_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesMemoryDtosMemoryRecordUpsertDto
    extends AiAdminServicesMemoryDtosMemoryRecordUpsertDto {
  @override
  final String? agentId;
  @override
  final String? deviceId;
  @override
  final int? userId;
  @override
  final String? entityId;
  @override
  final String? sessionId;
  @override
  final String? ruleId;
  @override
  final String? ruleCode;
  @override
  final String? entityScope;
  @override
  final String? recordType;
  @override
  final String? title;
  @override
  final String? content;
  @override
  final String? summary;
  @override
  final JsonObject? keywords;
  @override
  final JsonObject? payloadJson;
  @override
  final String? canonicalKey;
  @override
  final String? contentHash;
  @override
  final int? importance;
  @override
  final double? confidence;
  @override
  final int? isPinned;
  @override
  final String? source_;
  @override
  final String? sourceChatHistoryId;
  @override
  final String? sourceTurnId;
  @override
  final String? sourceRunId;
  @override
  final DateTime? expiresAt;

  factory _$AiAdminServicesMemoryDtosMemoryRecordUpsertDto(
          [void Function(AiAdminServicesMemoryDtosMemoryRecordUpsertDtoBuilder)?
              updates]) =>
      (AiAdminServicesMemoryDtosMemoryRecordUpsertDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesMemoryDtosMemoryRecordUpsertDto._(
      {this.agentId,
      this.deviceId,
      this.userId,
      this.entityId,
      this.sessionId,
      this.ruleId,
      this.ruleCode,
      this.entityScope,
      this.recordType,
      this.title,
      this.content,
      this.summary,
      this.keywords,
      this.payloadJson,
      this.canonicalKey,
      this.contentHash,
      this.importance,
      this.confidence,
      this.isPinned,
      this.source_,
      this.sourceChatHistoryId,
      this.sourceTurnId,
      this.sourceRunId,
      this.expiresAt})
      : super._();
  @override
  AiAdminServicesMemoryDtosMemoryRecordUpsertDto rebuild(
          void Function(AiAdminServicesMemoryDtosMemoryRecordUpsertDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesMemoryDtosMemoryRecordUpsertDtoBuilder toBuilder() =>
      AiAdminServicesMemoryDtosMemoryRecordUpsertDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesMemoryDtosMemoryRecordUpsertDto &&
        agentId == other.agentId &&
        deviceId == other.deviceId &&
        userId == other.userId &&
        entityId == other.entityId &&
        sessionId == other.sessionId &&
        ruleId == other.ruleId &&
        ruleCode == other.ruleCode &&
        entityScope == other.entityScope &&
        recordType == other.recordType &&
        title == other.title &&
        content == other.content &&
        summary == other.summary &&
        keywords == other.keywords &&
        payloadJson == other.payloadJson &&
        canonicalKey == other.canonicalKey &&
        contentHash == other.contentHash &&
        importance == other.importance &&
        confidence == other.confidence &&
        isPinned == other.isPinned &&
        source_ == other.source_ &&
        sourceChatHistoryId == other.sourceChatHistoryId &&
        sourceTurnId == other.sourceTurnId &&
        sourceRunId == other.sourceRunId &&
        expiresAt == other.expiresAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, agentId.hashCode);
    _$hash = $jc(_$hash, deviceId.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, entityId.hashCode);
    _$hash = $jc(_$hash, sessionId.hashCode);
    _$hash = $jc(_$hash, ruleId.hashCode);
    _$hash = $jc(_$hash, ruleCode.hashCode);
    _$hash = $jc(_$hash, entityScope.hashCode);
    _$hash = $jc(_$hash, recordType.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, keywords.hashCode);
    _$hash = $jc(_$hash, payloadJson.hashCode);
    _$hash = $jc(_$hash, canonicalKey.hashCode);
    _$hash = $jc(_$hash, contentHash.hashCode);
    _$hash = $jc(_$hash, importance.hashCode);
    _$hash = $jc(_$hash, confidence.hashCode);
    _$hash = $jc(_$hash, isPinned.hashCode);
    _$hash = $jc(_$hash, source_.hashCode);
    _$hash = $jc(_$hash, sourceChatHistoryId.hashCode);
    _$hash = $jc(_$hash, sourceTurnId.hashCode);
    _$hash = $jc(_$hash, sourceRunId.hashCode);
    _$hash = $jc(_$hash, expiresAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesMemoryDtosMemoryRecordUpsertDto')
          ..add('agentId', agentId)
          ..add('deviceId', deviceId)
          ..add('userId', userId)
          ..add('entityId', entityId)
          ..add('sessionId', sessionId)
          ..add('ruleId', ruleId)
          ..add('ruleCode', ruleCode)
          ..add('entityScope', entityScope)
          ..add('recordType', recordType)
          ..add('title', title)
          ..add('content', content)
          ..add('summary', summary)
          ..add('keywords', keywords)
          ..add('payloadJson', payloadJson)
          ..add('canonicalKey', canonicalKey)
          ..add('contentHash', contentHash)
          ..add('importance', importance)
          ..add('confidence', confidence)
          ..add('isPinned', isPinned)
          ..add('source_', source_)
          ..add('sourceChatHistoryId', sourceChatHistoryId)
          ..add('sourceTurnId', sourceTurnId)
          ..add('sourceRunId', sourceRunId)
          ..add('expiresAt', expiresAt))
        .toString();
  }
}

class AiAdminServicesMemoryDtosMemoryRecordUpsertDtoBuilder
    implements
        Builder<AiAdminServicesMemoryDtosMemoryRecordUpsertDto,
            AiAdminServicesMemoryDtosMemoryRecordUpsertDtoBuilder> {
  _$AiAdminServicesMemoryDtosMemoryRecordUpsertDto? _$v;

  String? _agentId;
  String? get agentId => _$this._agentId;
  set agentId(String? agentId) => _$this._agentId = agentId;

  String? _deviceId;
  String? get deviceId => _$this._deviceId;
  set deviceId(String? deviceId) => _$this._deviceId = deviceId;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  String? _entityId;
  String? get entityId => _$this._entityId;
  set entityId(String? entityId) => _$this._entityId = entityId;

  String? _sessionId;
  String? get sessionId => _$this._sessionId;
  set sessionId(String? sessionId) => _$this._sessionId = sessionId;

  String? _ruleId;
  String? get ruleId => _$this._ruleId;
  set ruleId(String? ruleId) => _$this._ruleId = ruleId;

  String? _ruleCode;
  String? get ruleCode => _$this._ruleCode;
  set ruleCode(String? ruleCode) => _$this._ruleCode = ruleCode;

  String? _entityScope;
  String? get entityScope => _$this._entityScope;
  set entityScope(String? entityScope) => _$this._entityScope = entityScope;

  String? _recordType;
  String? get recordType => _$this._recordType;
  set recordType(String? recordType) => _$this._recordType = recordType;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(String? summary) => _$this._summary = summary;

  JsonObject? _keywords;
  JsonObject? get keywords => _$this._keywords;
  set keywords(JsonObject? keywords) => _$this._keywords = keywords;

  JsonObject? _payloadJson;
  JsonObject? get payloadJson => _$this._payloadJson;
  set payloadJson(JsonObject? payloadJson) => _$this._payloadJson = payloadJson;

  String? _canonicalKey;
  String? get canonicalKey => _$this._canonicalKey;
  set canonicalKey(String? canonicalKey) => _$this._canonicalKey = canonicalKey;

  String? _contentHash;
  String? get contentHash => _$this._contentHash;
  set contentHash(String? contentHash) => _$this._contentHash = contentHash;

  int? _importance;
  int? get importance => _$this._importance;
  set importance(int? importance) => _$this._importance = importance;

  double? _confidence;
  double? get confidence => _$this._confidence;
  set confidence(double? confidence) => _$this._confidence = confidence;

  int? _isPinned;
  int? get isPinned => _$this._isPinned;
  set isPinned(int? isPinned) => _$this._isPinned = isPinned;

  String? _source_;
  String? get source_ => _$this._source_;
  set source_(String? source_) => _$this._source_ = source_;

  String? _sourceChatHistoryId;
  String? get sourceChatHistoryId => _$this._sourceChatHistoryId;
  set sourceChatHistoryId(String? sourceChatHistoryId) =>
      _$this._sourceChatHistoryId = sourceChatHistoryId;

  String? _sourceTurnId;
  String? get sourceTurnId => _$this._sourceTurnId;
  set sourceTurnId(String? sourceTurnId) => _$this._sourceTurnId = sourceTurnId;

  String? _sourceRunId;
  String? get sourceRunId => _$this._sourceRunId;
  set sourceRunId(String? sourceRunId) => _$this._sourceRunId = sourceRunId;

  DateTime? _expiresAt;
  DateTime? get expiresAt => _$this._expiresAt;
  set expiresAt(DateTime? expiresAt) => _$this._expiresAt = expiresAt;

  AiAdminServicesMemoryDtosMemoryRecordUpsertDtoBuilder() {
    AiAdminServicesMemoryDtosMemoryRecordUpsertDto._defaults(this);
  }

  AiAdminServicesMemoryDtosMemoryRecordUpsertDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _agentId = $v.agentId;
      _deviceId = $v.deviceId;
      _userId = $v.userId;
      _entityId = $v.entityId;
      _sessionId = $v.sessionId;
      _ruleId = $v.ruleId;
      _ruleCode = $v.ruleCode;
      _entityScope = $v.entityScope;
      _recordType = $v.recordType;
      _title = $v.title;
      _content = $v.content;
      _summary = $v.summary;
      _keywords = $v.keywords;
      _payloadJson = $v.payloadJson;
      _canonicalKey = $v.canonicalKey;
      _contentHash = $v.contentHash;
      _importance = $v.importance;
      _confidence = $v.confidence;
      _isPinned = $v.isPinned;
      _source_ = $v.source_;
      _sourceChatHistoryId = $v.sourceChatHistoryId;
      _sourceTurnId = $v.sourceTurnId;
      _sourceRunId = $v.sourceRunId;
      _expiresAt = $v.expiresAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesMemoryDtosMemoryRecordUpsertDto other) {
    _$v = other as _$AiAdminServicesMemoryDtosMemoryRecordUpsertDto;
  }

  @override
  void update(
      void Function(AiAdminServicesMemoryDtosMemoryRecordUpsertDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesMemoryDtosMemoryRecordUpsertDto build() => _build();

  _$AiAdminServicesMemoryDtosMemoryRecordUpsertDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesMemoryDtosMemoryRecordUpsertDto._(
          agentId: agentId,
          deviceId: deviceId,
          userId: userId,
          entityId: entityId,
          sessionId: sessionId,
          ruleId: ruleId,
          ruleCode: ruleCode,
          entityScope: entityScope,
          recordType: recordType,
          title: title,
          content: content,
          summary: summary,
          keywords: keywords,
          payloadJson: payloadJson,
          canonicalKey: canonicalKey,
          contentHash: contentHash,
          importance: importance,
          confidence: confidence,
          isPinned: isPinned,
          source_: source_,
          sourceChatHistoryId: sourceChatHistoryId,
          sourceTurnId: sourceTurnId,
          sourceRunId: sourceRunId,
          expiresAt: expiresAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
