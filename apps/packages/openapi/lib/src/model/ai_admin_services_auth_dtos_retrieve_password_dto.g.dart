// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_auth_dtos_retrieve_password_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAuthDtosRetrievePasswordDto
    extends AiAdminServicesAuthDtosRetrievePasswordDto {
  @override
  final String? phone;
  @override
  final String? code;
  @override
  final String? password;
  @override
  final String? captchaId;
  @override
  final String? turnstileToken;

  factory _$AiAdminServicesAuthDtosRetrievePasswordDto(
          [void Function(AiAdminServicesAuthDtosRetrievePasswordDtoBuilder)?
              updates]) =>
      (AiAdminServicesAuthDtosRetrievePasswordDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesAuthDtosRetrievePasswordDto._(
      {this.phone,
      this.code,
      this.password,
      this.captchaId,
      this.turnstileToken})
      : super._();
  @override
  AiAdminServicesAuthDtosRetrievePasswordDto rebuild(
          void Function(AiAdminServicesAuthDtosRetrievePasswordDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAuthDtosRetrievePasswordDtoBuilder toBuilder() =>
      AiAdminServicesAuthDtosRetrievePasswordDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAuthDtosRetrievePasswordDto &&
        phone == other.phone &&
        code == other.code &&
        password == other.password &&
        captchaId == other.captchaId &&
        turnstileToken == other.turnstileToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, captchaId.hashCode);
    _$hash = $jc(_$hash, turnstileToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesAuthDtosRetrievePasswordDto')
          ..add('phone', phone)
          ..add('code', code)
          ..add('password', password)
          ..add('captchaId', captchaId)
          ..add('turnstileToken', turnstileToken))
        .toString();
  }
}

class AiAdminServicesAuthDtosRetrievePasswordDtoBuilder
    implements
        Builder<AiAdminServicesAuthDtosRetrievePasswordDto,
            AiAdminServicesAuthDtosRetrievePasswordDtoBuilder> {
  _$AiAdminServicesAuthDtosRetrievePasswordDto? _$v;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  String? _captchaId;
  String? get captchaId => _$this._captchaId;
  set captchaId(String? captchaId) => _$this._captchaId = captchaId;

  String? _turnstileToken;
  String? get turnstileToken => _$this._turnstileToken;
  set turnstileToken(String? turnstileToken) =>
      _$this._turnstileToken = turnstileToken;

  AiAdminServicesAuthDtosRetrievePasswordDtoBuilder() {
    AiAdminServicesAuthDtosRetrievePasswordDto._defaults(this);
  }

  AiAdminServicesAuthDtosRetrievePasswordDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phone = $v.phone;
      _code = $v.code;
      _password = $v.password;
      _captchaId = $v.captchaId;
      _turnstileToken = $v.turnstileToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAuthDtosRetrievePasswordDto other) {
    _$v = other as _$AiAdminServicesAuthDtosRetrievePasswordDto;
  }

  @override
  void update(
      void Function(AiAdminServicesAuthDtosRetrievePasswordDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAuthDtosRetrievePasswordDto build() => _build();

  _$AiAdminServicesAuthDtosRetrievePasswordDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesAuthDtosRetrievePasswordDto._(
          phone: phone,
          code: code,
          password: password,
          captchaId: captchaId,
          turnstileToken: turnstileToken,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
