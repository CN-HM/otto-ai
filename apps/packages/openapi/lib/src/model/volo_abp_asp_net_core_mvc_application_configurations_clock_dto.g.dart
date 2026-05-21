// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_asp_net_core_mvc_application_configurations_clock_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto
    extends VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto {
  @override
  final String? kind;

  factory _$VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto(
          [void Function(
                  VoloAbpAspNetCoreMvcApplicationConfigurationsClockDtoBuilder)?
              updates]) =>
      (VoloAbpAspNetCoreMvcApplicationConfigurationsClockDtoBuilder()
            ..update(updates))
          ._build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto._({this.kind})
      : super._();
  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto rebuild(
          void Function(
                  VoloAbpAspNetCoreMvcApplicationConfigurationsClockDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsClockDtoBuilder toBuilder() =>
      VoloAbpAspNetCoreMvcApplicationConfigurationsClockDtoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto &&
        kind == other.kind;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, kind.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto')
          ..add('kind', kind))
        .toString();
  }
}

class VoloAbpAspNetCoreMvcApplicationConfigurationsClockDtoBuilder
    implements
        Builder<VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto,
            VoloAbpAspNetCoreMvcApplicationConfigurationsClockDtoBuilder> {
  _$VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto? _$v;

  String? _kind;
  String? get kind => _$this._kind;
  set kind(String? kind) => _$this._kind = kind;

  VoloAbpAspNetCoreMvcApplicationConfigurationsClockDtoBuilder() {
    VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto._defaults(this);
  }

  VoloAbpAspNetCoreMvcApplicationConfigurationsClockDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _kind = $v.kind;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto other) {
    _$v = other as _$VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto;
  }

  @override
  void update(
      void Function(
              VoloAbpAspNetCoreMvcApplicationConfigurationsClockDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto build() => _build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto _build() {
    final _$result = _$v ??
        _$VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto._(
          kind: kind,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
