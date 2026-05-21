// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_http_modeling_controller_api_description_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpHttpModelingControllerApiDescriptionModel
    extends VoloAbpHttpModelingControllerApiDescriptionModel {
  @override
  final String? controllerName;
  @override
  final String? controllerGroupName;
  @override
  final bool? isRemoteService;
  @override
  final bool? isIntegrationService;
  @override
  final String? apiVersion;
  @override
  final String? type;
  @override
  final BuiltList<VoloAbpHttpModelingControllerInterfaceApiDescriptionModel>?
      interfaces;
  @override
  final BuiltMap<String, VoloAbpHttpModelingActionApiDescriptionModel>? actions;

  factory _$VoloAbpHttpModelingControllerApiDescriptionModel(
          [void Function(
                  VoloAbpHttpModelingControllerApiDescriptionModelBuilder)?
              updates]) =>
      (VoloAbpHttpModelingControllerApiDescriptionModelBuilder()
            ..update(updates))
          ._build();

  _$VoloAbpHttpModelingControllerApiDescriptionModel._(
      {this.controllerName,
      this.controllerGroupName,
      this.isRemoteService,
      this.isIntegrationService,
      this.apiVersion,
      this.type,
      this.interfaces,
      this.actions})
      : super._();
  @override
  VoloAbpHttpModelingControllerApiDescriptionModel rebuild(
          void Function(VoloAbpHttpModelingControllerApiDescriptionModelBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VoloAbpHttpModelingControllerApiDescriptionModelBuilder toBuilder() =>
      VoloAbpHttpModelingControllerApiDescriptionModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VoloAbpHttpModelingControllerApiDescriptionModel &&
        controllerName == other.controllerName &&
        controllerGroupName == other.controllerGroupName &&
        isRemoteService == other.isRemoteService &&
        isIntegrationService == other.isIntegrationService &&
        apiVersion == other.apiVersion &&
        type == other.type &&
        interfaces == other.interfaces &&
        actions == other.actions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, controllerName.hashCode);
    _$hash = $jc(_$hash, controllerGroupName.hashCode);
    _$hash = $jc(_$hash, isRemoteService.hashCode);
    _$hash = $jc(_$hash, isIntegrationService.hashCode);
    _$hash = $jc(_$hash, apiVersion.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, interfaces.hashCode);
    _$hash = $jc(_$hash, actions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpHttpModelingControllerApiDescriptionModel')
          ..add('controllerName', controllerName)
          ..add('controllerGroupName', controllerGroupName)
          ..add('isRemoteService', isRemoteService)
          ..add('isIntegrationService', isIntegrationService)
          ..add('apiVersion', apiVersion)
          ..add('type', type)
          ..add('interfaces', interfaces)
          ..add('actions', actions))
        .toString();
  }
}

class VoloAbpHttpModelingControllerApiDescriptionModelBuilder
    implements
        Builder<VoloAbpHttpModelingControllerApiDescriptionModel,
            VoloAbpHttpModelingControllerApiDescriptionModelBuilder> {
  _$VoloAbpHttpModelingControllerApiDescriptionModel? _$v;

  String? _controllerName;
  String? get controllerName => _$this._controllerName;
  set controllerName(String? controllerName) =>
      _$this._controllerName = controllerName;

  String? _controllerGroupName;
  String? get controllerGroupName => _$this._controllerGroupName;
  set controllerGroupName(String? controllerGroupName) =>
      _$this._controllerGroupName = controllerGroupName;

  bool? _isRemoteService;
  bool? get isRemoteService => _$this._isRemoteService;
  set isRemoteService(bool? isRemoteService) =>
      _$this._isRemoteService = isRemoteService;

  bool? _isIntegrationService;
  bool? get isIntegrationService => _$this._isIntegrationService;
  set isIntegrationService(bool? isIntegrationService) =>
      _$this._isIntegrationService = isIntegrationService;

  String? _apiVersion;
  String? get apiVersion => _$this._apiVersion;
  set apiVersion(String? apiVersion) => _$this._apiVersion = apiVersion;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  ListBuilder<VoloAbpHttpModelingControllerInterfaceApiDescriptionModel>?
      _interfaces;
  ListBuilder<VoloAbpHttpModelingControllerInterfaceApiDescriptionModel>
      get interfaces => _$this._interfaces ??= ListBuilder<
          VoloAbpHttpModelingControllerInterfaceApiDescriptionModel>();
  set interfaces(
          ListBuilder<
                  VoloAbpHttpModelingControllerInterfaceApiDescriptionModel>?
              interfaces) =>
      _$this._interfaces = interfaces;

  MapBuilder<String, VoloAbpHttpModelingActionApiDescriptionModel>? _actions;
  MapBuilder<String, VoloAbpHttpModelingActionApiDescriptionModel>
      get actions => _$this._actions ??=
          MapBuilder<String, VoloAbpHttpModelingActionApiDescriptionModel>();
  set actions(
          MapBuilder<String, VoloAbpHttpModelingActionApiDescriptionModel>?
              actions) =>
      _$this._actions = actions;

  VoloAbpHttpModelingControllerApiDescriptionModelBuilder() {
    VoloAbpHttpModelingControllerApiDescriptionModel._defaults(this);
  }

  VoloAbpHttpModelingControllerApiDescriptionModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _controllerName = $v.controllerName;
      _controllerGroupName = $v.controllerGroupName;
      _isRemoteService = $v.isRemoteService;
      _isIntegrationService = $v.isIntegrationService;
      _apiVersion = $v.apiVersion;
      _type = $v.type;
      _interfaces = $v.interfaces?.toBuilder();
      _actions = $v.actions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VoloAbpHttpModelingControllerApiDescriptionModel other) {
    _$v = other as _$VoloAbpHttpModelingControllerApiDescriptionModel;
  }

  @override
  void update(
      void Function(VoloAbpHttpModelingControllerApiDescriptionModelBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpHttpModelingControllerApiDescriptionModel build() => _build();

  _$VoloAbpHttpModelingControllerApiDescriptionModel _build() {
    _$VoloAbpHttpModelingControllerApiDescriptionModel _$result;
    try {
      _$result = _$v ??
          _$VoloAbpHttpModelingControllerApiDescriptionModel._(
            controllerName: controllerName,
            controllerGroupName: controllerGroupName,
            isRemoteService: isRemoteService,
            isIntegrationService: isIntegrationService,
            apiVersion: apiVersion,
            type: type,
            interfaces: _interfaces?.build(),
            actions: _actions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'interfaces';
        _interfaces?.build();
        _$failedField = 'actions';
        _actions?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VoloAbpHttpModelingControllerApiDescriptionModel',
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
