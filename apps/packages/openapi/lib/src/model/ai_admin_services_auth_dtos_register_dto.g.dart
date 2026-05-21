// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_auth_dtos_register_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAuthDtosRegisterDto
    extends AiAdminServicesAuthDtosRegisterDto {
  @override
  final String? username;
  @override
  final String? password;
  @override
  final String? phone;
  @override
  final String? code;
  @override
  final String? turnstileToken;

  factory _$AiAdminServicesAuthDtosRegisterDto(
          [void Function(AiAdminServicesAuthDtosRegisterDtoBuilder)?
              updates]) =>
      (AiAdminServicesAuthDtosRegisterDtoBuilder()..update(updates))._build();

  _$AiAdminServicesAuthDtosRegisterDto._(
      {this.username,
      this.password,
      this.phone,
      this.code,
      this.turnstileToken})
      : super._();
  @override
  AiAdminServicesAuthDtosRegisterDto rebuild(
          void Function(AiAdminServicesAuthDtosRegisterDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAuthDtosRegisterDtoBuilder toBuilder() =>
      AiAdminServicesAuthDtosRegisterDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAuthDtosRegisterDto &&
        username == other.username &&
        password == other.password &&
        phone == other.phone &&
        code == other.code &&
        turnstileToken == other.turnstileToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, turnstileToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AiAdminServicesAuthDtosRegisterDto')
          ..add('username', username)
          ..add('password', password)
          ..add('phone', phone)
          ..add('code', code)
          ..add('turnstileToken', turnstileToken))
        .toString();
  }
}

class AiAdminServicesAuthDtosRegisterDtoBuilder
    implements
        Builder<AiAdminServicesAuthDtosRegisterDto,
            AiAdminServicesAuthDtosRegisterDtoBuilder> {
  _$AiAdminServicesAuthDtosRegisterDto? _$v;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _turnstileToken;
  String? get turnstileToken => _$this._turnstileToken;
  set turnstileToken(String? turnstileToken) =>
      _$this._turnstileToken = turnstileToken;

  AiAdminServicesAuthDtosRegisterDtoBuilder() {
    AiAdminServicesAuthDtosRegisterDto._defaults(this);
  }

  AiAdminServicesAuthDtosRegisterDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _username = $v.username;
      _password = $v.password;
      _phone = $v.phone;
      _code = $v.code;
      _turnstileToken = $v.turnstileToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAuthDtosRegisterDto other) {
    _$v = other as _$AiAdminServicesAuthDtosRegisterDto;
  }

  @override
  void update(
      void Function(AiAdminServicesAuthDtosRegisterDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAuthDtosRegisterDto build() => _build();

  _$AiAdminServicesAuthDtosRegisterDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesAuthDtosRegisterDto._(
          username: username,
          password: password,
          phone: phone,
          code: code,
          turnstileToken: turnstileToken,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
