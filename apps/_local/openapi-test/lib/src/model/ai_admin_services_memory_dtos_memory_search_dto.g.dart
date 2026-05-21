// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_memory_dtos_memory_search_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesMemoryDtosMemorySearchDto
    extends AiAdminServicesMemoryDtosMemorySearchDto {
  @override
  final String? entityId;
  @override
  final String? sessionId;
  @override
  final String? query;
  @override
  final String? recordType;
  @override
  final int? maxResults;
  @override
  final double? minScore;
  @override
  final int? minImportance;
  @override
  final int? includeExpired;

  factory _$AiAdminServicesMemoryDtosMemorySearchDto(
          [void Function(AiAdminServicesMemoryDtosMemorySearchDtoBuilder)?
              updates]) =>
      (AiAdminServicesMemoryDtosMemorySearchDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesMemoryDtosMemorySearchDto._(
      {this.entityId,
      this.sessionId,
      this.query,
      this.recordType,
      this.maxResults,
      this.minScore,
      this.minImportance,
      this.includeExpired})
      : super._();
  @override
  AiAdminServicesMemoryDtosMemorySearchDto rebuild(
          void Function(AiAdminServicesMemoryDtosMemorySearchDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesMemoryDtosMemorySearchDtoBuilder toBuilder() =>
      AiAdminServicesMemoryDtosMemorySearchDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesMemoryDtosMemorySearchDto &&
        entityId == other.entityId &&
        sessionId == other.sessionId &&
        query == other.query &&
        recordType == other.recordType &&
        maxResults == other.maxResults &&
        minScore == other.minScore &&
        minImportance == other.minImportance &&
        includeExpired == other.includeExpired;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, entityId.hashCode);
    _$hash = $jc(_$hash, sessionId.hashCode);
    _$hash = $jc(_$hash, query.hashCode);
    _$hash = $jc(_$hash, recordType.hashCode);
    _$hash = $jc(_$hash, maxResults.hashCode);
    _$hash = $jc(_$hash, minScore.hashCode);
    _$hash = $jc(_$hash, minImportance.hashCode);
    _$hash = $jc(_$hash, includeExpired.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesMemoryDtosMemorySearchDto')
          ..add('entityId', entityId)
          ..add('sessionId', sessionId)
          ..add('query', query)
          ..add('recordType', recordType)
          ..add('maxResults', maxResults)
          ..add('minScore', minScore)
          ..add('minImportance', minImportance)
          ..add('includeExpired', includeExpired))
        .toString();
  }
}

class AiAdminServicesMemoryDtosMemorySearchDtoBuilder
    implements
        Builder<AiAdminServicesMemoryDtosMemorySearchDto,
            AiAdminServicesMemoryDtosMemorySearchDtoBuilder> {
  _$AiAdminServicesMemoryDtosMemorySearchDto? _$v;

  String? _entityId;
  String? get entityId => _$this._entityId;
  set entityId(String? entityId) => _$this._entityId = entityId;

  String? _sessionId;
  String? get sessionId => _$this._sessionId;
  set sessionId(String? sessionId) => _$this._sessionId = sessionId;

  String? _query;
  String? get query => _$this._query;
  set query(String? query) => _$this._query = query;

  String? _recordType;
  String? get recordType => _$this._recordType;
  set recordType(String? recordType) => _$this._recordType = recordType;

  int? _maxResults;
  int? get maxResults => _$this._maxResults;
  set maxResults(int? maxResults) => _$this._maxResults = maxResults;

  double? _minScore;
  double? get minScore => _$this._minScore;
  set minScore(double? minScore) => _$this._minScore = minScore;

  int? _minImportance;
  int? get minImportance => _$this._minImportance;
  set minImportance(int? minImportance) =>
      _$this._minImportance = minImportance;

  int? _includeExpired;
  int? get includeExpired => _$this._includeExpired;
  set includeExpired(int? includeExpired) =>
      _$this._includeExpired = includeExpired;

  AiAdminServicesMemoryDtosMemorySearchDtoBuilder() {
    AiAdminServicesMemoryDtosMemorySearchDto._defaults(this);
  }

  AiAdminServicesMemoryDtosMemorySearchDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _entityId = $v.entityId;
      _sessionId = $v.sessionId;
      _query = $v.query;
      _recordType = $v.recordType;
      _maxResults = $v.maxResults;
      _minScore = $v.minScore;
      _minImportance = $v.minImportance;
      _includeExpired = $v.includeExpired;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesMemoryDtosMemorySearchDto other) {
    _$v = other as _$AiAdminServicesMemoryDtosMemorySearchDto;
  }

  @override
  void update(
      void Function(AiAdminServicesMemoryDtosMemorySearchDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesMemoryDtosMemorySearchDto build() => _build();

  _$AiAdminServicesMemoryDtosMemorySearchDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesMemoryDtosMemorySearchDto._(
          entityId: entityId,
          sessionId: sessionId,
          query: query,
          recordType: recordType,
          maxResults: maxResults,
          minScore: minScore,
          minImportance: minImportance,
          includeExpired: includeExpired,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
