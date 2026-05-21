// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_asp_net_core_mvc_application_configurations_time_zone.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone
    extends VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone {
  @override
  final VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone? iana;
  @override
  final VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone? windows;

  factory _$VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone(
          [void Function(
                  VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZoneBuilder)?
              updates]) =>
      (VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZoneBuilder()
            ..update(updates))
          ._build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone._(
      {this.iana, this.windows})
      : super._();
  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone rebuild(
          void Function(
                  VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZoneBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZoneBuilder toBuilder() =>
      VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZoneBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone &&
        iana == other.iana &&
        windows == other.windows;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, iana.hashCode);
    _$hash = $jc(_$hash, windows.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone')
          ..add('iana', iana)
          ..add('windows', windows))
        .toString();
  }
}

class VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZoneBuilder
    implements
        Builder<VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone,
            VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZoneBuilder> {
  _$VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone? _$v;

  VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZoneBuilder? _iana;
  VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZoneBuilder get iana =>
      _$this._iana ??=
          VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZoneBuilder();
  set iana(
          VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZoneBuilder?
              iana) =>
      _$this._iana = iana;

  VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZoneBuilder? _windows;
  VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZoneBuilder
      get windows => _$this._windows ??=
          VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZoneBuilder();
  set windows(
          VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZoneBuilder?
              windows) =>
      _$this._windows = windows;

  VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZoneBuilder() {
    VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone._defaults(this);
  }

  VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZoneBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _iana = $v.iana?.toBuilder();
      _windows = $v.windows?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone other) {
    _$v = other as _$VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone;
  }

  @override
  void update(
      void Function(
              VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZoneBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone build() => _build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone _build() {
    _$VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone _$result;
    try {
      _$result = _$v ??
          _$VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone._(
            iana: _iana?.build(),
            windows: _windows?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'iana';
        _iana?.build();
        _$failedField = 'windows';
        _windows?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone',
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
