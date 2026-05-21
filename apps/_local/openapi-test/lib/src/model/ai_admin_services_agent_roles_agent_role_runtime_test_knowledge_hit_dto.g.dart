// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_agent_roles_agent_role_runtime_test_knowledge_hit_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto
    extends AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto {
  @override
  final String? datasetId;
  @override
  final String? documentId;
  @override
  final String? documentName;
  @override
  final String? content;
  @override
  final double? score;

  factory _$AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto(
          [void Function(
                  AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDtoBuilder)?
              updates]) =>
      (AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto._(
      {this.datasetId,
      this.documentId,
      this.documentName,
      this.content,
      this.score})
      : super._();
  @override
  AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto rebuild(
          void Function(
                  AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDtoBuilder
      toBuilder() =>
          AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto &&
        datasetId == other.datasetId &&
        documentId == other.documentId &&
        documentName == other.documentName &&
        content == other.content &&
        score == other.score;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, datasetId.hashCode);
    _$hash = $jc(_$hash, documentId.hashCode);
    _$hash = $jc(_$hash, documentName.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, score.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto')
          ..add('datasetId', datasetId)
          ..add('documentId', documentId)
          ..add('documentName', documentName)
          ..add('content', content)
          ..add('score', score))
        .toString();
  }
}

class AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDtoBuilder
    implements
        Builder<AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto,
            AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDtoBuilder> {
  _$AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto? _$v;

  String? _datasetId;
  String? get datasetId => _$this._datasetId;
  set datasetId(String? datasetId) => _$this._datasetId = datasetId;

  String? _documentId;
  String? get documentId => _$this._documentId;
  set documentId(String? documentId) => _$this._documentId = documentId;

  String? _documentName;
  String? get documentName => _$this._documentName;
  set documentName(String? documentName) => _$this._documentName = documentName;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  double? _score;
  double? get score => _$this._score;
  set score(double? score) => _$this._score = score;

  AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDtoBuilder() {
    AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto._defaults(
        this);
  }

  AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDtoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _datasetId = $v.datasetId;
      _documentId = $v.documentId;
      _documentName = $v.documentName;
      _content = $v.content;
      _score = $v.score;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto other) {
    _$v =
        other as _$AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto build() =>
      _build();

  _$AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto._(
          datasetId: datasetId,
          documentId: documentId,
          documentName: documentName,
          content: content,
          score: score,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
