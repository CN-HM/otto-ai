// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_rbac_dtos_role_menu_assign_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesRbacDtosRoleMenuAssignDto
    extends AiAdminServicesRbacDtosRoleMenuAssignDto {
  @override
  final BuiltList<int>? menuIds;

  factory _$AiAdminServicesRbacDtosRoleMenuAssignDto(
          [void Function(AiAdminServicesRbacDtosRoleMenuAssignDtoBuilder)?
              updates]) =>
      (AiAdminServicesRbacDtosRoleMenuAssignDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesRbacDtosRoleMenuAssignDto._({this.menuIds}) : super._();
  @override
  AiAdminServicesRbacDtosRoleMenuAssignDto rebuild(
          void Function(AiAdminServicesRbacDtosRoleMenuAssignDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesRbacDtosRoleMenuAssignDtoBuilder toBuilder() =>
      AiAdminServicesRbacDtosRoleMenuAssignDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesRbacDtosRoleMenuAssignDto &&
        menuIds == other.menuIds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, menuIds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesRbacDtosRoleMenuAssignDto')
          ..add('menuIds', menuIds))
        .toString();
  }
}

class AiAdminServicesRbacDtosRoleMenuAssignDtoBuilder
    implements
        Builder<AiAdminServicesRbacDtosRoleMenuAssignDto,
            AiAdminServicesRbacDtosRoleMenuAssignDtoBuilder> {
  _$AiAdminServicesRbacDtosRoleMenuAssignDto? _$v;

  ListBuilder<int>? _menuIds;
  ListBuilder<int> get menuIds => _$this._menuIds ??= ListBuilder<int>();
  set menuIds(ListBuilder<int>? menuIds) => _$this._menuIds = menuIds;

  AiAdminServicesRbacDtosRoleMenuAssignDtoBuilder() {
    AiAdminServicesRbacDtosRoleMenuAssignDto._defaults(this);
  }

  AiAdminServicesRbacDtosRoleMenuAssignDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _menuIds = $v.menuIds?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesRbacDtosRoleMenuAssignDto other) {
    _$v = other as _$AiAdminServicesRbacDtosRoleMenuAssignDto;
  }

  @override
  void update(
      void Function(AiAdminServicesRbacDtosRoleMenuAssignDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesRbacDtosRoleMenuAssignDto build() => _build();

  _$AiAdminServicesRbacDtosRoleMenuAssignDto _build() {
    _$AiAdminServicesRbacDtosRoleMenuAssignDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesRbacDtosRoleMenuAssignDto._(
            menuIds: _menuIds?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'menuIds';
        _menuIds?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesRbacDtosRoleMenuAssignDto',
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
