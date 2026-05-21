// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_memory_dtos_memory_rule_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesMemoryDtosMemoryRuleDto
    extends AiAdminServicesMemoryDtosMemoryRuleDto {
  @override
  final String? id;
  @override
  final String? libraryId;
  @override
  final AiAdminServicesMemoryMemoryRuleType? ruleType;
  @override
  final String? ruleName;
  @override
  final String? instruction;
  @override
  final int? ttlDays;
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

  factory _$AiAdminServicesMemoryDtosMemoryRuleDto(
          [void Function(AiAdminServicesMemoryDtosMemoryRuleDtoBuilder)?
              updates]) =>
      (AiAdminServicesMemoryDtosMemoryRuleDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesMemoryDtosMemoryRuleDto._(
      {this.id,
      this.libraryId,
      this.ruleType,
      this.ruleName,
      this.instruction,
      this.ttlDays,
      this.isEnabled,
      this.creator,
      this.createdAt,
      this.updater,
      this.updatedAt})
      : super._();
  @override
  AiAdminServicesMemoryDtosMemoryRuleDto rebuild(
          void Function(AiAdminServicesMemoryDtosMemoryRuleDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesMemoryDtosMemoryRuleDtoBuilder toBuilder() =>
      AiAdminServicesMemoryDtosMemoryRuleDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesMemoryDtosMemoryRuleDto &&
        id == other.id &&
        libraryId == other.libraryId &&
        ruleType == other.ruleType &&
        ruleName == other.ruleName &&
        instruction == other.instruction &&
        ttlDays == other.ttlDays &&
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
    _$hash = $jc(_$hash, libraryId.hashCode);
    _$hash = $jc(_$hash, ruleType.hashCode);
    _$hash = $jc(_$hash, ruleName.hashCode);
    _$hash = $jc(_$hash, instruction.hashCode);
    _$hash = $jc(_$hash, ttlDays.hashCode);
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
            r'AiAdminServicesMemoryDtosMemoryRuleDto')
          ..add('id', id)
          ..add('libraryId', libraryId)
          ..add('ruleType', ruleType)
          ..add('ruleName', ruleName)
          ..add('instruction', instruction)
          ..add('ttlDays', ttlDays)
          ..add('isEnabled', isEnabled)
          ..add('creator', creator)
          ..add('createdAt', createdAt)
          ..add('updater', updater)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class AiAdminServicesMemoryDtosMemoryRuleDtoBuilder
    implements
        Builder<AiAdminServicesMemoryDtosMemoryRuleDto,
            AiAdminServicesMemoryDtosMemoryRuleDtoBuilder> {
  _$AiAdminServicesMemoryDtosMemoryRuleDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _libraryId;
  String? get libraryId => _$this._libraryId;
  set libraryId(String? libraryId) => _$this._libraryId = libraryId;

  AiAdminServicesMemoryMemoryRuleType? _ruleType;
  AiAdminServicesMemoryMemoryRuleType? get ruleType => _$this._ruleType;
  set ruleType(AiAdminServicesMemoryMemoryRuleType? ruleType) =>
      _$this._ruleType = ruleType;

  String? _ruleName;
  String? get ruleName => _$this._ruleName;
  set ruleName(String? ruleName) => _$this._ruleName = ruleName;

  String? _instruction;
  String? get instruction => _$this._instruction;
  set instruction(String? instruction) => _$this._instruction = instruction;

  int? _ttlDays;
  int? get ttlDays => _$this._ttlDays;
  set ttlDays(int? ttlDays) => _$this._ttlDays = ttlDays;

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

  AiAdminServicesMemoryDtosMemoryRuleDtoBuilder() {
    AiAdminServicesMemoryDtosMemoryRuleDto._defaults(this);
  }

  AiAdminServicesMemoryDtosMemoryRuleDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _libraryId = $v.libraryId;
      _ruleType = $v.ruleType;
      _ruleName = $v.ruleName;
      _instruction = $v.instruction;
      _ttlDays = $v.ttlDays;
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
  void replace(AiAdminServicesMemoryDtosMemoryRuleDto other) {
    _$v = other as _$AiAdminServicesMemoryDtosMemoryRuleDto;
  }

  @override
  void update(
      void Function(AiAdminServicesMemoryDtosMemoryRuleDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesMemoryDtosMemoryRuleDto build() => _build();

  _$AiAdminServicesMemoryDtosMemoryRuleDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesMemoryDtosMemoryRuleDto._(
          id: id,
          libraryId: libraryId,
          ruleType: ruleType,
          ruleName: ruleName,
          instruction: instruction,
          ttlDays: ttlDays,
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
