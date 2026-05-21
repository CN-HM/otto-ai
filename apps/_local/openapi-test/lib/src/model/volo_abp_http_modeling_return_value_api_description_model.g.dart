// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_http_modeling_return_value_api_description_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpHttpModelingReturnValueApiDescriptionModel
    extends VoloAbpHttpModelingReturnValueApiDescriptionModel {
  @override
  final String? type;
  @override
  final String? typeSimple;

  factory _$VoloAbpHttpModelingReturnValueApiDescriptionModel(
          [void Function(
                  VoloAbpHttpModelingReturnValueApiDescriptionModelBuilder)?
              updates]) =>
      (VoloAbpHttpModelingReturnValueApiDescriptionModelBuilder()
            ..update(updates))
          ._build();

  _$VoloAbpHttpModelingReturnValueApiDescriptionModel._(
      {this.type, this.typeSimple})
      : super._();
  @override
  VoloAbpHttpModelingReturnValueApiDescriptionModel rebuild(
          void Function(
                  VoloAbpHttpModelingReturnValueApiDescriptionModelBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VoloAbpHttpModelingReturnValueApiDescriptionModelBuilder toBuilder() =>
      VoloAbpHttpModelingReturnValueApiDescriptionModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VoloAbpHttpModelingReturnValueApiDescriptionModel &&
        type == other.type &&
        typeSimple == other.typeSimple;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, typeSimple.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpHttpModelingReturnValueApiDescriptionModel')
          ..add('type', type)
          ..add('typeSimple', typeSimple))
        .toString();
  }
}

class VoloAbpHttpModelingReturnValueApiDescriptionModelBuilder
    implements
        Builder<VoloAbpHttpModelingReturnValueApiDescriptionModel,
            VoloAbpHttpModelingReturnValueApiDescriptionModelBuilder> {
  _$VoloAbpHttpModelingReturnValueApiDescriptionModel? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _typeSimple;
  String? get typeSimple => _$this._typeSimple;
  set typeSimple(String? typeSimple) => _$this._typeSimple = typeSimple;

  VoloAbpHttpModelingReturnValueApiDescriptionModelBuilder() {
    VoloAbpHttpModelingReturnValueApiDescriptionModel._defaults(this);
  }

  VoloAbpHttpModelingReturnValueApiDescriptionModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _typeSimple = $v.typeSimple;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VoloAbpHttpModelingReturnValueApiDescriptionModel other) {
    _$v = other as _$VoloAbpHttpModelingReturnValueApiDescriptionModel;
  }

  @override
  void update(
      void Function(VoloAbpHttpModelingReturnValueApiDescriptionModelBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpHttpModelingReturnValueApiDescriptionModel build() => _build();

  _$VoloAbpHttpModelingReturnValueApiDescriptionModel _build() {
    final _$result = _$v ??
        _$VoloAbpHttpModelingReturnValueApiDescriptionModel._(
          type: type,
          typeSimple: typeSimple,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
