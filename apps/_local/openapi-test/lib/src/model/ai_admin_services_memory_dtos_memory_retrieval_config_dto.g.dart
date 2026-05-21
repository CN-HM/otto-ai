// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_memory_dtos_memory_retrieval_config_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesMemoryDtosMemoryRetrievalConfigDto
    extends AiAdminServicesMemoryDtosMemoryRetrievalConfigDto {
  @override
  final int? topK;
  @override
  final double? minScore;
  @override
  final bool? intentRecall;
  @override
  final bool? queryRewrite;
  @override
  final bool? rerank;

  factory _$AiAdminServicesMemoryDtosMemoryRetrievalConfigDto(
          [void Function(
                  AiAdminServicesMemoryDtosMemoryRetrievalConfigDtoBuilder)?
              updates]) =>
      (AiAdminServicesMemoryDtosMemoryRetrievalConfigDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesMemoryDtosMemoryRetrievalConfigDto._(
      {this.topK,
      this.minScore,
      this.intentRecall,
      this.queryRewrite,
      this.rerank})
      : super._();
  @override
  AiAdminServicesMemoryDtosMemoryRetrievalConfigDto rebuild(
          void Function(
                  AiAdminServicesMemoryDtosMemoryRetrievalConfigDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesMemoryDtosMemoryRetrievalConfigDtoBuilder toBuilder() =>
      AiAdminServicesMemoryDtosMemoryRetrievalConfigDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesMemoryDtosMemoryRetrievalConfigDto &&
        topK == other.topK &&
        minScore == other.minScore &&
        intentRecall == other.intentRecall &&
        queryRewrite == other.queryRewrite &&
        rerank == other.rerank;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, topK.hashCode);
    _$hash = $jc(_$hash, minScore.hashCode);
    _$hash = $jc(_$hash, intentRecall.hashCode);
    _$hash = $jc(_$hash, queryRewrite.hashCode);
    _$hash = $jc(_$hash, rerank.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesMemoryDtosMemoryRetrievalConfigDto')
          ..add('topK', topK)
          ..add('minScore', minScore)
          ..add('intentRecall', intentRecall)
          ..add('queryRewrite', queryRewrite)
          ..add('rerank', rerank))
        .toString();
  }
}

class AiAdminServicesMemoryDtosMemoryRetrievalConfigDtoBuilder
    implements
        Builder<AiAdminServicesMemoryDtosMemoryRetrievalConfigDto,
            AiAdminServicesMemoryDtosMemoryRetrievalConfigDtoBuilder> {
  _$AiAdminServicesMemoryDtosMemoryRetrievalConfigDto? _$v;

  int? _topK;
  int? get topK => _$this._topK;
  set topK(int? topK) => _$this._topK = topK;

  double? _minScore;
  double? get minScore => _$this._minScore;
  set minScore(double? minScore) => _$this._minScore = minScore;

  bool? _intentRecall;
  bool? get intentRecall => _$this._intentRecall;
  set intentRecall(bool? intentRecall) => _$this._intentRecall = intentRecall;

  bool? _queryRewrite;
  bool? get queryRewrite => _$this._queryRewrite;
  set queryRewrite(bool? queryRewrite) => _$this._queryRewrite = queryRewrite;

  bool? _rerank;
  bool? get rerank => _$this._rerank;
  set rerank(bool? rerank) => _$this._rerank = rerank;

  AiAdminServicesMemoryDtosMemoryRetrievalConfigDtoBuilder() {
    AiAdminServicesMemoryDtosMemoryRetrievalConfigDto._defaults(this);
  }

  AiAdminServicesMemoryDtosMemoryRetrievalConfigDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _topK = $v.topK;
      _minScore = $v.minScore;
      _intentRecall = $v.intentRecall;
      _queryRewrite = $v.queryRewrite;
      _rerank = $v.rerank;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesMemoryDtosMemoryRetrievalConfigDto other) {
    _$v = other as _$AiAdminServicesMemoryDtosMemoryRetrievalConfigDto;
  }

  @override
  void update(
      void Function(AiAdminServicesMemoryDtosMemoryRetrievalConfigDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesMemoryDtosMemoryRetrievalConfigDto build() => _build();

  _$AiAdminServicesMemoryDtosMemoryRetrievalConfigDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesMemoryDtosMemoryRetrievalConfigDto._(
          topK: topK,
          minScore: minScore,
          intentRecall: intentRecall,
          queryRewrite: queryRewrite,
          rerank: rerank,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
