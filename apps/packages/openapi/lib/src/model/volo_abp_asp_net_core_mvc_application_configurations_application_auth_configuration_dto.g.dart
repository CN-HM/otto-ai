// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_asp_net_core_mvc_application_configurations_application_auth_configuration_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto
    extends VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto {
  @override
  final BuiltMap<String, bool>? grantedPolicies;

  factory _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto(
          [void Function(
                  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDtoBuilder)?
              updates]) =>
      (VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDtoBuilder()
            ..update(updates))
          ._build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto._(
      {this.grantedPolicies})
      : super._();
  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto
      rebuild(
              void Function(
                      VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDtoBuilder
      toBuilder() =>
          VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto &&
        grantedPolicies == other.grantedPolicies;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, grantedPolicies.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto')
          ..add('grantedPolicies', grantedPolicies))
        .toString();
  }
}

class VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDtoBuilder
    implements
        Builder<
            VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto,
            VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDtoBuilder> {
  _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto?
      _$v;

  MapBuilder<String, bool>? _grantedPolicies;
  MapBuilder<String, bool> get grantedPolicies =>
      _$this._grantedPolicies ??= MapBuilder<String, bool>();
  set grantedPolicies(MapBuilder<String, bool>? grantedPolicies) =>
      _$this._grantedPolicies = grantedPolicies;

  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDtoBuilder() {
    VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto
        ._defaults(this);
  }

  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDtoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _grantedPolicies = $v.grantedPolicies?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto
          other) {
    _$v = other
        as _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto;
  }

  @override
  void update(
      void Function(
              VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto
      build() => _build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto
      _build() {
    _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto
        _$result;
    try {
      _$result = _$v ??
          _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto
              ._(
            grantedPolicies: _grantedPolicies?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'grantedPolicies';
        _grantedPolicies?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto',
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
