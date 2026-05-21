// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_knowledge_dtos_hit_vo_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesKnowledgeDtosHitVoDto
    extends AiAdminServicesKnowledgeDtosHitVoDto {
  @override
  final String? id;
  @override
  final String? content;
  @override
  final double? similarity;
  @override
  final String? documentId;
  @override
  final String? datasetId;
  @override
  final String? documentName;

  factory _$AiAdminServicesKnowledgeDtosHitVoDto(
          [void Function(AiAdminServicesKnowledgeDtosHitVoDtoBuilder)?
              updates]) =>
      (AiAdminServicesKnowledgeDtosHitVoDtoBuilder()..update(updates))._build();

  _$AiAdminServicesKnowledgeDtosHitVoDto._(
      {this.id,
      this.content,
      this.similarity,
      this.documentId,
      this.datasetId,
      this.documentName})
      : super._();
  @override
  AiAdminServicesKnowledgeDtosHitVoDto rebuild(
          void Function(AiAdminServicesKnowledgeDtosHitVoDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesKnowledgeDtosHitVoDtoBuilder toBuilder() =>
      AiAdminServicesKnowledgeDtosHitVoDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesKnowledgeDtosHitVoDto &&
        id == other.id &&
        content == other.content &&
        similarity == other.similarity &&
        documentId == other.documentId &&
        datasetId == other.datasetId &&
        documentName == other.documentName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, similarity.hashCode);
    _$hash = $jc(_$hash, documentId.hashCode);
    _$hash = $jc(_$hash, datasetId.hashCode);
    _$hash = $jc(_$hash, documentName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AiAdminServicesKnowledgeDtosHitVoDto')
          ..add('id', id)
          ..add('content', content)
          ..add('similarity', similarity)
          ..add('documentId', documentId)
          ..add('datasetId', datasetId)
          ..add('documentName', documentName))
        .toString();
  }
}

class AiAdminServicesKnowledgeDtosHitVoDtoBuilder
    implements
        Builder<AiAdminServicesKnowledgeDtosHitVoDto,
            AiAdminServicesKnowledgeDtosHitVoDtoBuilder> {
  _$AiAdminServicesKnowledgeDtosHitVoDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  double? _similarity;
  double? get similarity => _$this._similarity;
  set similarity(double? similarity) => _$this._similarity = similarity;

  String? _documentId;
  String? get documentId => _$this._documentId;
  set documentId(String? documentId) => _$this._documentId = documentId;

  String? _datasetId;
  String? get datasetId => _$this._datasetId;
  set datasetId(String? datasetId) => _$this._datasetId = datasetId;

  String? _documentName;
  String? get documentName => _$this._documentName;
  set documentName(String? documentName) => _$this._documentName = documentName;

  AiAdminServicesKnowledgeDtosHitVoDtoBuilder() {
    AiAdminServicesKnowledgeDtosHitVoDto._defaults(this);
  }

  AiAdminServicesKnowledgeDtosHitVoDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _content = $v.content;
      _similarity = $v.similarity;
      _documentId = $v.documentId;
      _datasetId = $v.datasetId;
      _documentName = $v.documentName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesKnowledgeDtosHitVoDto other) {
    _$v = other as _$AiAdminServicesKnowledgeDtosHitVoDto;
  }

  @override
  void update(
      void Function(AiAdminServicesKnowledgeDtosHitVoDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesKnowledgeDtosHitVoDto build() => _build();

  _$AiAdminServicesKnowledgeDtosHitVoDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesKnowledgeDtosHitVoDto._(
          id: id,
          content: content,
          similarity: similarity,
          documentId: documentId,
          datasetId: datasetId,
          documentName: documentName,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
