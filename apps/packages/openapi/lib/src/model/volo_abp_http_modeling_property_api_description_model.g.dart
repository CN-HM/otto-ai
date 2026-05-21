// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_http_modeling_property_api_description_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpHttpModelingPropertyApiDescriptionModel
    extends VoloAbpHttpModelingPropertyApiDescriptionModel {
  @override
  final String? name;
  @override
  final String? jsonName;
  @override
  final String? type;
  @override
  final String? typeSimple;
  @override
  final bool? isRequired;
  @override
  final int? minLength;
  @override
  final int? maxLength;
  @override
  final String? minimum;
  @override
  final String? maximum;
  @override
  final String? regex;
  @override
  final bool? isNullable;

  factory _$VoloAbpHttpModelingPropertyApiDescriptionModel(
          [void Function(VoloAbpHttpModelingPropertyApiDescriptionModelBuilder)?
              updates]) =>
      (VoloAbpHttpModelingPropertyApiDescriptionModelBuilder()..update(updates))
          ._build();

  _$VoloAbpHttpModelingPropertyApiDescriptionModel._(
      {this.name,
      this.jsonName,
      this.type,
      this.typeSimple,
      this.isRequired,
      this.minLength,
      this.maxLength,
      this.minimum,
      this.maximum,
      this.regex,
      this.isNullable})
      : super._();
  @override
  VoloAbpHttpModelingPropertyApiDescriptionModel rebuild(
          void Function(VoloAbpHttpModelingPropertyApiDescriptionModelBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VoloAbpHttpModelingPropertyApiDescriptionModelBuilder toBuilder() =>
      VoloAbpHttpModelingPropertyApiDescriptionModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VoloAbpHttpModelingPropertyApiDescriptionModel &&
        name == other.name &&
        jsonName == other.jsonName &&
        type == other.type &&
        typeSimple == other.typeSimple &&
        isRequired == other.isRequired &&
        minLength == other.minLength &&
        maxLength == other.maxLength &&
        minimum == other.minimum &&
        maximum == other.maximum &&
        regex == other.regex &&
        isNullable == other.isNullable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, jsonName.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, typeSimple.hashCode);
    _$hash = $jc(_$hash, isRequired.hashCode);
    _$hash = $jc(_$hash, minLength.hashCode);
    _$hash = $jc(_$hash, maxLength.hashCode);
    _$hash = $jc(_$hash, minimum.hashCode);
    _$hash = $jc(_$hash, maximum.hashCode);
    _$hash = $jc(_$hash, regex.hashCode);
    _$hash = $jc(_$hash, isNullable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpHttpModelingPropertyApiDescriptionModel')
          ..add('name', name)
          ..add('jsonName', jsonName)
          ..add('type', type)
          ..add('typeSimple', typeSimple)
          ..add('isRequired', isRequired)
          ..add('minLength', minLength)
          ..add('maxLength', maxLength)
          ..add('minimum', minimum)
          ..add('maximum', maximum)
          ..add('regex', regex)
          ..add('isNullable', isNullable))
        .toString();
  }
}

class VoloAbpHttpModelingPropertyApiDescriptionModelBuilder
    implements
        Builder<VoloAbpHttpModelingPropertyApiDescriptionModel,
            VoloAbpHttpModelingPropertyApiDescriptionModelBuilder> {
  _$VoloAbpHttpModelingPropertyApiDescriptionModel? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _jsonName;
  String? get jsonName => _$this._jsonName;
  set jsonName(String? jsonName) => _$this._jsonName = jsonName;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _typeSimple;
  String? get typeSimple => _$this._typeSimple;
  set typeSimple(String? typeSimple) => _$this._typeSimple = typeSimple;

  bool? _isRequired;
  bool? get isRequired => _$this._isRequired;
  set isRequired(bool? isRequired) => _$this._isRequired = isRequired;

  int? _minLength;
  int? get minLength => _$this._minLength;
  set minLength(int? minLength) => _$this._minLength = minLength;

  int? _maxLength;
  int? get maxLength => _$this._maxLength;
  set maxLength(int? maxLength) => _$this._maxLength = maxLength;

  String? _minimum;
  String? get minimum => _$this._minimum;
  set minimum(String? minimum) => _$this._minimum = minimum;

  String? _maximum;
  String? get maximum => _$this._maximum;
  set maximum(String? maximum) => _$this._maximum = maximum;

  String? _regex;
  String? get regex => _$this._regex;
  set regex(String? regex) => _$this._regex = regex;

  bool? _isNullable;
  bool? get isNullable => _$this._isNullable;
  set isNullable(bool? isNullable) => _$this._isNullable = isNullable;

  VoloAbpHttpModelingPropertyApiDescriptionModelBuilder() {
    VoloAbpHttpModelingPropertyApiDescriptionModel._defaults(this);
  }

  VoloAbpHttpModelingPropertyApiDescriptionModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _jsonName = $v.jsonName;
      _type = $v.type;
      _typeSimple = $v.typeSimple;
      _isRequired = $v.isRequired;
      _minLength = $v.minLength;
      _maxLength = $v.maxLength;
      _minimum = $v.minimum;
      _maximum = $v.maximum;
      _regex = $v.regex;
      _isNullable = $v.isNullable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VoloAbpHttpModelingPropertyApiDescriptionModel other) {
    _$v = other as _$VoloAbpHttpModelingPropertyApiDescriptionModel;
  }

  @override
  void update(
      void Function(VoloAbpHttpModelingPropertyApiDescriptionModelBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpHttpModelingPropertyApiDescriptionModel build() => _build();

  _$VoloAbpHttpModelingPropertyApiDescriptionModel _build() {
    final _$result = _$v ??
        _$VoloAbpHttpModelingPropertyApiDescriptionModel._(
          name: name,
          jsonName: jsonName,
          type: type,
          typeSimple: typeSimple,
          isRequired: isRequired,
          minLength: minLength,
          maxLength: maxLength,
          minimum: minimum,
          maximum: maximum,
          regex: regex,
          isNullable: isNullable,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
