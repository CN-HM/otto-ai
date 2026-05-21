// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_http_remote_service_validation_error_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpHttpRemoteServiceValidationErrorInfo
    extends VoloAbpHttpRemoteServiceValidationErrorInfo {
  @override
  final String? message;
  @override
  final BuiltList<String>? members;

  factory _$VoloAbpHttpRemoteServiceValidationErrorInfo(
          [void Function(VoloAbpHttpRemoteServiceValidationErrorInfoBuilder)?
              updates]) =>
      (VoloAbpHttpRemoteServiceValidationErrorInfoBuilder()..update(updates))
          ._build();

  _$VoloAbpHttpRemoteServiceValidationErrorInfo._({this.message, this.members})
      : super._();
  @override
  VoloAbpHttpRemoteServiceValidationErrorInfo rebuild(
          void Function(VoloAbpHttpRemoteServiceValidationErrorInfoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VoloAbpHttpRemoteServiceValidationErrorInfoBuilder toBuilder() =>
      VoloAbpHttpRemoteServiceValidationErrorInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VoloAbpHttpRemoteServiceValidationErrorInfo &&
        message == other.message &&
        members == other.members;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, members.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'VoloAbpHttpRemoteServiceValidationErrorInfo')
          ..add('message', message)
          ..add('members', members))
        .toString();
  }
}

class VoloAbpHttpRemoteServiceValidationErrorInfoBuilder
    implements
        Builder<VoloAbpHttpRemoteServiceValidationErrorInfo,
            VoloAbpHttpRemoteServiceValidationErrorInfoBuilder> {
  _$VoloAbpHttpRemoteServiceValidationErrorInfo? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ListBuilder<String>? _members;
  ListBuilder<String> get members => _$this._members ??= ListBuilder<String>();
  set members(ListBuilder<String>? members) => _$this._members = members;

  VoloAbpHttpRemoteServiceValidationErrorInfoBuilder() {
    VoloAbpHttpRemoteServiceValidationErrorInfo._defaults(this);
  }

  VoloAbpHttpRemoteServiceValidationErrorInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _members = $v.members?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VoloAbpHttpRemoteServiceValidationErrorInfo other) {
    _$v = other as _$VoloAbpHttpRemoteServiceValidationErrorInfo;
  }

  @override
  void update(
      void Function(VoloAbpHttpRemoteServiceValidationErrorInfoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpHttpRemoteServiceValidationErrorInfo build() => _build();

  _$VoloAbpHttpRemoteServiceValidationErrorInfo _build() {
    _$VoloAbpHttpRemoteServiceValidationErrorInfo _$result;
    try {
      _$result = _$v ??
          _$VoloAbpHttpRemoteServiceValidationErrorInfo._(
            message: message,
            members: _members?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'members';
        _members?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VoloAbpHttpRemoteServiceValidationErrorInfo',
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
