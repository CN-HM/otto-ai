// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_mcp_tools_dtos_mcp_tool_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto
    extends AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesMcpToolsDtosMcpToolDto? data;

  factory _$AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto rebuild(
          void Function(
                  AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto &&
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
            r'AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto,
            AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesMcpToolsDtosMcpToolDtoBuilder? _data;
  AiAdminServicesMcpToolsDtosMcpToolDtoBuilder get data =>
      _$this._data ??= AiAdminServicesMcpToolsDtosMcpToolDtoBuilder();
  set data(AiAdminServicesMcpToolsDtosMcpToolDtoBuilder? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDtoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto._defaults(
        this);
  }

  AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDtoBuilder
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
      AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto build() =>
      _build();

  _$AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto _build() {
    _$AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto._(
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
            r'AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto',
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
