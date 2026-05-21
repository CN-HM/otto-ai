// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_system_collections_generic_list_ai_admin_services_memory_dtos_memory_rule_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDto
    extends AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final BuiltList<AiAdminServicesMemoryDtosMemoryRuleDto>? data;

  factory _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDto(
          [void Function(
                  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDto
      rebuild(
              void Function(
                      AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDto &&
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
            r'AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDto,
            AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDtoBuilder> {
  _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDto?
      _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  ListBuilder<AiAdminServicesMemoryDtosMemoryRuleDto>? _data;
  ListBuilder<AiAdminServicesMemoryDtosMemoryRuleDto> get data =>
      _$this._data ??= ListBuilder<AiAdminServicesMemoryDtosMemoryRuleDto>();
  set data(ListBuilder<AiAdminServicesMemoryDtosMemoryRuleDto>? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDtoBuilder() {
    AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDtoBuilder
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
      AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDto
      build() => _build();

  _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDto
      _build() {
    _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDto
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
            r'AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDto',
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
