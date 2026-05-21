// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_mcp_tools_dtos_mcp_tool_upsert_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesMcpToolsDtosMcpToolUpsertDto
    extends AiAdminServicesMcpToolsDtosMcpToolUpsertDto {
  @override
  final String code;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? category;
  @override
  final String? paramSchema;
  @override
  final String status;
  @override
  final int? sort;

  factory _$AiAdminServicesMcpToolsDtosMcpToolUpsertDto(
          [void Function(AiAdminServicesMcpToolsDtosMcpToolUpsertDtoBuilder)?
              updates]) =>
      (AiAdminServicesMcpToolsDtosMcpToolUpsertDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesMcpToolsDtosMcpToolUpsertDto._(
      {required this.code,
      required this.name,
      this.description,
      this.category,
      this.paramSchema,
      required this.status,
      this.sort})
      : super._();
  @override
  AiAdminServicesMcpToolsDtosMcpToolUpsertDto rebuild(
          void Function(AiAdminServicesMcpToolsDtosMcpToolUpsertDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesMcpToolsDtosMcpToolUpsertDtoBuilder toBuilder() =>
      AiAdminServicesMcpToolsDtosMcpToolUpsertDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesMcpToolsDtosMcpToolUpsertDto &&
        code == other.code &&
        name == other.name &&
        description == other.description &&
        category == other.category &&
        paramSchema == other.paramSchema &&
        status == other.status &&
        sort == other.sort;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, paramSchema.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, sort.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesMcpToolsDtosMcpToolUpsertDto')
          ..add('code', code)
          ..add('name', name)
          ..add('description', description)
          ..add('category', category)
          ..add('paramSchema', paramSchema)
          ..add('status', status)
          ..add('sort', sort))
        .toString();
  }
}

class AiAdminServicesMcpToolsDtosMcpToolUpsertDtoBuilder
    implements
        Builder<AiAdminServicesMcpToolsDtosMcpToolUpsertDto,
            AiAdminServicesMcpToolsDtosMcpToolUpsertDtoBuilder> {
  _$AiAdminServicesMcpToolsDtosMcpToolUpsertDto? _$v;

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

  String? _paramSchema;
  String? get paramSchema => _$this._paramSchema;
  set paramSchema(String? paramSchema) => _$this._paramSchema = paramSchema;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  int? _sort;
  int? get sort => _$this._sort;
  set sort(int? sort) => _$this._sort = sort;

  AiAdminServicesMcpToolsDtosMcpToolUpsertDtoBuilder() {
    AiAdminServicesMcpToolsDtosMcpToolUpsertDto._defaults(this);
  }

  AiAdminServicesMcpToolsDtosMcpToolUpsertDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _name = $v.name;
      _description = $v.description;
      _category = $v.category;
      _paramSchema = $v.paramSchema;
      _status = $v.status;
      _sort = $v.sort;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesMcpToolsDtosMcpToolUpsertDto other) {
    _$v = other as _$AiAdminServicesMcpToolsDtosMcpToolUpsertDto;
  }

  @override
  void update(
      void Function(AiAdminServicesMcpToolsDtosMcpToolUpsertDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesMcpToolsDtosMcpToolUpsertDto build() => _build();

  _$AiAdminServicesMcpToolsDtosMcpToolUpsertDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesMcpToolsDtosMcpToolUpsertDto._(
          code: BuiltValueNullFieldError.checkNotNull(
              code, r'AiAdminServicesMcpToolsDtosMcpToolUpsertDto', 'code'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'AiAdminServicesMcpToolsDtosMcpToolUpsertDto', 'name'),
          description: description,
          category: category,
          paramSchema: paramSchema,
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'AiAdminServicesMcpToolsDtosMcpToolUpsertDto', 'status'),
          sort: sort,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
