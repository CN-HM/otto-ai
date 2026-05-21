// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_asp_net_core_mvc_application_configurations_timing_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto
    extends VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto {
  @override
  final VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone? timeZone;

  factory _$VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto(
          [void Function(
                  VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDtoBuilder)?
              updates]) =>
      (VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDtoBuilder()
            ..update(updates))
          ._build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto._({this.timeZone})
      : super._();
  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto rebuild(
          void Function(
                  VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDtoBuilder toBuilder() =>
      VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDtoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto &&
        timeZone == other.timeZone;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, timeZone.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto')
          ..add('timeZone', timeZone))
        .toString();
  }
}

class VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDtoBuilder
    implements
        Builder<VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto,
            VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDtoBuilder> {
  _$VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto? _$v;

  VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZoneBuilder? _timeZone;
  VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZoneBuilder get timeZone =>
      _$this._timeZone ??=
          VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZoneBuilder();
  set timeZone(
          VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZoneBuilder?
              timeZone) =>
      _$this._timeZone = timeZone;

  VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDtoBuilder() {
    VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto._defaults(this);
  }

  VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _timeZone = $v.timeZone?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto other) {
    _$v = other as _$VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto;
  }

  @override
  void update(
      void Function(
              VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto build() => _build();

  _$VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto _build() {
    _$VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto _$result;
    try {
      _$result = _$v ??
          _$VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto._(
            timeZone: _timeZone?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'timeZone';
        _timeZone?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto',
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
