// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_agent_roles_agent_role_runtime_test_stage_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto
    extends AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto {
  @override
  final String? status;
  @override
  final int? durationMs;
  @override
  final String? errorMessage;
  @override
  final AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto? trace;

  factory _$AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto(
          [void Function(
                  AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder)?
              updates]) =>
      (AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto._(
      {this.status, this.durationMs, this.errorMessage, this.trace})
      : super._();
  @override
  AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto rebuild(
          void Function(
                  AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder toBuilder() =>
      AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto &&
        status == other.status &&
        durationMs == other.durationMs &&
        errorMessage == other.errorMessage &&
        trace == other.trace;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, durationMs.hashCode);
    _$hash = $jc(_$hash, errorMessage.hashCode);
    _$hash = $jc(_$hash, trace.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto')
          ..add('status', status)
          ..add('durationMs', durationMs)
          ..add('errorMessage', errorMessage)
          ..add('trace', trace))
        .toString();
  }
}

class AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder
    implements
        Builder<AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto,
            AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder> {
  _$AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  int? _durationMs;
  int? get durationMs => _$this._durationMs;
  set durationMs(int? durationMs) => _$this._durationMs = durationMs;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDtoBuilder? _trace;
  AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDtoBuilder get trace =>
      _$this._trace ??=
          AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDtoBuilder();
  set trace(
          AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDtoBuilder?
              trace) =>
      _$this._trace = trace;

  AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder() {
    AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto._defaults(this);
  }

  AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _durationMs = $v.durationMs;
      _errorMessage = $v.errorMessage;
      _trace = $v.trace?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto other) {
    _$v = other as _$AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto build() => _build();

  _$AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto _build() {
    _$AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto._(
            status: status,
            durationMs: durationMs,
            errorMessage: errorMessage,
            trace: _trace?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'trace';
        _trace?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto',
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
