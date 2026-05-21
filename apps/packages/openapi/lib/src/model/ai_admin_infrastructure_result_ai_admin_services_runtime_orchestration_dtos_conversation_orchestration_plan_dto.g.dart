// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_runtime_orchestration_dtos_conversation_orchestration_plan_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto
    extends AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto?
      data;

  factory _$AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto
      rebuild(
              void Function(
                      AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto &&
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
            r'AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto,
            AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto?
      _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder?
      _data;
  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder
      get data => _$this._data ??=
          AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder();
  set data(
          AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder?
              data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder
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
      AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto
      build() => _build();

  _$AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto
      _build() {
    _$AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto
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
            r'AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto',
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
