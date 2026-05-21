// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_http_modeling_module_api_description_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpHttpModelingModuleApiDescriptionModel
    extends VoloAbpHttpModelingModuleApiDescriptionModel {
  @override
  final String? rootPath;
  @override
  final String? remoteServiceName;
  @override
  final BuiltMap<String, VoloAbpHttpModelingControllerApiDescriptionModel>?
      controllers;

  factory _$VoloAbpHttpModelingModuleApiDescriptionModel(
          [void Function(VoloAbpHttpModelingModuleApiDescriptionModelBuilder)?
              updates]) =>
      (VoloAbpHttpModelingModuleApiDescriptionModelBuilder()..update(updates))
          ._build();

  _$VoloAbpHttpModelingModuleApiDescriptionModel._(
      {this.rootPath, this.remoteServiceName, this.controllers})
      : super._();
  @override
  VoloAbpHttpModelingModuleApiDescriptionModel rebuild(
          void Function(VoloAbpHttpModelingModuleApiDescriptionModelBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VoloAbpHttpModelingModuleApiDescriptionModelBuilder toBuilder() =>
      VoloAbpHttpModelingModuleApiDescriptionModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VoloAbpHttpModelingModuleApiDescriptionModel &&
        rootPath == other.rootPath &&
        remoteServiceName == other.remoteServiceName &&
        controllers == other.controllers;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, rootPath.hashCode);
    _$hash = $jc(_$hash, remoteServiceName.hashCode);
    _$hash = $jc(_$hash, controllers.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpHttpModelingModuleApiDescriptionModel')
          ..add('rootPath', rootPath)
          ..add('remoteServiceName', remoteServiceName)
          ..add('controllers', controllers))
        .toString();
  }
}

class VoloAbpHttpModelingModuleApiDescriptionModelBuilder
    implements
        Builder<VoloAbpHttpModelingModuleApiDescriptionModel,
            VoloAbpHttpModelingModuleApiDescriptionModelBuilder> {
  _$VoloAbpHttpModelingModuleApiDescriptionModel? _$v;

  String? _rootPath;
  String? get rootPath => _$this._rootPath;
  set rootPath(String? rootPath) => _$this._rootPath = rootPath;

  String? _remoteServiceName;
  String? get remoteServiceName => _$this._remoteServiceName;
  set remoteServiceName(String? remoteServiceName) =>
      _$this._remoteServiceName = remoteServiceName;

  MapBuilder<String, VoloAbpHttpModelingControllerApiDescriptionModel>?
      _controllers;
  MapBuilder<String, VoloAbpHttpModelingControllerApiDescriptionModel>
      get controllers => _$this._controllers ??= MapBuilder<String,
          VoloAbpHttpModelingControllerApiDescriptionModel>();
  set controllers(
          MapBuilder<String, VoloAbpHttpModelingControllerApiDescriptionModel>?
              controllers) =>
      _$this._controllers = controllers;

  VoloAbpHttpModelingModuleApiDescriptionModelBuilder() {
    VoloAbpHttpModelingModuleApiDescriptionModel._defaults(this);
  }

  VoloAbpHttpModelingModuleApiDescriptionModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _rootPath = $v.rootPath;
      _remoteServiceName = $v.remoteServiceName;
      _controllers = $v.controllers?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VoloAbpHttpModelingModuleApiDescriptionModel other) {
    _$v = other as _$VoloAbpHttpModelingModuleApiDescriptionModel;
  }

  @override
  void update(
      void Function(VoloAbpHttpModelingModuleApiDescriptionModelBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpHttpModelingModuleApiDescriptionModel build() => _build();

  _$VoloAbpHttpModelingModuleApiDescriptionModel _build() {
    _$VoloAbpHttpModelingModuleApiDescriptionModel _$result;
    try {
      _$result = _$v ??
          _$VoloAbpHttpModelingModuleApiDescriptionModel._(
            rootPath: rootPath,
            remoteServiceName: remoteServiceName,
            controllers: _controllers?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'controllers';
        _controllers?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VoloAbpHttpModelingModuleApiDescriptionModel',
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
