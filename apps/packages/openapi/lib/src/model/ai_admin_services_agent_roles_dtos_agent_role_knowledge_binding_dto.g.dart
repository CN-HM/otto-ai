// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_agent_roles_dtos_agent_role_knowledge_binding_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto
    extends AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto {
  @override
  final int? id;
  @override
  final String? datasetId;
  @override
  final String? datasetName;
  @override
  final int? sort;
  @override
  final bool? enabled;
  @override
  final int? topK;
  @override
  final double? minScore;
  @override
  final bool? rerankEnabled;
  @override
  final int? maxChunks;

  factory _$AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto(
          [void Function(
                  AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDtoBuilder)?
              updates]) =>
      (AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto._(
      {this.id,
      this.datasetId,
      this.datasetName,
      this.sort,
      this.enabled,
      this.topK,
      this.minScore,
      this.rerankEnabled,
      this.maxChunks})
      : super._();
  @override
  AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto rebuild(
          void Function(
                  AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDtoBuilder
      toBuilder() =>
          AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto &&
        id == other.id &&
        datasetId == other.datasetId &&
        datasetName == other.datasetName &&
        sort == other.sort &&
        enabled == other.enabled &&
        topK == other.topK &&
        minScore == other.minScore &&
        rerankEnabled == other.rerankEnabled &&
        maxChunks == other.maxChunks;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, datasetId.hashCode);
    _$hash = $jc(_$hash, datasetName.hashCode);
    _$hash = $jc(_$hash, sort.hashCode);
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, topK.hashCode);
    _$hash = $jc(_$hash, minScore.hashCode);
    _$hash = $jc(_$hash, rerankEnabled.hashCode);
    _$hash = $jc(_$hash, maxChunks.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto')
          ..add('id', id)
          ..add('datasetId', datasetId)
          ..add('datasetName', datasetName)
          ..add('sort', sort)
          ..add('enabled', enabled)
          ..add('topK', topK)
          ..add('minScore', minScore)
          ..add('rerankEnabled', rerankEnabled)
          ..add('maxChunks', maxChunks))
        .toString();
  }
}

class AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDtoBuilder
    implements
        Builder<AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto,
            AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDtoBuilder> {
  _$AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _datasetId;
  String? get datasetId => _$this._datasetId;
  set datasetId(String? datasetId) => _$this._datasetId = datasetId;

  String? _datasetName;
  String? get datasetName => _$this._datasetName;
  set datasetName(String? datasetName) => _$this._datasetName = datasetName;

  int? _sort;
  int? get sort => _$this._sort;
  set sort(int? sort) => _$this._sort = sort;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  int? _topK;
  int? get topK => _$this._topK;
  set topK(int? topK) => _$this._topK = topK;

  double? _minScore;
  double? get minScore => _$this._minScore;
  set minScore(double? minScore) => _$this._minScore = minScore;

  bool? _rerankEnabled;
  bool? get rerankEnabled => _$this._rerankEnabled;
  set rerankEnabled(bool? rerankEnabled) =>
      _$this._rerankEnabled = rerankEnabled;

  int? _maxChunks;
  int? get maxChunks => _$this._maxChunks;
  set maxChunks(int? maxChunks) => _$this._maxChunks = maxChunks;

  AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDtoBuilder() {
    AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto._defaults(this);
  }

  AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _datasetId = $v.datasetId;
      _datasetName = $v.datasetName;
      _sort = $v.sort;
      _enabled = $v.enabled;
      _topK = $v.topK;
      _minScore = $v.minScore;
      _rerankEnabled = $v.rerankEnabled;
      _maxChunks = $v.maxChunks;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto other) {
    _$v = other as _$AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto build() => _build();

  _$AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto._(
          id: id,
          datasetId: datasetId,
          datasetName: datasetName,
          sort: sort,
          enabled: enabled,
          topK: topK,
          minScore: minScore,
          rerankEnabled: rerankEnabled,
          maxChunks: maxChunks,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
