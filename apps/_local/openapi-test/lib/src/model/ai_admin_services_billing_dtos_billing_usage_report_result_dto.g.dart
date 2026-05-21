// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_billing_dtos_billing_usage_report_result_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesBillingDtosBillingUsageReportResultDto
    extends AiAdminServicesBillingDtosBillingUsageReportResultDto {
  @override
  final bool? recorded;
  @override
  final String? idempotencyKey;
  @override
  final int? normalizedTokens;
  @override
  final int? consumedTokens;
  @override
  final int? remainingTokens;
  @override
  final bool? isLowBalance;
  @override
  final bool? isExhausted;
  @override
  final String? chargeStatus;
  @override
  final String? periodKey;

  factory _$AiAdminServicesBillingDtosBillingUsageReportResultDto(
          [void Function(
                  AiAdminServicesBillingDtosBillingUsageReportResultDtoBuilder)?
              updates]) =>
      (AiAdminServicesBillingDtosBillingUsageReportResultDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesBillingDtosBillingUsageReportResultDto._(
      {this.recorded,
      this.idempotencyKey,
      this.normalizedTokens,
      this.consumedTokens,
      this.remainingTokens,
      this.isLowBalance,
      this.isExhausted,
      this.chargeStatus,
      this.periodKey})
      : super._();
  @override
  AiAdminServicesBillingDtosBillingUsageReportResultDto rebuild(
          void Function(
                  AiAdminServicesBillingDtosBillingUsageReportResultDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesBillingDtosBillingUsageReportResultDtoBuilder toBuilder() =>
      AiAdminServicesBillingDtosBillingUsageReportResultDtoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesBillingDtosBillingUsageReportResultDto &&
        recorded == other.recorded &&
        idempotencyKey == other.idempotencyKey &&
        normalizedTokens == other.normalizedTokens &&
        consumedTokens == other.consumedTokens &&
        remainingTokens == other.remainingTokens &&
        isLowBalance == other.isLowBalance &&
        isExhausted == other.isExhausted &&
        chargeStatus == other.chargeStatus &&
        periodKey == other.periodKey;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, recorded.hashCode);
    _$hash = $jc(_$hash, idempotencyKey.hashCode);
    _$hash = $jc(_$hash, normalizedTokens.hashCode);
    _$hash = $jc(_$hash, consumedTokens.hashCode);
    _$hash = $jc(_$hash, remainingTokens.hashCode);
    _$hash = $jc(_$hash, isLowBalance.hashCode);
    _$hash = $jc(_$hash, isExhausted.hashCode);
    _$hash = $jc(_$hash, chargeStatus.hashCode);
    _$hash = $jc(_$hash, periodKey.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesBillingDtosBillingUsageReportResultDto')
          ..add('recorded', recorded)
          ..add('idempotencyKey', idempotencyKey)
          ..add('normalizedTokens', normalizedTokens)
          ..add('consumedTokens', consumedTokens)
          ..add('remainingTokens', remainingTokens)
          ..add('isLowBalance', isLowBalance)
          ..add('isExhausted', isExhausted)
          ..add('chargeStatus', chargeStatus)
          ..add('periodKey', periodKey))
        .toString();
  }
}

class AiAdminServicesBillingDtosBillingUsageReportResultDtoBuilder
    implements
        Builder<AiAdminServicesBillingDtosBillingUsageReportResultDto,
            AiAdminServicesBillingDtosBillingUsageReportResultDtoBuilder> {
  _$AiAdminServicesBillingDtosBillingUsageReportResultDto? _$v;

  bool? _recorded;
  bool? get recorded => _$this._recorded;
  set recorded(bool? recorded) => _$this._recorded = recorded;

  String? _idempotencyKey;
  String? get idempotencyKey => _$this._idempotencyKey;
  set idempotencyKey(String? idempotencyKey) =>
      _$this._idempotencyKey = idempotencyKey;

  int? _normalizedTokens;
  int? get normalizedTokens => _$this._normalizedTokens;
  set normalizedTokens(int? normalizedTokens) =>
      _$this._normalizedTokens = normalizedTokens;

  int? _consumedTokens;
  int? get consumedTokens => _$this._consumedTokens;
  set consumedTokens(int? consumedTokens) =>
      _$this._consumedTokens = consumedTokens;

  int? _remainingTokens;
  int? get remainingTokens => _$this._remainingTokens;
  set remainingTokens(int? remainingTokens) =>
      _$this._remainingTokens = remainingTokens;

  bool? _isLowBalance;
  bool? get isLowBalance => _$this._isLowBalance;
  set isLowBalance(bool? isLowBalance) => _$this._isLowBalance = isLowBalance;

  bool? _isExhausted;
  bool? get isExhausted => _$this._isExhausted;
  set isExhausted(bool? isExhausted) => _$this._isExhausted = isExhausted;

  String? _chargeStatus;
  String? get chargeStatus => _$this._chargeStatus;
  set chargeStatus(String? chargeStatus) => _$this._chargeStatus = chargeStatus;

  String? _periodKey;
  String? get periodKey => _$this._periodKey;
  set periodKey(String? periodKey) => _$this._periodKey = periodKey;

  AiAdminServicesBillingDtosBillingUsageReportResultDtoBuilder() {
    AiAdminServicesBillingDtosBillingUsageReportResultDto._defaults(this);
  }

  AiAdminServicesBillingDtosBillingUsageReportResultDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _recorded = $v.recorded;
      _idempotencyKey = $v.idempotencyKey;
      _normalizedTokens = $v.normalizedTokens;
      _consumedTokens = $v.consumedTokens;
      _remainingTokens = $v.remainingTokens;
      _isLowBalance = $v.isLowBalance;
      _isExhausted = $v.isExhausted;
      _chargeStatus = $v.chargeStatus;
      _periodKey = $v.periodKey;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesBillingDtosBillingUsageReportResultDto other) {
    _$v = other as _$AiAdminServicesBillingDtosBillingUsageReportResultDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesBillingDtosBillingUsageReportResultDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesBillingDtosBillingUsageReportResultDto build() => _build();

  _$AiAdminServicesBillingDtosBillingUsageReportResultDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesBillingDtosBillingUsageReportResultDto._(
          recorded: recorded,
          idempotencyKey: idempotencyKey,
          normalizedTokens: normalizedTokens,
          consumedTokens: consumedTokens,
          remainingTokens: remainingTokens,
          isLowBalance: isLowBalance,
          isExhausted: isExhausted,
          chargeStatus: chargeStatus,
          periodKey: periodKey,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
