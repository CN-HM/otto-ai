// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_billing_dtos_billing_plan_item_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesBillingDtosBillingPlanItemDto
    extends AiAdminServicesBillingDtosBillingPlanItemDto {
  @override
  final String? id;
  @override
  final String? code;
  @override
  final String? name;
  @override
  final String? planType;
  @override
  final int? includedTokens;
  @override
  final int? bonusTokens;
  @override
  final int? cycleMonths;
  @override
  final bool? isDefault;
  @override
  final bool? isEnabled;
  @override
  final int? sort;
  @override
  final String? remark;
  @override
  final double? amount;
  @override
  final String? currencyCode;
  @override
  final String? regionCode;
  @override
  final String? providerCode;

  factory _$AiAdminServicesBillingDtosBillingPlanItemDto(
          [void Function(AiAdminServicesBillingDtosBillingPlanItemDtoBuilder)?
              updates]) =>
      (AiAdminServicesBillingDtosBillingPlanItemDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesBillingDtosBillingPlanItemDto._(
      {this.id,
      this.code,
      this.name,
      this.planType,
      this.includedTokens,
      this.bonusTokens,
      this.cycleMonths,
      this.isDefault,
      this.isEnabled,
      this.sort,
      this.remark,
      this.amount,
      this.currencyCode,
      this.regionCode,
      this.providerCode})
      : super._();
  @override
  AiAdminServicesBillingDtosBillingPlanItemDto rebuild(
          void Function(AiAdminServicesBillingDtosBillingPlanItemDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesBillingDtosBillingPlanItemDtoBuilder toBuilder() =>
      AiAdminServicesBillingDtosBillingPlanItemDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesBillingDtosBillingPlanItemDto &&
        id == other.id &&
        code == other.code &&
        name == other.name &&
        planType == other.planType &&
        includedTokens == other.includedTokens &&
        bonusTokens == other.bonusTokens &&
        cycleMonths == other.cycleMonths &&
        isDefault == other.isDefault &&
        isEnabled == other.isEnabled &&
        sort == other.sort &&
        remark == other.remark &&
        amount == other.amount &&
        currencyCode == other.currencyCode &&
        regionCode == other.regionCode &&
        providerCode == other.providerCode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, planType.hashCode);
    _$hash = $jc(_$hash, includedTokens.hashCode);
    _$hash = $jc(_$hash, bonusTokens.hashCode);
    _$hash = $jc(_$hash, cycleMonths.hashCode);
    _$hash = $jc(_$hash, isDefault.hashCode);
    _$hash = $jc(_$hash, isEnabled.hashCode);
    _$hash = $jc(_$hash, sort.hashCode);
    _$hash = $jc(_$hash, remark.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, currencyCode.hashCode);
    _$hash = $jc(_$hash, regionCode.hashCode);
    _$hash = $jc(_$hash, providerCode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesBillingDtosBillingPlanItemDto')
          ..add('id', id)
          ..add('code', code)
          ..add('name', name)
          ..add('planType', planType)
          ..add('includedTokens', includedTokens)
          ..add('bonusTokens', bonusTokens)
          ..add('cycleMonths', cycleMonths)
          ..add('isDefault', isDefault)
          ..add('isEnabled', isEnabled)
          ..add('sort', sort)
          ..add('remark', remark)
          ..add('amount', amount)
          ..add('currencyCode', currencyCode)
          ..add('regionCode', regionCode)
          ..add('providerCode', providerCode))
        .toString();
  }
}

class AiAdminServicesBillingDtosBillingPlanItemDtoBuilder
    implements
        Builder<AiAdminServicesBillingDtosBillingPlanItemDto,
            AiAdminServicesBillingDtosBillingPlanItemDtoBuilder> {
  _$AiAdminServicesBillingDtosBillingPlanItemDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _planType;
  String? get planType => _$this._planType;
  set planType(String? planType) => _$this._planType = planType;

  int? _includedTokens;
  int? get includedTokens => _$this._includedTokens;
  set includedTokens(int? includedTokens) =>
      _$this._includedTokens = includedTokens;

  int? _bonusTokens;
  int? get bonusTokens => _$this._bonusTokens;
  set bonusTokens(int? bonusTokens) => _$this._bonusTokens = bonusTokens;

  int? _cycleMonths;
  int? get cycleMonths => _$this._cycleMonths;
  set cycleMonths(int? cycleMonths) => _$this._cycleMonths = cycleMonths;

  bool? _isDefault;
  bool? get isDefault => _$this._isDefault;
  set isDefault(bool? isDefault) => _$this._isDefault = isDefault;

  bool? _isEnabled;
  bool? get isEnabled => _$this._isEnabled;
  set isEnabled(bool? isEnabled) => _$this._isEnabled = isEnabled;

  int? _sort;
  int? get sort => _$this._sort;
  set sort(int? sort) => _$this._sort = sort;

  String? _remark;
  String? get remark => _$this._remark;
  set remark(String? remark) => _$this._remark = remark;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  String? _regionCode;
  String? get regionCode => _$this._regionCode;
  set regionCode(String? regionCode) => _$this._regionCode = regionCode;

  String? _providerCode;
  String? get providerCode => _$this._providerCode;
  set providerCode(String? providerCode) => _$this._providerCode = providerCode;

  AiAdminServicesBillingDtosBillingPlanItemDtoBuilder() {
    AiAdminServicesBillingDtosBillingPlanItemDto._defaults(this);
  }

  AiAdminServicesBillingDtosBillingPlanItemDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _code = $v.code;
      _name = $v.name;
      _planType = $v.planType;
      _includedTokens = $v.includedTokens;
      _bonusTokens = $v.bonusTokens;
      _cycleMonths = $v.cycleMonths;
      _isDefault = $v.isDefault;
      _isEnabled = $v.isEnabled;
      _sort = $v.sort;
      _remark = $v.remark;
      _amount = $v.amount;
      _currencyCode = $v.currencyCode;
      _regionCode = $v.regionCode;
      _providerCode = $v.providerCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesBillingDtosBillingPlanItemDto other) {
    _$v = other as _$AiAdminServicesBillingDtosBillingPlanItemDto;
  }

  @override
  void update(
      void Function(AiAdminServicesBillingDtosBillingPlanItemDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesBillingDtosBillingPlanItemDto build() => _build();

  _$AiAdminServicesBillingDtosBillingPlanItemDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesBillingDtosBillingPlanItemDto._(
          id: id,
          code: code,
          name: name,
          planType: planType,
          includedTokens: includedTokens,
          bonusTokens: bonusTokens,
          cycleMonths: cycleMonths,
          isDefault: isDefault,
          isEnabled: isEnabled,
          sort: sort,
          remark: remark,
          amount: amount,
          currencyCode: currencyCode,
          regionCode: regionCode,
          providerCode: providerCode,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
