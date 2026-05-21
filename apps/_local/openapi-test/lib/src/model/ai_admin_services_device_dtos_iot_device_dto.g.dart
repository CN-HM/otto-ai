// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_device_dtos_iot_device_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesDeviceDtosIotDeviceDto
    extends AiAdminServicesDeviceDtosIotDeviceDto {
  @override
  final String? id;
  @override
  final String? macAddress;
  @override
  final String? alias;
  @override
  final String? agentRoleId;
  @override
  final String? agentRoleName;
  @override
  final String? agentRoleReleaseId;
  @override
  final String? agentRoleVersion;
  @override
  final String? board;
  @override
  final String? appVersion;
  @override
  final bool? isOnline;
  @override
  final DateTime? lastConnectedAt;
  @override
  final int? autoUpdate;

  factory _$AiAdminServicesDeviceDtosIotDeviceDto(
          [void Function(AiAdminServicesDeviceDtosIotDeviceDtoBuilder)?
              updates]) =>
      (AiAdminServicesDeviceDtosIotDeviceDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesDeviceDtosIotDeviceDto._(
      {this.id,
      this.macAddress,
      this.alias,
      this.agentRoleId,
      this.agentRoleName,
      this.agentRoleReleaseId,
      this.agentRoleVersion,
      this.board,
      this.appVersion,
      this.isOnline,
      this.lastConnectedAt,
      this.autoUpdate})
      : super._();
  @override
  AiAdminServicesDeviceDtosIotDeviceDto rebuild(
          void Function(AiAdminServicesDeviceDtosIotDeviceDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesDeviceDtosIotDeviceDtoBuilder toBuilder() =>
      AiAdminServicesDeviceDtosIotDeviceDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesDeviceDtosIotDeviceDto &&
        id == other.id &&
        macAddress == other.macAddress &&
        alias == other.alias &&
        agentRoleId == other.agentRoleId &&
        agentRoleName == other.agentRoleName &&
        agentRoleReleaseId == other.agentRoleReleaseId &&
        agentRoleVersion == other.agentRoleVersion &&
        board == other.board &&
        appVersion == other.appVersion &&
        isOnline == other.isOnline &&
        lastConnectedAt == other.lastConnectedAt &&
        autoUpdate == other.autoUpdate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, macAddress.hashCode);
    _$hash = $jc(_$hash, alias.hashCode);
    _$hash = $jc(_$hash, agentRoleId.hashCode);
    _$hash = $jc(_$hash, agentRoleName.hashCode);
    _$hash = $jc(_$hash, agentRoleReleaseId.hashCode);
    _$hash = $jc(_$hash, agentRoleVersion.hashCode);
    _$hash = $jc(_$hash, board.hashCode);
    _$hash = $jc(_$hash, appVersion.hashCode);
    _$hash = $jc(_$hash, isOnline.hashCode);
    _$hash = $jc(_$hash, lastConnectedAt.hashCode);
    _$hash = $jc(_$hash, autoUpdate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesDeviceDtosIotDeviceDto')
          ..add('id', id)
          ..add('macAddress', macAddress)
          ..add('alias', alias)
          ..add('agentRoleId', agentRoleId)
          ..add('agentRoleName', agentRoleName)
          ..add('agentRoleReleaseId', agentRoleReleaseId)
          ..add('agentRoleVersion', agentRoleVersion)
          ..add('board', board)
          ..add('appVersion', appVersion)
          ..add('isOnline', isOnline)
          ..add('lastConnectedAt', lastConnectedAt)
          ..add('autoUpdate', autoUpdate))
        .toString();
  }
}

class AiAdminServicesDeviceDtosIotDeviceDtoBuilder
    implements
        Builder<AiAdminServicesDeviceDtosIotDeviceDto,
            AiAdminServicesDeviceDtosIotDeviceDtoBuilder> {
  _$AiAdminServicesDeviceDtosIotDeviceDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _macAddress;
  String? get macAddress => _$this._macAddress;
  set macAddress(String? macAddress) => _$this._macAddress = macAddress;

  String? _alias;
  String? get alias => _$this._alias;
  set alias(String? alias) => _$this._alias = alias;

  String? _agentRoleId;
  String? get agentRoleId => _$this._agentRoleId;
  set agentRoleId(String? agentRoleId) => _$this._agentRoleId = agentRoleId;

  String? _agentRoleName;
  String? get agentRoleName => _$this._agentRoleName;
  set agentRoleName(String? agentRoleName) =>
      _$this._agentRoleName = agentRoleName;

  String? _agentRoleReleaseId;
  String? get agentRoleReleaseId => _$this._agentRoleReleaseId;
  set agentRoleReleaseId(String? agentRoleReleaseId) =>
      _$this._agentRoleReleaseId = agentRoleReleaseId;

  String? _agentRoleVersion;
  String? get agentRoleVersion => _$this._agentRoleVersion;
  set agentRoleVersion(String? agentRoleVersion) =>
      _$this._agentRoleVersion = agentRoleVersion;

  String? _board;
  String? get board => _$this._board;
  set board(String? board) => _$this._board = board;

  String? _appVersion;
  String? get appVersion => _$this._appVersion;
  set appVersion(String? appVersion) => _$this._appVersion = appVersion;

  bool? _isOnline;
  bool? get isOnline => _$this._isOnline;
  set isOnline(bool? isOnline) => _$this._isOnline = isOnline;

  DateTime? _lastConnectedAt;
  DateTime? get lastConnectedAt => _$this._lastConnectedAt;
  set lastConnectedAt(DateTime? lastConnectedAt) =>
      _$this._lastConnectedAt = lastConnectedAt;

  int? _autoUpdate;
  int? get autoUpdate => _$this._autoUpdate;
  set autoUpdate(int? autoUpdate) => _$this._autoUpdate = autoUpdate;

  AiAdminServicesDeviceDtosIotDeviceDtoBuilder() {
    AiAdminServicesDeviceDtosIotDeviceDto._defaults(this);
  }

  AiAdminServicesDeviceDtosIotDeviceDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _macAddress = $v.macAddress;
      _alias = $v.alias;
      _agentRoleId = $v.agentRoleId;
      _agentRoleName = $v.agentRoleName;
      _agentRoleReleaseId = $v.agentRoleReleaseId;
      _agentRoleVersion = $v.agentRoleVersion;
      _board = $v.board;
      _appVersion = $v.appVersion;
      _isOnline = $v.isOnline;
      _lastConnectedAt = $v.lastConnectedAt;
      _autoUpdate = $v.autoUpdate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesDeviceDtosIotDeviceDto other) {
    _$v = other as _$AiAdminServicesDeviceDtosIotDeviceDto;
  }

  @override
  void update(
      void Function(AiAdminServicesDeviceDtosIotDeviceDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesDeviceDtosIotDeviceDto build() => _build();

  _$AiAdminServicesDeviceDtosIotDeviceDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesDeviceDtosIotDeviceDto._(
          id: id,
          macAddress: macAddress,
          alias: alias,
          agentRoleId: agentRoleId,
          agentRoleName: agentRoleName,
          agentRoleReleaseId: agentRoleReleaseId,
          agentRoleVersion: agentRoleVersion,
          board: board,
          appVersion: appVersion,
          isOnline: isOnline,
          lastConnectedAt: lastConnectedAt,
          autoUpdate: autoUpdate,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
