// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_asp_net_core_mvc_application_configurations_application_localization_configuration_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto
    extends VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto {
  @override
  final BuiltMap<String, BuiltMap<String, String>>? values;
  @override
  final BuiltMap<String,
          VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto>?
      resources;
  @override
  final BuiltList<VoloAbpLocalizationLanguageInfo>? languages;
  @override
  final VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDto?
      currentCulture;
  @override
  final String? defaultResourceName;
  @override
  final BuiltMap<String, BuiltList<VoloAbpNameValue>>? languagesMap;
  @override
  final BuiltMap<String, BuiltList<VoloAbpNameValue>>? languageFilesMap;

  factory _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto(
          [void Function(
                  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDtoBuilder)?
              updates]) =>
      (VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDtoBuilder()
            ..update(updates))
          ._build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto._(
      {this.values,
      this.resources,
      this.languages,
      this.currentCulture,
      this.defaultResourceName,
      this.languagesMap,
      this.languageFilesMap})
      : super._();
  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto
      rebuild(
              void Function(
                      VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDtoBuilder
      toBuilder() =>
          VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto &&
        values == other.values &&
        resources == other.resources &&
        languages == other.languages &&
        currentCulture == other.currentCulture &&
        defaultResourceName == other.defaultResourceName &&
        languagesMap == other.languagesMap &&
        languageFilesMap == other.languageFilesMap;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, values.hashCode);
    _$hash = $jc(_$hash, resources.hashCode);
    _$hash = $jc(_$hash, languages.hashCode);
    _$hash = $jc(_$hash, currentCulture.hashCode);
    _$hash = $jc(_$hash, defaultResourceName.hashCode);
    _$hash = $jc(_$hash, languagesMap.hashCode);
    _$hash = $jc(_$hash, languageFilesMap.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto')
          ..add('values', values)
          ..add('resources', resources)
          ..add('languages', languages)
          ..add('currentCulture', currentCulture)
          ..add('defaultResourceName', defaultResourceName)
          ..add('languagesMap', languagesMap)
          ..add('languageFilesMap', languageFilesMap))
        .toString();
  }
}

class VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDtoBuilder
    implements
        Builder<
            VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto,
            VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDtoBuilder> {
  _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto?
      _$v;

  MapBuilder<String, BuiltMap<String, String>>? _values;
  MapBuilder<String, BuiltMap<String, String>> get values =>
      _$this._values ??= MapBuilder<String, BuiltMap<String, String>>();
  set values(MapBuilder<String, BuiltMap<String, String>>? values) =>
      _$this._values = values;

  MapBuilder<String,
          VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto>?
      _resources;
  MapBuilder<String,
          VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto>
      get resources => _$this._resources ??= MapBuilder<String,
          VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto>();
  set resources(
          MapBuilder<String,
                  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto>?
              resources) =>
      _$this._resources = resources;

  ListBuilder<VoloAbpLocalizationLanguageInfo>? _languages;
  ListBuilder<VoloAbpLocalizationLanguageInfo> get languages =>
      _$this._languages ??= ListBuilder<VoloAbpLocalizationLanguageInfo>();
  set languages(ListBuilder<VoloAbpLocalizationLanguageInfo>? languages) =>
      _$this._languages = languages;

  VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDtoBuilder?
      _currentCulture;
  VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDtoBuilder
      get currentCulture => _$this._currentCulture ??=
          VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDtoBuilder();
  set currentCulture(
          VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDtoBuilder?
              currentCulture) =>
      _$this._currentCulture = currentCulture;

  String? _defaultResourceName;
  String? get defaultResourceName => _$this._defaultResourceName;
  set defaultResourceName(String? defaultResourceName) =>
      _$this._defaultResourceName = defaultResourceName;

  MapBuilder<String, BuiltList<VoloAbpNameValue>>? _languagesMap;
  MapBuilder<String, BuiltList<VoloAbpNameValue>> get languagesMap =>
      _$this._languagesMap ??=
          MapBuilder<String, BuiltList<VoloAbpNameValue>>();
  set languagesMap(
          MapBuilder<String, BuiltList<VoloAbpNameValue>>? languagesMap) =>
      _$this._languagesMap = languagesMap;

  MapBuilder<String, BuiltList<VoloAbpNameValue>>? _languageFilesMap;
  MapBuilder<String, BuiltList<VoloAbpNameValue>> get languageFilesMap =>
      _$this._languageFilesMap ??=
          MapBuilder<String, BuiltList<VoloAbpNameValue>>();
  set languageFilesMap(
          MapBuilder<String, BuiltList<VoloAbpNameValue>>? languageFilesMap) =>
      _$this._languageFilesMap = languageFilesMap;

  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDtoBuilder() {
    VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto
        ._defaults(this);
  }

  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDtoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _values = $v.values?.toBuilder();
      _resources = $v.resources?.toBuilder();
      _languages = $v.languages?.toBuilder();
      _currentCulture = $v.currentCulture?.toBuilder();
      _defaultResourceName = $v.defaultResourceName;
      _languagesMap = $v.languagesMap?.toBuilder();
      _languageFilesMap = $v.languageFilesMap?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto
          other) {
    _$v = other
        as _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto;
  }

  @override
  void update(
      void Function(
              VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto
      build() => _build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto
      _build() {
    _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto
        _$result;
    try {
      _$result = _$v ??
          _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto
              ._(
            values: _values?.build(),
            resources: _resources?.build(),
            languages: _languages?.build(),
            currentCulture: _currentCulture?.build(),
            defaultResourceName: defaultResourceName,
            languagesMap: _languagesMap?.build(),
            languageFilesMap: _languageFilesMap?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'values';
        _values?.build();
        _$failedField = 'resources';
        _resources?.build();
        _$failedField = 'languages';
        _languages?.build();
        _$failedField = 'currentCulture';
        _currentCulture?.build();

        _$failedField = 'languagesMap';
        _languagesMap?.build();
        _$failedField = 'languageFilesMap';
        _languageFilesMap?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto',
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
