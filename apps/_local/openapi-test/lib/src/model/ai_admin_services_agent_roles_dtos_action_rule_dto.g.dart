// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_agent_roles_dtos_action_rule_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAgentRolesDtosActionRuleDto
    extends AiAdminServicesAgentRolesDtosActionRuleDto {
  @override
  final String? id;
  @override
  final String? agentRoleId;
  @override
  final String? actionType;
  @override
  final String? name;
  @override
  final String? instruction;
  @override
  final int? isEnabled;
  @override
  final int? creator;
  @override
  final String? createdAt;
  @override
  final int? updater;
  @override
  final String? updatedAt;

  factory _$AiAdminServicesAgentRolesDtosActionRuleDto(
          [void Function(AiAdminServicesAgentRolesDtosActionRuleDtoBuilder)?
              updates]) =>
      (AiAdminServicesAgentRolesDtosActionRuleDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesAgentRolesDtosActionRuleDto._(
      {this.id,
      this.agentRoleId,
      this.actionType,
      this.name,
      this.instruction,
      this.isEnabled,
      this.creator,
      this.createdAt,
      this.updater,
      this.updatedAt})
      : super._();
  @override
  AiAdminServicesAgentRolesDtosActionRuleDto rebuild(
          void Function(AiAdminServicesAgentRolesDtosActionRuleDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAgentRolesDtosActionRuleDtoBuilder toBuilder() =>
      AiAdminServicesAgentRolesDtosActionRuleDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAgentRolesDtosActionRuleDto &&
        id == other.id &&
        agentRoleId == other.agentRoleId &&
        actionType == other.actionType &&
        name == other.name &&
        instruction == other.instruction &&
        isEnabled == other.isEnabled &&
        creator == other.creator &&
        createdAt == other.createdAt &&
        updater == other.updater &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, agentRoleId.hashCode);
    _$hash = $jc(_$hash, actionType.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, instruction.hashCode);
    _$hash = $jc(_$hash, isEnabled.hashCode);
    _$hash = $jc(_$hash, creator.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updater.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesAgentRolesDtosActionRuleDto')
          ..add('id', id)
          ..add('agentRoleId', agentRoleId)
          ..add('actionType', actionType)
          ..add('name', name)
          ..add('instruction', instruction)
          ..add('isEnabled', isEnabled)
          ..add('creator', creator)
          ..add('createdAt', createdAt)
          ..add('updater', updater)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class AiAdminServicesAgentRolesDtosActionRuleDtoBuilder
    implements
        Builder<AiAdminServicesAgentRolesDtosActionRuleDto,
            AiAdminServicesAgentRolesDtosActionRuleDtoBuilder> {
  _$AiAdminServicesAgentRolesDtosActionRuleDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _agentRoleId;
  String? get agentRoleId => _$this._agentRoleId;
  set agentRoleId(String? agentRoleId) => _$this._agentRoleId = agentRoleId;

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

  int? _creator;
  int? get creator => _$this._creator;
  set creator(int? creator) => _$this._creator = creator;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  int? _updater;
  int? get updater => _$this._updater;
  set updater(int? updater) => _$this._updater = updater;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  AiAdminServicesAgentRolesDtosActionRuleDtoBuilder() {
    AiAdminServicesAgentRolesDtosActionRuleDto._defaults(this);
  }

  AiAdminServicesAgentRolesDtosActionRuleDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _agentRoleId = $v.agentRoleId;
      _actionType = $v.actionType;
      _name = $v.name;
      _instruction = $v.instruction;
      _isEnabled = $v.isEnabled;
      _creator = $v.creator;
      _createdAt = $v.createdAt;
      _updater = $v.updater;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAgentRolesDtosActionRuleDto other) {
    _$v = other as _$AiAdminServicesAgentRolesDtosActionRuleDto;
  }

  @override
  void update(
      void Function(AiAdminServicesAgentRolesDtosActionRuleDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAgentRolesDtosActionRuleDto build() => _build();

  _$AiAdminServicesAgentRolesDtosActionRuleDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesAgentRolesDtosActionRuleDto._(
          id: id,
          agentRoleId: agentRoleId,
          actionType: actionType,
          name: name,
          instruction: instruction,
          isEnabled: isEnabled,
          creator: creator,
          createdAt: createdAt,
          updater: updater,
          updatedAt: updatedAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
