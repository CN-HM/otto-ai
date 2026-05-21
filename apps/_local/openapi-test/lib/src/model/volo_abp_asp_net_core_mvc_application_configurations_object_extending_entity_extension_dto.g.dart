// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_asp_net_core_mvc_application_configurations_object_extending_entity_extension_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto
    extends VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto {
  @override
  final BuiltMap<String,
          VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyDto>?
      properties;
  @override
  final BuiltMap<String, JsonObject?>? configuration;

  factory _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto(
          [void Function(
                  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDtoBuilder)?
              updates]) =>
      (VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDtoBuilder()
            ..update(updates))
          ._build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto._(
      {this.properties, this.configuration})
      : super._();
  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto
      rebuild(
              void Function(
                      VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDtoBuilder
      toBuilder() =>
          VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto &&
        properties == other.properties &&
        configuration == other.configuration;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, properties.hashCode);
    _$hash = $jc(_$hash, configuration.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto')
          ..add('properties', properties)
          ..add('configuration', configuration))
        .toString();
  }
}

class VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDtoBuilder
    implements
        Builder<
            VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto,
            VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDtoBuilder> {
  _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto?
      _$v;

  MapBuilder<String,
          VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyDto>?
      _properties;
  MapBuilder<String,
          VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyDto>
      get properties => _$this._properties ??= MapBuilder<String,
          VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyDto>();
  set properties(
          MapBuilder<String,
                  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyDto>?
              properties) =>
      _$this._properties = properties;

  MapBuilder<String, JsonObject?>? _configuration;
  MapBuilder<String, JsonObject?> get configuration =>
      _$this._configuration ??= MapBuilder<String, JsonObject?>();
  set configuration(MapBuilder<String, JsonObject?>? configuration) =>
      _$this._configuration = configuration;

  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDtoBuilder() {
    VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto
        ._defaults(this);
  }

  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDtoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _properties = $v.properties?.toBuilder();
      _configuration = $v.configuration?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto
          other) {
    _$v = other
        as _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto;
  }

  @override
  void update(
      void Function(
              VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto
      build() => _build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto
      _build() {
    _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto
        _$result;
    try {
      _$result = _$v ??
          _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto
              ._(
            properties: _properties?.build(),
            configuration: _configuration?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'properties';
        _properties?.build();
        _$failedField = 'configuration';
        _configuration?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto',
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
