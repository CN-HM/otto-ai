// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_system_collections_generic_list_system_int64.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64
    extends AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64 {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final BuiltList<int>? data;

  factory _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64(
          [void Function(
                  AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64Builder)?
              updates]) =>
      (AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64Builder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64 rebuild(
          void Function(
                  AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64Builder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64Builder
      toBuilder() =>
          AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64Builder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64 &&
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
            r'AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64Builder
    implements
        Builder<
            AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64,
            AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64Builder> {
  _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  ListBuilder<int>? _data;
  ListBuilder<int> get data => _$this._data ??= ListBuilder<int>();
  set data(ListBuilder<int>? data) => _$this._data = data;

  AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64Builder() {
    AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64
        ._defaults(this);
  }

  AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64Builder
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
      AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64Builder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64 build() =>
      _build();

  _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64
      _build() {
    _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64
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
            r'AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64',
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
