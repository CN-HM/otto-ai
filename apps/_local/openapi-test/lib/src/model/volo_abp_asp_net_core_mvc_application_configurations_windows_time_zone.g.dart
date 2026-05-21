// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_asp_net_core_mvc_application_configurations_windows_time_zone.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone
    extends VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone {
  @override
  final String? timeZoneId;

  factory _$VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone(
          [void Function(
                  VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZoneBuilder)?
              updates]) =>
      (VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZoneBuilder()
            ..update(updates))
          ._build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone._(
      {this.timeZoneId})
      : super._();
  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone rebuild(
          void Function(
                  VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZoneBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZoneBuilder
      toBuilder() =>
          VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZoneBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone &&
        timeZoneId == other.timeZoneId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, timeZoneId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone')
          ..add('timeZoneId', timeZoneId))
        .toString();
  }
}

class VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZoneBuilder
    implements
        Builder<VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone,
            VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZoneBuilder> {
  _$VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone? _$v;

  String? _timeZoneId;
  String? get timeZoneId => _$this._timeZoneId;
  set timeZoneId(String? timeZoneId) => _$this._timeZoneId = timeZoneId;

  VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZoneBuilder() {
    VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone._defaults(
        this);
  }

  VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZoneBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _timeZoneId = $v.timeZoneId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone other) {
    _$v =
        other as _$VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone;
  }

  @override
  void update(
      void Function(
              VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZoneBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone build() =>
      _build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone _build() {
    final _$result = _$v ??
        _$VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone._(
          timeZoneId: timeZoneId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
