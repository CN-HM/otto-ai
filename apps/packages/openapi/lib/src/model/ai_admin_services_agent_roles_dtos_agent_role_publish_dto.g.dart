// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_agent_roles_dtos_agent_role_publish_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAgentRolesDtosAgentRolePublishDto
    extends AiAdminServicesAgentRolesDtosAgentRolePublishDto {
  @override
  final String? version;
  @override
  final String? remark;

  factory _$AiAdminServicesAgentRolesDtosAgentRolePublishDto(
          [void Function(
                  AiAdminServicesAgentRolesDtosAgentRolePublishDtoBuilder)?
              updates]) =>
      (AiAdminServicesAgentRolesDtosAgentRolePublishDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesAgentRolesDtosAgentRolePublishDto._(
      {this.version, this.remark})
      : super._();
  @override
  AiAdminServicesAgentRolesDtosAgentRolePublishDto rebuild(
          void Function(AiAdminServicesAgentRolesDtosAgentRolePublishDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAgentRolesDtosAgentRolePublishDtoBuilder toBuilder() =>
      AiAdminServicesAgentRolesDtosAgentRolePublishDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAgentRolesDtosAgentRolePublishDto &&
        version == other.version &&
        remark == other.remark;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, remark.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesAgentRolesDtosAgentRolePublishDto')
          ..add('version', version)
          ..add('remark', remark))
        .toString();
  }
}

class AiAdminServicesAgentRolesDtosAgentRolePublishDtoBuilder
    implements
        Builder<AiAdminServicesAgentRolesDtosAgentRolePublishDto,
            AiAdminServicesAgentRolesDtosAgentRolePublishDtoBuilder> {
  _$AiAdminServicesAgentRolesDtosAgentRolePublishDto? _$v;

  String? _version;
  String? get version => _$this._version;
  set version(String? version) => _$this._version = version;

  String? _remark;
  String? get remark => _$this._remark;
  set remark(String? remark) => _$this._remark = remark;

  AiAdminServicesAgentRolesDtosAgentRolePublishDtoBuilder() {
    AiAdminServicesAgentRolesDtosAgentRolePublishDto._defaults(this);
  }

  AiAdminServicesAgentRolesDtosAgentRolePublishDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _version = $v.version;
      _remark = $v.remark;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAgentRolesDtosAgentRolePublishDto other) {
    _$v = other as _$AiAdminServicesAgentRolesDtosAgentRolePublishDto;
  }

  @override
  void update(
      void Function(AiAdminServicesAgentRolesDtosAgentRolePublishDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAgentRolesDtosAgentRolePublishDto build() => _build();

  _$AiAdminServicesAgentRolesDtosAgentRolePublishDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesAgentRolesDtosAgentRolePublishDto._(
          version: version,
          remark: remark,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
