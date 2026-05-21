// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_agent_roles_dtos_action_rule_upsert_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAgentRolesDtosActionRuleUpsertDto
    extends AiAdminServicesAgentRolesDtosActionRuleUpsertDto {
  @override
  final String? actionType;
  @override
  final String? name;
  @override
  final String? instruction;
  @override
  final int? isEnabled;

  factory _$AiAdminServicesAgentRolesDtosActionRuleUpsertDto(
          [void Function(
                  AiAdminServicesAgentRolesDtosActionRuleUpsertDtoBuilder)?
              updates]) =>
      (AiAdminServicesAgentRolesDtosActionRuleUpsertDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesAgentRolesDtosActionRuleUpsertDto._(
      {this.actionType, this.name, this.instruction, this.isEnabled})
      : super._();
  @override
  AiAdminServicesAgentRolesDtosActionRuleUpsertDto rebuild(
          void Function(AiAdminServicesAgentRolesDtosActionRuleUpsertDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAgentRolesDtosActionRuleUpsertDtoBuilder toBuilder() =>
      AiAdminServicesAgentRolesDtosActionRuleUpsertDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAgentRolesDtosActionRuleUpsertDto &&
        actionType == other.actionType &&
        name == other.name &&
        instruction == other.instruction &&
        isEnabled == other.isEnabled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, actionType.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, instruction.hashCode);
    _$hash = $jc(_$hash, isEnabled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesAgentRolesDtosActionRuleUpsertDto')
          ..add('actionType', actionType)
          ..add('name', name)
          ..add('instruction', instruction)
          ..add('isEnabled', isEnabled))
        .toString();
  }
}

class AiAdminServicesAgentRolesDtosActionRuleUpsertDtoBuilder
    implements
        Builder<AiAdminServicesAgentRolesDtosActionRuleUpsertDto,
            AiAdminServicesAgentRolesDtosActionRuleUpsertDtoBuilder> {
  _$AiAdminServicesAgentRolesDtosActionRuleUpsertDto? _$v;

  String? _actionType;
  String? get actionType => _$this._actionType;
  set actionType(String? actionType) => _$this._actionType = actionType;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _instruction;
  String? get instruction => _$this._instruction;
  set instruction(String? instruction) => _$this._instruction = instruction;

  int? _isEnabled;
  int? get isEnabled => _$this._isEnabled;
  set isEnabled(int? isEnabled) => _$this._isEnabled = isEnabled;

  AiAdminServicesAgentRolesDtosActionRuleUpsertDtoBuilder() {
    AiAdminServicesAgentRolesDtosActionRuleUpsertDto._defaults(this);
  }

  AiAdminServicesAgentRolesDtosActionRuleUpsertDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _actionType = $v.actionType;
      _name = $v.name;
      _instruction = $v.instruction;
      _isEnabled = $v.isEnabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAgentRolesDtosActionRuleUpsertDto other) {
    _$v = other as _$AiAdminServicesAgentRolesDtosActionRuleUpsertDto;
  }

  @override
  void update(
      void Function(AiAdminServicesAgentRolesDtosActionRuleUpsertDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAgentRolesDtosActionRuleUpsertDto build() => _build();

  _$AiAdminServicesAgentRolesDtosActionRuleUpsertDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesAgentRolesDtosActionRuleUpsertDto._(
          actionType: actionType,
          name: name,
          instruction: instruction,
          isEnabled: isEnabled,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
