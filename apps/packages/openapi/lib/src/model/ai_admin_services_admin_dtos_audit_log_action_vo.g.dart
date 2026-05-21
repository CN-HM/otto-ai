// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_admin_dtos_audit_log_action_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAdminDtosAuditLogActionVo
    extends AiAdminServicesAdminDtosAuditLogActionVo {
  @override
  final String? serviceName;
  @override
  final String? methodName;
  @override
  final String? parameters;
  @override
  final DateTime? executionTime;
  @override
  final int? executionDuration;

  factory _$AiAdminServicesAdminDtosAuditLogActionVo(
          [void Function(AiAdminServicesAdminDtosAuditLogActionVoBuilder)?
              updates]) =>
      (AiAdminServicesAdminDtosAuditLogActionVoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesAdminDtosAuditLogActionVo._(
      {this.serviceName,
      this.methodName,
      this.parameters,
      this.executionTime,
      this.executionDuration})
      : super._();
  @override
  AiAdminServicesAdminDtosAuditLogActionVo rebuild(
          void Function(AiAdminServicesAdminDtosAuditLogActionVoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAdminDtosAuditLogActionVoBuilder toBuilder() =>
      AiAdminServicesAdminDtosAuditLogActionVoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAdminDtosAuditLogActionVo &&
        serviceName == other.serviceName &&
        methodName == other.methodName &&
        parameters == other.parameters &&
        executionTime == other.executionTime &&
        executionDuration == other.executionDuration;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, serviceName.hashCode);
    _$hash = $jc(_$hash, methodName.hashCode);
    _$hash = $jc(_$hash, parameters.hashCode);
    _$hash = $jc(_$hash, executionTime.hashCode);
    _$hash = $jc(_$hash, executionDuration.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesAdminDtosAuditLogActionVo')
          ..add('serviceName', serviceName)
          ..add('methodName', methodName)
          ..add('parameters', parameters)
          ..add('executionTime', executionTime)
          ..add('executionDuration', executionDuration))
        .toString();
  }
}

class AiAdminServicesAdminDtosAuditLogActionVoBuilder
    implements
        Builder<AiAdminServicesAdminDtosAuditLogActionVo,
            AiAdminServicesAdminDtosAuditLogActionVoBuilder> {
  _$AiAdminServicesAdminDtosAuditLogActionVo? _$v;

  String? _serviceName;
  String? get serviceName => _$this._serviceName;
  set serviceName(String? serviceName) => _$this._serviceName = serviceName;

  String? _methodName;
  String? get methodName => _$this._methodName;
  set methodName(String? methodName) => _$this._methodName = methodName;

  String? _parameters;
  String? get parameters => _$this._parameters;
  set parameters(String? parameters) => _$this._parameters = parameters;

  DateTime? _executionTime;
  DateTime? get executionTime => _$this._executionTime;
  set executionTime(DateTime? executionTime) =>
      _$this._executionTime = executionTime;

  int? _executionDuration;
  int? get executionDuration => _$this._executionDuration;
  set executionDuration(int? executionDuration) =>
      _$this._executionDuration = executionDuration;

  AiAdminServicesAdminDtosAuditLogActionVoBuilder() {
    AiAdminServicesAdminDtosAuditLogActionVo._defaults(this);
  }

  AiAdminServicesAdminDtosAuditLogActionVoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _serviceName = $v.serviceName;
      _methodName = $v.methodName;
      _parameters = $v.parameters;
      _executionTime = $v.executionTime;
      _executionDuration = $v.executionDuration;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAdminDtosAuditLogActionVo other) {
    _$v = other as _$AiAdminServicesAdminDtosAuditLogActionVo;
  }

  @override
  void update(
      void Function(AiAdminServicesAdminDtosAuditLogActionVoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAdminDtosAuditLogActionVo build() => _build();

  _$AiAdminServicesAdminDtosAuditLogActionVo _build() {
    final _$result = _$v ??
        _$AiAdminServicesAdminDtosAuditLogActionVo._(
          serviceName: serviceName,
          methodName: methodName,
          parameters: parameters,
          executionTime: executionTime,
          executionDuration: executionDuration,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
