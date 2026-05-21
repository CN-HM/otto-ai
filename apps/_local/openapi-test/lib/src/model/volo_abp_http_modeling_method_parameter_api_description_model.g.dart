// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_http_modeling_method_parameter_api_description_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpHttpModelingMethodParameterApiDescriptionModel
    extends VoloAbpHttpModelingMethodParameterApiDescriptionModel {
  @override
  final String? name;
  @override
  final String? typeAsString;
  @override
  final String? type;
  @override
  final String? typeSimple;
  @override
  final bool? isOptional;
  @override
  final JsonObject? defaultValue;

  factory _$VoloAbpHttpModelingMethodParameterApiDescriptionModel(
          [void Function(
                  VoloAbpHttpModelingMethodParameterApiDescriptionModelBuilder)?
              updates]) =>
      (VoloAbpHttpModelingMethodParameterApiDescriptionModelBuilder()
            ..update(updates))
          ._build();

  _$VoloAbpHttpModelingMethodParameterApiDescriptionModel._(
      {this.name,
      this.typeAsString,
      this.type,
      this.typeSimple,
      this.isOptional,
      this.defaultValue})
      : super._();
  @override
  VoloAbpHttpModelingMethodParameterApiDescriptionModel rebuild(
          void Function(
                  VoloAbpHttpModelingMethodParameterApiDescriptionModelBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VoloAbpHttpModelingMethodParameterApiDescriptionModelBuilder toBuilder() =>
      VoloAbpHttpModelingMethodParameterApiDescriptionModelBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VoloAbpHttpModelingMethodParameterApiDescriptionModel &&
        name == other.name &&
        typeAsString == other.typeAsString &&
        type == other.type &&
        typeSimple == other.typeSimple &&
        isOptional == other.isOptional &&
        defaultValue == other.defaultValue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, typeAsString.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, typeSimple.hashCode);
    _$hash = $jc(_$hash, isOptional.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpHttpModelingMethodParameterApiDescriptionModel')
          ..add('name', name)
          ..add('typeAsString', typeAsString)
          ..add('type', type)
          ..add('typeSimple', typeSimple)
          ..add('isOptional', isOptional)
          ..add('defaultValue', defaultValue))
        .toString();
  }
}

class VoloAbpHttpModelingMethodParameterApiDescriptionModelBuilder
    implements
        Builder<VoloAbpHttpModelingMethodParameterApiDescriptionModel,
            VoloAbpHttpModelingMethodParameterApiDescriptionModelBuilder> {
  _$VoloAbpHttpModelingMethodParameterApiDescriptionModel? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _typeAsString;
  String? get typeAsString => _$this._typeAsString;
  set typeAsString(String? typeAsString) => _$this._typeAsString = typeAsString;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _typeSimple;
  String? get typeSimple => _$this._typeSimple;
  set typeSimple(String? typeSimple) => _$this._typeSimple = typeSimple;

  bool? _isOptional;
  bool? get isOptional => _$this._isOptional;
  set isOptional(bool? isOptional) => _$this._isOptional = isOptional;

  JsonObject? _defaultValue;
  JsonObject? get defaultValue => _$this._defaultValue;
  set defaultValue(JsonObject? defaultValue) =>
      _$this._defaultValue = defaultValue;

  VoloAbpHttpModelingMethodParameterApiDescriptionModelBuilder() {
    VoloAbpHttpModelingMethodParameterApiDescriptionModel._defaults(this);
  }

  VoloAbpHttpModelingMethodParameterApiDescriptionModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _typeAsString = $v.typeAsString;
      _type = $v.type;
      _typeSimple = $v.typeSimple;
      _isOptional = $v.isOptional;
      _defaultValue = $v.defaultValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VoloAbpHttpModelingMethodParameterApiDescriptionModel other) {
    _$v = other as _$VoloAbpHttpModelingMethodParameterApiDescriptionModel;
  }

  @override
  void update(
      void Function(
              VoloAbpHttpModelingMethodParameterApiDescriptionModelBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpHttpModelingMethodParameterApiDescriptionModel build() => _build();

  _$VoloAbpHttpModelingMethodParameterApiDescriptionModel _build() {
    final _$result = _$v ??
        _$VoloAbpHttpModelingMethodParameterApiDescriptionModel._(
          name: name,
          typeAsString: typeAsString,
          type: type,
          typeSimple: typeSimple,
          isOptional: isOptional,
          defaultValue: defaultValue,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
