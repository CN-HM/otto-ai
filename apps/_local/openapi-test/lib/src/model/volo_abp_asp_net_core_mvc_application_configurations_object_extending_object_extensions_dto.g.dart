// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_asp_net_core_mvc_application_configurations_object_extending_object_extensions_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto
    extends VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto {
  @override
  final BuiltMap<String,
          VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDto>?
      modules;
  @override
  final BuiltMap<String,
          VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto>?
      enums;

  factory _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto(
          [void Function(
                  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDtoBuilder)?
              updates]) =>
      (VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDtoBuilder()
            ..update(updates))
          ._build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto._(
      {this.modules, this.enums})
      : super._();
  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto
      rebuild(
              void Function(
                      VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDtoBuilder
      toBuilder() =>
          VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto &&
        modules == other.modules &&
        enums == other.enums;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, modules.hashCode);
    _$hash = $jc(_$hash, enums.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto')
          ..add('modules', modules)
          ..add('enums', enums))
        .toString();
  }
}

class VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDtoBuilder
    implements
        Builder<
            VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto,
            VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDtoBuilder> {
  _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto?
      _$v;

  MapBuilder<String,
          VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDto>?
      _modules;
  MapBuilder<String,
          VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDto>
      get modules => _$this._modules ??= MapBuilder<String,
          VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDto>();
  set modules(
          MapBuilder<String,
                  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDto>?
              modules) =>
      _$this._modules = modules;

  MapBuilder<String,
          VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto>?
      _enums;
  MapBuilder<String,
          VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto>
      get enums => _$this._enums ??= MapBuilder<String,
          VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto>();
  set enums(
          MapBuilder<String,
                  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto>?
              enums) =>
      _$this._enums = enums;

  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDtoBuilder() {
    VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto
        ._defaults(this);
  }

  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDtoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _modules = $v.modules?.toBuilder();
      _enums = $v.enums?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto
          other) {
    _$v = other
        as _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto;
  }

  @override
  void update(
      void Function(
              VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto
      build() => _build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto
      _build() {
    _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto
        _$result;
    try {
      _$result = _$v ??
          _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto
              ._(
            modules: _modules?.build(),
            enums: _enums?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'modules';
        _modules?.build();
        _$failedField = 'enums';
        _enums?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto',
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
