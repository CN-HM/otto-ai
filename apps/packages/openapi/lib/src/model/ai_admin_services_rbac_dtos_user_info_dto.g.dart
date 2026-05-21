// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_rbac_dtos_user_info_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesRbacDtosUserInfoDto
    extends AiAdminServicesRbacDtosUserInfoDto {
  @override
  final int? id;
  @override
  final String? username;
  @override
  final int? superAdmin;
  @override
  final int? status;
  @override
  final BuiltList<String>? roles;
  @override
  final BuiltList<String>? permissions;

  factory _$AiAdminServicesRbacDtosUserInfoDto(
          [void Function(AiAdminServicesRbacDtosUserInfoDtoBuilder)?
              updates]) =>
      (AiAdminServicesRbacDtosUserInfoDtoBuilder()..update(updates))._build();

  _$AiAdminServicesRbacDtosUserInfoDto._(
      {this.id,
      this.username,
      this.superAdmin,
      this.status,
      this.roles,
      this.permissions})
      : super._();
  @override
  AiAdminServicesRbacDtosUserInfoDto rebuild(
          void Function(AiAdminServicesRbacDtosUserInfoDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesRbacDtosUserInfoDtoBuilder toBuilder() =>
      AiAdminServicesRbacDtosUserInfoDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesRbacDtosUserInfoDto &&
        id == other.id &&
        username == other.username &&
        superAdmin == other.superAdmin &&
        status == other.status &&
        roles == other.roles &&
        permissions == other.permissions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, superAdmin.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, roles.hashCode);
    _$hash = $jc(_$hash, permissions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AiAdminServicesRbacDtosUserInfoDto')
          ..add('id', id)
          ..add('username', username)
          ..add('superAdmin', superAdmin)
          ..add('status', status)
          ..add('roles', roles)
          ..add('permissions', permissions))
        .toString();
  }
}

class AiAdminServicesRbacDtosUserInfoDtoBuilder
    implements
        Builder<AiAdminServicesRbacDtosUserInfoDto,
            AiAdminServicesRbacDtosUserInfoDtoBuilder> {
  _$AiAdminServicesRbacDtosUserInfoDto? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  int? _superAdmin;
  int? get superAdmin => _$this._superAdmin;
  set superAdmin(int? superAdmin) => _$this._superAdmin = superAdmin;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  ListBuilder<String>? _roles;
  ListBuilder<String> get roles => _$this._roles ??= ListBuilder<String>();
  set roles(ListBuilder<String>? roles) => _$this._roles = roles;

  ListBuilder<String>? _permissions;
  ListBuilder<String> get permissions =>
      _$this._permissions ??= ListBuilder<String>();
  set permissions(ListBuilder<String>? permissions) =>
      _$this._permissions = permissions;

  AiAdminServicesRbacDtosUserInfoDtoBuilder() {
    AiAdminServicesRbacDtosUserInfoDto._defaults(this);
  }

  AiAdminServicesRbacDtosUserInfoDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _username = $v.username;
      _superAdmin = $v.superAdmin;
      _status = $v.status;
      _roles = $v.roles?.toBuilder();
      _permissions = $v.permissions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesRbacDtosUserInfoDto other) {
    _$v = other as _$AiAdminServicesRbacDtosUserInfoDto;
  }

  @override
  void update(
      void Function(AiAdminServicesRbacDtosUserInfoDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesRbacDtosUserInfoDto build() => _build();

  _$AiAdminServicesRbacDtosUserInfoDto _build() {
    _$AiAdminServicesRbacDtosUserInfoDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesRbacDtosUserInfoDto._(
            id: id,
            username: username,
            superAdmin: superAdmin,
            status: status,
            roles: _roles?.build(),
            permissions: _permissions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'roles';
        _roles?.build();
        _$failedField = 'permissions';
        _permissions?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesRbacDtosUserInfoDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
