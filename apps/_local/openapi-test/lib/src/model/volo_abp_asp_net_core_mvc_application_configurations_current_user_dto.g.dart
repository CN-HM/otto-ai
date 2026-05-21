// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_asp_net_core_mvc_application_configurations_current_user_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto
    extends VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto {
  @override
  final bool? isAuthenticated;
  @override
  final String? id;
  @override
  final String? tenantId;
  @override
  final String? impersonatorUserId;
  @override
  final String? impersonatorTenantId;
  @override
  final String? impersonatorUserName;
  @override
  final String? impersonatorTenantName;
  @override
  final String? userName;
  @override
  final String? name;
  @override
  final String? surName;
  @override
  final String? email;
  @override
  final bool? emailVerified;
  @override
  final String? phoneNumber;
  @override
  final bool? phoneNumberVerified;
  @override
  final BuiltList<String>? roles;
  @override
  final String? sessionId;

  factory _$VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto(
          [void Function(
                  VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDtoBuilder)?
              updates]) =>
      (VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDtoBuilder()
            ..update(updates))
          ._build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto._(
      {this.isAuthenticated,
      this.id,
      this.tenantId,
      this.impersonatorUserId,
      this.impersonatorTenantId,
      this.impersonatorUserName,
      this.impersonatorTenantName,
      this.userName,
      this.name,
      this.surName,
      this.email,
      this.emailVerified,
      this.phoneNumber,
      this.phoneNumberVerified,
      this.roles,
      this.sessionId})
      : super._();
  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto rebuild(
          void Function(
                  VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDtoBuilder
      toBuilder() =>
          VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto &&
        isAuthenticated == other.isAuthenticated &&
        id == other.id &&
        tenantId == other.tenantId &&
        impersonatorUserId == other.impersonatorUserId &&
        impersonatorTenantId == other.impersonatorTenantId &&
        impersonatorUserName == other.impersonatorUserName &&
        impersonatorTenantName == other.impersonatorTenantName &&
        userName == other.userName &&
        name == other.name &&
        surName == other.surName &&
        email == other.email &&
        emailVerified == other.emailVerified &&
        phoneNumber == other.phoneNumber &&
        phoneNumberVerified == other.phoneNumberVerified &&
        roles == other.roles &&
        sessionId == other.sessionId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isAuthenticated.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, tenantId.hashCode);
    _$hash = $jc(_$hash, impersonatorUserId.hashCode);
    _$hash = $jc(_$hash, impersonatorTenantId.hashCode);
    _$hash = $jc(_$hash, impersonatorUserName.hashCode);
    _$hash = $jc(_$hash, impersonatorTenantName.hashCode);
    _$hash = $jc(_$hash, userName.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, surName.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, emailVerified.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, phoneNumberVerified.hashCode);
    _$hash = $jc(_$hash, roles.hashCode);
    _$hash = $jc(_$hash, sessionId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto')
          ..add('isAuthenticated', isAuthenticated)
          ..add('id', id)
          ..add('tenantId', tenantId)
          ..add('impersonatorUserId', impersonatorUserId)
          ..add('impersonatorTenantId', impersonatorTenantId)
          ..add('impersonatorUserName', impersonatorUserName)
          ..add('impersonatorTenantName', impersonatorTenantName)
          ..add('userName', userName)
          ..add('name', name)
          ..add('surName', surName)
          ..add('email', email)
          ..add('emailVerified', emailVerified)
          ..add('phoneNumber', phoneNumber)
          ..add('phoneNumberVerified', phoneNumberVerified)
          ..add('roles', roles)
          ..add('sessionId', sessionId))
        .toString();
  }
}

class VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDtoBuilder
    implements
        Builder<VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto,
            VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDtoBuilder> {
  _$VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto? _$v;

  bool? _isAuthenticated;
  bool? get isAuthenticated => _$this._isAuthenticated;
  set isAuthenticated(bool? isAuthenticated) =>
      _$this._isAuthenticated = isAuthenticated;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _tenantId;
  String? get tenantId => _$this._tenantId;
  set tenantId(String? tenantId) => _$this._tenantId = tenantId;

  String? _impersonatorUserId;
  String? get impersonatorUserId => _$this._impersonatorUserId;
  set impersonatorUserId(String? impersonatorUserId) =>
      _$this._impersonatorUserId = impersonatorUserId;

  String? _impersonatorTenantId;
  String? get impersonatorTenantId => _$this._impersonatorTenantId;
  set impersonatorTenantId(String? impersonatorTenantId) =>
      _$this._impersonatorTenantId = impersonatorTenantId;

  String? _impersonatorUserName;
  String? get impersonatorUserName => _$this._impersonatorUserName;
  set impersonatorUserName(String? impersonatorUserName) =>
      _$this._impersonatorUserName = impersonatorUserName;

  String? _impersonatorTenantName;
  String? get impersonatorTenantName => _$this._impersonatorTenantName;
  set impersonatorTenantName(String? impersonatorTenantName) =>
      _$this._impersonatorTenantName = impersonatorTenantName;

  String? _userName;
  String? get userName => _$this._userName;
  set userName(String? userName) => _$this._userName = userName;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _surName;
  String? get surName => _$this._surName;
  set surName(String? surName) => _$this._surName = surName;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  bool? _emailVerified;
  bool? get emailVerified => _$this._emailVerified;
  set emailVerified(bool? emailVerified) =>
      _$this._emailVerified = emailVerified;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  bool? _phoneNumberVerified;
  bool? get phoneNumberVerified => _$this._phoneNumberVerified;
  set phoneNumberVerified(bool? phoneNumberVerified) =>
      _$this._phoneNumberVerified = phoneNumberVerified;

  ListBuilder<String>? _roles;
  ListBuilder<String> get roles => _$this._roles ??= ListBuilder<String>();
  set roles(ListBuilder<String>? roles) => _$this._roles = roles;

  String? _sessionId;
  String? get sessionId => _$this._sessionId;
  set sessionId(String? sessionId) => _$this._sessionId = sessionId;

  VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDtoBuilder() {
    VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto._defaults(this);
  }

  VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDtoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _isAuthenticated = $v.isAuthenticated;
      _id = $v.id;
      _tenantId = $v.tenantId;
      _impersonatorUserId = $v.impersonatorUserId;
      _impersonatorTenantId = $v.impersonatorTenantId;
      _impersonatorUserName = $v.impersonatorUserName;
      _impersonatorTenantName = $v.impersonatorTenantName;
      _userName = $v.userName;
      _name = $v.name;
      _surName = $v.surName;
      _email = $v.email;
      _emailVerified = $v.emailVerified;
      _phoneNumber = $v.phoneNumber;
      _phoneNumberVerified = $v.phoneNumberVerified;
      _roles = $v.roles?.toBuilder();
      _sessionId = $v.sessionId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto other) {
    _$v =
        other as _$VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto;
  }

  @override
  void update(
      void Function(
              VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto build() =>
      _build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto _build() {
    _$VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto _$result;
    try {
      _$result = _$v ??
          _$VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto._(
            isAuthenticated: isAuthenticated,
            id: id,
            tenantId: tenantId,
            impersonatorUserId: impersonatorUserId,
            impersonatorTenantId: impersonatorTenantId,
            impersonatorUserName: impersonatorUserName,
            impersonatorTenantName: impersonatorTenantName,
            userName: userName,
            name: name,
            surName: surName,
            email: email,
            emailVerified: emailVerified,
            phoneNumber: phoneNumber,
            phoneNumberVerified: phoneNumberVerified,
            roles: _roles?.build(),
            sessionId: sessionId,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'roles';
        _roles?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto',
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
