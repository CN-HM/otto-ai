// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_system_object.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultSystemObject
    extends AiAdminInfrastructureResultSystemObject {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final JsonObject? data;

  factory _$AiAdminInfrastructureResultSystemObject(
          [void Function(AiAdminInfrastructureResultSystemObjectBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultSystemObjectBuilder()..update(updates))
          ._build();

  _$AiAdminInfrastructureResultSystemObject._({this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultSystemObject rebuild(
          void Function(AiAdminInfrastructureResultSystemObjectBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultSystemObjectBuilder toBuilder() =>
      AiAdminInfrastructureResultSystemObjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminInfrastructureResultSystemObject &&
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
            r'AiAdminInfrastructureResultSystemObject')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultSystemObjectBuilder
    implements
        Builder<AiAdminInfrastructureResultSystemObject,
            AiAdminInfrastructureResultSystemObjectBuilder> {
  _$AiAdminInfrastructureResultSystemObject? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(JsonObject? data) => _$this._data = data;

  AiAdminInfrastructureResultSystemObjectBuilder() {
    AiAdminInfrastructureResultSystemObject._defaults(this);
  }

  AiAdminInfrastructureResultSystemObjectBuilder get _$this {
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
  void replace(AiAdminInfrastructureResultSystemObject other) {
    _$v = other as _$AiAdminInfrastructureResultSystemObject;
  }

  @override
  void update(
      void Function(AiAdminInfrastructureResultSystemObjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultSystemObject build() => _build();

  _$AiAdminInfrastructureResultSystemObject _build() {
    final _$result = _$v ??
        _$AiAdminInfrastructureResultSystemObject._(
          code: code,
          msg: msg,
          data: data,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
