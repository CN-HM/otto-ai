// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_admin_dtos_audit_entity_change_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAdminDtosAuditEntityChangeVo
    extends AiAdminServicesAdminDtosAuditEntityChangeVo {
  @override
  final String? changeType;
  @override
  final String? entityTypeFullName;
  @override
  final String? entityId;
  @override
  final DateTime? changeTime;
  @override
  final BuiltList<AiAdminServicesAdminDtosAuditPropertyChangeVo>?
      propertyChanges;

  factory _$AiAdminServicesAdminDtosAuditEntityChangeVo(
          [void Function(AiAdminServicesAdminDtosAuditEntityChangeVoBuilder)?
              updates]) =>
      (AiAdminServicesAdminDtosAuditEntityChangeVoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesAdminDtosAuditEntityChangeVo._(
      {this.changeType,
      this.entityTypeFullName,
      this.entityId,
      this.changeTime,
      this.propertyChanges})
      : super._();
  @override
  AiAdminServicesAdminDtosAuditEntityChangeVo rebuild(
          void Function(AiAdminServicesAdminDtosAuditEntityChangeVoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAdminDtosAuditEntityChangeVoBuilder toBuilder() =>
      AiAdminServicesAdminDtosAuditEntityChangeVoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAdminDtosAuditEntityChangeVo &&
        changeType == other.changeType &&
        entityTypeFullName == other.entityTypeFullName &&
        entityId == other.entityId &&
        changeTime == other.changeTime &&
        propertyChanges == other.propertyChanges;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, changeType.hashCode);
    _$hash = $jc(_$hash, entityTypeFullName.hashCode);
    _$hash = $jc(_$hash, entityId.hashCode);
    _$hash = $jc(_$hash, changeTime.hashCode);
    _$hash = $jc(_$hash, propertyChanges.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesAdminDtosAuditEntityChangeVo')
          ..add('changeType', changeType)
          ..add('entityTypeFullName', entityTypeFullName)
          ..add('entityId', entityId)
          ..add('changeTime', changeTime)
          ..add('propertyChanges', propertyChanges))
        .toString();
  }
}

class AiAdminServicesAdminDtosAuditEntityChangeVoBuilder
    implements
        Builder<AiAdminServicesAdminDtosAuditEntityChangeVo,
            AiAdminServicesAdminDtosAuditEntityChangeVoBuilder> {
  _$AiAdminServicesAdminDtosAuditEntityChangeVo? _$v;

  String? _changeType;
  String? get changeType => _$this._changeType;
  set changeType(String? changeType) => _$this._changeType = changeType;

  String? _entityTypeFullName;
  String? get entityTypeFullName => _$this._entityTypeFullName;
  set entityTypeFullName(String? entityTypeFullName) =>
      _$this._entityTypeFullName = entityTypeFullName;

  String? _entityId;
  String? get entityId => _$this._entityId;
  set entityId(String? entityId) => _$this._entityId = entityId;

  DateTime? _changeTime;
  DateTime? get changeTime => _$this._changeTime;
  set changeTime(DateTime? changeTime) => _$this._changeTime = changeTime;

  ListBuilder<AiAdminServicesAdminDtosAuditPropertyChangeVo>? _propertyChanges;
  ListBuilder<AiAdminServicesAdminDtosAuditPropertyChangeVo>
      get propertyChanges => _$this._propertyChanges ??=
          ListBuilder<AiAdminServicesAdminDtosAuditPropertyChangeVo>();
  set propertyChanges(
          ListBuilder<AiAdminServicesAdminDtosAuditPropertyChangeVo>?
              propertyChanges) =>
      _$this._propertyChanges = propertyChanges;

  AiAdminServicesAdminDtosAuditEntityChangeVoBuilder() {
    AiAdminServicesAdminDtosAuditEntityChangeVo._defaults(this);
  }

  AiAdminServicesAdminDtosAuditEntityChangeVoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _changeType = $v.changeType;
      _entityTypeFullName = $v.entityTypeFullName;
      _entityId = $v.entityId;
      _changeTime = $v.changeTime;
      _propertyChanges = $v.propertyChanges?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAdminDtosAuditEntityChangeVo other) {
    _$v = other as _$AiAdminServicesAdminDtosAuditEntityChangeVo;
  }

  @override
  void update(
      void Function(AiAdminServicesAdminDtosAuditEntityChangeVoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAdminDtosAuditEntityChangeVo build() => _build();

  _$AiAdminServicesAdminDtosAuditEntityChangeVo _build() {
    _$AiAdminServicesAdminDtosAuditEntityChangeVo _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesAdminDtosAuditEntityChangeVo._(
            changeType: changeType,
            entityTypeFullName: entityTypeFullName,
            entityId: entityId,
            changeTime: changeTime,
            propertyChanges: _propertyChanges?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'propertyChanges';
        _propertyChanges?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesAdminDtosAuditEntityChangeVo',
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
