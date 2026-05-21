// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_system_collections_generic_list_ai_admin_services_agent_roles_dtos_action_rule_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto
    extends AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final BuiltList<AiAdminServicesAgentRolesDtosActionRuleDto>? data;

  factory _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto(
          [void Function(
                  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto
      rebuild(
              void Function(
                      AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto &&
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
            r'AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto,
            AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDtoBuilder> {
  _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto?
      _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  ListBuilder<AiAdminServicesAgentRolesDtosActionRuleDto>? _data;
  ListBuilder<AiAdminServicesAgentRolesDtosActionRuleDto> get data =>
      _$this._data ??=
          ListBuilder<AiAdminServicesAgentRolesDtosActionRuleDto>();
  set data(ListBuilder<AiAdminServicesAgentRolesDtosActionRuleDto>? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDtoBuilder() {
    AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDtoBuilder
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
      AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto
      build() => _build();

  _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto
      _build() {
    _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto
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
            r'AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto',
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
