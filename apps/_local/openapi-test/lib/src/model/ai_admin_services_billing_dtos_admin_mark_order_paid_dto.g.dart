// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_billing_dtos_admin_mark_order_paid_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesBillingDtosAdminMarkOrderPaidDto
    extends AiAdminServicesBillingDtosAdminMarkOrderPaidDto {
  @override
  final String? transactionNo;
  @override
  final DateTime? paidAt;
  @override
  final String? remark;

  factory _$AiAdminServicesBillingDtosAdminMarkOrderPaidDto(
          [void Function(
                  AiAdminServicesBillingDtosAdminMarkOrderPaidDtoBuilder)?
              updates]) =>
      (AiAdminServicesBillingDtosAdminMarkOrderPaidDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesBillingDtosAdminMarkOrderPaidDto._(
      {this.transactionNo, this.paidAt, this.remark})
      : super._();
  @override
  AiAdminServicesBillingDtosAdminMarkOrderPaidDto rebuild(
          void Function(AiAdminServicesBillingDtosAdminMarkOrderPaidDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesBillingDtosAdminMarkOrderPaidDtoBuilder toBuilder() =>
      AiAdminServicesBillingDtosAdminMarkOrderPaidDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesBillingDtosAdminMarkOrderPaidDto &&
        transactionNo == other.transactionNo &&
        paidAt == other.paidAt &&
        remark == other.remark;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, transactionNo.hashCode);
    _$hash = $jc(_$hash, paidAt.hashCode);
    _$hash = $jc(_$hash, remark.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesBillingDtosAdminMarkOrderPaidDto')
          ..add('transactionNo', transactionNo)
          ..add('paidAt', paidAt)
          ..add('remark', remark))
        .toString();
  }
}

class AiAdminServicesBillingDtosAdminMarkOrderPaidDtoBuilder
    implements
        Builder<AiAdminServicesBillingDtosAdminMarkOrderPaidDto,
            AiAdminServicesBillingDtosAdminMarkOrderPaidDtoBuilder> {
  _$AiAdminServicesBillingDtosAdminMarkOrderPaidDto? _$v;

  String? _transactionNo;
  String? get transactionNo => _$this._transactionNo;
  set transactionNo(String? transactionNo) =>
      _$this._transactionNo = transactionNo;

  DateTime? _paidAt;
  DateTime? get paidAt => _$this._paidAt;
  set paidAt(DateTime? paidAt) => _$this._paidAt = paidAt;

  String? _remark;
  String? get remark => _$this._remark;
  set remark(String? remark) => _$this._remark = remark;

  AiAdminServicesBillingDtosAdminMarkOrderPaidDtoBuilder() {
    AiAdminServicesBillingDtosAdminMarkOrderPaidDto._defaults(this);
  }

  AiAdminServicesBillingDtosAdminMarkOrderPaidDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _transactionNo = $v.transactionNo;
      _paidAt = $v.paidAt;
      _remark = $v.remark;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesBillingDtosAdminMarkOrderPaidDto other) {
    _$v = other as _$AiAdminServicesBillingDtosAdminMarkOrderPaidDto;
  }

  @override
  void update(
      void Function(AiAdminServicesBillingDtosAdminMarkOrderPaidDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesBillingDtosAdminMarkOrderPaidDto build() => _build();

  _$AiAdminServicesBillingDtosAdminMarkOrderPaidDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesBillingDtosAdminMarkOrderPaidDto._(
          transactionNo: transactionNo,
          paidAt: paidAt,
          remark: remark,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
