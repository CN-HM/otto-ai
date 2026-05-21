// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_http_modeling_controller_interface_api_description_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpHttpModelingControllerInterfaceApiDescriptionModel
    extends VoloAbpHttpModelingControllerInterfaceApiDescriptionModel {
  @override
  final String? type;
  @override
  final String? name;
  @override
  final BuiltList<VoloAbpHttpModelingInterfaceMethodApiDescriptionModel>?
      methods;

  factory _$VoloAbpHttpModelingControllerInterfaceApiDescriptionModel(
          [void Function(
                  VoloAbpHttpModelingControllerInterfaceApiDescriptionModelBuilder)?
              updates]) =>
      (VoloAbpHttpModelingControllerInterfaceApiDescriptionModelBuilder()
            ..update(updates))
          ._build();

  _$VoloAbpHttpModelingControllerInterfaceApiDescriptionModel._(
      {this.type, this.name, this.methods})
      : super._();
  @override
  VoloAbpHttpModelingControllerInterfaceApiDescriptionModel rebuild(
          void Function(
                  VoloAbpHttpModelingControllerInterfaceApiDescriptionModelBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VoloAbpHttpModelingControllerInterfaceApiDescriptionModelBuilder
      toBuilder() =>
          VoloAbpHttpModelingControllerInterfaceApiDescriptionModelBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VoloAbpHttpModelingControllerInterfaceApiDescriptionModel &&
        type == other.type &&
        name == other.name &&
        methods == other.methods;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, methods.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpHttpModelingControllerInterfaceApiDescriptionModel')
          ..add('type', type)
          ..add('name', name)
          ..add('methods', methods))
        .toString();
  }
}

class VoloAbpHttpModelingControllerInterfaceApiDescriptionModelBuilder
    implements
        Builder<VoloAbpHttpModelingControllerInterfaceApiDescriptionModel,
            VoloAbpHttpModelingControllerInterfaceApiDescriptionModelBuilder> {
  _$VoloAbpHttpModelingControllerInterfaceApiDescriptionModel? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<VoloAbpHttpModelingInterfaceMethodApiDescriptionModel>? _methods;
  ListBuilder<VoloAbpHttpModelingInterfaceMethodApiDescriptionModel>
      get methods => _$this._methods ??=
          ListBuilder<VoloAbpHttpModelingInterfaceMethodApiDescriptionModel>();
  set methods(
          ListBuilder<VoloAbpHttpModelingInterfaceMethodApiDescriptionModel>?
              methods) =>
      _$this._methods = methods;

  VoloAbpHttpModelingControllerInterfaceApiDescriptionModelBuilder() {
    VoloAbpHttpModelingControllerInterfaceApiDescriptionModel._defaults(this);
  }

  VoloAbpHttpModelingControllerInterfaceApiDescriptionModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _name = $v.name;
      _methods = $v.methods?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      VoloAbpHttpModelingControllerInterfaceApiDescriptionModel other) {
    _$v = other as _$VoloAbpHttpModelingControllerInterfaceApiDescriptionModel;
  }

  @override
  void update(
      void Function(
              VoloAbpHttpModelingControllerInterfaceApiDescriptionModelBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpHttpModelingControllerInterfaceApiDescriptionModel build() => _build();

  _$VoloAbpHttpModelingControllerInterfaceApiDescriptionModel _build() {
    _$VoloAbpHttpModelingControllerInterfaceApiDescriptionModel _$result;
    try {
      _$result = _$v ??
          _$VoloAbpHttpModelingControllerInterfaceApiDescriptionModel._(
            type: type,
            name: name,
            methods: _methods?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'methods';
        _methods?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VoloAbpHttpModelingControllerInterfaceApiDescriptionModel',
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
