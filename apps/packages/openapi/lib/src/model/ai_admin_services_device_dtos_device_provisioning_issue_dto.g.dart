// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_device_dtos_device_provisioning_issue_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesDeviceDtosDeviceProvisioningIssueDto
    extends AiAdminServicesDeviceDtosDeviceProvisioningIssueDto {
  @override
  final String? macAddress;
  @override
  final String? alias;
  @override
  final String? board;
  @override
  final String? appVersion;
  @override
  final String? agentRoleId;
  @override
  final String? agentRoleReleaseId;
  @override
  final bool? rotateCredential;

  factory _$AiAdminServicesDeviceDtosDeviceProvisioningIssueDto(
          [void Function(
                  AiAdminServicesDeviceDtosDeviceProvisioningIssueDtoBuilder)?
              updates]) =>
      (AiAdminServicesDeviceDtosDeviceProvisioningIssueDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesDeviceDtosDeviceProvisioningIssueDto._(
      {this.macAddress,
      this.alias,
      this.board,
      this.appVersion,
      this.agentRoleId,
      this.agentRoleReleaseId,
      this.rotateCredential})
      : super._();
  @override
  AiAdminServicesDeviceDtosDeviceProvisioningIssueDto rebuild(
          void Function(
                  AiAdminServicesDeviceDtosDeviceProvisioningIssueDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesDeviceDtosDeviceProvisioningIssueDtoBuilder toBuilder() =>
      AiAdminServicesDeviceDtosDeviceProvisioningIssueDtoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesDeviceDtosDeviceProvisioningIssueDto &&
        macAddress == other.macAddress &&
        alias == other.alias &&
        board == other.board &&
        appVersion == other.appVersion &&
        agentRoleId == other.agentRoleId &&
        agentRoleReleaseId == other.agentRoleReleaseId &&
        rotateCredential == other.rotateCredential;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, macAddress.hashCode);
    _$hash = $jc(_$hash, alias.hashCode);
    _$hash = $jc(_$hash, board.hashCode);
    _$hash = $jc(_$hash, appVersion.hashCode);
    _$hash = $jc(_$hash, agentRoleId.hashCode);
    _$hash = $jc(_$hash, agentRoleReleaseId.hashCode);
    _$hash = $jc(_$hash, rotateCredential.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesDeviceDtosDeviceProvisioningIssueDto')
          ..add('macAddress', macAddress)
          ..add('alias', alias)
          ..add('board', board)
          ..add('appVersion', appVersion)
          ..add('agentRoleId', agentRoleId)
          ..add('agentRoleReleaseId', agentRoleReleaseId)
          ..add('rotateCredential', rotateCredential))
        .toString();
  }
}

class AiAdminServicesDeviceDtosDeviceProvisioningIssueDtoBuilder
    implements
        Builder<AiAdminServicesDeviceDtosDeviceProvisioningIssueDto,
            AiAdminServicesDeviceDtosDeviceProvisioningIssueDtoBuilder> {
  _$AiAdminServicesDeviceDtosDeviceProvisioningIssueDto? _$v;

  String? _macAddress;
  String? get macAddress => _$this._macAddress;
  set macAddress(String? macAddress) => _$this._macAddress = macAddress;

  String? _alias;
  String? get alias => _$this._alias;
  set alias(String? alias) => _$this._alias = alias;

  String? _board;
  String? get board => _$this._board;
  set board(String? board) => _$this._board = board;

  String? _appVersion;
  String? get appVersion => _$this._appVersion;
  set appVersion(String? appVersion) => _$this._appVersion = appVersion;

  String? _agentRoleId;
  String? get agentRoleId => _$this._agentRoleId;
  set agentRoleId(String? agentRoleId) => _$this._agentRoleId = agentRoleId;

  String? _agentRoleReleaseId;
  String? get agentRoleReleaseId => _$this._agentRoleReleaseId;
  set agentRoleReleaseId(String? agentRoleReleaseId) =>
      _$this._agentRoleReleaseId = agentRoleReleaseId;

  bool? _rotateCredential;
  bool? get rotateCredential => _$this._rotateCredential;
  set rotateCredential(bool? rotateCredential) =>
      _$this._rotateCredential = rotateCredential;

  AiAdminServicesDeviceDtosDeviceProvisioningIssueDtoBuilder() {
    AiAdminServicesDeviceDtosDeviceProvisioningIssueDto._defaults(this);
  }

  AiAdminServicesDeviceDtosDeviceProvisioningIssueDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _macAddress = $v.macAddress;
      _alias = $v.alias;
      _board = $v.board;
      _appVersion = $v.appVersion;
      _agentRoleId = $v.agentRoleId;
      _agentRoleReleaseId = $v.agentRoleReleaseId;
      _rotateCredential = $v.rotateCredential;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesDeviceDtosDeviceProvisioningIssueDto other) {
    _$v = other as _$AiAdminServicesDeviceDtosDeviceProvisioningIssueDto;
  }

  @override
  void update(
      void Function(AiAdminServicesDeviceDtosDeviceProvisioningIssueDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesDeviceDtosDeviceProvisioningIssueDto build() => _build();

  _$AiAdminServicesDeviceDtosDeviceProvisioningIssueDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesDeviceDtosDeviceProvisioningIssueDto._(
          macAddress: macAddress,
          alias: alias,
          board: board,
          appVersion: appVersion,
          agentRoleId: agentRoleId,
          agentRoleReleaseId: agentRoleReleaseId,
          rotateCredential: rotateCredential,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
