// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_auth_dtos_token_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAuthDtosTokenDto
    extends AiAdminServicesAuthDtosTokenDto {
  @override
  final String? token;
  @override
  final int? expire;
  @override
  final String? clientHash;

  factory _$AiAdminServicesAuthDtosTokenDto(
          [void Function(AiAdminServicesAuthDtosTokenDtoBuilder)? updates]) =>
      (AiAdminServicesAuthDtosTokenDtoBuilder()..update(updates))._build();

  _$AiAdminServicesAuthDtosTokenDto._(
      {this.token, this.expire, this.clientHash})
      : super._();
  @override
  AiAdminServicesAuthDtosTokenDto rebuild(
          void Function(AiAdminServicesAuthDtosTokenDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAuthDtosTokenDtoBuilder toBuilder() =>
      AiAdminServicesAuthDtosTokenDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAuthDtosTokenDto &&
        token == other.token &&
        expire == other.expire &&
        clientHash == other.clientHash;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, expire.hashCode);
    _$hash = $jc(_$hash, clientHash.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AiAdminServicesAuthDtosTokenDto')
          ..add('token', token)
          ..add('expire', expire)
          ..add('clientHash', clientHash))
        .toString();
  }
}

class AiAdminServicesAuthDtosTokenDtoBuilder
    implements
        Builder<AiAdminServicesAuthDtosTokenDto,
            AiAdminServicesAuthDtosTokenDtoBuilder> {
  _$AiAdminServicesAuthDtosTokenDto? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  int? _expire;
  int? get expire => _$this._expire;
  set expire(int? expire) => _$this._expire = expire;

  String? _clientHash;
  String? get clientHash => _$this._clientHash;
  set clientHash(String? clientHash) => _$this._clientHash = clientHash;

  AiAdminServicesAuthDtosTokenDtoBuilder() {
    AiAdminServicesAuthDtosTokenDto._defaults(this);
  }

  AiAdminServicesAuthDtosTokenDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _expire = $v.expire;
      _clientHash = $v.clientHash;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAuthDtosTokenDto other) {
    _$v = other as _$AiAdminServicesAuthDtosTokenDto;
  }

  @override
  void update(void Function(AiAdminServicesAuthDtosTokenDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAuthDtosTokenDto build() => _build();

  _$AiAdminServicesAuthDtosTokenDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesAuthDtosTokenDto._(
          token: token,
          expire: expire,
          clientHash: clientHash,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
