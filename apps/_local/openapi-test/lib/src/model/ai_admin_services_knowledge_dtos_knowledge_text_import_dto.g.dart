// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_knowledge_dtos_knowledge_text_import_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesKnowledgeDtosKnowledgeTextImportDto
    extends AiAdminServicesKnowledgeDtosKnowledgeTextImportDto {
  @override
  final String? title;
  @override
  final String? content;
  @override
  final String? source_;
  @override
  final JsonObject? metadata;

  factory _$AiAdminServicesKnowledgeDtosKnowledgeTextImportDto(
          [void Function(
                  AiAdminServicesKnowledgeDtosKnowledgeTextImportDtoBuilder)?
              updates]) =>
      (AiAdminServicesKnowledgeDtosKnowledgeTextImportDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesKnowledgeDtosKnowledgeTextImportDto._(
      {this.title, this.content, this.source_, this.metadata})
      : super._();
  @override
  AiAdminServicesKnowledgeDtosKnowledgeTextImportDto rebuild(
          void Function(
                  AiAdminServicesKnowledgeDtosKnowledgeTextImportDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesKnowledgeDtosKnowledgeTextImportDtoBuilder toBuilder() =>
      AiAdminServicesKnowledgeDtosKnowledgeTextImportDtoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesKnowledgeDtosKnowledgeTextImportDto &&
        title == other.title &&
        content == other.content &&
        source_ == other.source_ &&
        metadata == other.metadata;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, source_.hashCode);
    _$hash = $jc(_$hash, metadata.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesKnowledgeDtosKnowledgeTextImportDto')
          ..add('title', title)
          ..add('content', content)
          ..add('source_', source_)
          ..add('metadata', metadata))
        .toString();
  }
}

class AiAdminServicesKnowledgeDtosKnowledgeTextImportDtoBuilder
    implements
        Builder<AiAdminServicesKnowledgeDtosKnowledgeTextImportDto,
            AiAdminServicesKnowledgeDtosKnowledgeTextImportDtoBuilder> {
  _$AiAdminServicesKnowledgeDtosKnowledgeTextImportDto? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  String? _source_;
  String? get source_ => _$this._source_;
  set source_(String? source_) => _$this._source_ = source_;

  JsonObject? _metadata;
  JsonObject? get metadata => _$this._metadata;
  set metadata(JsonObject? metadata) => _$this._metadata = metadata;

  AiAdminServicesKnowledgeDtosKnowledgeTextImportDtoBuilder() {
    AiAdminServicesKnowledgeDtosKnowledgeTextImportDto._defaults(this);
  }

  AiAdminServicesKnowledgeDtosKnowledgeTextImportDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _content = $v.content;
      _source_ = $v.source_;
      _metadata = $v.metadata;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesKnowledgeDtosKnowledgeTextImportDto other) {
    _$v = other as _$AiAdminServicesKnowledgeDtosKnowledgeTextImportDto;
  }

  @override
  void update(
      void Function(AiAdminServicesKnowledgeDtosKnowledgeTextImportDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesKnowledgeDtosKnowledgeTextImportDto build() => _build();

  _$AiAdminServicesKnowledgeDtosKnowledgeTextImportDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesKnowledgeDtosKnowledgeTextImportDto._(
          title: title,
          content: content,
          source_: source_,
          metadata: metadata,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
