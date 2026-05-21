// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_auth_dtos_sms_verification_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAuthDtosSmsVerificationDto
    extends AiAdminServicesAuthDtosSmsVerificationDto {
  @override
  final String? phone;
  @override
  final String? captcha;
  @override
  final String? captchaId;

  factory _$AiAdminServicesAuthDtosSmsVerificationDto(
          [void Function(AiAdminServicesAuthDtosSmsVerificationDtoBuilder)?
              updates]) =>
      (AiAdminServicesAuthDtosSmsVerificationDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesAuthDtosSmsVerificationDto._(
      {this.phone, this.captcha, this.captchaId})
      : super._();
  @override
  AiAdminServicesAuthDtosSmsVerificationDto rebuild(
          void Function(AiAdminServicesAuthDtosSmsVerificationDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAuthDtosSmsVerificationDtoBuilder toBuilder() =>
      AiAdminServicesAuthDtosSmsVerificationDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAuthDtosSmsVerificationDto &&
        phone == other.phone &&
        captcha == other.captcha &&
        captchaId == other.captchaId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, captcha.hashCode);
    _$hash = $jc(_$hash, captchaId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesAuthDtosSmsVerificationDto')
          ..add('phone', phone)
          ..add('captcha', captcha)
          ..add('captchaId', captchaId))
        .toString();
  }
}

class AiAdminServicesAuthDtosSmsVerificationDtoBuilder
    implements
        Builder<AiAdminServicesAuthDtosSmsVerificationDto,
            AiAdminServicesAuthDtosSmsVerificationDtoBuilder> {
  _$AiAdminServicesAuthDtosSmsVerificationDto? _$v;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _captcha;
  String? get captcha => _$this._captcha;
  set captcha(String? captcha) => _$this._captcha = captcha;

  String? _captchaId;
  String? get captchaId => _$this._captchaId;
  set captchaId(String? captchaId) => _$this._captchaId = captchaId;

  AiAdminServicesAuthDtosSmsVerificationDtoBuilder() {
    AiAdminServicesAuthDtosSmsVerificationDto._defaults(this);
  }

  AiAdminServicesAuthDtosSmsVerificationDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phone = $v.phone;
      _captcha = $v.captcha;
      _captchaId = $v.captchaId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAuthDtosSmsVerificationDto other) {
    _$v = other as _$AiAdminServicesAuthDtosSmsVerificationDto;
  }

  @override
  void update(
      void Function(AiAdminServicesAuthDtosSmsVerificationDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAuthDtosSmsVerificationDto build() => _build();

  _$AiAdminServicesAuthDtosSmsVerificationDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesAuthDtosSmsVerificationDto._(
          phone: phone,
          captcha: captcha,
          captchaId: captchaId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
