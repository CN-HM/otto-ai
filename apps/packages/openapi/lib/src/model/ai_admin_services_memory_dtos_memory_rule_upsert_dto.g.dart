// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_memory_dtos_memory_rule_upsert_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesMemoryDtosMemoryRuleUpsertDto
    extends AiAdminServicesMemoryDtosMemoryRuleUpsertDto {
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

  factory _$AiAdminServicesMemoryDtosMemoryRuleUpsertDto(
          [void Function(AiAdminServicesMemoryDtosMemoryRuleUpsertDtoBuilder)?
              updates]) =>
      (AiAdminServicesMemoryDtosMemoryRuleUpsertDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesMemoryDtosMemoryRuleUpsertDto._(
      {this.ruleType,
      this.ruleName,
      this.instruction,
      this.ttlDays,
      this.isEnabled})
      : super._();
  @override
  AiAdminServicesMemoryDtosMemoryRuleUpsertDto rebuild(
          void Function(AiAdminServicesMemoryDtosMemoryRuleUpsertDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesMemoryDtosMemoryRuleUpsertDtoBuilder toBuilder() =>
      AiAdminServicesMemoryDtosMemoryRuleUpsertDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesMemoryDtosMemoryRuleUpsertDto &&
        ruleType == other.ruleType &&
        ruleName == other.ruleName &&
        instruction == other.instruction &&
        ttlDays == other.ttlDays &&
        isEnabled == other.isEnabled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ruleType.hashCode);
    _$hash = $jc(_$hash, ruleName.hashCode);
    _$hash = $jc(_$hash, instruction.hashCode);
    _$hash = $jc(_$hash, ttlDays.hashCode);
    _$hash = $jc(_$hash, isEnabled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesMemoryDtosMemoryRuleUpsertDto')
          ..add('ruleType', ruleType)
          ..add('ruleName', ruleName)
          ..add('instruction', instruction)
          ..add('ttlDays', ttlDays)
          ..add('isEnabled', isEnabled))
        .toString();
  }
}

class AiAdminServicesMemoryDtosMemoryRuleUpsertDtoBuilder
    implements
        Builder<AiAdminServicesMemoryDtosMemoryRuleUpsertDto,
            AiAdminServicesMemoryDtosMemoryRuleUpsertDtoBuilder> {
  _$AiAdminServicesMemoryDtosMemoryRuleUpsertDto? _$v;

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

  AiAdminServicesMemoryDtosMemoryRuleUpsertDtoBuilder() {
    AiAdminServicesMemoryDtosMemoryRuleUpsertDto._defaults(this);
  }

  AiAdminServicesMemoryDtosMemoryRuleUpsertDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ruleType = $v.ruleType;
      _ruleName = $v.ruleName;
      _instruction = $v.instruction;
      _ttlDays = $v.ttlDays;
      _isEnabled = $v.isEnabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesMemoryDtosMemoryRuleUpsertDto other) {
    _$v = other as _$AiAdminServicesMemoryDtosMemoryRuleUpsertDto;
  }

  @override
  void update(
      void Function(AiAdminServicesMemoryDtosMemoryRuleUpsertDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesMemoryDtosMemoryRuleUpsertDto build() => _build();

  _$AiAdminServicesMemoryDtosMemoryRuleUpsertDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesMemoryDtosMemoryRuleUpsertDto._(
          ruleType: ruleType,
          ruleName: ruleName,
          instruction: instruction,
          ttlDays: ttlDays,
          isEnabled: isEnabled,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
