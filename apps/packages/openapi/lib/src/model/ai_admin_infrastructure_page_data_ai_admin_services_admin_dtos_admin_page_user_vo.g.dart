// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_page_data_ai_admin_services_admin_dtos_admin_page_user_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo
    extends AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo {
  @override
  final int? total;
  @override
  final BuiltList<AiAdminServicesAdminDtosAdminPageUserVo>? list;

  factory _$AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo(
          [void Function(
                  AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVoBuilder)?
              updates]) =>
      (AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo._(
      {this.total, this.list})
      : super._();
  @override
  AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo rebuild(
          void Function(
                  AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVoBuilder
      toBuilder() =>
          AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo &&
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
            r'AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo')
          ..add('total', total)
          ..add('list', list))
        .toString();
  }
}

class AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVoBuilder
    implements
        Builder<
            AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo,
            AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVoBuilder> {
  _$AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo? _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  ListBuilder<AiAdminServicesAdminDtosAdminPageUserVo>? _list;
  ListBuilder<AiAdminServicesAdminDtosAdminPageUserVo> get list =>
      _$this._list ??= ListBuilder<AiAdminServicesAdminDtosAdminPageUserVo>();
  set list(ListBuilder<AiAdminServicesAdminDtosAdminPageUserVo>? list) =>
      _$this._list = list;

  AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVoBuilder() {
    AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo
        ._defaults(this);
  }

  AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVoBuilder
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
      AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo
          other) {
    _$v = other
        as _$AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo
      build() => _build();

  _$AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo
      _build() {
    _$AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo
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
            r'AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo',
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
