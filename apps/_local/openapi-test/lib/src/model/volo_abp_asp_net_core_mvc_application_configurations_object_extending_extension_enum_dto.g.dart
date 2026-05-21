// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_asp_net_core_mvc_application_configurations_object_extending_extension_enum_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto
    extends VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto {
  @override
  final BuiltList<
          VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumFieldDto>?
      fields;
  @override
  final String? localizationResource;

  factory _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto(
          [void Function(
                  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDtoBuilder)?
              updates]) =>
      (VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDtoBuilder()
            ..update(updates))
          ._build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto._(
      {this.fields, this.localizationResource})
      : super._();
  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto
      rebuild(
              void Function(
                      VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDtoBuilder
      toBuilder() =>
          VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto &&
        fields == other.fields &&
        localizationResource == other.localizationResource;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, fields.hashCode);
    _$hash = $jc(_$hash, localizationResource.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto')
          ..add('fields', fields)
          ..add('localizationResource', localizationResource))
        .toString();
  }
}

class VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDtoBuilder
    implements
        Builder<
            VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto,
            VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDtoBuilder> {
  _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto?
      _$v;

  ListBuilder<
          VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumFieldDto>?
      _fields;
  ListBuilder<
          VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumFieldDto>
      get fields => _$this._fields ??= ListBuilder<
          VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumFieldDto>();
  set fields(
          ListBuilder<
                  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumFieldDto>?
              fields) =>
      _$this._fields = fields;

  String? _localizationResource;
  String? get localizationResource => _$this._localizationResource;
  set localizationResource(String? localizationResource) =>
      _$this._localizationResource = localizationResource;

  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDtoBuilder() {
    VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto
        ._defaults(this);
  }

  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDtoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _fields = $v.fields?.toBuilder();
      _localizationResource = $v.localizationResource;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto
          other) {
    _$v = other
        as _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto;
  }

  @override
  void update(
      void Function(
              VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto
      build() => _build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto
      _build() {
    _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto
        _$result;
    try {
      _$result = _$v ??
          _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto
              ._(
            fields: _fields?.build(),
            localizationResource: localizationResource,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'fields';
        _fields?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto',
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
