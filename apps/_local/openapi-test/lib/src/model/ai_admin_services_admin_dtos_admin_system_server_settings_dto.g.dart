// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_admin_dtos_admin_system_server_settings_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAdminDtosAdminSystemServerSettingsDto
    extends AiAdminServicesAdminDtosAdminSystemServerSettingsDto {
  @override
  final String? listenIp;
  @override
  final String? publicHost;
  @override
  final int? port;
  @override
  final int? httpPort;
  @override
  final int? visionPort;
  @override
  final String? secret;
  @override
  final bool? allowUserRegister;
  @override
  final String? frontendUrl;

  factory _$AiAdminServicesAdminDtosAdminSystemServerSettingsDto(
          [void Function(
                  AiAdminServicesAdminDtosAdminSystemServerSettingsDtoBuilder)?
              updates]) =>
      (AiAdminServicesAdminDtosAdminSystemServerSettingsDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesAdminDtosAdminSystemServerSettingsDto._(
      {this.listenIp,
      this.publicHost,
      this.port,
      this.httpPort,
      this.visionPort,
      this.secret,
      this.allowUserRegister,
      this.frontendUrl})
      : super._();
  @override
  AiAdminServicesAdminDtosAdminSystemServerSettingsDto rebuild(
          void Function(
                  AiAdminServicesAdminDtosAdminSystemServerSettingsDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAdminDtosAdminSystemServerSettingsDtoBuilder toBuilder() =>
      AiAdminServicesAdminDtosAdminSystemServerSettingsDtoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAdminDtosAdminSystemServerSettingsDto &&
        listenIp == other.listenIp &&
        publicHost == other.publicHost &&
        port == other.port &&
        httpPort == other.httpPort &&
        visionPort == other.visionPort &&
        secret == other.secret &&
        allowUserRegister == other.allowUserRegister &&
        frontendUrl == other.frontendUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, listenIp.hashCode);
    _$hash = $jc(_$hash, publicHost.hashCode);
    _$hash = $jc(_$hash, port.hashCode);
    _$hash = $jc(_$hash, httpPort.hashCode);
    _$hash = $jc(_$hash, visionPort.hashCode);
    _$hash = $jc(_$hash, secret.hashCode);
    _$hash = $jc(_$hash, allowUserRegister.hashCode);
    _$hash = $jc(_$hash, frontendUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesAdminDtosAdminSystemServerSettingsDto')
          ..add('listenIp', listenIp)
          ..add('publicHost', publicHost)
          ..add('port', port)
          ..add('httpPort', httpPort)
          ..add('visionPort', visionPort)
          ..add('secret', secret)
          ..add('allowUserRegister', allowUserRegister)
          ..add('frontendUrl', frontendUrl))
        .toString();
  }
}

class AiAdminServicesAdminDtosAdminSystemServerSettingsDtoBuilder
    implements
        Builder<AiAdminServicesAdminDtosAdminSystemServerSettingsDto,
            AiAdminServicesAdminDtosAdminSystemServerSettingsDtoBuilder> {
  _$AiAdminServicesAdminDtosAdminSystemServerSettingsDto? _$v;

  String? _listenIp;
  String? get listenIp => _$this._listenIp;
  set listenIp(String? listenIp) => _$this._listenIp = listenIp;

  String? _publicHost;
  String? get publicHost => _$this._publicHost;
  set publicHost(String? publicHost) => _$this._publicHost = publicHost;

  int? _port;
  int? get port => _$this._port;
  set port(int? port) => _$this._port = port;

  int? _httpPort;
  int? get httpPort => _$this._httpPort;
  set httpPort(int? httpPort) => _$this._httpPort = httpPort;

  int? _visionPort;
  int? get visionPort => _$this._visionPort;
  set visionPort(int? visionPort) => _$this._visionPort = visionPort;

  String? _secret;
  String? get secret => _$this._secret;
  set secret(String? secret) => _$this._secret = secret;

  bool? _allowUserRegister;
  bool? get allowUserRegister => _$this._allowUserRegister;
  set allowUserRegister(bool? allowUserRegister) =>
      _$this._allowUserRegister = allowUserRegister;

  String? _frontendUrl;
  String? get frontendUrl => _$this._frontendUrl;
  set frontendUrl(String? frontendUrl) => _$this._frontendUrl = frontendUrl;

  AiAdminServicesAdminDtosAdminSystemServerSettingsDtoBuilder() {
    AiAdminServicesAdminDtosAdminSystemServerSettingsDto._defaults(this);
  }

  AiAdminServicesAdminDtosAdminSystemServerSettingsDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _listenIp = $v.listenIp;
      _publicHost = $v.publicHost;
      _port = $v.port;
      _httpPort = $v.httpPort;
      _visionPort = $v.visionPort;
      _secret = $v.secret;
      _allowUserRegister = $v.allowUserRegister;
      _frontendUrl = $v.frontendUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAdminDtosAdminSystemServerSettingsDto other) {
    _$v = other as _$AiAdminServicesAdminDtosAdminSystemServerSettingsDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesAdminDtosAdminSystemServerSettingsDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAdminDtosAdminSystemServerSettingsDto build() => _build();

  _$AiAdminServicesAdminDtosAdminSystemServerSettingsDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesAdminDtosAdminSystemServerSettingsDto._(
          listenIp: listenIp,
          publicHost: publicHost,
          port: port,
          httpPort: httpPort,
          visionPort: visionPort,
          secret: secret,
          allowUserRegister: allowUserRegister,
          frontendUrl: frontendUrl,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
