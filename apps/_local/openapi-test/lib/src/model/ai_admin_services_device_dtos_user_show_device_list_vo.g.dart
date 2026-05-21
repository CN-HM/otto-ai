// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_device_dtos_user_show_device_list_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesDeviceDtosUserShowDeviceListVo
    extends AiAdminServicesDeviceDtosUserShowDeviceListVo {
  @override
  final String? id;
  @override
  final String? appVersion;
  @override
  final String? bindUserName;
  @override
  final String? macAddress;
  @override
  final String? board;
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
  final String? lastConnectedAt;
  @override
  final String? createDate;

  factory _$AiAdminServicesDeviceDtosUserShowDeviceListVo(
          [void Function(AiAdminServicesDeviceDtosUserShowDeviceListVoBuilder)?
              updates]) =>
      (AiAdminServicesDeviceDtosUserShowDeviceListVoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesDeviceDtosUserShowDeviceListVo._(
      {this.id,
      this.appVersion,
      this.bindUserName,
      this.macAddress,
      this.board,
      this.alias,
      this.agentRoleId,
      this.agentRoleName,
      this.agentRoleReleaseId,
      this.agentRoleVersion,
      this.lastConnectedAt,
      this.createDate})
      : super._();
  @override
  AiAdminServicesDeviceDtosUserShowDeviceListVo rebuild(
          void Function(AiAdminServicesDeviceDtosUserShowDeviceListVoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesDeviceDtosUserShowDeviceListVoBuilder toBuilder() =>
      AiAdminServicesDeviceDtosUserShowDeviceListVoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesDeviceDtosUserShowDeviceListVo &&
        id == other.id &&
        appVersion == other.appVersion &&
        bindUserName == other.bindUserName &&
        macAddress == other.macAddress &&
        board == other.board &&
        alias == other.alias &&
        agentRoleId == other.agentRoleId &&
        agentRoleName == other.agentRoleName &&
        agentRoleReleaseId == other.agentRoleReleaseId &&
        agentRoleVersion == other.agentRoleVersion &&
        lastConnectedAt == other.lastConnectedAt &&
        createDate == other.createDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, appVersion.hashCode);
    _$hash = $jc(_$hash, bindUserName.hashCode);
    _$hash = $jc(_$hash, macAddress.hashCode);
    _$hash = $jc(_$hash, board.hashCode);
    _$hash = $jc(_$hash, alias.hashCode);
    _$hash = $jc(_$hash, agentRoleId.hashCode);
    _$hash = $jc(_$hash, agentRoleName.hashCode);
    _$hash = $jc(_$hash, agentRoleReleaseId.hashCode);
    _$hash = $jc(_$hash, agentRoleVersion.hashCode);
    _$hash = $jc(_$hash, lastConnectedAt.hashCode);
    _$hash = $jc(_$hash, createDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesDeviceDtosUserShowDeviceListVo')
          ..add('id', id)
          ..add('appVersion', appVersion)
          ..add('bindUserName', bindUserName)
          ..add('macAddress', macAddress)
          ..add('board', board)
          ..add('alias', alias)
          ..add('agentRoleId', agentRoleId)
          ..add('agentRoleName', agentRoleName)
          ..add('agentRoleReleaseId', agentRoleReleaseId)
          ..add('agentRoleVersion', agentRoleVersion)
          ..add('lastConnectedAt', lastConnectedAt)
          ..add('createDate', createDate))
        .toString();
  }
}

class AiAdminServicesDeviceDtosUserShowDeviceListVoBuilder
    implements
        Builder<AiAdminServicesDeviceDtosUserShowDeviceListVo,
            AiAdminServicesDeviceDtosUserShowDeviceListVoBuilder> {
  _$AiAdminServicesDeviceDtosUserShowDeviceListVo? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _appVersion;
  String? get appVersion => _$this._appVersion;
  set appVersion(String? appVersion) => _$this._appVersion = appVersion;

  String? _bindUserName;
  String? get bindUserName => _$this._bindUserName;
  set bindUserName(String? bindUserName) => _$this._bindUserName = bindUserName;

  String? _macAddress;
  String? get macAddress => _$this._macAddress;
  set macAddress(String? macAddress) => _$this._macAddress = macAddress;

  String? _board;
  String? get board => _$this._board;
  set board(String? board) => _$this._board = board;

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

  String? _lastConnectedAt;
  String? get lastConnectedAt => _$this._lastConnectedAt;
  set lastConnectedAt(String? lastConnectedAt) =>
      _$this._lastConnectedAt = lastConnectedAt;

  String? _createDate;
  String? get createDate => _$this._createDate;
  set createDate(String? createDate) => _$this._createDate = createDate;

  AiAdminServicesDeviceDtosUserShowDeviceListVoBuilder() {
    AiAdminServicesDeviceDtosUserShowDeviceListVo._defaults(this);
  }

  AiAdminServicesDeviceDtosUserShowDeviceListVoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _appVersion = $v.appVersion;
      _bindUserName = $v.bindUserName;
      _macAddress = $v.macAddress;
      _board = $v.board;
      _alias = $v.alias;
      _agentRoleId = $v.agentRoleId;
      _agentRoleName = $v.agentRoleName;
      _agentRoleReleaseId = $v.agentRoleReleaseId;
      _agentRoleVersion = $v.agentRoleVersion;
      _lastConnectedAt = $v.lastConnectedAt;
      _createDate = $v.createDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesDeviceDtosUserShowDeviceListVo other) {
    _$v = other as _$AiAdminServicesDeviceDtosUserShowDeviceListVo;
  }

  @override
  void update(
      void Function(AiAdminServicesDeviceDtosUserShowDeviceListVoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesDeviceDtosUserShowDeviceListVo build() => _build();

  _$AiAdminServicesDeviceDtosUserShowDeviceListVo _build() {
    final _$result = _$v ??
        _$AiAdminServicesDeviceDtosUserShowDeviceListVo._(
          id: id,
          appVersion: appVersion,
          bindUserName: bindUserName,
          macAddress: macAddress,
          board: board,
          alias: alias,
          agentRoleId: agentRoleId,
          agentRoleName: agentRoleName,
          agentRoleReleaseId: agentRoleReleaseId,
          agentRoleVersion: agentRoleVersion,
          lastConnectedAt: lastConnectedAt,
          createDate: createDate,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
