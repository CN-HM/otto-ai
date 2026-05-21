// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_asp_net_core_mvc_application_configurations_object_extending_extension_property_feature_policy_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDto
    extends VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDto {
  @override
  final BuiltList<String>? features;
  @override
  final bool? requiresAll;

  factory _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDto(
          [void Function(
                  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDtoBuilder)?
              updates]) =>
      (VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDtoBuilder()
            ..update(updates))
          ._build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDto._(
      {this.features, this.requiresAll})
      : super._();
  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDto
      rebuild(
              void Function(
                      VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDtoBuilder
      toBuilder() =>
          VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDto &&
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
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDto')
          ..add('features', features)
          ..add('requiresAll', requiresAll))
        .toString();
  }
}

class VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDtoBuilder
    implements
        Builder<
            VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDto,
            VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDtoBuilder> {
  _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDto?
      _$v;

  ListBuilder<String>? _features;
  ListBuilder<String> get features =>
      _$this._features ??= ListBuilder<String>();
  set features(ListBuilder<String>? features) => _$this._features = features;

  bool? _requiresAll;
  bool? get requiresAll => _$this._requiresAll;
  set requiresAll(bool? requiresAll) => _$this._requiresAll = requiresAll;

  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDtoBuilder() {
    VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDto
        ._defaults(this);
  }

  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDtoBuilder
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
      VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDto
          other) {
    _$v = other
        as _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDto;
  }

  @override
  void update(
      void Function(
              VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDto
      build() => _build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDto
      _build() {
    _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDto
        _$result;
    try {
      _$result = _$v ??
          _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDto
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
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDto',
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
