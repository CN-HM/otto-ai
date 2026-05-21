// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_http_modeling_interface_method_api_description_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpHttpModelingInterfaceMethodApiDescriptionModel
    extends VoloAbpHttpModelingInterfaceMethodApiDescriptionModel {
  @override
  final String? name;
  @override
  final BuiltList<VoloAbpHttpModelingMethodParameterApiDescriptionModel>?
      parametersOnMethod;
  @override
  final VoloAbpHttpModelingReturnValueApiDescriptionModel? returnValue;

  factory _$VoloAbpHttpModelingInterfaceMethodApiDescriptionModel(
          [void Function(
                  VoloAbpHttpModelingInterfaceMethodApiDescriptionModelBuilder)?
              updates]) =>
      (VoloAbpHttpModelingInterfaceMethodApiDescriptionModelBuilder()
            ..update(updates))
          ._build();

  _$VoloAbpHttpModelingInterfaceMethodApiDescriptionModel._(
      {this.name, this.parametersOnMethod, this.returnValue})
      : super._();
  @override
  VoloAbpHttpModelingInterfaceMethodApiDescriptionModel rebuild(
          void Function(
                  VoloAbpHttpModelingInterfaceMethodApiDescriptionModelBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VoloAbpHttpModelingInterfaceMethodApiDescriptionModelBuilder toBuilder() =>
      VoloAbpHttpModelingInterfaceMethodApiDescriptionModelBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VoloAbpHttpModelingInterfaceMethodApiDescriptionModel &&
        name == other.name &&
        parametersOnMethod == other.parametersOnMethod &&
        returnValue == other.returnValue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, parametersOnMethod.hashCode);
    _$hash = $jc(_$hash, returnValue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpHttpModelingInterfaceMethodApiDescriptionModel')
          ..add('name', name)
          ..add('parametersOnMethod', parametersOnMethod)
          ..add('returnValue', returnValue))
        .toString();
  }
}

class VoloAbpHttpModelingInterfaceMethodApiDescriptionModelBuilder
    implements
        Builder<VoloAbpHttpModelingInterfaceMethodApiDescriptionModel,
            VoloAbpHttpModelingInterfaceMethodApiDescriptionModelBuilder> {
  _$VoloAbpHttpModelingInterfaceMethodApiDescriptionModel? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<VoloAbpHttpModelingMethodParameterApiDescriptionModel>?
      _parametersOnMethod;
  ListBuilder<VoloAbpHttpModelingMethodParameterApiDescriptionModel>
      get parametersOnMethod => _$this._parametersOnMethod ??=
          ListBuilder<VoloAbpHttpModelingMethodParameterApiDescriptionModel>();
  set parametersOnMethod(
          ListBuilder<VoloAbpHttpModelingMethodParameterApiDescriptionModel>?
              parametersOnMethod) =>
      _$this._parametersOnMethod = parametersOnMethod;

  VoloAbpHttpModelingReturnValueApiDescriptionModelBuilder? _returnValue;
  VoloAbpHttpModelingReturnValueApiDescriptionModelBuilder get returnValue =>
      _$this._returnValue ??=
          VoloAbpHttpModelingReturnValueApiDescriptionModelBuilder();
  set returnValue(
          VoloAbpHttpModelingReturnValueApiDescriptionModelBuilder?
              returnValue) =>
      _$this._returnValue = returnValue;

  VoloAbpHttpModelingInterfaceMethodApiDescriptionModelBuilder() {
    VoloAbpHttpModelingInterfaceMethodApiDescriptionModel._defaults(this);
  }

  VoloAbpHttpModelingInterfaceMethodApiDescriptionModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _parametersOnMethod = $v.parametersOnMethod?.toBuilder();
      _returnValue = $v.returnValue?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VoloAbpHttpModelingInterfaceMethodApiDescriptionModel other) {
    _$v = other as _$VoloAbpHttpModelingInterfaceMethodApiDescriptionModel;
  }

  @override
  void update(
      void Function(
              VoloAbpHttpModelingInterfaceMethodApiDescriptionModelBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpHttpModelingInterfaceMethodApiDescriptionModel build() => _build();

  _$VoloAbpHttpModelingInterfaceMethodApiDescriptionModel _build() {
    _$VoloAbpHttpModelingInterfaceMethodApiDescriptionModel _$result;
    try {
      _$result = _$v ??
          _$VoloAbpHttpModelingInterfaceMethodApiDescriptionModel._(
            name: name,
            parametersOnMethod: _parametersOnMethod?.build(),
            returnValue: _returnValue?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'parametersOnMethod';
        _parametersOnMethod?.build();
        _$failedField = 'returnValue';
        _returnValue?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VoloAbpHttpModelingInterfaceMethodApiDescriptionModel',
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
