// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_name_value.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpNameValue extends VoloAbpNameValue {
  @override
  final String? name;
  @override
  final String? value;

  factory _$VoloAbpNameValue(
          [void Function(VoloAbpNameValueBuilder)? updates]) =>
      (VoloAbpNameValueBuilder()..update(updates))._build();

  _$VoloAbpNameValue._({this.name, this.value}) : super._();
  @override
  VoloAbpNameValue rebuild(void Function(VoloAbpNameValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VoloAbpNameValueBuilder toBuilder() =>
      VoloAbpNameValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VoloAbpNameValue &&
        name == other.name &&
        value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VoloAbpNameValue')
          ..add('name', name)
          ..add('value', value))
        .toString();
  }
}

class VoloAbpNameValueBuilder
    implements Builder<VoloAbpNameValue, VoloAbpNameValueBuilder> {
  _$VoloAbpNameValue? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  VoloAbpNameValueBuilder() {
    VoloAbpNameValue._defaults(this);
  }

  VoloAbpNameValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VoloAbpNameValue other) {
    _$v = other as _$VoloAbpNameValue;
  }

  @override
  void update(void Function(VoloAbpNameValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpNameValue build() => _build();

  _$VoloAbpNameValue _build() {
    final _$result = _$v ??
        _$VoloAbpNameValue._(
          name: name,
          value: value,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
