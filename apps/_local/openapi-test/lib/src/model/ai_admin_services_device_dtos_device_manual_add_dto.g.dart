// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_device_dtos_device_manual_add_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesDeviceDtosDeviceManualAddDto
    extends AiAdminServicesDeviceDtosDeviceManualAddDto {
  @override
  final String? agentRoleId;
  @override
  final String? agentRoleReleaseId;
  @override
  final String? board;
  @override
  final String? appVersion;
  @override
  final String? macAddress;

  factory _$AiAdminServicesDeviceDtosDeviceManualAddDto(
          [void Function(AiAdminServicesDeviceDtosDeviceManualAddDtoBuilder)?
              updates]) =>
      (AiAdminServicesDeviceDtosDeviceManualAddDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesDeviceDtosDeviceManualAddDto._(
      {this.agentRoleId,
      this.agentRoleReleaseId,
      this.board,
      this.appVersion,
      this.macAddress})
      : super._();
  @override
  AiAdminServicesDeviceDtosDeviceManualAddDto rebuild(
          void Function(AiAdminServicesDeviceDtosDeviceManualAddDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesDeviceDtosDeviceManualAddDtoBuilder toBuilder() =>
      AiAdminServicesDeviceDtosDeviceManualAddDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesDeviceDtosDeviceManualAddDto &&
        agentRoleId == other.agentRoleId &&
        agentRoleReleaseId == other.agentRoleReleaseId &&
        board == other.board &&
        appVersion == other.appVersion &&
        macAddress == other.macAddress;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, agentRoleId.hashCode);
    _$hash = $jc(_$hash, agentRoleReleaseId.hashCode);
    _$hash = $jc(_$hash, board.hashCode);
    _$hash = $jc(_$hash, appVersion.hashCode);
    _$hash = $jc(_$hash, macAddress.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesDeviceDtosDeviceManualAddDto')
          ..add('agentRoleId', agentRoleId)
          ..add('agentRoleReleaseId', agentRoleReleaseId)
          ..add('board', board)
          ..add('appVersion', appVersion)
          ..add('macAddress', macAddress))
        .toString();
  }
}

class AiAdminServicesDeviceDtosDeviceManualAddDtoBuilder
    implements
        Builder<AiAdminServicesDeviceDtosDeviceManualAddDto,
            AiAdminServicesDeviceDtosDeviceManualAddDtoBuilder> {
  _$AiAdminServicesDeviceDtosDeviceManualAddDto? _$v;

  String? _agentRoleId;
  String? get agentRoleId => _$this._agentRoleId;
  set agentRoleId(String? agentRoleId) => _$this._agentRoleId = agentRoleId;

  String? _agentRoleReleaseId;
  String? get agentRoleReleaseId => _$this._agentRoleReleaseId;
  set agentRoleReleaseId(String? agentRoleReleaseId) =>
      _$this._agentRoleReleaseId = agentRoleReleaseId;

  String? _board;
  String? get board => _$this._board;
  set board(String? board) => _$this._board = board;

  String? _appVersion;
  String? get appVersion => _$this._appVersion;
  set appVersion(String? appVersion) => _$this._appVersion = appVersion;

  String? _macAddress;
  String? get macAddress => _$this._macAddress;
  set macAddress(String? macAddress) => _$this._macAddress = macAddress;

  AiAdminServicesDeviceDtosDeviceManualAddDtoBuilder() {
    AiAdminServicesDeviceDtosDeviceManualAddDto._defaults(this);
  }

  AiAdminServicesDeviceDtosDeviceManualAddDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _agentRoleId = $v.agentRoleId;
      _agentRoleReleaseId = $v.agentRoleReleaseId;
      _board = $v.board;
      _appVersion = $v.appVersion;
      _macAddress = $v.macAddress;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesDeviceDtosDeviceManualAddDto other) {
    _$v = other as _$AiAdminServicesDeviceDtosDeviceManualAddDto;
  }

  @override
  void update(
      void Function(AiAdminServicesDeviceDtosDeviceManualAddDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesDeviceDtosDeviceManualAddDto build() => _build();

  _$AiAdminServicesDeviceDtosDeviceManualAddDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesDeviceDtosDeviceManualAddDto._(
          agentRoleId: agentRoleId,
          agentRoleReleaseId: agentRoleReleaseId,
          board: board,
          appVersion: appVersion,
          macAddress: macAddress,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
