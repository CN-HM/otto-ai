// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_agent_roles_agent_role_runtime_test_request_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto
    extends AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto {
  @override
  final String? agentRoleId;
  @override
  final String? agentRoleCode;
  @override
  final String? agentRoleReleaseId;
  @override
  final String? sessionId;
  @override
  final String? deviceId;
  @override
  final String? userText;
  @override
  final String? audioBase64;
  @override
  final String? audioFormat;
  @override
  final String? language;
  @override
  final String? responseFormat;

  factory _$AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto(
          [void Function(
                  AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDtoBuilder)?
              updates]) =>
      (AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto._(
      {this.agentRoleId,
      this.agentRoleCode,
      this.agentRoleReleaseId,
      this.sessionId,
      this.deviceId,
      this.userText,
      this.audioBase64,
      this.audioFormat,
      this.language,
      this.responseFormat})
      : super._();
  @override
  AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto rebuild(
          void Function(
                  AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDtoBuilder toBuilder() =>
      AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDtoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto &&
        agentRoleId == other.agentRoleId &&
        agentRoleCode == other.agentRoleCode &&
        agentRoleReleaseId == other.agentRoleReleaseId &&
        sessionId == other.sessionId &&
        deviceId == other.deviceId &&
        userText == other.userText &&
        audioBase64 == other.audioBase64 &&
        audioFormat == other.audioFormat &&
        language == other.language &&
        responseFormat == other.responseFormat;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, agentRoleId.hashCode);
    _$hash = $jc(_$hash, agentRoleCode.hashCode);
    _$hash = $jc(_$hash, agentRoleReleaseId.hashCode);
    _$hash = $jc(_$hash, sessionId.hashCode);
    _$hash = $jc(_$hash, deviceId.hashCode);
    _$hash = $jc(_$hash, userText.hashCode);
    _$hash = $jc(_$hash, audioBase64.hashCode);
    _$hash = $jc(_$hash, audioFormat.hashCode);
    _$hash = $jc(_$hash, language.hashCode);
    _$hash = $jc(_$hash, responseFormat.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto')
          ..add('agentRoleId', agentRoleId)
          ..add('agentRoleCode', agentRoleCode)
          ..add('agentRoleReleaseId', agentRoleReleaseId)
          ..add('sessionId', sessionId)
          ..add('deviceId', deviceId)
          ..add('userText', userText)
          ..add('audioBase64', audioBase64)
          ..add('audioFormat', audioFormat)
          ..add('language', language)
          ..add('responseFormat', responseFormat))
        .toString();
  }
}

class AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDtoBuilder
    implements
        Builder<AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto,
            AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDtoBuilder> {
  _$AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto? _$v;

  String? _agentRoleId;
  String? get agentRoleId => _$this._agentRoleId;
  set agentRoleId(String? agentRoleId) => _$this._agentRoleId = agentRoleId;

  String? _agentRoleCode;
  String? get agentRoleCode => _$this._agentRoleCode;
  set agentRoleCode(String? agentRoleCode) =>
      _$this._agentRoleCode = agentRoleCode;

  String? _agentRoleReleaseId;
  String? get agentRoleReleaseId => _$this._agentRoleReleaseId;
  set agentRoleReleaseId(String? agentRoleReleaseId) =>
      _$this._agentRoleReleaseId = agentRoleReleaseId;

  String? _sessionId;
  String? get sessionId => _$this._sessionId;
  set sessionId(String? sessionId) => _$this._sessionId = sessionId;

  String? _deviceId;
  String? get deviceId => _$this._deviceId;
  set deviceId(String? deviceId) => _$this._deviceId = deviceId;

  String? _userText;
  String? get userText => _$this._userText;
  set userText(String? userText) => _$this._userText = userText;

  String? _audioBase64;
  String? get audioBase64 => _$this._audioBase64;
  set audioBase64(String? audioBase64) => _$this._audioBase64 = audioBase64;

  String? _audioFormat;
  String? get audioFormat => _$this._audioFormat;
  set audioFormat(String? audioFormat) => _$this._audioFormat = audioFormat;

  String? _language;
  String? get language => _$this._language;
  set language(String? language) => _$this._language = language;

  String? _responseFormat;
  String? get responseFormat => _$this._responseFormat;
  set responseFormat(String? responseFormat) =>
      _$this._responseFormat = responseFormat;

  AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDtoBuilder() {
    AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto._defaults(this);
  }

  AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _agentRoleId = $v.agentRoleId;
      _agentRoleCode = $v.agentRoleCode;
      _agentRoleReleaseId = $v.agentRoleReleaseId;
      _sessionId = $v.sessionId;
      _deviceId = $v.deviceId;
      _userText = $v.userText;
      _audioBase64 = $v.audioBase64;
      _audioFormat = $v.audioFormat;
      _language = $v.language;
      _responseFormat = $v.responseFormat;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto other) {
    _$v = other as _$AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto build() => _build();

  _$AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto._(
          agentRoleId: agentRoleId,
          agentRoleCode: agentRoleCode,
          agentRoleReleaseId: agentRoleReleaseId,
          sessionId: sessionId,
          deviceId: deviceId,
          userText: userText,
          audioBase64: audioBase64,
          audioFormat: audioFormat,
          language: language,
          responseFormat: responseFormat,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
