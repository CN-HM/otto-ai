// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_http_remote_service_error_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpHttpRemoteServiceErrorInfo
    extends VoloAbpHttpRemoteServiceErrorInfo {
  @override
  final String? code;
  @override
  final String? message;
  @override
  final String? details;
  @override
  final BuiltMap<String, JsonObject?>? data;
  @override
  final BuiltList<VoloAbpHttpRemoteServiceValidationErrorInfo>?
      validationErrors;

  factory _$VoloAbpHttpRemoteServiceErrorInfo(
          [void Function(VoloAbpHttpRemoteServiceErrorInfoBuilder)? updates]) =>
      (VoloAbpHttpRemoteServiceErrorInfoBuilder()..update(updates))._build();

  _$VoloAbpHttpRemoteServiceErrorInfo._(
      {this.code, this.message, this.details, this.data, this.validationErrors})
      : super._();
  @override
  VoloAbpHttpRemoteServiceErrorInfo rebuild(
          void Function(VoloAbpHttpRemoteServiceErrorInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VoloAbpHttpRemoteServiceErrorInfoBuilder toBuilder() =>
      VoloAbpHttpRemoteServiceErrorInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VoloAbpHttpRemoteServiceErrorInfo &&
        code == other.code &&
        message == other.message &&
        details == other.details &&
        data == other.data &&
        validationErrors == other.validationErrors;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, details.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, validationErrors.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VoloAbpHttpRemoteServiceErrorInfo')
          ..add('code', code)
          ..add('message', message)
          ..add('details', details)
          ..add('data', data)
          ..add('validationErrors', validationErrors))
        .toString();
  }
}

class VoloAbpHttpRemoteServiceErrorInfoBuilder
    implements
        Builder<VoloAbpHttpRemoteServiceErrorInfo,
            VoloAbpHttpRemoteServiceErrorInfoBuilder> {
  _$VoloAbpHttpRemoteServiceErrorInfo? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _details;
  String? get details => _$this._details;
  set details(String? details) => _$this._details = details;

  MapBuilder<String, JsonObject?>? _data;
  MapBuilder<String, JsonObject?> get data =>
      _$this._data ??= MapBuilder<String, JsonObject?>();
  set data(MapBuilder<String, JsonObject?>? data) => _$this._data = data;

  ListBuilder<VoloAbpHttpRemoteServiceValidationErrorInfo>? _validationErrors;
  ListBuilder<VoloAbpHttpRemoteServiceValidationErrorInfo>
      get validationErrors => _$this._validationErrors ??=
          ListBuilder<VoloAbpHttpRemoteServiceValidationErrorInfo>();
  set validationErrors(
          ListBuilder<VoloAbpHttpRemoteServiceValidationErrorInfo>?
              validationErrors) =>
      _$this._validationErrors = validationErrors;

  VoloAbpHttpRemoteServiceErrorInfoBuilder() {
    VoloAbpHttpRemoteServiceErrorInfo._defaults(this);
  }

  VoloAbpHttpRemoteServiceErrorInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _details = $v.details;
      _data = $v.data?.toBuilder();
      _validationErrors = $v.validationErrors?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VoloAbpHttpRemoteServiceErrorInfo other) {
    _$v = other as _$VoloAbpHttpRemoteServiceErrorInfo;
  }

  @override
  void update(
      void Function(VoloAbpHttpRemoteServiceErrorInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpHttpRemoteServiceErrorInfo build() => _build();

  _$VoloAbpHttpRemoteServiceErrorInfo _build() {
    _$VoloAbpHttpRemoteServiceErrorInfo _$result;
    try {
      _$result = _$v ??
          _$VoloAbpHttpRemoteServiceErrorInfo._(
            code: code,
            message: message,
            details: details,
            data: _data?.build(),
            validationErrors: _validationErrors?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
        _$failedField = 'validationErrors';
        _validationErrors?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VoloAbpHttpRemoteServiceErrorInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
