// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_system_string.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultSystemString
    extends AiAdminInfrastructureResultSystemString {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final String? data;

  factory _$AiAdminInfrastructureResultSystemString(
          [void Function(AiAdminInfrastructureResultSystemStringBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultSystemStringBuilder()..update(updates))
          ._build();

  _$AiAdminInfrastructureResultSystemString._({this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultSystemString rebuild(
          void Function(AiAdminInfrastructureResultSystemStringBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultSystemStringBuilder toBuilder() =>
      AiAdminInfrastructureResultSystemStringBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminInfrastructureResultSystemString &&
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
            r'AiAdminInfrastructureResultSystemString')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultSystemStringBuilder
    implements
        Builder<AiAdminInfrastructureResultSystemString,
            AiAdminInfrastructureResultSystemStringBuilder> {
  _$AiAdminInfrastructureResultSystemString? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  String? _data;
  String? get data => _$this._data;
  set data(String? data) => _$this._data = data;

  AiAdminInfrastructureResultSystemStringBuilder() {
    AiAdminInfrastructureResultSystemString._defaults(this);
  }

  AiAdminInfrastructureResultSystemStringBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _msg = $v.msg;
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminInfrastructureResultSystemString other) {
    _$v = other as _$AiAdminInfrastructureResultSystemString;
  }

  @override
  void update(
      void Function(AiAdminInfrastructureResultSystemStringBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultSystemString build() => _build();

  _$AiAdminInfrastructureResultSystemString _build() {
    final _$result = _$v ??
        _$AiAdminInfrastructureResultSystemString._(
          code: code,
          msg: msg,
          data: data,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
