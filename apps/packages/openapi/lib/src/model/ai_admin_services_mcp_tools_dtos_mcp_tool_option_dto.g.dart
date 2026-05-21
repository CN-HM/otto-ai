// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_mcp_tools_dtos_mcp_tool_option_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesMcpToolsDtosMcpToolOptionDto
    extends AiAdminServicesMcpToolsDtosMcpToolOptionDto {
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

  factory _$AiAdminServicesMcpToolsDtosMcpToolOptionDto(
          [void Function(AiAdminServicesMcpToolsDtosMcpToolOptionDtoBuilder)?
              updates]) =>
      (AiAdminServicesMcpToolsDtosMcpToolOptionDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesMcpToolsDtosMcpToolOptionDto._(
      {this.id,
      this.code,
      this.name,
      this.description,
      this.category,
      this.isSystem})
      : super._();
  @override
  AiAdminServicesMcpToolsDtosMcpToolOptionDto rebuild(
          void Function(AiAdminServicesMcpToolsDtosMcpToolOptionDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesMcpToolsDtosMcpToolOptionDtoBuilder toBuilder() =>
      AiAdminServicesMcpToolsDtosMcpToolOptionDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesMcpToolsDtosMcpToolOptionDto &&
        id == other.id &&
        code == other.code &&
        name == other.name &&
        description == other.description &&
        category == other.category &&
        isSystem == other.isSystem;
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
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesMcpToolsDtosMcpToolOptionDto')
          ..add('id', id)
          ..add('code', code)
          ..add('name', name)
          ..add('description', description)
          ..add('category', category)
          ..add('isSystem', isSystem))
        .toString();
  }
}

class AiAdminServicesMcpToolsDtosMcpToolOptionDtoBuilder
    implements
        Builder<AiAdminServicesMcpToolsDtosMcpToolOptionDto,
            AiAdminServicesMcpToolsDtosMcpToolOptionDtoBuilder> {
  _$AiAdminServicesMcpToolsDtosMcpToolOptionDto? _$v;

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

  AiAdminServicesMcpToolsDtosMcpToolOptionDtoBuilder() {
    AiAdminServicesMcpToolsDtosMcpToolOptionDto._defaults(this);
  }

  AiAdminServicesMcpToolsDtosMcpToolOptionDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _code = $v.code;
      _name = $v.name;
      _description = $v.description;
      _category = $v.category;
      _isSystem = $v.isSystem;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesMcpToolsDtosMcpToolOptionDto other) {
    _$v = other as _$AiAdminServicesMcpToolsDtosMcpToolOptionDto;
  }

  @override
  void update(
      void Function(AiAdminServicesMcpToolsDtosMcpToolOptionDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesMcpToolsDtosMcpToolOptionDto build() => _build();

  _$AiAdminServicesMcpToolsDtosMcpToolOptionDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesMcpToolsDtosMcpToolOptionDto._(
          id: id,
          code: code,
          name: name,
          description: description,
          category: category,
          isSystem: isSystem,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
