// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_asp_net_core_mvc_application_configurations_application_feature_configuration_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDto
    extends VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDto {
  @override
  final BuiltMap<String, String?>? values;

  factory _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDto(
          [void Function(
                  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDtoBuilder)?
              updates]) =>
      (VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDtoBuilder()
            ..update(updates))
          ._build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDto._(
      {this.values})
      : super._();
  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDto
      rebuild(
              void Function(
                      VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDtoBuilder
      toBuilder() =>
          VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDto &&
        values == other.values;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, values.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDto')
          ..add('values', values))
        .toString();
  }
}

class VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDtoBuilder
    implements
        Builder<
            VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDto,
            VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDtoBuilder> {
  _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDto?
      _$v;

  MapBuilder<String, String?>? _values;
  MapBuilder<String, String?> get values =>
      _$this._values ??= MapBuilder<String, String?>();
  set values(MapBuilder<String, String?>? values) => _$this._values = values;

  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDtoBuilder() {
    VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDto
        ._defaults(this);
  }

  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDtoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _values = $v.values?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDto
          other) {
    _$v = other
        as _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDto;
  }

  @override
  void update(
      void Function(
              VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDto
      build() => _build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDto
      _build() {
    _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDto
        _$result;
    try {
      _$result = _$v ??
          _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDto
              ._(
            values: _values?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'values';
        _values?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDto',
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
