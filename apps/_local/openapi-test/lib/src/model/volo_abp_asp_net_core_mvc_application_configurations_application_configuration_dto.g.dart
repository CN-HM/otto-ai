// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_asp_net_core_mvc_application_configurations_application_configuration_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto
    extends VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto {
  @override
  final VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto?
      localization;
  @override
  final VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto?
      auth;
  @override
  final VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto?
      setting;
  @override
  final VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto?
      currentUser;
  @override
  final VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDto?
      features;
  @override
  final VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDto?
      globalFeatures;
  @override
  final VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto? multiTenancy;
  @override
  final VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto? currentTenant;
  @override
  final VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto? timing;
  @override
  final VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto? clock;
  @override
  final VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto?
      objectExtensions;
  @override
  final BuiltMap<String, JsonObject?>? extraProperties;

  factory _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto(
          [void Function(
                  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDtoBuilder)?
              updates]) =>
      (VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDtoBuilder()
            ..update(updates))
          ._build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto._(
      {this.localization,
      this.auth,
      this.setting,
      this.currentUser,
      this.features,
      this.globalFeatures,
      this.multiTenancy,
      this.currentTenant,
      this.timing,
      this.clock,
      this.objectExtensions,
      this.extraProperties})
      : super._();
  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto rebuild(
          void Function(
                  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDtoBuilder
      toBuilder() =>
          VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto &&
        localization == other.localization &&
        auth == other.auth &&
        setting == other.setting &&
        currentUser == other.currentUser &&
        features == other.features &&
        globalFeatures == other.globalFeatures &&
        multiTenancy == other.multiTenancy &&
        currentTenant == other.currentTenant &&
        timing == other.timing &&
        clock == other.clock &&
        objectExtensions == other.objectExtensions &&
        extraProperties == other.extraProperties;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, localization.hashCode);
    _$hash = $jc(_$hash, auth.hashCode);
    _$hash = $jc(_$hash, setting.hashCode);
    _$hash = $jc(_$hash, currentUser.hashCode);
    _$hash = $jc(_$hash, features.hashCode);
    _$hash = $jc(_$hash, globalFeatures.hashCode);
    _$hash = $jc(_$hash, multiTenancy.hashCode);
    _$hash = $jc(_$hash, currentTenant.hashCode);
    _$hash = $jc(_$hash, timing.hashCode);
    _$hash = $jc(_$hash, clock.hashCode);
    _$hash = $jc(_$hash, objectExtensions.hashCode);
    _$hash = $jc(_$hash, extraProperties.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto')
          ..add('localization', localization)
          ..add('auth', auth)
          ..add('setting', setting)
          ..add('currentUser', currentUser)
          ..add('features', features)
          ..add('globalFeatures', globalFeatures)
          ..add('multiTenancy', multiTenancy)
          ..add('currentTenant', currentTenant)
          ..add('timing', timing)
          ..add('clock', clock)
          ..add('objectExtensions', objectExtensions)
          ..add('extraProperties', extraProperties))
        .toString();
  }
}

class VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDtoBuilder
    implements
        Builder<
            VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto,
            VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDtoBuilder> {
  _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto?
      _$v;

  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDtoBuilder?
      _localization;
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDtoBuilder
      get localization => _$this._localization ??=
          VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDtoBuilder();
  set localization(
          VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDtoBuilder?
              localization) =>
      _$this._localization = localization;

  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDtoBuilder?
      _auth;
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDtoBuilder
      get auth => _$this._auth ??=
          VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDtoBuilder();
  set auth(
          VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDtoBuilder?
              auth) =>
      _$this._auth = auth;

  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDtoBuilder?
      _setting;
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDtoBuilder
      get setting => _$this._setting ??=
          VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDtoBuilder();
  set setting(
          VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDtoBuilder?
              setting) =>
      _$this._setting = setting;

  VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDtoBuilder?
      _currentUser;
  VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDtoBuilder
      get currentUser => _$this._currentUser ??=
          VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDtoBuilder();
  set currentUser(
          VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDtoBuilder?
              currentUser) =>
      _$this._currentUser = currentUser;

  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDtoBuilder?
      _features;
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDtoBuilder
      get features => _$this._features ??=
          VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDtoBuilder();
  set features(
          VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDtoBuilder?
              features) =>
      _$this._features = features;

  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDtoBuilder?
      _globalFeatures;
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDtoBuilder
      get globalFeatures => _$this._globalFeatures ??=
          VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDtoBuilder();
  set globalFeatures(
          VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDtoBuilder?
              globalFeatures) =>
      _$this._globalFeatures = globalFeatures;

  VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDtoBuilder? _multiTenancy;
  VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDtoBuilder get multiTenancy =>
      _$this._multiTenancy ??=
          VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDtoBuilder();
  set multiTenancy(
          VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDtoBuilder?
              multiTenancy) =>
      _$this._multiTenancy = multiTenancy;

  VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDtoBuilder? _currentTenant;
  VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDtoBuilder get currentTenant =>
      _$this._currentTenant ??=
          VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDtoBuilder();
  set currentTenant(
          VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDtoBuilder?
              currentTenant) =>
      _$this._currentTenant = currentTenant;

  VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDtoBuilder? _timing;
  VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDtoBuilder get timing =>
      _$this._timing ??=
          VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDtoBuilder();
  set timing(
          VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDtoBuilder?
              timing) =>
      _$this._timing = timing;

  VoloAbpAspNetCoreMvcApplicationConfigurationsClockDtoBuilder? _clock;
  VoloAbpAspNetCoreMvcApplicationConfigurationsClockDtoBuilder get clock =>
      _$this._clock ??=
          VoloAbpAspNetCoreMvcApplicationConfigurationsClockDtoBuilder();
  set clock(
          VoloAbpAspNetCoreMvcApplicationConfigurationsClockDtoBuilder?
              clock) =>
      _$this._clock = clock;

  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDtoBuilder?
      _objectExtensions;
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDtoBuilder
      get objectExtensions => _$this._objectExtensions ??=
          VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDtoBuilder();
  set objectExtensions(
          VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDtoBuilder?
              objectExtensions) =>
      _$this._objectExtensions = objectExtensions;

  MapBuilder<String, JsonObject?>? _extraProperties;
  MapBuilder<String, JsonObject?> get extraProperties =>
      _$this._extraProperties ??= MapBuilder<String, JsonObject?>();
  set extraProperties(MapBuilder<String, JsonObject?>? extraProperties) =>
      _$this._extraProperties = extraProperties;

  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDtoBuilder() {
    VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto
        ._defaults(this);
  }

  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDtoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _localization = $v.localization?.toBuilder();
      _auth = $v.auth?.toBuilder();
      _setting = $v.setting?.toBuilder();
      _currentUser = $v.currentUser?.toBuilder();
      _features = $v.features?.toBuilder();
      _globalFeatures = $v.globalFeatures?.toBuilder();
      _multiTenancy = $v.multiTenancy?.toBuilder();
      _currentTenant = $v.currentTenant?.toBuilder();
      _timing = $v.timing?.toBuilder();
      _clock = $v.clock?.toBuilder();
      _objectExtensions = $v.objectExtensions?.toBuilder();
      _extraProperties = $v.extraProperties?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto
          other) {
    _$v = other
        as _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto;
  }

  @override
  void update(
      void Function(
              VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto
      build() => _build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto
      _build() {
    _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto
        _$result;
    try {
      _$result = _$v ??
          _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto
              ._(
            localization: _localization?.build(),
            auth: _auth?.build(),
            setting: _setting?.build(),
            currentUser: _currentUser?.build(),
            features: _features?.build(),
            globalFeatures: _globalFeatures?.build(),
            multiTenancy: _multiTenancy?.build(),
            currentTenant: _currentTenant?.build(),
            timing: _timing?.build(),
            clock: _clock?.build(),
            objectExtensions: _objectExtensions?.build(),
            extraProperties: _extraProperties?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'localization';
        _localization?.build();
        _$failedField = 'auth';
        _auth?.build();
        _$failedField = 'setting';
        _setting?.build();
        _$failedField = 'currentUser';
        _currentUser?.build();
        _$failedField = 'features';
        _features?.build();
        _$failedField = 'globalFeatures';
        _globalFeatures?.build();
        _$failedField = 'multiTenancy';
        _multiTenancy?.build();
        _$failedField = 'currentTenant';
        _currentTenant?.build();
        _$failedField = 'timing';
        _timing?.build();
        _$failedField = 'clock';
        _clock?.build();
        _$failedField = 'objectExtensions';
        _objectExtensions?.build();
        _$failedField = 'extraProperties';
        _extraProperties?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
