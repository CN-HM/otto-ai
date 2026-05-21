// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_controllers_runtime_status_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminControllersRuntimeStatusDto
    extends AiAdminControllersRuntimeStatusDto {
  @override
  final String? nodeId;
  @override
  final bool? runtimeEnabled;
  @override
  final DateTime? nodeStartedAtUtc;
  @override
  final int? onlineDeviceCount;
  @override
  final int? activeConversationCount;
  @override
  final int? aliveConversationCount;
  @override
  final int? udpSessionCount;
  @override
  final int? localSpeechIdleTimeoutMs;
  @override
  final BuiltList<AiAdminControllersRuntimeServiceStatusDto>? services;
  @override
  final AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto?
      conversationTrace;
  @override
  final AiAdminServicesRuntimeRuntimeReadinessSnapshotDto? readiness;

  factory _$AiAdminControllersRuntimeStatusDto(
          [void Function(AiAdminControllersRuntimeStatusDtoBuilder)?
              updates]) =>
      (AiAdminControllersRuntimeStatusDtoBuilder()..update(updates))._build();

  _$AiAdminControllersRuntimeStatusDto._(
      {this.nodeId,
      this.runtimeEnabled,
      this.nodeStartedAtUtc,
      this.onlineDeviceCount,
      this.activeConversationCount,
      this.aliveConversationCount,
      this.udpSessionCount,
      this.localSpeechIdleTimeoutMs,
      this.services,
      this.conversationTrace,
      this.readiness})
      : super._();
  @override
  AiAdminControllersRuntimeStatusDto rebuild(
          void Function(AiAdminControllersRuntimeStatusDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminControllersRuntimeStatusDtoBuilder toBuilder() =>
      AiAdminControllersRuntimeStatusDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminControllersRuntimeStatusDto &&
        nodeId == other.nodeId &&
        runtimeEnabled == other.runtimeEnabled &&
        nodeStartedAtUtc == other.nodeStartedAtUtc &&
        onlineDeviceCount == other.onlineDeviceCount &&
        activeConversationCount == other.activeConversationCount &&
        aliveConversationCount == other.aliveConversationCount &&
        udpSessionCount == other.udpSessionCount &&
        localSpeechIdleTimeoutMs == other.localSpeechIdleTimeoutMs &&
        services == other.services &&
        conversationTrace == other.conversationTrace &&
        readiness == other.readiness;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, nodeId.hashCode);
    _$hash = $jc(_$hash, runtimeEnabled.hashCode);
    _$hash = $jc(_$hash, nodeStartedAtUtc.hashCode);
    _$hash = $jc(_$hash, onlineDeviceCount.hashCode);
    _$hash = $jc(_$hash, activeConversationCount.hashCode);
    _$hash = $jc(_$hash, aliveConversationCount.hashCode);
    _$hash = $jc(_$hash, udpSessionCount.hashCode);
    _$hash = $jc(_$hash, localSpeechIdleTimeoutMs.hashCode);
    _$hash = $jc(_$hash, services.hashCode);
    _$hash = $jc(_$hash, conversationTrace.hashCode);
    _$hash = $jc(_$hash, readiness.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AiAdminControllersRuntimeStatusDto')
          ..add('nodeId', nodeId)
          ..add('runtimeEnabled', runtimeEnabled)
          ..add('nodeStartedAtUtc', nodeStartedAtUtc)
          ..add('onlineDeviceCount', onlineDeviceCount)
          ..add('activeConversationCount', activeConversationCount)
          ..add('aliveConversationCount', aliveConversationCount)
          ..add('udpSessionCount', udpSessionCount)
          ..add('localSpeechIdleTimeoutMs', localSpeechIdleTimeoutMs)
          ..add('services', services)
          ..add('conversationTrace', conversationTrace)
          ..add('readiness', readiness))
        .toString();
  }
}

