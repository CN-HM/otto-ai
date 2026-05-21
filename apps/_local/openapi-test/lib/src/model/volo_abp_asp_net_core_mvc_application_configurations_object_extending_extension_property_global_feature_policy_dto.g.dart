// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_asp_net_core_mvc_application_configurations_object_extending_extension_property_global_feature_policy_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDto
    extends VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDto {
  @override
  final BuiltList<String>? features;
  @override
  final bool? requiresAll;

  factory _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDto(
          [void Function(
                  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDtoBuilder)?
              updates]) =>
      (VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDtoBuilder()
            ..update(updates))
          ._build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDto._(
      {this.features, this.requiresAll})
      : super._();
  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDto
      rebuild(
              void Function(
                      VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDtoBuilder
      toBuilder() =>
          VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDto &&
        features == other.features &&
        requiresAll == other.requiresAll;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, features.hashCode);
    _$hash = $jc(_$hash, requiresAll.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDto')
          ..add('features', features)
          ..add('requiresAll', requiresAll))
        .toString();
  }
}

class VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDtoBuilder
    implements
        Builder<
            VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDto,
            VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDtoBuilder> {
  _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDto?
      _$v;

  ListBuilder<String>? _features;
  ListBuilder<String> get features =>
      _$this._features ??= ListBuilder<String>();
  set features(ListBuilder<String>? features) => _$this._features = features;

  bool? _requiresAll;
  bool? get requiresAll => _$this._requiresAll;
  set requiresAll(bool? requiresAll) => _$this._requiresAll = requiresAll;

  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDtoBuilder() {
    VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDto
        ._defaults(this);
  }

  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDtoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _features = $v.features?.toBuilder();
      _requiresAll = $v.requiresAll;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDto
          other) {
    _$v = other
        as _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDto;
  }

  @override
  void update(
      void Function(
              VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDto
      build() => _build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDto
      _build() {
    _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDto
        _$result;
    try {
      _$result = _$v ??
          _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDto
              ._(
            features: _features?.build(),
            requiresAll: requiresAll,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'features';
        _features?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDto',
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
