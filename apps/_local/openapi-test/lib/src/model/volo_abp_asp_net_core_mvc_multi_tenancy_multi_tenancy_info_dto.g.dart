// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_asp_net_core_mvc_multi_tenancy_multi_tenancy_info_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto
    extends VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto {
  @override
  final bool? isEnabled;

  factory _$VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto(
          [void Function(
                  VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDtoBuilder)?
              updates]) =>
      (VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDtoBuilder()
            ..update(updates))
          ._build();

  _$VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto._({this.isEnabled})
      : super._();
  @override
  VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto rebuild(
          void Function(
                  VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDtoBuilder toBuilder() =>
      VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDtoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto &&
        isEnabled == other.isEnabled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isEnabled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto')
          ..add('isEnabled', isEnabled))
        .toString();
  }
}

class VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDtoBuilder
    implements
        Builder<VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto,
            VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDtoBuilder> {
  _$VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto? _$v;

  bool? _isEnabled;
  bool? get isEnabled => _$this._isEnabled;
  set isEnabled(bool? isEnabled) => _$this._isEnabled = isEnabled;

  VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDtoBuilder() {
    VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto._defaults(this);
  }

  VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isEnabled = $v.isEnabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto other) {
    _$v = other as _$VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto;
  }

  @override
  void update(
      void Function(VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto build() => _build();

  _$VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto _build() {
    final _$result = _$v ??
        _$VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto._(
          isEnabled: isEnabled,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
