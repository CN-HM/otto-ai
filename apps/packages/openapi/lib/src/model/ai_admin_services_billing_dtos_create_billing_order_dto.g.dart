// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_billing_dtos_create_billing_order_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesBillingDtosCreateBillingOrderDto
    extends AiAdminServicesBillingDtosCreateBillingOrderDto {
  @override
  final String? planId;
  @override
  final String? providerCode;

  factory _$AiAdminServicesBillingDtosCreateBillingOrderDto(
          [void Function(
                  AiAdminServicesBillingDtosCreateBillingOrderDtoBuilder)?
              updates]) =>
      (AiAdminServicesBillingDtosCreateBillingOrderDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesBillingDtosCreateBillingOrderDto._(
      {this.planId, this.providerCode})
      : super._();
  @override
  AiAdminServicesBillingDtosCreateBillingOrderDto rebuild(
          void Function(AiAdminServicesBillingDtosCreateBillingOrderDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesBillingDtosCreateBillingOrderDtoBuilder toBuilder() =>
      AiAdminServicesBillingDtosCreateBillingOrderDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesBillingDtosCreateBillingOrderDto &&
        planId == other.planId &&
        providerCode == other.providerCode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, planId.hashCode);
    _$hash = $jc(_$hash, providerCode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesBillingDtosCreateBillingOrderDto')
          ..add('planId', planId)
          ..add('providerCode', providerCode))
        .toString();
  }
}

class AiAdminServicesBillingDtosCreateBillingOrderDtoBuilder
    implements
        Builder<AiAdminServicesBillingDtosCreateBillingOrderDto,
            AiAdminServicesBillingDtosCreateBillingOrderDtoBuilder> {
  _$AiAdminServicesBillingDtosCreateBillingOrderDto? _$v;

  String? _planId;
  String? get planId => _$this._planId;
  set planId(String? planId) => _$this._planId = planId;

  String? _providerCode;
  String? get providerCode => _$this._providerCode;
  set providerCode(String? providerCode) => _$this._providerCode = providerCode;

  AiAdminServicesBillingDtosCreateBillingOrderDtoBuilder() {
    AiAdminServicesBillingDtosCreateBillingOrderDto._defaults(this);
  }

  AiAdminServicesBillingDtosCreateBillingOrderDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _planId = $v.planId;
      _providerCode = $v.providerCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesBillingDtosCreateBillingOrderDto other) {
    _$v = other as _$AiAdminServicesBillingDtosCreateBillingOrderDto;
  }

  @override
  void update(
      void Function(AiAdminServicesBillingDtosCreateBillingOrderDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesBillingDtosCreateBillingOrderDto build() => _build();

  _$AiAdminServicesBillingDtosCreateBillingOrderDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesBillingDtosCreateBillingOrderDto._(
          planId: planId,
          providerCode: providerCode,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
