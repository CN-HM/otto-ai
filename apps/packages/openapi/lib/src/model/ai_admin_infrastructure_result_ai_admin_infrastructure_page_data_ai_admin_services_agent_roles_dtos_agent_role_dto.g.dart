// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_infrastructure_page_data_ai_admin_services_agent_roles_dtos_agent_role_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto
    extends AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto?
      data;

  factory _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto
      rebuild(
              void Function(
                      AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto &&
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
            r'AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto,
            AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto?
      _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder?
      _data;
  AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder
      get data => _$this._data ??=
          AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder();
  set data(
          AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder?
              data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder() {
    AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder
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
      AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto
      build() => _build();

  _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto
      _build() {
    _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto
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
            r'AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto',
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
