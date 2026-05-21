// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_agent_roles_dtos_agent_role_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDto
    extends AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesAgentRolesDtosAgentRoleDto? data;

  factory _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDto rebuild(
          void Function(
                  AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDto &&
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
            r'AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDto,
            AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDto? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesAgentRolesDtosAgentRoleDtoBuilder? _data;
  AiAdminServicesAgentRolesDtosAgentRoleDtoBuilder get data =>
      _$this._data ??= AiAdminServicesAgentRolesDtosAgentRoleDtoBuilder();
  set data(AiAdminServicesAgentRolesDtosAgentRoleDtoBuilder? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder
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
      AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDto
      build() => _build();

  _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDto
      _build() {
    _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDto
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
            r'AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDto',
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
