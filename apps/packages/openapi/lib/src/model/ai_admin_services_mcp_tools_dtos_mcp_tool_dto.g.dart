// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_mcp_tools_dtos_mcp_tool_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesMcpToolsDtosMcpToolDto
    extends AiAdminServicesMcpToolsDtosMcpToolDto {
  @override
  final String? id;
  @override
  final String? code;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? category;
  @override
  final bool? isSystem;
  @override
  final String? paramSchema;
  @override
  final String? status;
  @override
  final int? sort;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  factory _$AiAdminServicesMcpToolsDtosMcpToolDto(
          [void Function(AiAdminServicesMcpToolsDtosMcpToolDtoBuilder)?
              updates]) =>
      (AiAdminServicesMcpToolsDtosMcpToolDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesMcpToolsDtosMcpToolDto._(
      {this.id,
      this.code,
      this.name,
      this.description,
      this.category,
      this.isSystem,
      this.paramSchema,
      this.status,
      this.sort,
      this.createdAt,
      this.updatedAt})
      : super._();
  @override
  AiAdminServicesMcpToolsDtosMcpToolDto rebuild(
          void Function(AiAdminServicesMcpToolsDtosMcpToolDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesMcpToolsDtosMcpToolDtoBuilder toBuilder() =>
      AiAdminServicesMcpToolsDtosMcpToolDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesMcpToolsDtosMcpToolDto &&
        id == other.id &&
        code == other.code &&
        name == other.name &&
        description == other.description &&
        category == other.category &&
        isSystem == other.isSystem &&
        paramSchema == other.paramSchema &&
        status == other.status &&
        sort == other.sort &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, isSystem.hashCode);
    _$hash = $jc(_$hash, paramSchema.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, sort.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesMcpToolsDtosMcpToolDto')
          ..add('id', id)
          ..add('code', code)
          ..add('name', name)
          ..add('description', description)
          ..add('category', category)
          ..add('isSystem', isSystem)
          ..add('paramSchema', paramSchema)
          ..add('status', status)
          ..add('sort', sort)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class AiAdminServicesMcpToolsDtosMcpToolDtoBuilder
    implements
        Builder<AiAdminServicesMcpToolsDtosMcpToolDto,
            AiAdminServicesMcpToolsDtosMcpToolDtoBuilder> {
  _$AiAdminServicesMcpToolsDtosMcpToolDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  bool? _isSystem;
  bool? get isSystem => _$this._isSystem;
  set isSystem(bool? isSystem) => _$this._isSystem = isSystem;

  String? _paramSchema;
  String? get paramSchema => _$this._paramSchema;
  set paramSchema(String? paramSchema) => _$this._paramSchema = paramSchema;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  int? _sort;
  int? get sort => _$this._sort;
  set sort(int? sort) => _$this._sort = sort;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  AiAdminServicesMcpToolsDtosMcpToolDtoBuilder() {
    AiAdminServicesMcpToolsDtosMcpToolDto._defaults(this);
  }

  AiAdminServicesMcpToolsDtosMcpToolDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _code = $v.code;
      _name = $v.name;
      _description = $v.description;
      _category = $v.category;
      _isSystem = $v.isSystem;
      _paramSchema = $v.paramSchema;
      _status = $v.status;
      _sort = $v.sort;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesMcpToolsDtosMcpToolDto other) {
    _$v = other as _$AiAdminServicesMcpToolsDtosMcpToolDto;
  }

  @override
  void update(
      void Function(AiAdminServicesMcpToolsDtosMcpToolDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesMcpToolsDtosMcpToolDto build() => _build();

  _$AiAdminServicesMcpToolsDtosMcpToolDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesMcpToolsDtosMcpToolDto._(
          id: id,
          code: code,
          name: name,
          description: description,
          category: category,
          isSystem: isSystem,
          paramSchema: paramSchema,
          status: status,
          sort: sort,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
