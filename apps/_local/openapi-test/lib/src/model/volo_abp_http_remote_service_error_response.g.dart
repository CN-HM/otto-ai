// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_http_remote_service_error_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpHttpRemoteServiceErrorResponse
    extends VoloAbpHttpRemoteServiceErrorResponse {
  @override
  final VoloAbpHttpRemoteServiceErrorInfo? error;

  factory _$VoloAbpHttpRemoteServiceErrorResponse(
          [void Function(VoloAbpHttpRemoteServiceErrorResponseBuilder)?
              updates]) =>
      (VoloAbpHttpRemoteServiceErrorResponseBuilder()..update(updates))
          ._build();

  _$VoloAbpHttpRemoteServiceErrorResponse._({this.error}) : super._();
  @override
  VoloAbpHttpRemoteServiceErrorResponse rebuild(
          void Function(VoloAbpHttpRemoteServiceErrorResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VoloAbpHttpRemoteServiceErrorResponseBuilder toBuilder() =>
      VoloAbpHttpRemoteServiceErrorResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VoloAbpHttpRemoteServiceErrorResponse &&
        error == other.error;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpHttpRemoteServiceErrorResponse')
          ..add('error', error))
        .toString();
  }
}

class VoloAbpHttpRemoteServiceErrorResponseBuilder
    implements
        Builder<VoloAbpHttpRemoteServiceErrorResponse,
            VoloAbpHttpRemoteServiceErrorResponseBuilder> {
  _$VoloAbpHttpRemoteServiceErrorResponse? _$v;

  VoloAbpHttpRemoteServiceErrorInfoBuilder? _error;
  VoloAbpHttpRemoteServiceErrorInfoBuilder get error =>
      _$this._error ??= VoloAbpHttpRemoteServiceErrorInfoBuilder();
  set error(VoloAbpHttpRemoteServiceErrorInfoBuilder? error) =>
      _$this._error = error;

  VoloAbpHttpRemoteServiceErrorResponseBuilder() {
    VoloAbpHttpRemoteServiceErrorResponse._defaults(this);
  }

  VoloAbpHttpRemoteServiceErrorResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VoloAbpHttpRemoteServiceErrorResponse other) {
    _$v = other as _$VoloAbpHttpRemoteServiceErrorResponse;
  }

  @override
  void update(
      void Function(VoloAbpHttpRemoteServiceErrorResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpHttpRemoteServiceErrorResponse build() => _build();

  _$VoloAbpHttpRemoteServiceErrorResponse _build() {
    _$VoloAbpHttpRemoteServiceErrorResponse _$result;
    try {
      _$result = _$v ??
          _$VoloAbpHttpRemoteServiceErrorResponse._(
            error: _error?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'error';
        _error?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VoloAbpHttpRemoteServiceErrorResponse',
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
