// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_infrastructure_page_data_ai_admin_services_voice_dtos_timbre_details_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo
    extends AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo?
      data;

  factory _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo(
          [void Function(
                  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo
      rebuild(
              void Function(
                      AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo &&
        code == other.code &&
        msg == other.msg &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, msg.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo,
            AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVoBuilder> {
  _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo?
      _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVoBuilder?
      _data;
  AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVoBuilder
      get data => _$this._data ??=
          AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVoBuilder();
  set data(
          AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVoBuilder?
              data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVoBuilder() {
    AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo
        ._defaults(this);
  }

  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _msg = $v.msg;
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo
      build() => _build();

  _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo
      _build() {
    _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo
              ._(
            code: code,
            msg: msg,
            data: _data?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo',
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
