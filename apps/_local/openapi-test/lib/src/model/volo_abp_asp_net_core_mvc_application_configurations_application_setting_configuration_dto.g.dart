// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_asp_net_core_mvc_application_configurations_application_setting_configuration_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto
    extends VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto {
  @override
  final BuiltMap<String, String?>? values;

  factory _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto(
          [void Function(
                  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDtoBuilder)?
              updates]) =>
      (VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDtoBuilder()
            ..update(updates))
          ._build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto._(
      {this.values})
      : super._();
  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto
      rebuild(
              void Function(
                      VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDtoBuilder
      toBuilder() =>
          VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto &&
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
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto')
          ..add('values', values))
        .toString();
  }
}

class VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDtoBuilder
    implements
        Builder<
            VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto,
            VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDtoBuilder> {
  _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto?
      _$v;

  MapBuilder<String, String?>? _values;
  MapBuilder<String, String?> get values =>
      _$this._values ??= MapBuilder<String, String?>();
  set values(MapBuilder<String, String?>? values) => _$this._values = values;

  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDtoBuilder() {
    VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto
        ._defaults(this);
  }

  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDtoBuilder
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
      VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto
          other) {
    _$v = other
        as _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto;
  }

  @override
  void update(
      void Function(
              VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto
      build() => _build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto
      _build() {
    _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto
        _$result;
    try {
      _$result = _$v ??
          _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto
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
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto',
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
