// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_controllers_runtime_status_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDto
    extends AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminControllersRuntimeStatusDto? data;

  factory _$AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDto rebuild(
          void Function(
                  AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDto &&
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
            r'AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDtoBuilder
    implements
        Builder<AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDto,
            AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDto? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminControllersRuntimeStatusDtoBuilder? _data;
  AiAdminControllersRuntimeStatusDtoBuilder get data =>
      _$this._data ??= AiAdminControllersRuntimeStatusDtoBuilder();
  set data(AiAdminControllersRuntimeStatusDtoBuilder? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDtoBuilder() {
    AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDto._defaults(
        this);
  }

  AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDtoBuilder
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
      AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDto other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDto build() =>
      _build();

  _$AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDto _build() {
    _$AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDto._(
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
            r'AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDto',
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
