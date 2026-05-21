// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_memory_dtos_memory_runtime_context_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesMemoryDtosMemoryRuntimeContextDto
    extends AiAdminServicesMemoryDtosMemoryRuntimeContextDto {
  @override
  final String? libraryId;
  @override
  final String? libraryName;
  @override
  final String? entityScope;
  @override
  final String? entityId;
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
  @override
  final BuiltList<AiAdminServicesMemoryDtosMemorySearchHitDto>? records;

  factory _$AiAdminServicesMemoryDtosMemoryRuntimeContextDto(
          [void Function(
                  AiAdminServicesMemoryDtosMemoryRuntimeContextDtoBuilder)?
              updates]) =>
      (AiAdminServicesMemoryDtosMemoryRuntimeContextDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesMemoryDtosMemoryRuntimeContextDto._(
      {this.libraryId,
      this.libraryName,
      this.entityScope,
      this.entityId,
      this.topK,
      this.minScore,
      this.intentRecall,
      this.queryRewrite,
      this.rerank,
      this.records})
      : super._();
  @override
  AiAdminServicesMemoryDtosMemoryRuntimeContextDto rebuild(
          void Function(AiAdminServicesMemoryDtosMemoryRuntimeContextDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesMemoryDtosMemoryRuntimeContextDtoBuilder toBuilder() =>
      AiAdminServicesMemoryDtosMemoryRuntimeContextDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesMemoryDtosMemoryRuntimeContextDto &&
        libraryId == other.libraryId &&
        libraryName == other.libraryName &&
        entityScope == other.entityScope &&
        entityId == other.entityId &&
        topK == other.topK &&
        minScore == other.minScore &&
        intentRecall == other.intentRecall &&
        queryRewrite == other.queryRewrite &&
        rerank == other.rerank &&
        records == other.records;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, libraryId.hashCode);
    _$hash = $jc(_$hash, libraryName.hashCode);
    _$hash = $jc(_$hash, entityScope.hashCode);
    _$hash = $jc(_$hash, entityId.hashCode);
    _$hash = $jc(_$hash, topK.hashCode);
    _$hash = $jc(_$hash, minScore.hashCode);
    _$hash = $jc(_$hash, intentRecall.hashCode);
    _$hash = $jc(_$hash, queryRewrite.hashCode);
    _$hash = $jc(_$hash, rerank.hashCode);
    _$hash = $jc(_$hash, records.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesMemoryDtosMemoryRuntimeContextDto')
          ..add('libraryId', libraryId)
          ..add('libraryName', libraryName)
          ..add('entityScope', entityScope)
          ..add('entityId', entityId)
          ..add('topK', topK)
          ..add('minScore', minScore)
          ..add('intentRecall', intentRecall)
          ..add('queryRewrite', queryRewrite)
          ..add('rerank', rerank)
          ..add('records', records))
        .toString();
  }
}

class AiAdminServicesMemoryDtosMemoryRuntimeContextDtoBuilder
    implements
        Builder<AiAdminServicesMemoryDtosMemoryRuntimeContextDto,
            AiAdminServicesMemoryDtosMemoryRuntimeContextDtoBuilder> {
  _$AiAdminServicesMemoryDtosMemoryRuntimeContextDto? _$v;

  String? _libraryId;
  String? get libraryId => _$this._libraryId;
  set libraryId(String? libraryId) => _$this._libraryId = libraryId;

  String? _libraryName;
  String? get libraryName => _$this._libraryName;
  set libraryName(String? libraryName) => _$this._libraryName = libraryName;

  String? _entityScope;
  String? get entityScope => _$this._entityScope;
  set entityScope(String? entityScope) => _$this._entityScope = entityScope;

  String? _entityId;
  String? get entityId => _$this._entityId;
  set entityId(String? entityId) => _$this._entityId = entityId;

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

  ListBuilder<AiAdminServicesMemoryDtosMemorySearchHitDto>? _records;
  ListBuilder<AiAdminServicesMemoryDtosMemorySearchHitDto> get records =>
      _$this._records ??=
          ListBuilder<AiAdminServicesMemoryDtosMemorySearchHitDto>();
  set records(
          ListBuilder<AiAdminServicesMemoryDtosMemorySearchHitDto>? records) =>
      _$this._records = records;

  AiAdminServicesMemoryDtosMemoryRuntimeContextDtoBuilder() {
    AiAdminServicesMemoryDtosMemoryRuntimeContextDto._defaults(this);
  }

  AiAdminServicesMemoryDtosMemoryRuntimeContextDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _libraryId = $v.libraryId;
      _libraryName = $v.libraryName;
      _entityScope = $v.entityScope;
      _entityId = $v.entityId;
      _topK = $v.topK;
      _minScore = $v.minScore;
      _intentRecall = $v.intentRecall;
      _queryRewrite = $v.queryRewrite;
      _rerank = $v.rerank;
      _records = $v.records?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesMemoryDtosMemoryRuntimeContextDto other) {
    _$v = other as _$AiAdminServicesMemoryDtosMemoryRuntimeContextDto;
  }

  @override
  void update(
      void Function(AiAdminServicesMemoryDtosMemoryRuntimeContextDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesMemoryDtosMemoryRuntimeContextDto build() => _build();

  _$AiAdminServicesMemoryDtosMemoryRuntimeContextDto _build() {
    _$AiAdminServicesMemoryDtosMemoryRuntimeContextDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesMemoryDtosMemoryRuntimeContextDto._(
            libraryId: libraryId,
            libraryName: libraryName,
            entityScope: entityScope,
            entityId: entityId,
            topK: topK,
            minScore: minScore,
            intentRecall: intentRecall,
            queryRewrite: queryRewrite,
            rerank: rerank,
            records: _records?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'records';
        _records?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesMemoryDtosMemoryRuntimeContextDto',
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
