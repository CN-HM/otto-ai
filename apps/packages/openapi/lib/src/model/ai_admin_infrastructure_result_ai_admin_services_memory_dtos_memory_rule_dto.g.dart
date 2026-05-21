// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_memory_dtos_memory_rule_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDto
    extends AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesMemoryDtosMemoryRuleDto? data;

  factory _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDto rebuild(
          void Function(
                  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDto &&
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
            r'AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDto,
            AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDto? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesMemoryDtosMemoryRuleDtoBuilder? _data;
  AiAdminServicesMemoryDtosMemoryRuleDtoBuilder get data =>
      _$this._data ??= AiAdminServicesMemoryDtosMemoryRuleDtoBuilder();
  set data(AiAdminServicesMemoryDtosMemoryRuleDtoBuilder? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDtoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDto._defaults(
        this);
  }

  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDtoBuilder
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
      AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDto other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDto build() =>
      _build();

  _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDto _build() {
    _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDto._(
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
            r'AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDto',
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
