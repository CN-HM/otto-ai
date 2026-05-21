// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_page_data_ai_admin_services_admin_dtos_audit_log_page_item_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVo
    extends AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVo {
  @override
  final int? total;
  @override
  final BuiltList<AiAdminServicesAdminDtosAuditLogPageItemVo>? list;

  factory _$AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVo(
          [void Function(
                  AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVoBuilder)?
              updates]) =>
      (AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVo._(
      {this.total, this.list})
      : super._();
  @override
  AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVo rebuild(
          void Function(
                  AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVoBuilder
      toBuilder() =>
          AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVo &&
        total == other.total &&
        list == other.list;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, list.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVo')
          ..add('total', total)
          ..add('list', list))
        .toString();
  }
}

class AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVoBuilder
    implements
        Builder<
            AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVo,
            AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVoBuilder> {
  _$AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVo?
      _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  ListBuilder<AiAdminServicesAdminDtosAuditLogPageItemVo>? _list;
  ListBuilder<AiAdminServicesAdminDtosAuditLogPageItemVo> get list =>
      _$this._list ??=
          ListBuilder<AiAdminServicesAdminDtosAuditLogPageItemVo>();
  set list(ListBuilder<AiAdminServicesAdminDtosAuditLogPageItemVo>? list) =>
      _$this._list = list;

  AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVoBuilder() {
    AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVo
        ._defaults(this);
  }

  AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _total = $v.total;
      _list = $v.list?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVo
          other) {
    _$v = other
        as _$AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVo;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVo
      build() => _build();

  _$AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVo
      _build() {
    _$AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVo
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVo
              ._(
            total: total,
            list: _list?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'list';
        _list?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVo',
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
