// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_auth_dtos_pub_config_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAuthDtosPubConfigDto
    extends AiAdminServicesAuthDtosPubConfigDto {
  @override
  final BuiltList<AiAdminServicesAuthDtosMenuItemDto>? menus;
  @override
  final bool? allowUserRegister;
  @override
  final String? turnstileSiteKey;

  factory _$AiAdminServicesAuthDtosPubConfigDto(
          [void Function(AiAdminServicesAuthDtosPubConfigDtoBuilder)?
              updates]) =>
      (AiAdminServicesAuthDtosPubConfigDtoBuilder()..update(updates))._build();

  _$AiAdminServicesAuthDtosPubConfigDto._(
      {this.menus, this.allowUserRegister, this.turnstileSiteKey})
      : super._();
  @override
  AiAdminServicesAuthDtosPubConfigDto rebuild(
          void Function(AiAdminServicesAuthDtosPubConfigDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAuthDtosPubConfigDtoBuilder toBuilder() =>
      AiAdminServicesAuthDtosPubConfigDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAuthDtosPubConfigDto &&
        menus == other.menus &&
        allowUserRegister == other.allowUserRegister &&
        turnstileSiteKey == other.turnstileSiteKey;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, menus.hashCode);
    _$hash = $jc(_$hash, allowUserRegister.hashCode);
    _$hash = $jc(_$hash, turnstileSiteKey.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AiAdminServicesAuthDtosPubConfigDto')
          ..add('menus', menus)
          ..add('allowUserRegister', allowUserRegister)
          ..add('turnstileSiteKey', turnstileSiteKey))
        .toString();
  }
}

class AiAdminServicesAuthDtosPubConfigDtoBuilder
    implements
        Builder<AiAdminServicesAuthDtosPubConfigDto,
            AiAdminServicesAuthDtosPubConfigDtoBuilder> {
  _$AiAdminServicesAuthDtosPubConfigDto? _$v;

  ListBuilder<AiAdminServicesAuthDtosMenuItemDto>? _menus;
  ListBuilder<AiAdminServicesAuthDtosMenuItemDto> get menus =>
      _$this._menus ??= ListBuilder<AiAdminServicesAuthDtosMenuItemDto>();
  set menus(ListBuilder<AiAdminServicesAuthDtosMenuItemDto>? menus) =>
      _$this._menus = menus;

  bool? _allowUserRegister;
  bool? get allowUserRegister => _$this._allowUserRegister;
  set allowUserRegister(bool? allowUserRegister) =>
      _$this._allowUserRegister = allowUserRegister;

  String? _turnstileSiteKey;
  String? get turnstileSiteKey => _$this._turnstileSiteKey;
  set turnstileSiteKey(String? turnstileSiteKey) =>
      _$this._turnstileSiteKey = turnstileSiteKey;

  AiAdminServicesAuthDtosPubConfigDtoBuilder() {
    AiAdminServicesAuthDtosPubConfigDto._defaults(this);
  }

  AiAdminServicesAuthDtosPubConfigDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _menus = $v.menus?.toBuilder();
      _allowUserRegister = $v.allowUserRegister;
      _turnstileSiteKey = $v.turnstileSiteKey;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAuthDtosPubConfigDto other) {
    _$v = other as _$AiAdminServicesAuthDtosPubConfigDto;
  }

  @override
  void update(
      void Function(AiAdminServicesAuthDtosPubConfigDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAuthDtosPubConfigDto build() => _build();

  _$AiAdminServicesAuthDtosPubConfigDto _build() {
    _$AiAdminServicesAuthDtosPubConfigDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesAuthDtosPubConfigDto._(
            menus: _menus?.build(),
            allowUserRegister: allowUserRegister,
            turnstileSiteKey: turnstileSiteKey,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'menus';
        _menus?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'AiAdminServicesAuthDtosPubConfigDto',
            _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
