// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_memory_dtos_memory_search_hit_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesMemoryDtosMemorySearchHitDto
    extends AiAdminServicesMemoryDtosMemorySearchHitDto {
  @override
  final String? id;
  @override
  final String? entityId;
  @override
  final String? sessionId;
  @override
  final String? ruleId;
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
  final String? embeddingModelId;
  @override
  final int? embeddingDimension;
  @override
  final bool? hasEmbedding;
  @override
  final int? importance;
  @override
  final int? isPinned;
  @override
  final double? score;
  @override
  final String? expiresAt;
  @override
  final String? updatedAt;

  factory _$AiAdminServicesMemoryDtosMemorySearchHitDto(
          [void Function(AiAdminServicesMemoryDtosMemorySearchHitDtoBuilder)?
              updates]) =>
      (AiAdminServicesMemoryDtosMemorySearchHitDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesMemoryDtosMemorySearchHitDto._(
      {this.id,
      this.entityId,
      this.sessionId,
      this.ruleId,
      this.recordType,
      this.title,
      this.content,
      this.summary,
      this.keywords,
      this.payloadJson,
      this.embeddingModelId,
      this.embeddingDimension,
      this.hasEmbedding,
      this.importance,
      this.isPinned,
      this.score,
      this.expiresAt,
      this.updatedAt})
      : super._();
  @override
  AiAdminServicesMemoryDtosMemorySearchHitDto rebuild(
          void Function(AiAdminServicesMemoryDtosMemorySearchHitDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesMemoryDtosMemorySearchHitDtoBuilder toBuilder() =>
      AiAdminServicesMemoryDtosMemorySearchHitDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesMemoryDtosMemorySearchHitDto &&
        id == other.id &&
        entityId == other.entityId &&
        sessionId == other.sessionId &&
        ruleId == other.ruleId &&
        recordType == other.recordType &&
        title == other.title &&
        content == other.content &&
        summary == other.summary &&
        keywords == other.keywords &&
        payloadJson == other.payloadJson &&
        embeddingModelId == other.embeddingModelId &&
        embeddingDimension == other.embeddingDimension &&
        hasEmbedding == other.hasEmbedding &&
        importance == other.importance &&
        isPinned == other.isPinned &&
        score == other.score &&
        expiresAt == other.expiresAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, entityId.hashCode);
    _$hash = $jc(_$hash, sessionId.hashCode);
    _$hash = $jc(_$hash, ruleId.hashCode);
    _$hash = $jc(_$hash, recordType.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, keywords.hashCode);
    _$hash = $jc(_$hash, payloadJson.hashCode);
    _$hash = $jc(_$hash, embeddingModelId.hashCode);
    _$hash = $jc(_$hash, embeddingDimension.hashCode);
    _$hash = $jc(_$hash, hasEmbedding.hashCode);
    _$hash = $jc(_$hash, importance.hashCode);
    _$hash = $jc(_$hash, isPinned.hashCode);
    _$hash = $jc(_$hash, score.hashCode);
    _$hash = $jc(_$hash, expiresAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesMemoryDtosMemorySearchHitDto')
          ..add('id', id)
          ..add('entityId', entityId)
          ..add('sessionId', sessionId)
          ..add('ruleId', ruleId)
          ..add('recordType', recordType)
          ..add('title', title)
          ..add('content', content)
          ..add('summary', summary)
          ..add('keywords', keywords)
          ..add('payloadJson', payloadJson)
          ..add('embeddingModelId', embeddingModelId)
          ..add('embeddingDimension', embeddingDimension)
          ..add('hasEmbedding', hasEmbedding)
          ..add('importance', importance)
          ..add('isPinned', isPinned)
          ..add('score', score)
          ..add('expiresAt', expiresAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class AiAdminServicesMemoryDtosMemorySearchHitDtoBuilder
    implements
        Builder<AiAdminServicesMemoryDtosMemorySearchHitDto,
            AiAdminServicesMemoryDtosMemorySearchHitDtoBuilder> {
  _$AiAdminServicesMemoryDtosMemorySearchHitDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _entityId;
  String? get entityId => _$this._entityId;
  set entityId(String? entityId) => _$this._entityId = entityId;

  String? _sessionId;
  String? get sessionId => _$this._sessionId;
  set sessionId(String? sessionId) => _$this._sessionId = sessionId;

  String? _ruleId;
  String? get ruleId => _$this._ruleId;
  set ruleId(String? ruleId) => _$this._ruleId = ruleId;

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

  String? _embeddingModelId;
  String? get embeddingModelId => _$this._embeddingModelId;
  set embeddingModelId(String? embeddingModelId) =>
      _$this._embeddingModelId = embeddingModelId;

  int? _embeddingDimension;
  int? get embeddingDimension => _$this._embeddingDimension;
  set embeddingDimension(int? embeddingDimension) =>
      _$this._embeddingDimension = embeddingDimension;

  bool? _hasEmbedding;
  bool? get hasEmbedding => _$this._hasEmbedding;
  set hasEmbedding(bool? hasEmbedding) => _$this._hasEmbedding = hasEmbedding;

  int? _importance;
  int? get importance => _$this._importance;
  set importance(int? importance) => _$this._importance = importance;

  int? _isPinned;
  int? get isPinned => _$this._isPinned;
  set isPinned(int? isPinned) => _$this._isPinned = isPinned;

  double? _score;
  double? get score => _$this._score;
  set score(double? score) => _$this._score = score;

  String? _expiresAt;
  String? get expiresAt => _$this._expiresAt;
  set expiresAt(String? expiresAt) => _$this._expiresAt = expiresAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  AiAdminServicesMemoryDtosMemorySearchHitDtoBuilder() {
    AiAdminServicesMemoryDtosMemorySearchHitDto._defaults(this);
  }

  AiAdminServicesMemoryDtosMemorySearchHitDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _entityId = $v.entityId;
      _sessionId = $v.sessionId;
      _ruleId = $v.ruleId;
      _recordType = $v.recordType;
      _title = $v.title;
      _content = $v.content;
      _summary = $v.summary;
      _keywords = $v.keywords;
      _payloadJson = $v.payloadJson;
      _embeddingModelId = $v.embeddingModelId;
      _embeddingDimension = $v.embeddingDimension;
      _hasEmbedding = $v.hasEmbedding;
      _importance = $v.importance;
      _isPinned = $v.isPinned;
      _score = $v.score;
      _expiresAt = $v.expiresAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesMemoryDtosMemorySearchHitDto other) {
    _$v = other as _$AiAdminServicesMemoryDtosMemorySearchHitDto;
  }

  @override
  void update(
      void Function(AiAdminServicesMemoryDtosMemorySearchHitDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesMemoryDtosMemorySearchHitDto build() => _build();

  _$AiAdminServicesMemoryDtosMemorySearchHitDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesMemoryDtosMemorySearchHitDto._(
          id: id,
          entityId: entityId,
          sessionId: sessionId,
          ruleId: ruleId,
          recordType: recordType,
          title: title,
          content: content,
          summary: summary,
          keywords: keywords,
          payloadJson: payloadJson,
          embeddingModelId: embeddingModelId,
          embeddingDimension: embeddingDimension,
          hasEmbedding: hasEmbedding,
          importance: importance,
          isPinned: isPinned,
          score: score,
          expiresAt: expiresAt,
          updatedAt: updatedAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
