// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_agent_roles_dtos_action_rule_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto
    extends AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesAgentRolesDtosActionRuleDto? data;

  factory _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto rebuild(
          void Function(
                  AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto &&
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
            r'AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto,
            AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesAgentRolesDtosActionRuleDtoBuilder? _data;
  AiAdminServicesAgentRolesDtosActionRuleDtoBuilder get data =>
      _$this._data ??= AiAdminServicesAgentRolesDtosActionRuleDtoBuilder();
  set data(AiAdminServicesAgentRolesDtosActionRuleDtoBuilder? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDtoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDtoBuilder
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
      AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto
      build() => _build();

  _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto
      _build() {
    _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto
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
            r'AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto',
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
