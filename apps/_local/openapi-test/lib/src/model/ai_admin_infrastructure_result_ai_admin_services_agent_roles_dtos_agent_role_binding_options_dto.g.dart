// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_agent_roles_dtos_agent_role_binding_options_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto
    extends AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto? data;

  factory _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto
      rebuild(
              void Function(
                      AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto &&
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
            r'AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto,
            AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto?
      _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoBuilder? _data;
  AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoBuilder get data =>
      _$this._data ??=
          AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoBuilder();
  set data(
          AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoBuilder?
              data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoBuilder
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
      AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto
      build() => _build();

  _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto
      _build() {
    _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto
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
            r'AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto',
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
