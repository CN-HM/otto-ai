// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_billing_dtos_billing_order_detail_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesBillingDtosBillingOrderDetailDto
    extends AiAdminServicesBillingDtosBillingOrderDetailDto {
  @override
  final String? id;
  @override
  final String? orderNo;
  @override
  final String? planId;
  @override
  final String? planCode;
  @override
  final String? planName;
  @override
  final String? orderType;
  @override
  final String? providerCode;
  @override
  final String? currencyCode;
  @override
  final double? amount;
  @override
  final int? grantedTokens;
  @override
  final String? status;
  @override
  final String? externalTradeNo;
  @override
  final String? paidAt;
  @override
  final String? activatedAt;
  @override
  final String? createDate;
  @override
  final String? regionCode;
  @override
  final String? cancelledAt;
  @override
  final String? latestTransactionNo;
  @override
  final String? latestPaymentStatus;
  @override
  final bool? canPay;
  @override
  final bool? canCancel;

  factory _$AiAdminServicesBillingDtosBillingOrderDetailDto(
          [void Function(
                  AiAdminServicesBillingDtosBillingOrderDetailDtoBuilder)?
              updates]) =>
      (AiAdminServicesBillingDtosBillingOrderDetailDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesBillingDtosBillingOrderDetailDto._(
      {this.id,
      this.orderNo,
      this.planId,
      this.planCode,
      this.planName,
      this.orderType,
      this.providerCode,
      this.currencyCode,
      this.amount,
      this.grantedTokens,
      this.status,
      this.externalTradeNo,
      this.paidAt,
      this.activatedAt,
      this.createDate,
      this.regionCode,
      this.cancelledAt,
      this.latestTransactionNo,
      this.latestPaymentStatus,
      this.canPay,
      this.canCancel})
      : super._();
  @override
  AiAdminServicesBillingDtosBillingOrderDetailDto rebuild(
          void Function(AiAdminServicesBillingDtosBillingOrderDetailDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesBillingDtosBillingOrderDetailDtoBuilder toBuilder() =>
      AiAdminServicesBillingDtosBillingOrderDetailDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesBillingDtosBillingOrderDetailDto &&
        id == other.id &&
        orderNo == other.orderNo &&
        planId == other.planId &&
        planCode == other.planCode &&
        planName == other.planName &&
        orderType == other.orderType &&
        providerCode == other.providerCode &&
        currencyCode == other.currencyCode &&
        amount == other.amount &&
        grantedTokens == other.grantedTokens &&
        status == other.status &&
        externalTradeNo == other.externalTradeNo &&
        paidAt == other.paidAt &&
        activatedAt == other.activatedAt &&
        createDate == other.createDate &&
        regionCode == other.regionCode &&
        cancelledAt == other.cancelledAt &&
        latestTransactionNo == other.latestTransactionNo &&
        latestPaymentStatus == other.latestPaymentStatus &&
        canPay == other.canPay &&
        canCancel == other.canCancel;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, orderNo.hashCode);
    _$hash = $jc(_$hash, planId.hashCode);
    _$hash = $jc(_$hash, planCode.hashCode);
    _$hash = $jc(_$hash, planName.hashCode);
    _$hash = $jc(_$hash, orderType.hashCode);
    _$hash = $jc(_$hash, providerCode.hashCode);
    _$hash = $jc(_$hash, currencyCode.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, grantedTokens.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, externalTradeNo.hashCode);
    _$hash = $jc(_$hash, paidAt.hashCode);
    _$hash = $jc(_$hash, activatedAt.hashCode);
    _$hash = $jc(_$hash, createDate.hashCode);
    _$hash = $jc(_$hash, regionCode.hashCode);
    _$hash = $jc(_$hash, cancelledAt.hashCode);
    _$hash = $jc(_$hash, latestTransactionNo.hashCode);
    _$hash = $jc(_$hash, latestPaymentStatus.hashCode);
    _$hash = $jc(_$hash, canPay.hashCode);
    _$hash = $jc(_$hash, canCancel.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesBillingDtosBillingOrderDetailDto')
          ..add('id', id)
          ..add('orderNo', orderNo)
          ..add('planId', planId)
          ..add('planCode', planCode)
          ..add('planName', planName)
          ..add('orderType', orderType)
          ..add('providerCode', providerCode)
          ..add('currencyCode', currencyCode)
          ..add('amount', amount)
          ..add('grantedTokens', grantedTokens)
          ..add('status', status)
          ..add('externalTradeNo', externalTradeNo)
          ..add('paidAt', paidAt)
          ..add('activatedAt', activatedAt)
          ..add('createDate', createDate)
          ..add('regionCode', regionCode)
          ..add('cancelledAt', cancelledAt)
          ..add('latestTransactionNo', latestTransactionNo)
          ..add('latestPaymentStatus', latestPaymentStatus)
          ..add('canPay', canPay)
          ..add('canCancel', canCancel))
        .toString();
  }
}

class AiAdminServicesBillingDtosBillingOrderDetailDtoBuilder
    implements
        Builder<AiAdminServicesBillingDtosBillingOrderDetailDto,
            AiAdminServicesBillingDtosBillingOrderDetailDtoBuilder> {
  _$AiAdminServicesBillingDtosBillingOrderDetailDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _orderNo;
  String? get orderNo => _$this._orderNo;
  set orderNo(String? orderNo) => _$this._orderNo = orderNo;

  String? _planId;
  String? get planId => _$this._planId;
  set planId(String? planId) => _$this._planId = planId;

  String? _planCode;
  String? get planCode => _$this._planCode;
  set planCode(String? planCode) => _$this._planCode = planCode;

  String? _planName;
  String? get planName => _$this._planName;
  set planName(String? planName) => _$this._planName = planName;

  String? _orderType;
  String? get orderType => _$this._orderType;
  set orderType(String? orderType) => _$this._orderType = orderType;

  String? _providerCode;
  String? get providerCode => _$this._providerCode;
  set providerCode(String? providerCode) => _$this._providerCode = providerCode;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  int? _grantedTokens;
  int? get grantedTokens => _$this._grantedTokens;
  set grantedTokens(int? grantedTokens) =>
      _$this._grantedTokens = grantedTokens;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _externalTradeNo;
  String? get externalTradeNo => _$this._externalTradeNo;
  set externalTradeNo(String? externalTradeNo) =>
      _$this._externalTradeNo = externalTradeNo;

  String? _paidAt;
  String? get paidAt => _$this._paidAt;
  set paidAt(String? paidAt) => _$this._paidAt = paidAt;

  String? _activatedAt;
  String? get activatedAt => _$this._activatedAt;
  set activatedAt(String? activatedAt) => _$this._activatedAt = activatedAt;

  String? _createDate;
  String? get createDate => _$this._createDate;
  set createDate(String? createDate) => _$this._createDate = createDate;

  String? _regionCode;
  String? get regionCode => _$this._regionCode;
  set regionCode(String? regionCode) => _$this._regionCode = regionCode;

  String? _cancelledAt;
  String? get cancelledAt => _$this._cancelledAt;
  set cancelledAt(String? cancelledAt) => _$this._cancelledAt = cancelledAt;

  String? _latestTransactionNo;
  String? get latestTransactionNo => _$this._latestTransactionNo;
  set latestTransactionNo(String? latestTransactionNo) =>
      _$this._latestTransactionNo = latestTransactionNo;

  String? _latestPaymentStatus;
  String? get latestPaymentStatus => _$this._latestPaymentStatus;
  set latestPaymentStatus(String? latestPaymentStatus) =>
      _$this._latestPaymentStatus = latestPaymentStatus;

  bool? _canPay;
  bool? get canPay => _$this._canPay;
  set canPay(bool? canPay) => _$this._canPay = canPay;

  bool? _canCancel;
  bool? get canCancel => _$this._canCancel;
  set canCancel(bool? canCancel) => _$this._canCancel = canCancel;

  AiAdminServicesBillingDtosBillingOrderDetailDtoBuilder() {
    AiAdminServicesBillingDtosBillingOrderDetailDto._defaults(this);
  }

  AiAdminServicesBillingDtosBillingOrderDetailDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _orderNo = $v.orderNo;
      _planId = $v.planId;
      _planCode = $v.planCode;
      _planName = $v.planName;
      _orderType = $v.orderType;
      _providerCode = $v.providerCode;
      _currencyCode = $v.currencyCode;
      _amount = $v.amount;
      _grantedTokens = $v.grantedTokens;
      _status = $v.status;
      _externalTradeNo = $v.externalTradeNo;
      _paidAt = $v.paidAt;
      _activatedAt = $v.activatedAt;
      _createDate = $v.createDate;
      _regionCode = $v.regionCode;
      _cancelledAt = $v.cancelledAt;
      _latestTransactionNo = $v.latestTransactionNo;
      _latestPaymentStatus = $v.latestPaymentStatus;
      _canPay = $v.canPay;
      _canCancel = $v.canCancel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesBillingDtosBillingOrderDetailDto other) {
    _$v = other as _$AiAdminServicesBillingDtosBillingOrderDetailDto;
  }

  @override
  void update(
      void Function(AiAdminServicesBillingDtosBillingOrderDetailDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesBillingDtosBillingOrderDetailDto build() => _build();

  _$AiAdminServicesBillingDtosBillingOrderDetailDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesBillingDtosBillingOrderDetailDto._(
          id: id,
          orderNo: orderNo,
          planId: planId,
          planCode: planCode,
          planName: planName,
          orderType: orderType,
          providerCode: providerCode,
          currencyCode: currencyCode,
          amount: amount,
          grantedTokens: grantedTokens,
          status: status,
          externalTradeNo: externalTradeNo,
          paidAt: paidAt,
          activatedAt: activatedAt,
          createDate: createDate,
          regionCode: regionCode,
          cancelledAt: cancelledAt,
          latestTransactionNo: latestTransactionNo,
          latestPaymentStatus: latestPaymentStatus,
          canPay: canPay,
          canCancel: canCancel,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
