// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_page_data_ai_admin_services_device_dtos_user_show_device_list_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo
    extends AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo {
  @override
  final int? total;
  @override
  final BuiltList<AiAdminServicesDeviceDtosUserShowDeviceListVo>? list;

  factory _$AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo(
          [void Function(
                  AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVoBuilder)?
              updates]) =>
      (AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo._(
      {this.total, this.list})
      : super._();
  @override
  AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo
      rebuild(
              void Function(
                      AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVoBuilder
      toBuilder() =>
          AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo &&
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
            r'AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo')
          ..add('total', total)
          ..add('list', list))
        .toString();
  }
}

class AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVoBuilder
    implements
        Builder<
            AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo,
            AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVoBuilder> {
  _$AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo?
      _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  ListBuilder<AiAdminServicesDeviceDtosUserShowDeviceListVo>? _list;
  ListBuilder<AiAdminServicesDeviceDtosUserShowDeviceListVo> get list =>
      _$this._list ??=
          ListBuilder<AiAdminServicesDeviceDtosUserShowDeviceListVo>();
  set list(ListBuilder<AiAdminServicesDeviceDtosUserShowDeviceListVo>? list) =>
      _$this._list = list;

  AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVoBuilder() {
    AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo
        ._defaults(this);
  }

  AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVoBuilder
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
      AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo
          other) {
    _$v = other
        as _$AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo
      build() => _build();

  _$AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo
      _build() {
    _$AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo
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
            r'AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo',
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
