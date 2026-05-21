// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_page_data_ai_admin_services_knowledge_dtos_knowledge_base_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto
    extends AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto {
  @override
  final int? total;
  @override
  final BuiltList<AiAdminServicesKnowledgeDtosKnowledgeBaseDto>? list;

  factory _$AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto(
          [void Function(
                  AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto._(
      {this.total, this.list})
      : super._();
  @override
  AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto rebuild(
          void Function(
                  AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder
      toBuilder() =>
          AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto &&
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
            r'AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto')
          ..add('total', total)
          ..add('list', list))
        .toString();
  }
}

class AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder
    implements
        Builder<
            AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto,
            AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder> {
  _$AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto?
      _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  ListBuilder<AiAdminServicesKnowledgeDtosKnowledgeBaseDto>? _list;
  ListBuilder<AiAdminServicesKnowledgeDtosKnowledgeBaseDto> get list =>
      _$this._list ??=
          ListBuilder<AiAdminServicesKnowledgeDtosKnowledgeBaseDto>();
  set list(ListBuilder<AiAdminServicesKnowledgeDtosKnowledgeBaseDto>? list) =>
      _$this._list = list;

  AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder() {
    AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto
        ._defaults(this);
  }

  AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder
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
      AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto
          other) {
    _$v = other
        as _$AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto
      build() => _build();

  _$AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto
      _build() {
    _$AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto
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
            r'AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto',
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