class AiAdminControllersRuntimeStatusDtoBuilder
    implements
        Builder<AiAdminControllersRuntimeStatusDto,
            AiAdminControllersRuntimeStatusDtoBuilder> {
  _$AiAdminControllersRuntimeStatusDto? _$v;

  String? _nodeId;
  String? get nodeId => _$this._nodeId;
  set nodeId(String? nodeId) => _$this._nodeId = nodeId;

  bool? _runtimeEnabled;
  bool? get runtimeEnabled => _$this._runtimeEnabled;
  set runtimeEnabled(bool? runtimeEnabled) =>
      _$this._runtimeEnabled = runtimeEnabled;

  DateTime? _nodeStartedAtUtc;
  DateTime? get nodeStartedAtUtc => _$this._nodeStartedAtUtc;
  set nodeStartedAtUtc(DateTime? nodeStartedAtUtc) =>
      _$this._nodeStartedAtUtc = nodeStartedAtUtc;

  int? _onlineDeviceCount;
  int? get onlineDeviceCount => _$this._onlineDeviceCount;
  set onlineDeviceCount(int? onlineDeviceCount) =>
      _$this._onlineDeviceCount = onlineDeviceCount;

  int? _activeConversationCount;
  int? get activeConversationCount => _$this._activeConversationCount;
  set activeConversationCount(int? activeConversationCount) =>
      _$this._activeConversationCount = activeConversationCount;

  int? _aliveConversationCount;
  int? get aliveConversationCount => _$this._aliveConversationCount;
  set aliveConversationCount(int? aliveConversationCount) =>
      _$this._aliveConversationCount = aliveConversationCount;

  int? _udpSessionCount;
  int? get udpSessionCount => _$this._udpSessionCount;
  set udpSessionCount(int? udpSessionCount) =>
      _$this._udpSessionCount = udpSessionCount;

  int? _localSpeechIdleTimeoutMs;
  int? get localSpeechIdleTimeoutMs => _$this._localSpeechIdleTimeoutMs;
  set localSpeechIdleTimeoutMs(int? localSpeechIdleTimeoutMs) =>
      _$this._localSpeechIdleTimeoutMs = localSpeechIdleTimeoutMs;

  ListBuilder<AiAdminControllersRuntimeServiceStatusDto>? _services;
  ListBuilder<AiAdminControllersRuntimeServiceStatusDto> get services =>
      _$this._services ??=
          ListBuilder<AiAdminControllersRuntimeServiceStatusDto>();
  set services(
          ListBuilder<AiAdminControllersRuntimeServiceStatusDto>? services) =>
      _$this._services = services;

  AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDtoBuilder?
      _conversationTrace;
  AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDtoBuilder
      get conversationTrace => _$this._conversationTrace ??=
          AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDtoBuilder();
  set conversationTrace(
          AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDtoBuilder?
              conversationTrace) =>
      _$this._conversationTrace = conversationTrace;

  AiAdminServicesRuntimeRuntimeReadinessSnapshotDtoBuilder? _readiness;
  AiAdminServicesRuntimeRuntimeReadinessSnapshotDtoBuilder get readiness =>
      _$this._readiness ??=
          AiAdminServicesRuntimeRuntimeReadinessSnapshotDtoBuilder();
  set readiness(
          AiAdminServicesRuntimeRuntimeReadinessSnapshotDtoBuilder?
              readiness) =>
      _$this._readiness = readiness;

  AiAdminControllersRuntimeStatusDtoBuilder() {
    AiAdminControllersRuntimeStatusDto._defaults(this);
  }

  AiAdminControllersRuntimeStatusDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nodeId = $v.nodeId;
      _runtimeEnabled = $v.runtimeEnabled;
      _nodeStartedAtUtc = $v.nodeStartedAtUtc;
      _onlineDeviceCount = $v.onlineDeviceCount;
      _activeConversationCount = $v.activeConversationCount;
      _aliveConversationCount = $v.aliveConversationCount;
      _udpSessionCount = $v.udpSessionCount;
      _localSpeechIdleTimeoutMs = $v.localSpeechIdleTimeoutMs;
      _services = $v.services?.toBuilder();
      _conversationTrace = $v.conversationTrace?.toBuilder();
      _readiness = $v.readiness?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminControllersRuntimeStatusDto other) {
    _$v = other as _$AiAdminControllersRuntimeStatusDto;
  }

  @override
  void update(
      void Function(AiAdminControllersRuntimeStatusDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminControllersRuntimeStatusDto build() => _build();

  _$AiAdminControllersRuntimeStatusDto _build() {
    _$AiAdminControllersRuntimeStatusDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminControllersRuntimeStatusDto._(
            nodeId: nodeId,
            runtimeEnabled: runtimeEnabled,
            nodeStartedAtUtc: nodeStartedAtUtc,
            onlineDeviceCount: onlineDeviceCount,
            activeConversationCount: activeConversationCount,
            aliveConversationCount: aliveConversationCount,
            udpSessionCount: udpSessionCount,
            localSpeechIdleTimeoutMs: localSpeechIdleTimeoutMs,
            services: _services?.build(),
            conversationTrace: _conversationTrace?.build(),
            readiness: _readiness?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'services';
        _services?.build();
        _$failedField = 'conversationTrace';
        _conversationTrace?.build();
        _$failedField = 'readiness';
        _readiness?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminControllersRuntimeStatusDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
