// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_rbac_dtos_menu_tree_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesRbacDtosMenuTreeDto
    extends AiAdminServicesRbacDtosMenuTreeDto {
  @override
  final int? id;
  @override
  final int? parentId;
  @override
  final String? name;
  @override
  final String? code;
  @override
  final int? type;
  @override
  final int? sort;
  @override
  final BuiltList<AiAdminServicesRbacDtosMenuTreeDto>? children;

  factory _$AiAdminServicesRbacDtosMenuTreeDto(
          [void Function(AiAdminServicesRbacDtosMenuTreeDtoBuilder)?
              updates]) =>
      (AiAdminServicesRbacDtosMenuTreeDtoBuilder()..update(updates))._build();

  _$AiAdminServicesRbacDtosMenuTreeDto._(
      {this.id,
      this.parentId,
      this.name,
      this.code,
      this.type,
      this.sort,
      this.children})
      : super._();
  @override
  AiAdminServicesRbacDtosMenuTreeDto rebuild(
          void Function(AiAdminServicesRbacDtosMenuTreeDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesRbacDtosMenuTreeDtoBuilder toBuilder() =>
      AiAdminServicesRbacDtosMenuTreeDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesRbacDtosMenuTreeDto &&
        id == other.id &&
        parentId == other.parentId &&
        name == other.name &&
        code == other.code &&
        type == other.type &&
        sort == other.sort &&
        children == other.children;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, parentId.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, sort.hashCode);
    _$hash = $jc(_$hash, children.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AiAdminServicesRbacDtosMenuTreeDto')
          ..add('id', id)
          ..add('parentId', parentId)
          ..add('name', name)
          ..add('code', code)
          ..add('type', type)
          ..add('sort', sort)
          ..add('children', children))
        .toString();
  }
}

class AiAdminServicesRbacDtosMenuTreeDtoBuilder
    implements
        Builder<AiAdminServicesRbacDtosMenuTreeDto,
            AiAdminServicesRbacDtosMenuTreeDtoBuilder> {
  _$AiAdminServicesRbacDtosMenuTreeDto? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _parentId;
  int? get parentId => _$this._parentId;
  set parentId(int? parentId) => _$this._parentId = parentId;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  int? _type;
  int? get type => _$this._type;
  set type(int? type) => _$this._type = type;

  int? _sort;
  int? get sort => _$this._sort;
  set sort(int? sort) => _$this._sort = sort;

  ListBuilder<AiAdminServicesRbacDtosMenuTreeDto>? _children;
  ListBuilder<AiAdminServicesRbacDtosMenuTreeDto> get children =>
      _$this._children ??= ListBuilder<AiAdminServicesRbacDtosMenuTreeDto>();
  set children(ListBuilder<AiAdminServicesRbacDtosMenuTreeDto>? children) =>
      _$this._children = children;

  AiAdminServicesRbacDtosMenuTreeDtoBuilder() {
    AiAdminServicesRbacDtosMenuTreeDto._defaults(this);
  }

  AiAdminServicesRbacDtosMenuTreeDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _parentId = $v.parentId;
      _name = $v.name;
      _code = $v.code;
      _type = $v.type;
      _sort = $v.sort;
      _children = $v.children?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesRbacDtosMenuTreeDto other) {
    _$v = other as _$AiAdminServicesRbacDtosMenuTreeDto;
  }

  @override
  void update(
      void Function(AiAdminServicesRbacDtosMenuTreeDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesRbacDtosMenuTreeDto build() => _build();

  _$AiAdminServicesRbacDtosMenuTreeDto _build() {
    _$AiAdminServicesRbacDtosMenuTreeDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesRbacDtosMenuTreeDto._(
            id: id,
            parentId: parentId,
            name: name,
            code: code,
            type: type,
            sort: sort,
            children: _children?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'children';
        _children?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesRbacDtosMenuTreeDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
