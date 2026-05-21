// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_asp_net_core_mvc_application_configurations_application_localization_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto
    extends VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto {
  @override
  final BuiltMap<String,
          VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto>?
      resources;
  @override
  final VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDto?
      currentCulture;

  factory _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto(
          [void Function(
                  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDtoBuilder)?
              updates]) =>
      (VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDtoBuilder()
            ..update(updates))
          ._build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto._(
      {this.resources, this.currentCulture})
      : super._();
  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto rebuild(
          void Function(
                  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDtoBuilder
      toBuilder() =>
          VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto &&
        resources == other.resources &&
        currentCulture == other.currentCulture;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, resources.hashCode);
    _$hash = $jc(_$hash, currentCulture.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto')
          ..add('resources', resources)
          ..add('currentCulture', currentCulture))
        .toString();
  }
}

class VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDtoBuilder
    implements
        Builder<
            VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto,
            VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDtoBuilder> {
  _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto?
      _$v;

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

  VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDtoBuilder?
      _currentCulture;
  VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDtoBuilder
      get currentCulture => _$this._currentCulture ??=
          VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDtoBuilder();
  set currentCulture(
          VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDtoBuilder?
              currentCulture) =>
      _$this._currentCulture = currentCulture;

  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDtoBuilder() {
    VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto
        ._defaults(this);
  }

  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDtoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _resources = $v.resources?.toBuilder();
      _currentCulture = $v.currentCulture?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto
          other) {
    _$v = other
        as _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto;
  }

  @override
  void update(
      void Function(
              VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto
      build() => _build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto
      _build() {
    _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto
        _$result;
    try {
      _$result = _$v ??
          _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto
              ._(
            resources: _resources?.build(),
            currentCulture: _currentCulture?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'resources';
        _resources?.build();
        _$failedField = 'currentCulture';
        _currentCulture?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto',
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
