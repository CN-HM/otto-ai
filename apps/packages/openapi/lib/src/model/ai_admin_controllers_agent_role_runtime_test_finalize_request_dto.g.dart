// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_controllers_agent_role_runtime_test_finalize_request_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto
    extends AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto {
  @override
  final String? sessionId;

  factory _$AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto(
          [void Function(
                  AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDtoBuilder)?
              updates]) =>
      (AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto._({this.sessionId})
      : super._();
  @override
  AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto rebuild(
          void Function(
                  AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDtoBuilder toBuilder() =>
      AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDtoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto &&
        sessionId == other.sessionId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, sessionId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto')
          ..add('sessionId', sessionId))
        .toString();
  }
}

class AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDtoBuilder
    implements
        Builder<AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto,
            AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDtoBuilder> {
  _$AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto? _$v;

  String? _sessionId;
  String? get sessionId => _$this._sessionId;
  set sessionId(String? sessionId) => _$this._sessionId = sessionId;

  AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDtoBuilder() {
    AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto._defaults(this);
  }

  AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sessionId = $v.sessionId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto other) {
    _$v = other as _$AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto;
  }

  @override
  void update(
      void Function(
              AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto build() => _build();

  _$AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto _build() {
    final _$result = _$v ??
        _$AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto._(
          sessionId: sessionId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
