// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_billing_dtos_billing_usage_report_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesBillingDtosBillingUsageReportDto
    extends AiAdminServicesBillingDtosBillingUsageReportDto {
  @override
  final String? macAddress;
  @override
  final String? sessionId;
  @override
  final String? serviceType;
  @override
  final String? providerCode;
  @override
  final String? modelConfigId;
  @override
  final String? unitType;
  @override
  final double? rawUnits;
  @override
  final int? normalizedTokens;
  @override
  final String? rawUsageJson;
  @override
  final String? idempotencyKey;
  @override
  final int? reportTime;

  factory _$AiAdminServicesBillingDtosBillingUsageReportDto(
          [void Function(
                  AiAdminServicesBillingDtosBillingUsageReportDtoBuilder)?
              updates]) =>
      (AiAdminServicesBillingDtosBillingUsageReportDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesBillingDtosBillingUsageReportDto._(
      {this.macAddress,
      this.sessionId,
      this.serviceType,
      this.providerCode,
      this.modelConfigId,
      this.unitType,
      this.rawUnits,
      this.normalizedTokens,
      this.rawUsageJson,
      this.idempotencyKey,
      this.reportTime})
      : super._();
  @override
  AiAdminServicesBillingDtosBillingUsageReportDto rebuild(
          void Function(AiAdminServicesBillingDtosBillingUsageReportDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesBillingDtosBillingUsageReportDtoBuilder toBuilder() =>
      AiAdminServicesBillingDtosBillingUsageReportDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesBillingDtosBillingUsageReportDto &&
        macAddress == other.macAddress &&
        sessionId == other.sessionId &&
        serviceType == other.serviceType &&
        providerCode == other.providerCode &&
        modelConfigId == other.modelConfigId &&
        unitType == other.unitType &&
        rawUnits == other.rawUnits &&
        normalizedTokens == other.normalizedTokens &&
        rawUsageJson == other.rawUsageJson &&
        idempotencyKey == other.idempotencyKey &&
        reportTime == other.reportTime;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, macAddress.hashCode);
    _$hash = $jc(_$hash, sessionId.hashCode);
    _$hash = $jc(_$hash, serviceType.hashCode);
    _$hash = $jc(_$hash, providerCode.hashCode);
    _$hash = $jc(_$hash, modelConfigId.hashCode);
    _$hash = $jc(_$hash, unitType.hashCode);
    _$hash = $jc(_$hash, rawUnits.hashCode);
    _$hash = $jc(_$hash, normalizedTokens.hashCode);
    _$hash = $jc(_$hash, rawUsageJson.hashCode);
    _$hash = $jc(_$hash, idempotencyKey.hashCode);
    _$hash = $jc(_$hash, reportTime.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesBillingDtosBillingUsageReportDto')
          ..add('macAddress', macAddress)
          ..add('sessionId', sessionId)
          ..add('serviceType', serviceType)
          ..add('providerCode', providerCode)
          ..add('modelConfigId', modelConfigId)
          ..add('unitType', unitType)
          ..add('rawUnits', rawUnits)
          ..add('normalizedTokens', normalizedTokens)
          ..add('rawUsageJson', rawUsageJson)
          ..add('idempotencyKey', idempotencyKey)
          ..add('reportTime', reportTime))
        .toString();
  }
}

class AiAdminServicesBillingDtosBillingUsageReportDtoBuilder
    implements
        Builder<AiAdminServicesBillingDtosBillingUsageReportDto,
            AiAdminServicesBillingDtosBillingUsageReportDtoBuilder> {
  _$AiAdminServicesBillingDtosBillingUsageReportDto? _$v;

  String? _macAddress;
  String? get macAddress => _$this._macAddress;
  set macAddress(String? macAddress) => _$this._macAddress = macAddress;

  String? _sessionId;
  String? get sessionId => _$this._sessionId;
  set sessionId(String? sessionId) => _$this._sessionId = sessionId;

  String? _serviceType;
  String? get serviceType => _$this._serviceType;
  set serviceType(String? serviceType) => _$this._serviceType = serviceType;

  String? _providerCode;
  String? get providerCode => _$this._providerCode;
  set providerCode(String? providerCode) => _$this._providerCode = providerCode;

  String? _modelConfigId;
  String? get modelConfigId => _$this._modelConfigId;
  set modelConfigId(String? modelConfigId) =>
      _$this._modelConfigId = modelConfigId;

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

  String? _rawUsageJson;
  String? get rawUsageJson => _$this._rawUsageJson;
  set rawUsageJson(String? rawUsageJson) => _$this._rawUsageJson = rawUsageJson;

  String? _idempotencyKey;
  String? get idempotencyKey => _$this._idempotencyKey;
  set idempotencyKey(String? idempotencyKey) =>
      _$this._idempotencyKey = idempotencyKey;

  int? _reportTime;
  int? get reportTime => _$this._reportTime;
  set reportTime(int? reportTime) => _$this._reportTime = reportTime;

  AiAdminServicesBillingDtosBillingUsageReportDtoBuilder() {
    AiAdminServicesBillingDtosBillingUsageReportDto._defaults(this);
  }

  AiAdminServicesBillingDtosBillingUsageReportDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _macAddress = $v.macAddress;
      _sessionId = $v.sessionId;
      _serviceType = $v.serviceType;
      _providerCode = $v.providerCode;
      _modelConfigId = $v.modelConfigId;
      _unitType = $v.unitType;
      _rawUnits = $v.rawUnits;
      _normalizedTokens = $v.normalizedTokens;
      _rawUsageJson = $v.rawUsageJson;
      _idempotencyKey = $v.idempotencyKey;
      _reportTime = $v.reportTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesBillingDtosBillingUsageReportDto other) {
    _$v = other as _$AiAdminServicesBillingDtosBillingUsageReportDto;
  }

  @override
  void update(
      void Function(AiAdminServicesBillingDtosBillingUsageReportDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesBillingDtosBillingUsageReportDto build() => _build();

  _$AiAdminServicesBillingDtosBillingUsageReportDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesBillingDtosBillingUsageReportDto._(
          macAddress: macAddress,
          sessionId: sessionId,
          serviceType: serviceType,
          providerCode: providerCode,
          modelConfigId: modelConfigId,
          unitType: unitType,
          rawUnits: rawUnits,
          normalizedTokens: normalizedTokens,
          rawUsageJson: rawUsageJson,
          idempotencyKey: idempotencyKey,
          reportTime: reportTime,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
