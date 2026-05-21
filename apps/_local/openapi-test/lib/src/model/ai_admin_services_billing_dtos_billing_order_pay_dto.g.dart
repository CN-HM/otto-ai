// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_billing_dtos_billing_order_pay_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesBillingDtosBillingOrderPayDto
    extends AiAdminServicesBillingDtosBillingOrderPayDto {
  @override
  final String? providerCode;
  @override
  final String? returnUrl;

  factory _$AiAdminServicesBillingDtosBillingOrderPayDto(
          [void Function(AiAdminServicesBillingDtosBillingOrderPayDtoBuilder)?
              updates]) =>
      (AiAdminServicesBillingDtosBillingOrderPayDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesBillingDtosBillingOrderPayDto._(
      {this.providerCode, this.returnUrl})
      : super._();
  @override
  AiAdminServicesBillingDtosBillingOrderPayDto rebuild(
          void Function(AiAdminServicesBillingDtosBillingOrderPayDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesBillingDtosBillingOrderPayDtoBuilder toBuilder() =>
      AiAdminServicesBillingDtosBillingOrderPayDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesBillingDtosBillingOrderPayDto &&
        providerCode == other.providerCode &&
        returnUrl == other.returnUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, providerCode.hashCode);
    _$hash = $jc(_$hash, returnUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesBillingDtosBillingOrderPayDto')
          ..add('providerCode', providerCode)
          ..add('returnUrl', returnUrl))
        .toString();
  }
}

class AiAdminServicesBillingDtosBillingOrderPayDtoBuilder
    implements
        Builder<AiAdminServicesBillingDtosBillingOrderPayDto,
            AiAdminServicesBillingDtosBillingOrderPayDtoBuilder> {
  _$AiAdminServicesBillingDtosBillingOrderPayDto? _$v;

  String? _providerCode;
  String? get providerCode => _$this._providerCode;
  set providerCode(String? providerCode) => _$this._providerCode = providerCode;

  String? _returnUrl;
  String? get returnUrl => _$this._returnUrl;
  set returnUrl(String? returnUrl) => _$this._returnUrl = returnUrl;

  AiAdminServicesBillingDtosBillingOrderPayDtoBuilder() {
    AiAdminServicesBillingDtosBillingOrderPayDto._defaults(this);
  }

  AiAdminServicesBillingDtosBillingOrderPayDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _providerCode = $v.providerCode;
      _returnUrl = $v.returnUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesBillingDtosBillingOrderPayDto other) {
    _$v = other as _$AiAdminServicesBillingDtosBillingOrderPayDto;
  }

  @override
  void update(
      void Function(AiAdminServicesBillingDtosBillingOrderPayDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesBillingDtosBillingOrderPayDto build() => _build();

  _$AiAdminServicesBillingDtosBillingOrderPayDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesBillingDtosBillingOrderPayDto._(
          providerCode: providerCode,
          returnUrl: returnUrl,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
