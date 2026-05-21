// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_asp_net_core_mvc_application_configurations_iana_time_zone.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone
    extends VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone {
  @override
  final String? timeZoneName;

  factory _$VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone(
          [void Function(
                  VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZoneBuilder)?
              updates]) =>
      (VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZoneBuilder()
            ..update(updates))
          ._build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone._(
      {this.timeZoneName})
      : super._();
  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone rebuild(
          void Function(
                  VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZoneBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZoneBuilder
      toBuilder() =>
          VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZoneBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone &&
        timeZoneName == other.timeZoneName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, timeZoneName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone')
          ..add('timeZoneName', timeZoneName))
        .toString();
  }
}

class VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZoneBuilder
    implements
        Builder<VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone,
            VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZoneBuilder> {
  _$VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone? _$v;

  String? _timeZoneName;
  String? get timeZoneName => _$this._timeZoneName;
  set timeZoneName(String? timeZoneName) => _$this._timeZoneName = timeZoneName;

  VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZoneBuilder() {
    VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone._defaults(this);
  }

  VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZoneBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _timeZoneName = $v.timeZoneName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone other) {
    _$v = other as _$VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone;
  }

  @override
  void update(
      void Function(
              VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZoneBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone build() => _build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone _build() {
    final _$result = _$v ??
        _$VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone._(
          timeZoneName: timeZoneName,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
