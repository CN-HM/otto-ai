// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_knowledge_dtos_doc_agg_vo_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesKnowledgeDtosDocAggVoDto
    extends AiAdminServicesKnowledgeDtosDocAggVoDto {
  @override
  final int? count;
  @override
  final String? docName;
  @override
  final String? docId;

  factory _$AiAdminServicesKnowledgeDtosDocAggVoDto(
          [void Function(AiAdminServicesKnowledgeDtosDocAggVoDtoBuilder)?
              updates]) =>
      (AiAdminServicesKnowledgeDtosDocAggVoDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesKnowledgeDtosDocAggVoDto._(
      {this.count, this.docName, this.docId})
      : super._();
  @override
  AiAdminServicesKnowledgeDtosDocAggVoDto rebuild(
          void Function(AiAdminServicesKnowledgeDtosDocAggVoDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesKnowledgeDtosDocAggVoDtoBuilder toBuilder() =>
      AiAdminServicesKnowledgeDtosDocAggVoDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesKnowledgeDtosDocAggVoDto &&
        count == other.count &&
        docName == other.docName &&
        docId == other.docId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jc(_$hash, docName.hashCode);
    _$hash = $jc(_$hash, docId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesKnowledgeDtosDocAggVoDto')
          ..add('count', count)
          ..add('docName', docName)
          ..add('docId', docId))
        .toString();
  }
}

class AiAdminServicesKnowledgeDtosDocAggVoDtoBuilder
    implements
        Builder<AiAdminServicesKnowledgeDtosDocAggVoDto,
            AiAdminServicesKnowledgeDtosDocAggVoDtoBuilder> {
  _$AiAdminServicesKnowledgeDtosDocAggVoDto? _$v;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  String? _docName;
  String? get docName => _$this._docName;
  set docName(String? docName) => _$this._docName = docName;

  String? _docId;
  String? get docId => _$this._docId;
  set docId(String? docId) => _$this._docId = docId;

  AiAdminServicesKnowledgeDtosDocAggVoDtoBuilder() {
    AiAdminServicesKnowledgeDtosDocAggVoDto._defaults(this);
  }

  AiAdminServicesKnowledgeDtosDocAggVoDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _count = $v.count;
      _docName = $v.docName;
      _docId = $v.docId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesKnowledgeDtosDocAggVoDto other) {
    _$v = other as _$AiAdminServicesKnowledgeDtosDocAggVoDto;
  }

  @override
  void update(
      void Function(AiAdminServicesKnowledgeDtosDocAggVoDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesKnowledgeDtosDocAggVoDto build() => _build();

  _$AiAdminServicesKnowledgeDtosDocAggVoDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesKnowledgeDtosDocAggVoDto._(
          count: count,
          docName: docName,
          docId: docId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
