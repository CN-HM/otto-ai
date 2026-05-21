// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_admin_dtos_admin_system_settings_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAdminDtosAdminSystemSettingsDto
    extends AiAdminServicesAdminDtosAdminSystemSettingsDto {
  @override
  final AiAdminServicesAdminDtosAdminSystemServerSettingsDto? server;
  @override
  final AiAdminServicesAdminDtosAdminSystemLogSettingsDto? log;
  @override
  final AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto? runtime;
  @override
  final AiAdminServicesAdminDtosAdminSystemBillingSettingsDto? billing;

  factory _$AiAdminServicesAdminDtosAdminSystemSettingsDto(
          [void Function(AiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder)?
              updates]) =>
      (AiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesAdminDtosAdminSystemSettingsDto._(
      {this.server, this.log, this.runtime, this.billing})
      : super._();
  @override
  AiAdminServicesAdminDtosAdminSystemSettingsDto rebuild(
          void Function(AiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder toBuilder() =>
      AiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAdminDtosAdminSystemSettingsDto &&
        server == other.server &&
        log == other.log &&
        runtime == other.runtime &&
        billing == other.billing;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, server.hashCode);
    _$hash = $jc(_$hash, log.hashCode);
    _$hash = $jc(_$hash, runtime.hashCode);
    _$hash = $jc(_$hash, billing.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesAdminDtosAdminSystemSettingsDto')
          ..add('server', server)
          ..add('log', log)
          ..add('runtime', runtime)
          ..add('billing', billing))
        .toString();
  }
}

class AiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder
    implements
        Builder<AiAdminServicesAdminDtosAdminSystemSettingsDto,
            AiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder> {
  _$AiAdminServicesAdminDtosAdminSystemSettingsDto? _$v;

  AiAdminServicesAdminDtosAdminSystemServerSettingsDtoBuilder? _server;
  AiAdminServicesAdminDtosAdminSystemServerSettingsDtoBuilder get server =>
      _$this._server ??=
          AiAdminServicesAdminDtosAdminSystemServerSettingsDtoBuilder();
  set server(
          AiAdminServicesAdminDtosAdminSystemServerSettingsDtoBuilder?
              server) =>
      _$this._server = server;

  AiAdminServicesAdminDtosAdminSystemLogSettingsDtoBuilder? _log;
  AiAdminServicesAdminDtosAdminSystemLogSettingsDtoBuilder get log =>
      _$this._log ??=
          AiAdminServicesAdminDtosAdminSystemLogSettingsDtoBuilder();
  set log(AiAdminServicesAdminDtosAdminSystemLogSettingsDtoBuilder? log) =>
      _$this._log = log;

  AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDtoBuilder? _runtime;
  AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDtoBuilder get runtime =>
      _$this._runtime ??=
          AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDtoBuilder();
  set runtime(
          AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDtoBuilder?
              runtime) =>
      _$this._runtime = runtime;

  AiAdminServicesAdminDtosAdminSystemBillingSettingsDtoBuilder? _billing;
  AiAdminServicesAdminDtosAdminSystemBillingSettingsDtoBuilder get billing =>
      _$this._billing ??=
          AiAdminServicesAdminDtosAdminSystemBillingSettingsDtoBuilder();
  set billing(
          AiAdminServicesAdminDtosAdminSystemBillingSettingsDtoBuilder?
              billing) =>
      _$this._billing = billing;

  AiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder() {
    AiAdminServicesAdminDtosAdminSystemSettingsDto._defaults(this);
  }

  AiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _server = $v.server?.toBuilder();
      _log = $v.log?.toBuilder();
      _runtime = $v.runtime?.toBuilder();
      _billing = $v.billing?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAdminDtosAdminSystemSettingsDto other) {
    _$v = other as _$AiAdminServicesAdminDtosAdminSystemSettingsDto;
  }

  @override
  void update(
      void Function(AiAdminServicesAdminDtosAdminSystemSettingsDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAdminDtosAdminSystemSettingsDto build() => _build();

  _$AiAdminServicesAdminDtosAdminSystemSettingsDto _build() {
    _$AiAdminServicesAdminDtosAdminSystemSettingsDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesAdminDtosAdminSystemSettingsDto._(
            server: _server?.build(),
            log: _log?.build(),
            runtime: _runtime?.build(),
            billing: _billing?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'server';
        _server?.build();
        _$failedField = 'log';
        _log?.build();
        _$failedField = 'runtime';
        _runtime?.build();
        _$failedField = 'billing';
        _billing?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesAdminDtosAdminSystemSettingsDto',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
