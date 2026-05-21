// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_asp_net_core_mvc_application_configurations_application_localization_resource_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto
    extends VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto {
  @override
  final BuiltMap<String, String>? texts;
  @override
  final BuiltList<String>? baseResources;

  factory _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto(
          [void Function(
                  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDtoBuilder)?
              updates]) =>
      (VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDtoBuilder()
            ..update(updates))
          ._build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto._(
      {this.texts, this.baseResources})
      : super._();
  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto
      rebuild(
              void Function(
                      VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDtoBuilder
      toBuilder() =>
          VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto &&
        texts == other.texts &&
        baseResources == other.baseResources;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, texts.hashCode);
    _$hash = $jc(_$hash, baseResources.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto')
          ..add('texts', texts)
          ..add('baseResources', baseResources))
        .toString();
  }
}

class VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDtoBuilder
    implements
        Builder<
            VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto,
            VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDtoBuilder> {
  _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto?
      _$v;

  MapBuilder<String, String>? _texts;
  MapBuilder<String, String> get texts =>
      _$this._texts ??= MapBuilder<String, String>();
  set texts(MapBuilder<String, String>? texts) => _$this._texts = texts;

  ListBuilder<String>? _baseResources;
  ListBuilder<String> get baseResources =>
      _$this._baseResources ??= ListBuilder<String>();
  set baseResources(ListBuilder<String>? baseResources) =>
      _$this._baseResources = baseResources;

  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDtoBuilder() {
    VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto
        ._defaults(this);
  }

  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDtoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _texts = $v.texts?.toBuilder();
      _baseResources = $v.baseResources?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto
          other) {
    _$v = other
        as _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto;
  }

  @override
  void update(
      void Function(
              VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto
      build() => _build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto
      _build() {
    _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto
        _$result;
    try {
      _$result = _$v ??
          _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto
              ._(
            texts: _texts?.build(),
            baseResources: _baseResources?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'texts';
        _texts?.build();
        _$failedField = 'baseResources';
        _baseResources?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto',
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
