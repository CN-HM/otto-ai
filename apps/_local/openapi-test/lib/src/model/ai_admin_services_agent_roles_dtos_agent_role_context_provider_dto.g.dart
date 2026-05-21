// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_agent_roles_dtos_agent_role_context_provider_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto
    extends AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto {
  @override
  final String? id;
  @override
  final String? url;
  @override
  final String? headers;

  factory _$AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto(
          [void Function(
                  AiAdminServicesAgentRolesDtosAgentRoleContextProviderDtoBuilder)?
              updates]) =>
      (AiAdminServicesAgentRolesDtosAgentRoleContextProviderDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto._(
      {this.id, this.url, this.headers})
      : super._();
  @override
  AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto rebuild(
          void Function(
                  AiAdminServicesAgentRolesDtosAgentRoleContextProviderDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAgentRolesDtosAgentRoleContextProviderDtoBuilder toBuilder() =>
      AiAdminServicesAgentRolesDtosAgentRoleContextProviderDtoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto &&
        id == other.id &&
        url == other.url &&
        headers == other.headers;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, headers.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto')
          ..add('id', id)
          ..add('url', url)
          ..add('headers', headers))
        .toString();
  }
}

class AiAdminServicesAgentRolesDtosAgentRoleContextProviderDtoBuilder
    implements
        Builder<AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto,
            AiAdminServicesAgentRolesDtosAgentRoleContextProviderDtoBuilder> {
  _$AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _headers;
  String? get headers => _$this._headers;
  set headers(String? headers) => _$this._headers = headers;

  AiAdminServicesAgentRolesDtosAgentRoleContextProviderDtoBuilder() {
    AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto._defaults(this);
  }

  AiAdminServicesAgentRolesDtosAgentRoleContextProviderDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _url = $v.url;
      _headers = $v.headers;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto other) {
    _$v = other as _$AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesAgentRolesDtosAgentRoleContextProviderDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto build() => _build();

  _$AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto._(
          id: id,
          url: url,
          headers: headers,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
