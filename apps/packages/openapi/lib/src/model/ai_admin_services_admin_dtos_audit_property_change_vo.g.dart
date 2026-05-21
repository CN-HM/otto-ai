// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_admin_dtos_audit_property_change_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAdminDtosAuditPropertyChangeVo
    extends AiAdminServicesAdminDtosAuditPropertyChangeVo {
  @override
  final String? propertyName;
  @override
  final String? originalValue;
  @override
  final String? newValue;

  factory _$AiAdminServicesAdminDtosAuditPropertyChangeVo(
          [void Function(AiAdminServicesAdminDtosAuditPropertyChangeVoBuilder)?
              updates]) =>
      (AiAdminServicesAdminDtosAuditPropertyChangeVoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesAdminDtosAuditPropertyChangeVo._(
      {this.propertyName, this.originalValue, this.newValue})
      : super._();
  @override
  AiAdminServicesAdminDtosAuditPropertyChangeVo rebuild(
          void Function(AiAdminServicesAdminDtosAuditPropertyChangeVoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAdminDtosAuditPropertyChangeVoBuilder toBuilder() =>
      AiAdminServicesAdminDtosAuditPropertyChangeVoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAdminDtosAuditPropertyChangeVo &&
        propertyName == other.propertyName &&
        originalValue == other.originalValue &&
        newValue == other.newValue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, propertyName.hashCode);
    _$hash = $jc(_$hash, originalValue.hashCode);
    _$hash = $jc(_$hash, newValue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesAdminDtosAuditPropertyChangeVo')
          ..add('propertyName', propertyName)
          ..add('originalValue', originalValue)
          ..add('newValue', newValue))
        .toString();
  }
}

class AiAdminServicesAdminDtosAuditPropertyChangeVoBuilder
    implements
        Builder<AiAdminServicesAdminDtosAuditPropertyChangeVo,
            AiAdminServicesAdminDtosAuditPropertyChangeVoBuilder> {
  _$AiAdminServicesAdminDtosAuditPropertyChangeVo? _$v;

  String? _propertyName;
  String? get propertyName => _$this._propertyName;
  set propertyName(String? propertyName) => _$this._propertyName = propertyName;

  String? _originalValue;
  String? get originalValue => _$this._originalValue;
  set originalValue(String? originalValue) =>
      _$this._originalValue = originalValue;

  String? _newValue;
  String? get newValue => _$this._newValue;
  set newValue(String? newValue) => _$this._newValue = newValue;

  AiAdminServicesAdminDtosAuditPropertyChangeVoBuilder() {
    AiAdminServicesAdminDtosAuditPropertyChangeVo._defaults(this);
  }

  AiAdminServicesAdminDtosAuditPropertyChangeVoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _propertyName = $v.propertyName;
      _originalValue = $v.originalValue;
      _newValue = $v.newValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAdminDtosAuditPropertyChangeVo other) {
    _$v = other as _$AiAdminServicesAdminDtosAuditPropertyChangeVo;
  }

  @override
  void update(
      void Function(AiAdminServicesAdminDtosAuditPropertyChangeVoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAdminDtosAuditPropertyChangeVo build() => _build();

  _$AiAdminServicesAdminDtosAuditPropertyChangeVo _build() {
    final _$result = _$v ??
        _$AiAdminServicesAdminDtosAuditPropertyChangeVo._(
          propertyName: propertyName,
          originalValue: originalValue,
          newValue: newValue,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
