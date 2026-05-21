// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_voice_dtos_timbre_details_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo
    extends AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesVoiceDtosTimbreDetailsVo? data;

  factory _$AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo rebuild(
          void Function(
                  AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo &&
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
            r'AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo,
            AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesVoiceDtosTimbreDetailsVoBuilder? _data;
  AiAdminServicesVoiceDtosTimbreDetailsVoBuilder get data =>
      _$this._data ??= AiAdminServicesVoiceDtosTimbreDetailsVoBuilder();
  set data(AiAdminServicesVoiceDtosTimbreDetailsVoBuilder? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo
        ._defaults(this);
  }

  AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVoBuilder
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
      AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo build() =>
      _build();

  _$AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo
      _build() {
    _$AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo
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
            r'AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo',
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
