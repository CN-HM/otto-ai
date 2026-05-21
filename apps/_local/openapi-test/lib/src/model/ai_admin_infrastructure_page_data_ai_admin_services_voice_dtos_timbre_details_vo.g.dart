// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_page_data_ai_admin_services_voice_dtos_timbre_details_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo
    extends AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo {
  @override
  final int? total;
  @override
  final BuiltList<AiAdminServicesVoiceDtosTimbreDetailsVo>? list;

  factory _$AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo(
          [void Function(
                  AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVoBuilder)?
              updates]) =>
      (AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo._(
      {this.total, this.list})
      : super._();
  @override
  AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo rebuild(
          void Function(
                  AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVoBuilder
      toBuilder() =>
          AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo &&
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
            r'AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo')
          ..add('total', total)
          ..add('list', list))
        .toString();
  }
}

class AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVoBuilder
    implements
        Builder<
            AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo,
            AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVoBuilder> {
  _$AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo? _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  ListBuilder<AiAdminServicesVoiceDtosTimbreDetailsVo>? _list;
  ListBuilder<AiAdminServicesVoiceDtosTimbreDetailsVo> get list =>
      _$this._list ??= ListBuilder<AiAdminServicesVoiceDtosTimbreDetailsVo>();
  set list(ListBuilder<AiAdminServicesVoiceDtosTimbreDetailsVo>? list) =>
      _$this._list = list;

  AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVoBuilder() {
    AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo
        ._defaults(this);
  }

  AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVoBuilder
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
      AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo
          other) {
    _$v = other
        as _$AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo
      build() => _build();

  _$AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo
      _build() {
    _$AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo
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
            r'AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo',
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
