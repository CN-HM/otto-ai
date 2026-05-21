// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_knowledge_dtos_test_req_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesKnowledgeDtosTestReqDto
    extends AiAdminServicesKnowledgeDtosTestReqDto {
  @override
  final String? question;
  @override
  final String? query;
  @override
  final String? rewriteQuery;
  @override
  final int? topK;
  @override
  final double? threshold;
  @override
  final int? page;
  @override
  final bool? highlight;

  factory _$AiAdminServicesKnowledgeDtosTestReqDto(
          [void Function(AiAdminServicesKnowledgeDtosTestReqDtoBuilder)?
              updates]) =>
      (AiAdminServicesKnowledgeDtosTestReqDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesKnowledgeDtosTestReqDto._(
      {this.question,
      this.query,
      this.rewriteQuery,
      this.topK,
      this.threshold,
      this.page,
      this.highlight})
      : super._();
  @override
  AiAdminServicesKnowledgeDtosTestReqDto rebuild(
          void Function(AiAdminServicesKnowledgeDtosTestReqDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesKnowledgeDtosTestReqDtoBuilder toBuilder() =>
      AiAdminServicesKnowledgeDtosTestReqDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesKnowledgeDtosTestReqDto &&
        question == other.question &&
        query == other.query &&
        rewriteQuery == other.rewriteQuery &&
        topK == other.topK &&
        threshold == other.threshold &&
        page == other.page &&
        highlight == other.highlight;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, question.hashCode);
    _$hash = $jc(_$hash, query.hashCode);
    _$hash = $jc(_$hash, rewriteQuery.hashCode);
    _$hash = $jc(_$hash, topK.hashCode);
    _$hash = $jc(_$hash, threshold.hashCode);
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jc(_$hash, highlight.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesKnowledgeDtosTestReqDto')
          ..add('question', question)
          ..add('query', query)
          ..add('rewriteQuery', rewriteQuery)
          ..add('topK', topK)
          ..add('threshold', threshold)
          ..add('page', page)
          ..add('highlight', highlight))
        .toString();
  }
}

class AiAdminServicesKnowledgeDtosTestReqDtoBuilder
    implements
        Builder<AiAdminServicesKnowledgeDtosTestReqDto,
            AiAdminServicesKnowledgeDtosTestReqDtoBuilder> {
  _$AiAdminServicesKnowledgeDtosTestReqDto? _$v;

  String? _question;
  String? get question => _$this._question;
  set question(String? question) => _$this._question = question;

  String? _query;
  String? get query => _$this._query;
  set query(String? query) => _$this._query = query;

  String? _rewriteQuery;
  String? get rewriteQuery => _$this._rewriteQuery;
  set rewriteQuery(String? rewriteQuery) => _$this._rewriteQuery = rewriteQuery;

  int? _topK;
  int? get topK => _$this._topK;
  set topK(int? topK) => _$this._topK = topK;

  double? _threshold;
  double? get threshold => _$this._threshold;
  set threshold(double? threshold) => _$this._threshold = threshold;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  bool? _highlight;
  bool? get highlight => _$this._highlight;
  set highlight(bool? highlight) => _$this._highlight = highlight;

  AiAdminServicesKnowledgeDtosTestReqDtoBuilder() {
    AiAdminServicesKnowledgeDtosTestReqDto._defaults(this);
  }

  AiAdminServicesKnowledgeDtosTestReqDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _question = $v.question;
      _query = $v.query;
      _rewriteQuery = $v.rewriteQuery;
      _topK = $v.topK;
      _threshold = $v.threshold;
      _page = $v.page;
      _highlight = $v.highlight;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesKnowledgeDtosTestReqDto other) {
    _$v = other as _$AiAdminServicesKnowledgeDtosTestReqDto;
  }

  @override
  void update(
      void Function(AiAdminServicesKnowledgeDtosTestReqDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesKnowledgeDtosTestReqDto build() => _build();

  _$AiAdminServicesKnowledgeDtosTestReqDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesKnowledgeDtosTestReqDto._(
          question: question,
          query: query,
          rewriteQuery: rewriteQuery,
          topK: topK,
          threshold: threshold,
          page: page,
          highlight: highlight,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
