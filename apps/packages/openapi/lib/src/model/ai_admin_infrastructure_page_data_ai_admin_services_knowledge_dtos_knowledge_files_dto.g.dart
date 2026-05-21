// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_page_data_ai_admin_services_knowledge_dtos_knowledge_files_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto
    extends AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto {
  @override
  final int? total;
  @override
  final BuiltList<AiAdminServicesKnowledgeDtosKnowledgeFilesDto>? list;

  factory _$AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto(
          [void Function(
                  AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto._(
      {this.total, this.list})
      : super._();
  @override
  AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto
      rebuild(
              void Function(
                      AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder
      toBuilder() =>
          AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto &&
        total == other.total &&
        list == other.list;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, list.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto')
          ..add('total', total)
          ..add('list', list))
        .toString();
  }
}

class AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder
    implements
        Builder<
            AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto,
            AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder> {
  _$AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto?
      _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  ListBuilder<AiAdminServicesKnowledgeDtosKnowledgeFilesDto>? _list;
  ListBuilder<AiAdminServicesKnowledgeDtosKnowledgeFilesDto> get list =>
      _$this._list ??=
          ListBuilder<AiAdminServicesKnowledgeDtosKnowledgeFilesDto>();
  set list(ListBuilder<AiAdminServicesKnowledgeDtosKnowledgeFilesDto>? list) =>
      _$this._list = list;

  AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder() {
    AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto
        ._defaults(this);
  }

  AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _total = $v.total;
      _list = $v.list?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto
          other) {
    _$v = other
        as _$AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto
      build() => _build();

  _$AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto
      _build() {
    _$AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto
              ._(
            total: total,
            list: _list?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'list';
        _list?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto',
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
