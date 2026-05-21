// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_memory_dtos_memory_search_result_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesMemoryDtosMemorySearchResultDto
    extends AiAdminServicesMemoryDtosMemorySearchResultDto {
  @override
  final String? libraryId;
  @override
  final String? entityId;
  @override
  final String? query;
  @override
  final double? minScore;
  @override
  final int? total;
  @override
  final BuiltList<AiAdminServicesMemoryDtosMemorySearchHitDto>? hits;

  factory _$AiAdminServicesMemoryDtosMemorySearchResultDto(
          [void Function(AiAdminServicesMemoryDtosMemorySearchResultDtoBuilder)?
              updates]) =>
      (AiAdminServicesMemoryDtosMemorySearchResultDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesMemoryDtosMemorySearchResultDto._(
      {this.libraryId,
      this.entityId,
      this.query,
      this.minScore,
      this.total,
      this.hits})
      : super._();
  @override
  AiAdminServicesMemoryDtosMemorySearchResultDto rebuild(
          void Function(AiAdminServicesMemoryDtosMemorySearchResultDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesMemoryDtosMemorySearchResultDtoBuilder toBuilder() =>
      AiAdminServicesMemoryDtosMemorySearchResultDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesMemoryDtosMemorySearchResultDto &&
        libraryId == other.libraryId &&
        entityId == other.entityId &&
        query == other.query &&
        minScore == other.minScore &&
        total == other.total &&
        hits == other.hits;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, libraryId.hashCode);
    _$hash = $jc(_$hash, entityId.hashCode);
    _$hash = $jc(_$hash, query.hashCode);
    _$hash = $jc(_$hash, minScore.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, hits.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesMemoryDtosMemorySearchResultDto')
          ..add('libraryId', libraryId)
          ..add('entityId', entityId)
          ..add('query', query)
          ..add('minScore', minScore)
          ..add('total', total)
          ..add('hits', hits))
        .toString();
  }
}

class AiAdminServicesMemoryDtosMemorySearchResultDtoBuilder
    implements
        Builder<AiAdminServicesMemoryDtosMemorySearchResultDto,
            AiAdminServicesMemoryDtosMemorySearchResultDtoBuilder> {
  _$AiAdminServicesMemoryDtosMemorySearchResultDto? _$v;

  String? _libraryId;
  String? get libraryId => _$this._libraryId;
  set libraryId(String? libraryId) => _$this._libraryId = libraryId;

  String? _entityId;
  String? get entityId => _$this._entityId;
  set entityId(String? entityId) => _$this._entityId = entityId;

  String? _query;
  String? get query => _$this._query;
  set query(String? query) => _$this._query = query;

  double? _minScore;
  double? get minScore => _$this._minScore;
  set minScore(double? minScore) => _$this._minScore = minScore;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  ListBuilder<AiAdminServicesMemoryDtosMemorySearchHitDto>? _hits;
  ListBuilder<AiAdminServicesMemoryDtosMemorySearchHitDto> get hits =>
      _$this._hits ??=
          ListBuilder<AiAdminServicesMemoryDtosMemorySearchHitDto>();
  set hits(ListBuilder<AiAdminServicesMemoryDtosMemorySearchHitDto>? hits) =>
      _$this._hits = hits;

  AiAdminServicesMemoryDtosMemorySearchResultDtoBuilder() {
    AiAdminServicesMemoryDtosMemorySearchResultDto._defaults(this);
  }

  AiAdminServicesMemoryDtosMemorySearchResultDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _libraryId = $v.libraryId;
      _entityId = $v.entityId;
      _query = $v.query;
      _minScore = $v.minScore;
      _total = $v.total;
      _hits = $v.hits?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesMemoryDtosMemorySearchResultDto other) {
    _$v = other as _$AiAdminServicesMemoryDtosMemorySearchResultDto;
  }

  @override
  void update(
      void Function(AiAdminServicesMemoryDtosMemorySearchResultDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesMemoryDtosMemorySearchResultDto build() => _build();

  _$AiAdminServicesMemoryDtosMemorySearchResultDto _build() {
    _$AiAdminServicesMemoryDtosMemorySearchResultDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesMemoryDtosMemorySearchResultDto._(
            libraryId: libraryId,
            entityId: entityId,
            query: query,
            minScore: minScore,
            total: total,
            hits: _hits?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'hits';
        _hits?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesMemoryDtosMemorySearchResultDto',
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
