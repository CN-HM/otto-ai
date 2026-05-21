// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_auth_dtos_login_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAuthDtosLoginDto
    extends AiAdminServicesAuthDtosLoginDto {
  @override
  final String? username;
  @override
  final String? password;
  @override
  final String? mobileCaptcha;
  @override
  final String? captchaId;
  @override
  final String? turnstileToken;

  factory _$AiAdminServicesAuthDtosLoginDto(
          [void Function(AiAdminServicesAuthDtosLoginDtoBuilder)? updates]) =>
      (AiAdminServicesAuthDtosLoginDtoBuilder()..update(updates))._build();

  _$AiAdminServicesAuthDtosLoginDto._(
      {this.username,
      this.password,
      this.mobileCaptcha,
      this.captchaId,
      this.turnstileToken})
      : super._();
  @override
  AiAdminServicesAuthDtosLoginDto rebuild(
          void Function(AiAdminServicesAuthDtosLoginDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAuthDtosLoginDtoBuilder toBuilder() =>
      AiAdminServicesAuthDtosLoginDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAuthDtosLoginDto &&
        username == other.username &&
        password == other.password &&
        mobileCaptcha == other.mobileCaptcha &&
        captchaId == other.captchaId &&
        turnstileToken == other.turnstileToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, mobileCaptcha.hashCode);
    _$hash = $jc(_$hash, captchaId.hashCode);
    _$hash = $jc(_$hash, turnstileToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AiAdminServicesAuthDtosLoginDto')
          ..add('username', username)
          ..add('password', password)
          ..add('mobileCaptcha', mobileCaptcha)
          ..add('captchaId', captchaId)
          ..add('turnstileToken', turnstileToken))
        .toString();
  }
}

class AiAdminServicesAuthDtosLoginDtoBuilder
    implements
        Builder<AiAdminServicesAuthDtosLoginDto,
            AiAdminServicesAuthDtosLoginDtoBuilder> {
  _$AiAdminServicesAuthDtosLoginDto? _$v;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  String? _mobileCaptcha;
  String? get mobileCaptcha => _$this._mobileCaptcha;
  set mobileCaptcha(String? mobileCaptcha) =>
      _$this._mobileCaptcha = mobileCaptcha;

  String? _captchaId;
  String? get captchaId => _$this._captchaId;
  set captchaId(String? captchaId) => _$this._captchaId = captchaId;

  String? _turnstileToken;
  String? get turnstileToken => _$this._turnstileToken;
  set turnstileToken(String? turnstileToken) =>
      _$this._turnstileToken = turnstileToken;

  AiAdminServicesAuthDtosLoginDtoBuilder() {
    AiAdminServicesAuthDtosLoginDto._defaults(this);
  }

  AiAdminServicesAuthDtosLoginDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _username = $v.username;
      _password = $v.password;
      _mobileCaptcha = $v.mobileCaptcha;
      _captchaId = $v.captchaId;
      _turnstileToken = $v.turnstileToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAuthDtosLoginDto other) {
    _$v = other as _$AiAdminServicesAuthDtosLoginDto;
  }

  @override
  void update(void Function(AiAdminServicesAuthDtosLoginDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAuthDtosLoginDto build() => _build();

  _$AiAdminServicesAuthDtosLoginDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesAuthDtosLoginDto._(
          username: username,
          password: password,
          mobileCaptcha: mobileCaptcha,
          captchaId: captchaId,
          turnstileToken: turnstileToken,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
