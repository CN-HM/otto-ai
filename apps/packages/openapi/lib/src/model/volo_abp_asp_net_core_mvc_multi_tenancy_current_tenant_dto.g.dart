// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_asp_net_core_mvc_multi_tenancy_current_tenant_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto
    extends VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final bool? isAvailable;

  factory _$VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto(
          [void Function(
                  VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDtoBuilder)?
              updates]) =>
      (VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDtoBuilder()
            ..update(updates))
          ._build();

  _$VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto._(
      {this.id, this.name, this.isAvailable})
      : super._();
  @override
  VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto rebuild(
          void Function(VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDtoBuilder toBuilder() =>
      VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto &&
        id == other.id &&
        name == other.name &&
        isAvailable == other.isAvailable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, isAvailable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto')
          ..add('id', id)
          ..add('name', name)
          ..add('isAvailable', isAvailable))
        .toString();
  }
}

class VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDtoBuilder
    implements
        Builder<VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto,
            VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDtoBuilder> {
  _$VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  bool? _isAvailable;
  bool? get isAvailable => _$this._isAvailable;
  set isAvailable(bool? isAvailable) => _$this._isAvailable = isAvailable;

  VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDtoBuilder() {
    VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto._defaults(this);
  }

  VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _isAvailable = $v.isAvailable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto other) {
    _$v = other as _$VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto;
  }

  @override
  void update(
      void Function(VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto build() => _build();

  _$VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto _build() {
    final _$result = _$v ??
        _$VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto._(
          id: id,
          name: name,
          isAvailable: isAvailable,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
