// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_asp_net_core_mvc_application_configurations_application_global_feature_configuration_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDto
    extends VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDto {
  @override
  final BuiltSet<String>? enabledFeatures;

  factory _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDto(
          [void Function(
                  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDtoBuilder)?
              updates]) =>
      (VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDtoBuilder()
            ..update(updates))
          ._build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDto._(
      {this.enabledFeatures})
      : super._();
  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDto
      rebuild(
              void Function(
                      VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDtoBuilder
      toBuilder() =>
          VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDto &&
        enabledFeatures == other.enabledFeatures;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabledFeatures.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDto')
          ..add('enabledFeatures', enabledFeatures))
        .toString();
  }
}

class VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDtoBuilder
    implements
        Builder<
            VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDto,
            VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDtoBuilder> {
  _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDto?
      _$v;

  SetBuilder<String>? _enabledFeatures;
  SetBuilder<String> get enabledFeatures =>
      _$this._enabledFeatures ??= SetBuilder<String>();
  set enabledFeatures(SetBuilder<String>? enabledFeatures) =>
      _$this._enabledFeatures = enabledFeatures;

  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDtoBuilder() {
    VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDto
        ._defaults(this);
  }

  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDtoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabledFeatures = $v.enabledFeatures?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDto
          other) {
    _$v = other
        as _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDto;
  }

  @override
  void update(
      void Function(
              VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDto
      build() => _build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDto
      _build() {
    _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDto
        _$result;
    try {
      _$result = _$v ??
          _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDto
              ._(
            enabledFeatures: _enabledFeatures?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'enabledFeatures';
        _enabledFeatures?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDto',
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
