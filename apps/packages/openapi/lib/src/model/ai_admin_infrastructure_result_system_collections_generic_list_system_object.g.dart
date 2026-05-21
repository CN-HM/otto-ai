// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_system_collections_generic_list_system_object.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemObject
    extends AiAdminInfrastructureResultSystemCollectionsGenericListSystemObject {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final BuiltList<JsonObject?>? data;

  factory _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemObject(
          [void Function(
                  AiAdminInfrastructureResultSystemCollectionsGenericListSystemObjectBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultSystemCollectionsGenericListSystemObjectBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemObject._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultSystemCollectionsGenericListSystemObject rebuild(
          void Function(
                  AiAdminInfrastructureResultSystemCollectionsGenericListSystemObjectBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultSystemCollectionsGenericListSystemObjectBuilder
      toBuilder() =>
          AiAdminInfrastructureResultSystemCollectionsGenericListSystemObjectBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultSystemCollectionsGenericListSystemObject &&
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
            r'AiAdminInfrastructureResultSystemCollectionsGenericListSystemObject')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultSystemCollectionsGenericListSystemObjectBuilder
    implements
        Builder<
            AiAdminInfrastructureResultSystemCollectionsGenericListSystemObject,
            AiAdminInfrastructureResultSystemCollectionsGenericListSystemObjectBuilder> {
  _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemObject? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  ListBuilder<JsonObject?>? _data;
  ListBuilder<JsonObject?> get data =>
      _$this._data ??= ListBuilder<JsonObject?>();
  set data(ListBuilder<JsonObject?>? data) => _$this._data = data;

  AiAdminInfrastructureResultSystemCollectionsGenericListSystemObjectBuilder() {
    AiAdminInfrastructureResultSystemCollectionsGenericListSystemObject
        ._defaults(this);
  }

  AiAdminInfrastructureResultSystemCollectionsGenericListSystemObjectBuilder
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
      AiAdminInfrastructureResultSystemCollectionsGenericListSystemObject
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemObject;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultSystemCollectionsGenericListSystemObjectBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultSystemCollectionsGenericListSystemObject build() =>
      _build();

  _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemObject
      _build() {
    _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemObject
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemObject
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
            r'AiAdminInfrastructureResultSystemCollectionsGenericListSystemObject',
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
