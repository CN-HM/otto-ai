// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_auth_dtos_menu_item_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAuthDtosMenuItemDto
    extends AiAdminServicesAuthDtosMenuItemDto {
  @override
  final String? name;
  @override
  final String? path;
  @override
  final String? icon;
  @override
  final BuiltList<AiAdminServicesAuthDtosMenuItemDto>? children;

  factory _$AiAdminServicesAuthDtosMenuItemDto(
          [void Function(AiAdminServicesAuthDtosMenuItemDtoBuilder)?
              updates]) =>
      (AiAdminServicesAuthDtosMenuItemDtoBuilder()..update(updates))._build();

  _$AiAdminServicesAuthDtosMenuItemDto._(
      {this.name, this.path, this.icon, this.children})
      : super._();
  @override
  AiAdminServicesAuthDtosMenuItemDto rebuild(
          void Function(AiAdminServicesAuthDtosMenuItemDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAuthDtosMenuItemDtoBuilder toBuilder() =>
      AiAdminServicesAuthDtosMenuItemDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAuthDtosMenuItemDto &&
        name == other.name &&
        path == other.path &&
        icon == other.icon &&
        children == other.children;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, path.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, children.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AiAdminServicesAuthDtosMenuItemDto')
          ..add('name', name)
          ..add('path', path)
          ..add('icon', icon)
          ..add('children', children))
        .toString();
  }
}

class AiAdminServicesAuthDtosMenuItemDtoBuilder
    implements
        Builder<AiAdminServicesAuthDtosMenuItemDto,
            AiAdminServicesAuthDtosMenuItemDtoBuilder> {
  _$AiAdminServicesAuthDtosMenuItemDto? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _path;
  String? get path => _$this._path;
  set path(String? path) => _$this._path = path;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  ListBuilder<AiAdminServicesAuthDtosMenuItemDto>? _children;
  ListBuilder<AiAdminServicesAuthDtosMenuItemDto> get children =>
      _$this._children ??= ListBuilder<AiAdminServicesAuthDtosMenuItemDto>();
  set children(ListBuilder<AiAdminServicesAuthDtosMenuItemDto>? children) =>
      _$this._children = children;

  AiAdminServicesAuthDtosMenuItemDtoBuilder() {
    AiAdminServicesAuthDtosMenuItemDto._defaults(this);
  }

  AiAdminServicesAuthDtosMenuItemDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _path = $v.path;
      _icon = $v.icon;
      _children = $v.children?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAuthDtosMenuItemDto other) {
    _$v = other as _$AiAdminServicesAuthDtosMenuItemDto;
  }

  @override
  void update(
      void Function(AiAdminServicesAuthDtosMenuItemDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAuthDtosMenuItemDto build() => _build();

  _$AiAdminServicesAuthDtosMenuItemDto _build() {
    _$AiAdminServicesAuthDtosMenuItemDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesAuthDtosMenuItemDto._(
            name: name,
            path: path,
            icon: icon,
            children: _children?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'children';
        _children?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesAuthDtosMenuItemDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
