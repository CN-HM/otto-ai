// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_asp_net_core_mvc_application_configurations_object_extending_extension_property_permission_policy_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDto
    extends VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDto {
  @override
  final BuiltList<String>? permissionNames;
  @override
  final bool? requiresAll;

  factory _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDto(
          [void Function(
                  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDtoBuilder)?
              updates]) =>
      (VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDtoBuilder()
            ..update(updates))
          ._build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDto._(
      {this.permissionNames, this.requiresAll})
      : super._();
  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDto
      rebuild(
              void Function(
                      VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDtoBuilder
      toBuilder() =>
          VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDto &&
        permissionNames == other.permissionNames &&
        requiresAll == other.requiresAll;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, permissionNames.hashCode);
    _$hash = $jc(_$hash, requiresAll.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDto')
          ..add('permissionNames', permissionNames)
          ..add('requiresAll', requiresAll))
        .toString();
  }
}

class VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDtoBuilder
    implements
        Builder<
            VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDto,
            VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDtoBuilder> {
  _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDto?
      _$v;

  ListBuilder<String>? _permissionNames;
  ListBuilder<String> get permissionNames =>
      _$this._permissionNames ??= ListBuilder<String>();
  set permissionNames(ListBuilder<String>? permissionNames) =>
      _$this._permissionNames = permissionNames;

  bool? _requiresAll;
  bool? get requiresAll => _$this._requiresAll;
  set requiresAll(bool? requiresAll) => _$this._requiresAll = requiresAll;

  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDtoBuilder() {
    VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDto
        ._defaults(this);
  }

  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDtoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _permissionNames = $v.permissionNames?.toBuilder();
      _requiresAll = $v.requiresAll;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDto
          other) {
    _$v = other
        as _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDto;
  }

  @override
  void update(
      void Function(
              VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDto
      build() => _build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDto
      _build() {
    _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDto
        _$result;
    try {
      _$result = _$v ??
          _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDto
              ._(
            permissionNames: _permissionNames?.build(),
            requiresAll: requiresAll,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'permissionNames';
        _permissionNames?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDto',
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
