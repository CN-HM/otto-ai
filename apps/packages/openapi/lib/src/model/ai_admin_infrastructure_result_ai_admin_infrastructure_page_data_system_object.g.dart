// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_infrastructure_page_data_system_object.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObject
    extends AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObject {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminInfrastructurePageDataSystemObject? data;

  factory _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObject(
          [void Function(
                  AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObjectBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObjectBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObject._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObject rebuild(
          void Function(
                  AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObjectBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObjectBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObjectBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObject &&
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
            r'AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObject')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObjectBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObject,
            AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObjectBuilder> {
  _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObject? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminInfrastructurePageDataSystemObjectBuilder? _data;
  AiAdminInfrastructurePageDataSystemObjectBuilder get data =>
      _$this._data ??= AiAdminInfrastructurePageDataSystemObjectBuilder();
  set data(AiAdminInfrastructurePageDataSystemObjectBuilder? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObjectBuilder() {
    AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObject
        ._defaults(this);
  }

  AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObjectBuilder
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
      AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObject
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObject;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObjectBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObject
      build() => _build();

  _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObject
      _build() {
    _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObject
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObject
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
            r'AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObject',
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
