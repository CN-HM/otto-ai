// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_knowledge_dtos_result_vo_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesKnowledgeDtosResultVoDto
    extends AiAdminServicesKnowledgeDtosResultVoDto {
  @override
  final BuiltList<AiAdminServicesKnowledgeDtosHitVoDto>? chunks;
  @override
  final int? total;
  @override
  final BuiltList<AiAdminServicesKnowledgeDtosDocAggVoDto>? docAggs;
  @override
  final String? query;
  @override
  final String? effectiveQuery;
  @override
  final int? topK;
  @override
  final double? threshold;
  @override
  final bool? rewriteApplied;

  factory _$AiAdminServicesKnowledgeDtosResultVoDto(
          [void Function(AiAdminServicesKnowledgeDtosResultVoDtoBuilder)?
              updates]) =>
      (AiAdminServicesKnowledgeDtosResultVoDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesKnowledgeDtosResultVoDto._(
      {this.chunks,
      this.total,
      this.docAggs,
      this.query,
      this.effectiveQuery,
      this.topK,
      this.threshold,
      this.rewriteApplied})
      : super._();
  @override
  AiAdminServicesKnowledgeDtosResultVoDto rebuild(
          void Function(AiAdminServicesKnowledgeDtosResultVoDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesKnowledgeDtosResultVoDtoBuilder toBuilder() =>
      AiAdminServicesKnowledgeDtosResultVoDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesKnowledgeDtosResultVoDto &&
        chunks == other.chunks &&
        total == other.total &&
        docAggs == other.docAggs &&
        query == other.query &&
        effectiveQuery == other.effectiveQuery &&
        topK == other.topK &&
        threshold == other.threshold &&
        rewriteApplied == other.rewriteApplied;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, chunks.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, docAggs.hashCode);
    _$hash = $jc(_$hash, query.hashCode);
    _$hash = $jc(_$hash, effectiveQuery.hashCode);
    _$hash = $jc(_$hash, topK.hashCode);
    _$hash = $jc(_$hash, threshold.hashCode);
    _$hash = $jc(_$hash, rewriteApplied.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesKnowledgeDtosResultVoDto')
          ..add('chunks', chunks)
          ..add('total', total)
          ..add('docAggs', docAggs)
          ..add('query', query)
          ..add('effectiveQuery', effectiveQuery)
          ..add('topK', topK)
          ..add('threshold', threshold)
          ..add('rewriteApplied', rewriteApplied))
        .toString();
  }
}

class AiAdminServicesKnowledgeDtosResultVoDtoBuilder
    implements
        Builder<AiAdminServicesKnowledgeDtosResultVoDto,
            AiAdminServicesKnowledgeDtosResultVoDtoBuilder> {
  _$AiAdminServicesKnowledgeDtosResultVoDto? _$v;

  ListBuilder<AiAdminServicesKnowledgeDtosHitVoDto>? _chunks;
  ListBuilder<AiAdminServicesKnowledgeDtosHitVoDto> get chunks =>
      _$this._chunks ??= ListBuilder<AiAdminServicesKnowledgeDtosHitVoDto>();
  set chunks(ListBuilder<AiAdminServicesKnowledgeDtosHitVoDto>? chunks) =>
      _$this._chunks = chunks;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  ListBuilder<AiAdminServicesKnowledgeDtosDocAggVoDto>? _docAggs;
  ListBuilder<AiAdminServicesKnowledgeDtosDocAggVoDto> get docAggs =>
      _$this._docAggs ??=
          ListBuilder<AiAdminServicesKnowledgeDtosDocAggVoDto>();
  set docAggs(ListBuilder<AiAdminServicesKnowledgeDtosDocAggVoDto>? docAggs) =>
      _$this._docAggs = docAggs;

  String? _query;
  String? get query => _$this._query;
  set query(String? query) => _$this._query = query;

  String? _effectiveQuery;
  String? get effectiveQuery => _$this._effectiveQuery;
  set effectiveQuery(String? effectiveQuery) =>
      _$this._effectiveQuery = effectiveQuery;

  int? _topK;
  int? get topK => _$this._topK;
  set topK(int? topK) => _$this._topK = topK;

  double? _threshold;
  double? get threshold => _$this._threshold;
  set threshold(double? threshold) => _$this._threshold = threshold;

  bool? _rewriteApplied;
  bool? get rewriteApplied => _$this._rewriteApplied;
  set rewriteApplied(bool? rewriteApplied) =>
      _$this._rewriteApplied = rewriteApplied;

  AiAdminServicesKnowledgeDtosResultVoDtoBuilder() {
    AiAdminServicesKnowledgeDtosResultVoDto._defaults(this);
  }

  AiAdminServicesKnowledgeDtosResultVoDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _chunks = $v.chunks?.toBuilder();
      _total = $v.total;
      _docAggs = $v.docAggs?.toBuilder();
      _query = $v.query;
      _effectiveQuery = $v.effectiveQuery;
      _topK = $v.topK;
      _threshold = $v.threshold;
      _rewriteApplied = $v.rewriteApplied;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesKnowledgeDtosResultVoDto other) {
    _$v = other as _$AiAdminServicesKnowledgeDtosResultVoDto;
  }

  @override
  void update(
      void Function(AiAdminServicesKnowledgeDtosResultVoDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesKnowledgeDtosResultVoDto build() => _build();

  _$AiAdminServicesKnowledgeDtosResultVoDto _build() {
    _$AiAdminServicesKnowledgeDtosResultVoDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesKnowledgeDtosResultVoDto._(
            chunks: _chunks?.build(),
            total: total,
            docAggs: _docAggs?.build(),
            query: query,
            effectiveQuery: effectiveQuery,
            topK: topK,
            threshold: threshold,
            rewriteApplied: rewriteApplied,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'chunks';
        _chunks?.build();

        _$failedField = 'docAggs';
        _docAggs?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesKnowledgeDtosResultVoDto',
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
