// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_http_modeling_application_api_description_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpHttpModelingApplicationApiDescriptionModel
    extends VoloAbpHttpModelingApplicationApiDescriptionModel {
  @override
  final BuiltMap<String, VoloAbpHttpModelingModuleApiDescriptionModel>? modules;
  @override
  final BuiltMap<String, VoloAbpHttpModelingTypeApiDescriptionModel>? types;

  factory _$VoloAbpHttpModelingApplicationApiDescriptionModel(
          [void Function(
                  VoloAbpHttpModelingApplicationApiDescriptionModelBuilder)?
              updates]) =>
      (VoloAbpHttpModelingApplicationApiDescriptionModelBuilder()
            ..update(updates))
          ._build();

  _$VoloAbpHttpModelingApplicationApiDescriptionModel._(
      {this.modules, this.types})
      : super._();
  @override
  VoloAbpHttpModelingApplicationApiDescriptionModel rebuild(
          void Function(
                  VoloAbpHttpModelingApplicationApiDescriptionModelBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VoloAbpHttpModelingApplicationApiDescriptionModelBuilder toBuilder() =>
      VoloAbpHttpModelingApplicationApiDescriptionModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VoloAbpHttpModelingApplicationApiDescriptionModel &&
        modules == other.modules &&
        types == other.types;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, modules.hashCode);
    _$hash = $jc(_$hash, types.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpHttpModelingApplicationApiDescriptionModel')
          ..add('modules', modules)
          ..add('types', types))
        .toString();
  }
}

class VoloAbpHttpModelingApplicationApiDescriptionModelBuilder
    implements
        Builder<VoloAbpHttpModelingApplicationApiDescriptionModel,
            VoloAbpHttpModelingApplicationApiDescriptionModelBuilder> {
  _$VoloAbpHttpModelingApplicationApiDescriptionModel? _$v;

  MapBuilder<String, VoloAbpHttpModelingModuleApiDescriptionModel>? _modules;
  MapBuilder<String, VoloAbpHttpModelingModuleApiDescriptionModel>
      get modules => _$this._modules ??=
          MapBuilder<String, VoloAbpHttpModelingModuleApiDescriptionModel>();
  set modules(
          MapBuilder<String, VoloAbpHttpModelingModuleApiDescriptionModel>?
              modules) =>
      _$this._modules = modules;

  MapBuilder<String, VoloAbpHttpModelingTypeApiDescriptionModel>? _types;
  MapBuilder<String, VoloAbpHttpModelingTypeApiDescriptionModel> get types =>
      _$this._types ??=
          MapBuilder<String, VoloAbpHttpModelingTypeApiDescriptionModel>();
  set types(
          MapBuilder<String, VoloAbpHttpModelingTypeApiDescriptionModel>?
              types) =>
      _$this._types = types;

  VoloAbpHttpModelingApplicationApiDescriptionModelBuilder() {
    VoloAbpHttpModelingApplicationApiDescriptionModel._defaults(this);
  }

  VoloAbpHttpModelingApplicationApiDescriptionModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _modules = $v.modules?.toBuilder();
      _types = $v.types?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VoloAbpHttpModelingApplicationApiDescriptionModel other) {
    _$v = other as _$VoloAbpHttpModelingApplicationApiDescriptionModel;
  }

  @override
  void update(
      void Function(VoloAbpHttpModelingApplicationApiDescriptionModelBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpHttpModelingApplicationApiDescriptionModel build() => _build();

  _$VoloAbpHttpModelingApplicationApiDescriptionModel _build() {
    _$VoloAbpHttpModelingApplicationApiDescriptionModel _$result;
    try {
      _$result = _$v ??
          _$VoloAbpHttpModelingApplicationApiDescriptionModel._(
            modules: _modules?.build(),
            types: _types?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'modules';
        _modules?.build();
        _$failedField = 'types';
        _types?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VoloAbpHttpModelingApplicationApiDescriptionModel',
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
