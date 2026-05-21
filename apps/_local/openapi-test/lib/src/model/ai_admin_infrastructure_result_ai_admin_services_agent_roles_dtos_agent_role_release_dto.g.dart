// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_agent_roles_dtos_agent_role_release_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDto
    extends AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesAgentRolesDtosAgentRoleReleaseDto? data;

  factory _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDto
      rebuild(
              void Function(
                      AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDto &&
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
            r'AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDto,
            AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDto?
      _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesAgentRolesDtosAgentRoleReleaseDtoBuilder? _data;
  AiAdminServicesAgentRolesDtosAgentRoleReleaseDtoBuilder get data =>
      _$this._data ??=
          AiAdminServicesAgentRolesDtosAgentRoleReleaseDtoBuilder();
  set data(AiAdminServicesAgentRolesDtosAgentRoleReleaseDtoBuilder? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDtoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDtoBuilder
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
      AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDto
      build() => _build();

  _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDto
      _build() {
    _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDto
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
            r'AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDto',
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
