// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_billing_dtos_admin_billing_usage_item_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesBillingDtosAdminBillingUsageItemDto
    extends AiAdminServicesBillingDtosAdminBillingUsageItemDto {
  @override
  final String? id;
  @override
  final int? userId;
  @override
  final String? username;
  @override
  final String? mobile;
  @override
  final String? agentId;
  @override
  final String? deviceId;
  @override
  final String? sessionId;
  @override
  final String? serviceType;
  @override
  final String? providerCode;
  @override
  final String? unitType;
  @override
  final double? rawUnits;
  @override
  final int? normalizedTokens;
  @override
  final String? chargeStatus;
  @override
  final String? happenedAt;

  factory _$AiAdminServicesBillingDtosAdminBillingUsageItemDto(
          [void Function(
                  AiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder)?
              updates]) =>
      (AiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesBillingDtosAdminBillingUsageItemDto._(
      {this.id,
      this.userId,
      this.username,
      this.mobile,
      this.agentId,
      this.deviceId,
      this.sessionId,
      this.serviceType,
      this.providerCode,
      this.unitType,
      this.rawUnits,
      this.normalizedTokens,
      this.chargeStatus,
      this.happenedAt})
      : super._();
  @override
  AiAdminServicesBillingDtosAdminBillingUsageItemDto rebuild(
          void Function(
                  AiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder toBuilder() =>
      AiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesBillingDtosAdminBillingUsageItemDto &&
        id == other.id &&
        userId == other.userId &&
        username == other.username &&
        mobile == other.mobile &&
        agentId == other.agentId &&
        deviceId == other.deviceId &&
        sessionId == other.sessionId &&
        serviceType == other.serviceType &&
        providerCode == other.providerCode &&
        unitType == other.unitType &&
        rawUnits == other.rawUnits &&
        normalizedTokens == other.normalizedTokens &&
        chargeStatus == other.chargeStatus &&
        happenedAt == other.happenedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, mobile.hashCode);
    _$hash = $jc(_$hash, agentId.hashCode);
    _$hash = $jc(_$hash, deviceId.hashCode);
    _$hash = $jc(_$hash, sessionId.hashCode);
    _$hash = $jc(_$hash, serviceType.hashCode);
    _$hash = $jc(_$hash, providerCode.hashCode);
    _$hash = $jc(_$hash, unitType.hashCode);
    _$hash = $jc(_$hash, rawUnits.hashCode);
    _$hash = $jc(_$hash, normalizedTokens.hashCode);
    _$hash = $jc(_$hash, chargeStatus.hashCode);
    _$hash = $jc(_$hash, happenedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesBillingDtosAdminBillingUsageItemDto')
          ..add('id', id)
          ..add('userId', userId)
          ..add('username', username)
          ..add('mobile', mobile)
          ..add('agentId', agentId)
          ..add('deviceId', deviceId)
          ..add('sessionId', sessionId)
          ..add('serviceType', serviceType)
          ..add('providerCode', providerCode)
          ..add('unitType', unitType)
          ..add('rawUnits', rawUnits)
          ..add('normalizedTokens', normalizedTokens)
          ..add('chargeStatus', chargeStatus)
          ..add('happenedAt', happenedAt))
        .toString();
  }
}

class AiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder
    implements
        Builder<AiAdminServicesBillingDtosAdminBillingUsageItemDto,
            AiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder> {
  _$AiAdminServicesBillingDtosAdminBillingUsageItemDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _mobile;
  String? get mobile => _$this._mobile;
  set mobile(String? mobile) => _$this._mobile = mobile;

  String? _agentId;
  String? get agentId => _$this._agentId;
  set agentId(String? agentId) => _$this._agentId = agentId;

  String? _deviceId;
  String? get deviceId => _$this._deviceId;
  set deviceId(String? deviceId) => _$this._deviceId = deviceId;

  String? _sessionId;
  String? get sessionId => _$this._sessionId;
  set sessionId(String? sessionId) => _$this._sessionId = sessionId;

  String? _serviceType;
  String? get serviceType => _$this._serviceType;
  set serviceType(String? serviceType) => _$this._serviceType = serviceType;

  String? _providerCode;
  String? get providerCode => _$this._providerCode;
  set providerCode(String? providerCode) => _$this._providerCode = providerCode;

  String? _unitType;
  String? get unitType => _$this._unitType;
  set unitType(String? unitType) => _$this._unitType = unitType;

  double? _rawUnits;
  double? get rawUnits => _$this._rawUnits;
  set rawUnits(double? rawUnits) => _$this._rawUnits = rawUnits;

  int? _normalizedTokens;
  int? get normalizedTokens => _$this._normalizedTokens;
  set normalizedTokens(int? normalizedTokens) =>
      _$this._normalizedTokens = normalizedTokens;

  String? _chargeStatus;
  String? get chargeStatus => _$this._chargeStatus;
  set chargeStatus(String? chargeStatus) => _$this._chargeStatus = chargeStatus;

  String? _happenedAt;
  String? get happenedAt => _$this._happenedAt;
  set happenedAt(String? happenedAt) => _$this._happenedAt = happenedAt;

  AiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder() {
    AiAdminServicesBillingDtosAdminBillingUsageItemDto._defaults(this);
  }

  AiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _userId = $v.userId;
      _username = $v.username;
      _mobile = $v.mobile;
      _agentId = $v.agentId;
      _deviceId = $v.deviceId;
      _sessionId = $v.sessionId;
      _serviceType = $v.serviceType;
      _providerCode = $v.providerCode;
      _unitType = $v.unitType;
      _rawUnits = $v.rawUnits;
      _normalizedTokens = $v.normalizedTokens;
      _chargeStatus = $v.chargeStatus;
      _happenedAt = $v.happenedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesBillingDtosAdminBillingUsageItemDto other) {
    _$v = other as _$AiAdminServicesBillingDtosAdminBillingUsageItemDto;
  }

  @override
  void update(
      void Function(AiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesBillingDtosAdminBillingUsageItemDto build() => _build();

  _$AiAdminServicesBillingDtosAdminBillingUsageItemDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesBillingDtosAdminBillingUsageItemDto._(
          id: id,
          userId: userId,
          username: username,
          mobile: mobile,
          agentId: agentId,
          deviceId: deviceId,
          sessionId: sessionId,
          serviceType: serviceType,
          providerCode: providerCode,
          unitType: unitType,
          rawUnits: rawUnits,
          normalizedTokens: normalizedTokens,
          chargeStatus: chargeStatus,
          happenedAt: happenedAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
