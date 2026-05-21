// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_agent_roles_dtos_agent_role_plugin_mapping_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto
    extends AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto {
  @override
  final String? pluginId;
  @override
  final String? paramInfo;
  @override
  final String? providerCode;

  factory _$AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto(
          [void Function(
                  AiAdminServicesAgentRolesDtosAgentRolePluginMappingDtoBuilder)?
              updates]) =>
      (AiAdminServicesAgentRolesDtosAgentRolePluginMappingDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto._(
      {this.pluginId, this.paramInfo, this.providerCode})
      : super._();
  @override
  AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto rebuild(
          void Function(
                  AiAdminServicesAgentRolesDtosAgentRolePluginMappingDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAgentRolesDtosAgentRolePluginMappingDtoBuilder toBuilder() =>
      AiAdminServicesAgentRolesDtosAgentRolePluginMappingDtoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto &&
        pluginId == other.pluginId &&
        paramInfo == other.paramInfo &&
        providerCode == other.providerCode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, pluginId.hashCode);
    _$hash = $jc(_$hash, paramInfo.hashCode);
    _$hash = $jc(_$hash, providerCode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto')
          ..add('pluginId', pluginId)
          ..add('paramInfo', paramInfo)
          ..add('providerCode', providerCode))
        .toString();
  }
}

class AiAdminServicesAgentRolesDtosAgentRolePluginMappingDtoBuilder
    implements
        Builder<AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto,
            AiAdminServicesAgentRolesDtosAgentRolePluginMappingDtoBuilder> {
  _$AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto? _$v;

  String? _pluginId;
  String? get pluginId => _$this._pluginId;
  set pluginId(String? pluginId) => _$this._pluginId = pluginId;

  String? _paramInfo;
  String? get paramInfo => _$this._paramInfo;
  set paramInfo(String? paramInfo) => _$this._paramInfo = paramInfo;

  String? _providerCode;
  String? get providerCode => _$this._providerCode;
  set providerCode(String? providerCode) => _$this._providerCode = providerCode;

  AiAdminServicesAgentRolesDtosAgentRolePluginMappingDtoBuilder() {
    AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto._defaults(this);
  }

  AiAdminServicesAgentRolesDtosAgentRolePluginMappingDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pluginId = $v.pluginId;
      _paramInfo = $v.paramInfo;
      _providerCode = $v.providerCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto other) {
    _$v = other as _$AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesAgentRolesDtosAgentRolePluginMappingDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto build() => _build();

  _$AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto._(
          pluginId: pluginId,
          paramInfo: paramInfo,
          providerCode: providerCode,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
