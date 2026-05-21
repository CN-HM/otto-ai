// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_asp_net_core_mvc_application_configurations_object_extending_module_extension_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDto
    extends VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDto {
  @override
  final BuiltMap<String,
          VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto>?
      entities;
  @override
  final BuiltMap<String, JsonObject?>? configuration;

  factory _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDto(
          [void Function(
                  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDtoBuilder)?
              updates]) =>
      (VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDtoBuilder()
            ..update(updates))
          ._build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDto._(
      {this.entities, this.configuration})
      : super._();
  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDto
      rebuild(
              void Function(
                      VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDtoBuilder
      toBuilder() =>
          VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDto &&
        entities == other.entities &&
        configuration == other.configuration;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, entities.hashCode);
    _$hash = $jc(_$hash, configuration.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDto')
          ..add('entities', entities)
          ..add('configuration', configuration))
        .toString();
  }
}

class VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDtoBuilder
    implements
        Builder<
            VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDto,
            VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDtoBuilder> {
  _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDto?
      _$v;

  MapBuilder<String,
          VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto>?
      _entities;
  MapBuilder<String,
          VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto>
      get entities => _$this._entities ??= MapBuilder<String,
          VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto>();
  set entities(
          MapBuilder<String,
                  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto>?
              entities) =>
      _$this._entities = entities;

  MapBuilder<String, JsonObject?>? _configuration;
  MapBuilder<String, JsonObject?> get configuration =>
      _$this._configuration ??= MapBuilder<String, JsonObject?>();
  set configuration(MapBuilder<String, JsonObject?>? configuration) =>
      _$this._configuration = configuration;

  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDtoBuilder() {
    VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDto
        ._defaults(this);
  }

  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDtoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _entities = $v.entities?.toBuilder();
      _configuration = $v.configuration?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDto
          other) {
    _$v = other
        as _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDto;
  }

  @override
  void update(
      void Function(
              VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDto
      build() => _build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDto
      _build() {
    _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDto
        _$result;
    try {
      _$result = _$v ??
          _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDto
              ._(
            entities: _entities?.build(),
            configuration: _configuration?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'entities';
        _entities?.build();
        _$failedField = 'configuration';
        _configuration?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDto',
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
