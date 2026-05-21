// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_rbac_dtos_user_role_assign_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesRbacDtosUserRoleAssignDto
    extends AiAdminServicesRbacDtosUserRoleAssignDto {
  @override
  final BuiltList<int>? roleIds;

  factory _$AiAdminServicesRbacDtosUserRoleAssignDto(
          [void Function(AiAdminServicesRbacDtosUserRoleAssignDtoBuilder)?
              updates]) =>
      (AiAdminServicesRbacDtosUserRoleAssignDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesRbacDtosUserRoleAssignDto._({this.roleIds}) : super._();
  @override
  AiAdminServicesRbacDtosUserRoleAssignDto rebuild(
          void Function(AiAdminServicesRbacDtosUserRoleAssignDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesRbacDtosUserRoleAssignDtoBuilder toBuilder() =>
      AiAdminServicesRbacDtosUserRoleAssignDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesRbacDtosUserRoleAssignDto &&
        roleIds == other.roleIds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, roleIds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesRbacDtosUserRoleAssignDto')
          ..add('roleIds', roleIds))
        .toString();
  }
}

class AiAdminServicesRbacDtosUserRoleAssignDtoBuilder
    implements
        Builder<AiAdminServicesRbacDtosUserRoleAssignDto,
            AiAdminServicesRbacDtosUserRoleAssignDtoBuilder> {
  _$AiAdminServicesRbacDtosUserRoleAssignDto? _$v;

  ListBuilder<int>? _roleIds;
  ListBuilder<int> get roleIds => _$this._roleIds ??= ListBuilder<int>();
  set roleIds(ListBuilder<int>? roleIds) => _$this._roleIds = roleIds;

  AiAdminServicesRbacDtosUserRoleAssignDtoBuilder() {
    AiAdminServicesRbacDtosUserRoleAssignDto._defaults(this);
  }

  AiAdminServicesRbacDtosUserRoleAssignDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _roleIds = $v.roleIds?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesRbacDtosUserRoleAssignDto other) {
    _$v = other as _$AiAdminServicesRbacDtosUserRoleAssignDto;
  }

  @override
  void update(
      void Function(AiAdminServicesRbacDtosUserRoleAssignDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesRbacDtosUserRoleAssignDto build() => _build();

  _$AiAdminServicesRbacDtosUserRoleAssignDto _build() {
    _$AiAdminServicesRbacDtosUserRoleAssignDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesRbacDtosUserRoleAssignDto._(
            roleIds: _roleIds?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'roleIds';
        _roleIds?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesRbacDtosUserRoleAssignDto',
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
