// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_auth_dtos_password_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAuthDtosPasswordDto
    extends AiAdminServicesAuthDtosPasswordDto {
  @override
  final String? password;
  @override
  final String? newPassword;

  factory _$AiAdminServicesAuthDtosPasswordDto(
          [void Function(AiAdminServicesAuthDtosPasswordDtoBuilder)?
              updates]) =>
      (AiAdminServicesAuthDtosPasswordDtoBuilder()..update(updates))._build();

  _$AiAdminServicesAuthDtosPasswordDto._({this.password, this.newPassword})
      : super._();
  @override
  AiAdminServicesAuthDtosPasswordDto rebuild(
          void Function(AiAdminServicesAuthDtosPasswordDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAuthDtosPasswordDtoBuilder toBuilder() =>
      AiAdminServicesAuthDtosPasswordDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAuthDtosPasswordDto &&
        password == other.password &&
        newPassword == other.newPassword;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, newPassword.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AiAdminServicesAuthDtosPasswordDto')
          ..add('password', password)
          ..add('newPassword', newPassword))
        .toString();
  }
}

class AiAdminServicesAuthDtosPasswordDtoBuilder
    implements
        Builder<AiAdminServicesAuthDtosPasswordDto,
            AiAdminServicesAuthDtosPasswordDtoBuilder> {
  _$AiAdminServicesAuthDtosPasswordDto? _$v;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  String? _newPassword;
  String? get newPassword => _$this._newPassword;
  set newPassword(String? newPassword) => _$this._newPassword = newPassword;

  AiAdminServicesAuthDtosPasswordDtoBuilder() {
    AiAdminServicesAuthDtosPasswordDto._defaults(this);
  }

  AiAdminServicesAuthDtosPasswordDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _password = $v.password;
      _newPassword = $v.newPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAuthDtosPasswordDto other) {
    _$v = other as _$AiAdminServicesAuthDtosPasswordDto;
  }

  @override
  void update(
      void Function(AiAdminServicesAuthDtosPasswordDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAuthDtosPasswordDto build() => _build();

  _$AiAdminServicesAuthDtosPasswordDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesAuthDtosPasswordDto._(
          password: password,
          newPassword: newPassword,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
