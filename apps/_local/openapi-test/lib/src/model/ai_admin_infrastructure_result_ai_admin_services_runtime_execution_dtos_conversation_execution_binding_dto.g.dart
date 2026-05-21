// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_runtime_execution_dtos_conversation_execution_binding_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto
    extends AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto?
      data;

  factory _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto
      rebuild(
              void Function(
                      AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto &&
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
            r'AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto,
            AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto?
      _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoBuilder?
      _data;
  AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoBuilder
      get data => _$this._data ??=
          AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoBuilder();
  set data(
          AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoBuilder?
              data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoBuilder
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
      AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto
      build() => _build();

  _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto
      _build() {
    _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto
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
            r'AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto',
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
