// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_system_collections_generic_list_system_string.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemString
    extends AiAdminInfrastructureResultSystemCollectionsGenericListSystemString {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final BuiltList<String>? data;

  factory _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemString(
          [void Function(
                  AiAdminInfrastructureResultSystemCollectionsGenericListSystemStringBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultSystemCollectionsGenericListSystemStringBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemString._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultSystemCollectionsGenericListSystemString rebuild(
          void Function(
                  AiAdminInfrastructureResultSystemCollectionsGenericListSystemStringBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultSystemCollectionsGenericListSystemStringBuilder
      toBuilder() =>
          AiAdminInfrastructureResultSystemCollectionsGenericListSystemStringBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultSystemCollectionsGenericListSystemString &&
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
            r'AiAdminInfrastructureResultSystemCollectionsGenericListSystemString')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultSystemCollectionsGenericListSystemStringBuilder
    implements
        Builder<
            AiAdminInfrastructureResultSystemCollectionsGenericListSystemString,
            AiAdminInfrastructureResultSystemCollectionsGenericListSystemStringBuilder> {
  _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemString? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  ListBuilder<String>? _data;
  ListBuilder<String> get data => _$this._data ??= ListBuilder<String>();
  set data(ListBuilder<String>? data) => _$this._data = data;

  AiAdminInfrastructureResultSystemCollectionsGenericListSystemStringBuilder() {
    AiAdminInfrastructureResultSystemCollectionsGenericListSystemString
        ._defaults(this);
  }

  AiAdminInfrastructureResultSystemCollectionsGenericListSystemStringBuilder
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
      AiAdminInfrastructureResultSystemCollectionsGenericListSystemString
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemString;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultSystemCollectionsGenericListSystemStringBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultSystemCollectionsGenericListSystemString build() =>
      _build();

  _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemString
      _build() {
    _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemString
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemString
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
            r'AiAdminInfrastructureResultSystemCollectionsGenericListSystemString',
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
