// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_device_dtos_device_update_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesDeviceDtosDeviceUpdateDto
    extends AiAdminServicesDeviceDtosDeviceUpdateDto {
  @override
  final int? autoUpdate;
  @override
  final String? alias;
  @override
  final String? agentRoleId;
  @override
  final String? agentRoleReleaseId;

  factory _$AiAdminServicesDeviceDtosDeviceUpdateDto(
          [void Function(AiAdminServicesDeviceDtosDeviceUpdateDtoBuilder)?
              updates]) =>
      (AiAdminServicesDeviceDtosDeviceUpdateDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesDeviceDtosDeviceUpdateDto._(
      {this.autoUpdate, this.alias, this.agentRoleId, this.agentRoleReleaseId})
      : super._();
  @override
  AiAdminServicesDeviceDtosDeviceUpdateDto rebuild(
          void Function(AiAdminServicesDeviceDtosDeviceUpdateDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesDeviceDtosDeviceUpdateDtoBuilder toBuilder() =>
      AiAdminServicesDeviceDtosDeviceUpdateDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesDeviceDtosDeviceUpdateDto &&
        autoUpdate == other.autoUpdate &&
        alias == other.alias &&
        agentRoleId == other.agentRoleId &&
        agentRoleReleaseId == other.agentRoleReleaseId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, autoUpdate.hashCode);
    _$hash = $jc(_$hash, alias.hashCode);
    _$hash = $jc(_$hash, agentRoleId.hashCode);
    _$hash = $jc(_$hash, agentRoleReleaseId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesDeviceDtosDeviceUpdateDto')
          ..add('autoUpdate', autoUpdate)
          ..add('alias', alias)
          ..add('agentRoleId', agentRoleId)
          ..add('agentRoleReleaseId', agentRoleReleaseId))
        .toString();
  }
}

class AiAdminServicesDeviceDtosDeviceUpdateDtoBuilder
    implements
        Builder<AiAdminServicesDeviceDtosDeviceUpdateDto,
            AiAdminServicesDeviceDtosDeviceUpdateDtoBuilder> {
  _$AiAdminServicesDeviceDtosDeviceUpdateDto? _$v;

  int? _autoUpdate;
  int? get autoUpdate => _$this._autoUpdate;
  set autoUpdate(int? autoUpdate) => _$this._autoUpdate = autoUpdate;

  String? _alias;
  String? get alias => _$this._alias;
  set alias(String? alias) => _$this._alias = alias;

  String? _agentRoleId;
  String? get agentRoleId => _$this._agentRoleId;
  set agentRoleId(String? agentRoleId) => _$this._agentRoleId = agentRoleId;

  String? _agentRoleReleaseId;
  String? get agentRoleReleaseId => _$this._agentRoleReleaseId;
  set agentRoleReleaseId(String? agentRoleReleaseId) =>
      _$this._agentRoleReleaseId = agentRoleReleaseId;

  AiAdminServicesDeviceDtosDeviceUpdateDtoBuilder() {
    AiAdminServicesDeviceDtosDeviceUpdateDto._defaults(this);
  }

  AiAdminServicesDeviceDtosDeviceUpdateDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _autoUpdate = $v.autoUpdate;
      _alias = $v.alias;
      _agentRoleId = $v.agentRoleId;
      _agentRoleReleaseId = $v.agentRoleReleaseId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesDeviceDtosDeviceUpdateDto other) {
    _$v = other as _$AiAdminServicesDeviceDtosDeviceUpdateDto;
  }

  @override
  void update(
      void Function(AiAdminServicesDeviceDtosDeviceUpdateDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesDeviceDtosDeviceUpdateDto build() => _build();

  _$AiAdminServicesDeviceDtosDeviceUpdateDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesDeviceDtosDeviceUpdateDto._(
          autoUpdate: autoUpdate,
          alias: alias,
          agentRoleId: agentRoleId,
          agentRoleReleaseId: agentRoleReleaseId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
