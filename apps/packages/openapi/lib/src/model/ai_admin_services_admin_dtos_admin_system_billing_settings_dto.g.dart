// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_admin_dtos_admin_system_billing_settings_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAdminDtosAdminSystemBillingSettingsDto
    extends AiAdminServicesAdminDtosAdminSystemBillingSettingsDto {
  @override
  final String? defaultPlanCode;
  @override
  final String? resetTimezone;
  @override
  final double? lowBalanceRatio;
  @override
  final int? exhaustionRemindCooldownHours;

  factory _$AiAdminServicesAdminDtosAdminSystemBillingSettingsDto(
          [void Function(
                  AiAdminServicesAdminDtosAdminSystemBillingSettingsDtoBuilder)?
              updates]) =>
      (AiAdminServicesAdminDtosAdminSystemBillingSettingsDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesAdminDtosAdminSystemBillingSettingsDto._(
      {this.defaultPlanCode,
      this.resetTimezone,
      this.lowBalanceRatio,
      this.exhaustionRemindCooldownHours})
      : super._();
  @override
  AiAdminServicesAdminDtosAdminSystemBillingSettingsDto rebuild(
          void Function(
                  AiAdminServicesAdminDtosAdminSystemBillingSettingsDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAdminDtosAdminSystemBillingSettingsDtoBuilder toBuilder() =>
      AiAdminServicesAdminDtosAdminSystemBillingSettingsDtoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAdminDtosAdminSystemBillingSettingsDto &&
        defaultPlanCode == other.defaultPlanCode &&
        resetTimezone == other.resetTimezone &&
        lowBalanceRatio == other.lowBalanceRatio &&
        exhaustionRemindCooldownHours == other.exhaustionRemindCooldownHours;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, defaultPlanCode.hashCode);
    _$hash = $jc(_$hash, resetTimezone.hashCode);
    _$hash = $jc(_$hash, lowBalanceRatio.hashCode);
    _$hash = $jc(_$hash, exhaustionRemindCooldownHours.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesAdminDtosAdminSystemBillingSettingsDto')
          ..add('defaultPlanCode', defaultPlanCode)
          ..add('resetTimezone', resetTimezone)
          ..add('lowBalanceRatio', lowBalanceRatio)
          ..add('exhaustionRemindCooldownHours', exhaustionRemindCooldownHours))
        .toString();
  }
}

class AiAdminServicesAdminDtosAdminSystemBillingSettingsDtoBuilder
    implements
        Builder<AiAdminServicesAdminDtosAdminSystemBillingSettingsDto,
            AiAdminServicesAdminDtosAdminSystemBillingSettingsDtoBuilder> {
  _$AiAdminServicesAdminDtosAdminSystemBillingSettingsDto? _$v;

  String? _defaultPlanCode;
  String? get defaultPlanCode => _$this._defaultPlanCode;
  set defaultPlanCode(String? defaultPlanCode) =>
      _$this._defaultPlanCode = defaultPlanCode;

  String? _resetTimezone;
  String? get resetTimezone => _$this._resetTimezone;
  set resetTimezone(String? resetTimezone) =>
      _$this._resetTimezone = resetTimezone;

  double? _lowBalanceRatio;
  double? get lowBalanceRatio => _$this._lowBalanceRatio;
  set lowBalanceRatio(double? lowBalanceRatio) =>
      _$this._lowBalanceRatio = lowBalanceRatio;

  int? _exhaustionRemindCooldownHours;
  int? get exhaustionRemindCooldownHours =>
      _$this._exhaustionRemindCooldownHours;
  set exhaustionRemindCooldownHours(int? exhaustionRemindCooldownHours) =>
      _$this._exhaustionRemindCooldownHours = exhaustionRemindCooldownHours;

  AiAdminServicesAdminDtosAdminSystemBillingSettingsDtoBuilder() {
    AiAdminServicesAdminDtosAdminSystemBillingSettingsDto._defaults(this);
  }

  AiAdminServicesAdminDtosAdminSystemBillingSettingsDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _defaultPlanCode = $v.defaultPlanCode;
      _resetTimezone = $v.resetTimezone;
      _lowBalanceRatio = $v.lowBalanceRatio;
      _exhaustionRemindCooldownHours = $v.exhaustionRemindCooldownHours;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAdminDtosAdminSystemBillingSettingsDto other) {
    _$v = other as _$AiAdminServicesAdminDtosAdminSystemBillingSettingsDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesAdminDtosAdminSystemBillingSettingsDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAdminDtosAdminSystemBillingSettingsDto build() => _build();

  _$AiAdminServicesAdminDtosAdminSystemBillingSettingsDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesAdminDtosAdminSystemBillingSettingsDto._(
          defaultPlanCode: defaultPlanCode,
          resetTimezone: resetTimezone,
          lowBalanceRatio: lowBalanceRatio,
          exhaustionRemindCooldownHours: exhaustionRemindCooldownHours,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
