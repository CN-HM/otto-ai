// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_billing_dtos_admin_billing_subscription_item_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto
    extends AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto {
  @override
  final int? userId;
  @override
  final String? username;
  @override
  final String? mobile;
  @override
  final String? planCode;
  @override
  final String? planName;
  @override
  final String? subscriptionStatus;
  @override
  final String? periodKey;
  @override
  final int? totalTokens;
  @override
  final int? consumedTokens;
  @override
  final int? remainingTokens;
  @override
  final String? periodEndAt;
  @override
  final bool? isLowBalance;
  @override
  final bool? isExhausted;

  factory _$AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto(
          [void Function(
                  AiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder)?
              updates]) =>
      (AiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto._(
      {this.userId,
      this.username,
      this.mobile,
      this.planCode,
      this.planName,
      this.subscriptionStatus,
      this.periodKey,
      this.totalTokens,
      this.consumedTokens,
      this.remainingTokens,
      this.periodEndAt,
      this.isLowBalance,
      this.isExhausted})
      : super._();
  @override
  AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto rebuild(
          void Function(
                  AiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder
      toBuilder() =>
          AiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto &&
        userId == other.userId &&
        username == other.username &&
        mobile == other.mobile &&
        planCode == other.planCode &&
        planName == other.planName &&
        subscriptionStatus == other.subscriptionStatus &&
        periodKey == other.periodKey &&
        totalTokens == other.totalTokens &&
        consumedTokens == other.consumedTokens &&
        remainingTokens == other.remainingTokens &&
        periodEndAt == other.periodEndAt &&
        isLowBalance == other.isLowBalance &&
        isExhausted == other.isExhausted;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, mobile.hashCode);
    _$hash = $jc(_$hash, planCode.hashCode);
    _$hash = $jc(_$hash, planName.hashCode);
    _$hash = $jc(_$hash, subscriptionStatus.hashCode);
    _$hash = $jc(_$hash, periodKey.hashCode);
    _$hash = $jc(_$hash, totalTokens.hashCode);
    _$hash = $jc(_$hash, consumedTokens.hashCode);
    _$hash = $jc(_$hash, remainingTokens.hashCode);
    _$hash = $jc(_$hash, periodEndAt.hashCode);
    _$hash = $jc(_$hash, isLowBalance.hashCode);
    _$hash = $jc(_$hash, isExhausted.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto')
          ..add('userId', userId)
          ..add('username', username)
          ..add('mobile', mobile)
          ..add('planCode', planCode)
          ..add('planName', planName)
          ..add('subscriptionStatus', subscriptionStatus)
          ..add('periodKey', periodKey)
          ..add('totalTokens', totalTokens)
          ..add('consumedTokens', consumedTokens)
          ..add('remainingTokens', remainingTokens)
          ..add('periodEndAt', periodEndAt)
          ..add('isLowBalance', isLowBalance)
          ..add('isExhausted', isExhausted))
        .toString();
  }
}

class AiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder
    implements
        Builder<AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto,
            AiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder> {
  _$AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto? _$v;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _mobile;
  String? get mobile => _$this._mobile;
  set mobile(String? mobile) => _$this._mobile = mobile;

  String? _planCode;
  String? get planCode => _$this._planCode;
  set planCode(String? planCode) => _$this._planCode = planCode;

  String? _planName;
  String? get planName => _$this._planName;
  set planName(String? planName) => _$this._planName = planName;

  String? _subscriptionStatus;
  String? get subscriptionStatus => _$this._subscriptionStatus;
  set subscriptionStatus(String? subscriptionStatus) =>
      _$this._subscriptionStatus = subscriptionStatus;

  String? _periodKey;
  String? get periodKey => _$this._periodKey;
  set periodKey(String? periodKey) => _$this._periodKey = periodKey;

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

  String? _periodEndAt;
  String? get periodEndAt => _$this._periodEndAt;
  set periodEndAt(String? periodEndAt) => _$this._periodEndAt = periodEndAt;

  bool? _isLowBalance;
  bool? get isLowBalance => _$this._isLowBalance;
  set isLowBalance(bool? isLowBalance) => _$this._isLowBalance = isLowBalance;

  bool? _isExhausted;
  bool? get isExhausted => _$this._isExhausted;
  set isExhausted(bool? isExhausted) => _$this._isExhausted = isExhausted;

  AiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder() {
    AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto._defaults(this);
  }

  AiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _username = $v.username;
      _mobile = $v.mobile;
      _planCode = $v.planCode;
      _planName = $v.planName;
      _subscriptionStatus = $v.subscriptionStatus;
      _periodKey = $v.periodKey;
      _totalTokens = $v.totalTokens;
      _consumedTokens = $v.consumedTokens;
      _remainingTokens = $v.remainingTokens;
      _periodEndAt = $v.periodEndAt;
      _isLowBalance = $v.isLowBalance;
      _isExhausted = $v.isExhausted;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto other) {
    _$v = other as _$AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto build() => _build();

  _$AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto._(
          userId: userId,
          username: username,
          mobile: mobile,
          planCode: planCode,
          planName: planName,
          subscriptionStatus: subscriptionStatus,
          periodKey: periodKey,
          totalTokens: totalTokens,
          consumedTokens: consumedTokens,
          remainingTokens: remainingTokens,
          periodEndAt: periodEndAt,
          isLowBalance: isLowBalance,
          isExhausted: isExhausted,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
