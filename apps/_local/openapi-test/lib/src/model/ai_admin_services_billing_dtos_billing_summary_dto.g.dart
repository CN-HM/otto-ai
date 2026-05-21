// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_billing_dtos_billing_summary_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesBillingDtosBillingSummaryDto
    extends AiAdminServicesBillingDtosBillingSummaryDto {
  @override
  final int? userId;
  @override
  final String? username;
  @override
  final String? mobile;
  @override
  final String? subscriptionId;
  @override
  final String? subscriptionStatus;
  @override
  final String? planId;
  @override
  final String? planCode;
  @override
  final String? planName;
  @override
  final String? periodId;
  @override
  final String? periodKey;
  @override
  final String? periodStartAt;
  @override
  final String? periodEndAt;
  @override
  final int? totalTokens;
  @override
  final int? consumedTokens;
  @override
  final int? remainingTokens;
  @override
  final double? remainingRatio;
  @override
  final bool? isLowBalance;
  @override
  final bool? isExhausted;

  factory _$AiAdminServicesBillingDtosBillingSummaryDto(
          [void Function(AiAdminServicesBillingDtosBillingSummaryDtoBuilder)?
              updates]) =>
      (AiAdminServicesBillingDtosBillingSummaryDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesBillingDtosBillingSummaryDto._(
      {this.userId,
      this.username,
      this.mobile,
      this.subscriptionId,
      this.subscriptionStatus,
      this.planId,
      this.planCode,
      this.planName,
      this.periodId,
      this.periodKey,
      this.periodStartAt,
      this.periodEndAt,
      this.totalTokens,
      this.consumedTokens,
      this.remainingTokens,
      this.remainingRatio,
      this.isLowBalance,
      this.isExhausted})
      : super._();
  @override
  AiAdminServicesBillingDtosBillingSummaryDto rebuild(
          void Function(AiAdminServicesBillingDtosBillingSummaryDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesBillingDtosBillingSummaryDtoBuilder toBuilder() =>
      AiAdminServicesBillingDtosBillingSummaryDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesBillingDtosBillingSummaryDto &&
        userId == other.userId &&
        username == other.username &&
        mobile == other.mobile &&
        subscriptionId == other.subscriptionId &&
        subscriptionStatus == other.subscriptionStatus &&
        planId == other.planId &&
        planCode == other.planCode &&
        planName == other.planName &&
        periodId == other.periodId &&
        periodKey == other.periodKey &&
        periodStartAt == other.periodStartAt &&
        periodEndAt == other.periodEndAt &&
        totalTokens == other.totalTokens &&
        consumedTokens == other.consumedTokens &&
        remainingTokens == other.remainingTokens &&
        remainingRatio == other.remainingRatio &&
        isLowBalance == other.isLowBalance &&
        isExhausted == other.isExhausted;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, mobile.hashCode);
    _$hash = $jc(_$hash, subscriptionId.hashCode);
    _$hash = $jc(_$hash, subscriptionStatus.hashCode);
    _$hash = $jc(_$hash, planId.hashCode);
    _$hash = $jc(_$hash, planCode.hashCode);
    _$hash = $jc(_$hash, planName.hashCode);
    _$hash = $jc(_$hash, periodId.hashCode);
    _$hash = $jc(_$hash, periodKey.hashCode);
    _$hash = $jc(_$hash, periodStartAt.hashCode);
    _$hash = $jc(_$hash, periodEndAt.hashCode);
    _$hash = $jc(_$hash, totalTokens.hashCode);
    _$hash = $jc(_$hash, consumedTokens.hashCode);
    _$hash = $jc(_$hash, remainingTokens.hashCode);
    _$hash = $jc(_$hash, remainingRatio.hashCode);
    _$hash = $jc(_$hash, isLowBalance.hashCode);
    _$hash = $jc(_$hash, isExhausted.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesBillingDtosBillingSummaryDto')
          ..add('userId', userId)
          ..add('username', username)
          ..add('mobile', mobile)
          ..add('subscriptionId', subscriptionId)
          ..add('subscriptionStatus', subscriptionStatus)
          ..add('planId', planId)
          ..add('planCode', planCode)
          ..add('planName', planName)
          ..add('periodId', periodId)
          ..add('periodKey', periodKey)
          ..add('periodStartAt', periodStartAt)
          ..add('periodEndAt', periodEndAt)
          ..add('totalTokens', totalTokens)
          ..add('consumedTokens', consumedTokens)
          ..add('remainingTokens', remainingTokens)
          ..add('remainingRatio', remainingRatio)
          ..add('isLowBalance', isLowBalance)
          ..add('isExhausted', isExhausted))
        .toString();
  }
}

class AiAdminServicesBillingDtosBillingSummaryDtoBuilder
    implements
        Builder<AiAdminServicesBillingDtosBillingSummaryDto,
            AiAdminServicesBillingDtosBillingSummaryDtoBuilder> {
  _$AiAdminServicesBillingDtosBillingSummaryDto? _$v;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _mobile;
  String? get mobile => _$this._mobile;
  set mobile(String? mobile) => _$this._mobile = mobile;

  String? _subscriptionId;
  String? get subscriptionId => _$this._subscriptionId;
  set subscriptionId(String? subscriptionId) =>
      _$this._subscriptionId = subscriptionId;

  String? _subscriptionStatus;
  String? get subscriptionStatus => _$this._subscriptionStatus;
  set subscriptionStatus(String? subscriptionStatus) =>
      _$this._subscriptionStatus = subscriptionStatus;

  String? _planId;
  String? get planId => _$this._planId;
  set planId(String? planId) => _$this._planId = planId;

  String? _planCode;
  String? get planCode => _$this._planCode;
  set planCode(String? planCode) => _$this._planCode = planCode;

  String? _planName;
  String? get planName => _$this._planName;
  set planName(String? planName) => _$this._planName = planName;

  String? _periodId;
  String? get periodId => _$this._periodId;
  set periodId(String? periodId) => _$this._periodId = periodId;

  String? _periodKey;
  String? get periodKey => _$this._periodKey;
  set periodKey(String? periodKey) => _$this._periodKey = periodKey;

  String? _periodStartAt;
  String? get periodStartAt => _$this._periodStartAt;
  set periodStartAt(String? periodStartAt) =>
      _$this._periodStartAt = periodStartAt;

  String? _periodEndAt;
  String? get periodEndAt => _$this._periodEndAt;
  set periodEndAt(String? periodEndAt) => _$this._periodEndAt = periodEndAt;

  int? _totalTokens;
  int? get totalTokens => _$this._totalTokens;
  set totalTokens(int? totalTokens) => _$this._totalTokens = totalTokens;

  int? _consumedTokens;
  int? get consumedTokens => _$this._consumedTokens;
  set consumedTokens(int? consumedTokens) =>
      _$this._consumedTokens = consumedTokens;

  int? _remainingTokens;
  int? get remainingTokens => _$this._remainingTokens;
  set remainingTokens(int? remainingTokens) =>
      _$this._remainingTokens = remainingTokens;

  double? _remainingRatio;
  double? get remainingRatio => _$this._remainingRatio;
  set remainingRatio(double? remainingRatio) =>
      _$this._remainingRatio = remainingRatio;

  bool? _isLowBalance;
  bool? get isLowBalance => _$this._isLowBalance;
  set isLowBalance(bool? isLowBalance) => _$this._isLowBalance = isLowBalance;

  bool? _isExhausted;
  bool? get isExhausted => _$this._isExhausted;
  set isExhausted(bool? isExhausted) => _$this._isExhausted = isExhausted;

  AiAdminServicesBillingDtosBillingSummaryDtoBuilder() {
    AiAdminServicesBillingDtosBillingSummaryDto._defaults(this);
  }

  AiAdminServicesBillingDtosBillingSummaryDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _username = $v.username;
      _mobile = $v.mobile;
      _subscriptionId = $v.subscriptionId;
      _subscriptionStatus = $v.subscriptionStatus;
      _planId = $v.planId;
      _planCode = $v.planCode;
      _planName = $v.planName;
      _periodId = $v.periodId;
      _periodKey = $v.periodKey;
      _periodStartAt = $v.periodStartAt;
      _periodEndAt = $v.periodEndAt;
      _totalTokens = $v.totalTokens;
      _consumedTokens = $v.consumedTokens;
      _remainingTokens = $v.remainingTokens;
      _remainingRatio = $v.remainingRatio;
      _isLowBalance = $v.isLowBalance;
      _isExhausted = $v.isExhausted;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesBillingDtosBillingSummaryDto other) {
    _$v = other as _$AiAdminServicesBillingDtosBillingSummaryDto;
  }

  @override
  void update(
      void Function(AiAdminServicesBillingDtosBillingSummaryDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesBillingDtosBillingSummaryDto build() => _build();

  _$AiAdminServicesBillingDtosBillingSummaryDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesBillingDtosBillingSummaryDto._(
          userId: userId,
          username: username,
          mobile: mobile,
          subscriptionId: subscriptionId,
          subscriptionStatus: subscriptionStatus,
          planId: planId,
          planCode: planCode,
          planName: planName,
          periodId: periodId,
          periodKey: periodKey,
          periodStartAt: periodStartAt,
          periodEndAt: periodEndAt,
          totalTokens: totalTokens,
          consumedTokens: consumedTokens,
          remainingTokens: remainingTokens,
          remainingRatio: remainingRatio,
          isLowBalance: isLowBalance,
          isExhausted: isExhausted,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
