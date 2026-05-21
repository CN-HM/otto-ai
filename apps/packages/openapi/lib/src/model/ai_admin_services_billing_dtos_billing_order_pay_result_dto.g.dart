// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_billing_dtos_billing_order_pay_result_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesBillingDtosBillingOrderPayResultDto
    extends AiAdminServicesBillingDtosBillingOrderPayResultDto {
  @override
  final String? orderId;
  @override
  final String? orderNo;
  @override
  final String? status;
  @override
  final String? providerCode;
  @override
  final String? actionType;
  @override
  final String? payUrl;
  @override
  final String? externalTradeNo;
  @override
  final String? expireAt;
  @override
  final String? message;
  @override
  final String? payloadJson;

  factory _$AiAdminServicesBillingDtosBillingOrderPayResultDto(
          [void Function(
                  AiAdminServicesBillingDtosBillingOrderPayResultDtoBuilder)?
              updates]) =>
      (AiAdminServicesBillingDtosBillingOrderPayResultDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesBillingDtosBillingOrderPayResultDto._(
      {this.orderId,
      this.orderNo,
      this.status,
      this.providerCode,
      this.actionType,
      this.payUrl,
      this.externalTradeNo,
      this.expireAt,
      this.message,
      this.payloadJson})
      : super._();
  @override
  AiAdminServicesBillingDtosBillingOrderPayResultDto rebuild(
          void Function(
                  AiAdminServicesBillingDtosBillingOrderPayResultDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesBillingDtosBillingOrderPayResultDtoBuilder toBuilder() =>
      AiAdminServicesBillingDtosBillingOrderPayResultDtoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesBillingDtosBillingOrderPayResultDto &&
        orderId == other.orderId &&
        orderNo == other.orderNo &&
        status == other.status &&
        providerCode == other.providerCode &&
        actionType == other.actionType &&
        payUrl == other.payUrl &&
        externalTradeNo == other.externalTradeNo &&
        expireAt == other.expireAt &&
        message == other.message &&
        payloadJson == other.payloadJson;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, orderId.hashCode);
    _$hash = $jc(_$hash, orderNo.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, providerCode.hashCode);
    _$hash = $jc(_$hash, actionType.hashCode);
    _$hash = $jc(_$hash, payUrl.hashCode);
    _$hash = $jc(_$hash, externalTradeNo.hashCode);
    _$hash = $jc(_$hash, expireAt.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, payloadJson.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesBillingDtosBillingOrderPayResultDto')
          ..add('orderId', orderId)
          ..add('orderNo', orderNo)
          ..add('status', status)
          ..add('providerCode', providerCode)
          ..add('actionType', actionType)
          ..add('payUrl', payUrl)
          ..add('externalTradeNo', externalTradeNo)
          ..add('expireAt', expireAt)
          ..add('message', message)
          ..add('payloadJson', payloadJson))
        .toString();
  }
}

class AiAdminServicesBillingDtosBillingOrderPayResultDtoBuilder
    implements
        Builder<AiAdminServicesBillingDtosBillingOrderPayResultDto,
            AiAdminServicesBillingDtosBillingOrderPayResultDtoBuilder> {
  _$AiAdminServicesBillingDtosBillingOrderPayResultDto? _$v;

  String? _orderId;
  String? get orderId => _$this._orderId;
  set orderId(String? orderId) => _$this._orderId = orderId;

  String? _orderNo;
  String? get orderNo => _$this._orderNo;
  set orderNo(String? orderNo) => _$this._orderNo = orderNo;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _providerCode;
  String? get providerCode => _$this._providerCode;
  set providerCode(String? providerCode) => _$this._providerCode = providerCode;

  String? _actionType;
  String? get actionType => _$this._actionType;
  set actionType(String? actionType) => _$this._actionType = actionType;

  String? _payUrl;
  String? get payUrl => _$this._payUrl;
  set payUrl(String? payUrl) => _$this._payUrl = payUrl;

  String? _externalTradeNo;
  String? get externalTradeNo => _$this._externalTradeNo;
  set externalTradeNo(String? externalTradeNo) =>
      _$this._externalTradeNo = externalTradeNo;

  String? _expireAt;
  String? get expireAt => _$this._expireAt;
  set expireAt(String? expireAt) => _$this._expireAt = expireAt;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _payloadJson;
  String? get payloadJson => _$this._payloadJson;
  set payloadJson(String? payloadJson) => _$this._payloadJson = payloadJson;

  AiAdminServicesBillingDtosBillingOrderPayResultDtoBuilder() {
    AiAdminServicesBillingDtosBillingOrderPayResultDto._defaults(this);
  }

  AiAdminServicesBillingDtosBillingOrderPayResultDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _orderId = $v.orderId;
      _orderNo = $v.orderNo;
      _status = $v.status;
      _providerCode = $v.providerCode;
      _actionType = $v.actionType;
      _payUrl = $v.payUrl;
      _externalTradeNo = $v.externalTradeNo;
      _expireAt = $v.expireAt;
      _message = $v.message;
      _payloadJson = $v.payloadJson;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesBillingDtosBillingOrderPayResultDto other) {
    _$v = other as _$AiAdminServicesBillingDtosBillingOrderPayResultDto;
  }

  @override
  void update(
      void Function(AiAdminServicesBillingDtosBillingOrderPayResultDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesBillingDtosBillingOrderPayResultDto build() => _build();

  _$AiAdminServicesBillingDtosBillingOrderPayResultDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesBillingDtosBillingOrderPayResultDto._(
          orderId: orderId,
          orderNo: orderNo,
          status: status,
          providerCode: providerCode,
          actionType: actionType,
          payUrl: payUrl,
          externalTradeNo: externalTradeNo,
          expireAt: expireAt,
          message: message,
          payloadJson: payloadJson,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
