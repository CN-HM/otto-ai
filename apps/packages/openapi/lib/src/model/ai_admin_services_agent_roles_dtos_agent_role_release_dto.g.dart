// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_agent_roles_dtos_agent_role_release_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAgentRolesDtosAgentRoleReleaseDto
    extends AiAdminServicesAgentRolesDtosAgentRoleReleaseDto {
  @override
  final String? id;
  @override
  final String? roleId;
  @override
  final String? version;
  @override
  final String? status;
  @override
  final String? snapshotJson;
  @override
  final String? remark;
  @override
  final String? publishedAt;
  @override
  final int? creator;
  @override
  final String? createdAt;
  @override
  final int? updater;
  @override
  final String? updatedAt;

  factory _$AiAdminServicesAgentRolesDtosAgentRoleReleaseDto(
          [void Function(
                  AiAdminServicesAgentRolesDtosAgentRoleReleaseDtoBuilder)?
              updates]) =>
      (AiAdminServicesAgentRolesDtosAgentRoleReleaseDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesAgentRolesDtosAgentRoleReleaseDto._(
      {this.id,
      this.roleId,
      this.version,
      this.status,
      this.snapshotJson,
      this.remark,
      this.publishedAt,
      this.creator,
      this.createdAt,
      this.updater,
      this.updatedAt})
      : super._();
  @override
  AiAdminServicesAgentRolesDtosAgentRoleReleaseDto rebuild(
          void Function(AiAdminServicesAgentRolesDtosAgentRoleReleaseDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAgentRolesDtosAgentRoleReleaseDtoBuilder toBuilder() =>
      AiAdminServicesAgentRolesDtosAgentRoleReleaseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAgentRolesDtosAgentRoleReleaseDto &&
        id == other.id &&
        roleId == other.roleId &&
        version == other.version &&
        status == other.status &&
        snapshotJson == other.snapshotJson &&
        remark == other.remark &&
        publishedAt == other.publishedAt &&
        creator == other.creator &&
        createdAt == other.createdAt &&
        updater == other.updater &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, roleId.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, snapshotJson.hashCode);
    _$hash = $jc(_$hash, remark.hashCode);
    _$hash = $jc(_$hash, publishedAt.hashCode);
    _$hash = $jc(_$hash, creator.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updater.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesAgentRolesDtosAgentRoleReleaseDto')
          ..add('id', id)
          ..add('roleId', roleId)
          ..add('version', version)
          ..add('status', status)
          ..add('snapshotJson', snapshotJson)
          ..add('remark', remark)
          ..add('publishedAt', publishedAt)
          ..add('creator', creator)
          ..add('createdAt', createdAt)
          ..add('updater', updater)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class AiAdminServicesAgentRolesDtosAgentRoleReleaseDtoBuilder
    implements
        Builder<AiAdminServicesAgentRolesDtosAgentRoleReleaseDto,
            AiAdminServicesAgentRolesDtosAgentRoleReleaseDtoBuilder> {
  _$AiAdminServicesAgentRolesDtosAgentRoleReleaseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _roleId;
  String? get roleId => _$this._roleId;
  set roleId(String? roleId) => _$this._roleId = roleId;

  String? _version;
  String? get version => _$this._version;
  set version(String? version) => _$this._version = version;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _snapshotJson;
  String? get snapshotJson => _$this._snapshotJson;
  set snapshotJson(String? snapshotJson) => _$this._snapshotJson = snapshotJson;

  String? _remark;
  String? get remark => _$this._remark;
  set remark(String? remark) => _$this._remark = remark;

  String? _publishedAt;
  String? get publishedAt => _$this._publishedAt;
  set publishedAt(String? publishedAt) => _$this._publishedAt = publishedAt;

  int? _creator;
  int? get creator => _$this._creator;
  set creator(int? creator) => _$this._creator = creator;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  int? _updater;
  int? get updater => _$this._updater;
  set updater(int? updater) => _$this._updater = updater;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  AiAdminServicesAgentRolesDtosAgentRoleReleaseDtoBuilder() {
    AiAdminServicesAgentRolesDtosAgentRoleReleaseDto._defaults(this);
  }

  AiAdminServicesAgentRolesDtosAgentRoleReleaseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _roleId = $v.roleId;
      _version = $v.version;
      _status = $v.status;
      _snapshotJson = $v.snapshotJson;
      _remark = $v.remark;
      _publishedAt = $v.publishedAt;
      _creator = $v.creator;
      _createdAt = $v.createdAt;
      _updater = $v.updater;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAgentRolesDtosAgentRoleReleaseDto other) {
    _$v = other as _$AiAdminServicesAgentRolesDtosAgentRoleReleaseDto;
  }

  @override
  void update(
      void Function(AiAdminServicesAgentRolesDtosAgentRoleReleaseDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAgentRolesDtosAgentRoleReleaseDto build() => _build();

  _$AiAdminServicesAgentRolesDtosAgentRoleReleaseDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesAgentRolesDtosAgentRoleReleaseDto._(
          id: id,
          roleId: roleId,
          version: version,
          status: status,
          snapshotJson: snapshotJson,
          remark: remark,
          publishedAt: publishedAt,
          creator: creator,
          createdAt: createdAt,
          updater: updater,
          updatedAt: updatedAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
