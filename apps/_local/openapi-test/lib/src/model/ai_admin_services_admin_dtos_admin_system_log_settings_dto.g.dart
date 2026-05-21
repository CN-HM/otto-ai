// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_admin_dtos_admin_system_log_settings_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAdminDtosAdminSystemLogSettingsDto
    extends AiAdminServicesAdminDtosAdminSystemLogSettingsDto {
  @override
  final String? logFormat;
  @override
  final String? logFormatFile;
  @override
  final String? logLevel;
  @override
  final String? logDir;
  @override
  final String? logFile;
  @override
  final String? dataDir;

  factory _$AiAdminServicesAdminDtosAdminSystemLogSettingsDto(
          [void Function(
                  AiAdminServicesAdminDtosAdminSystemLogSettingsDtoBuilder)?
              updates]) =>
      (AiAdminServicesAdminDtosAdminSystemLogSettingsDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesAdminDtosAdminSystemLogSettingsDto._(
      {this.logFormat,
      this.logFormatFile,
      this.logLevel,
      this.logDir,
      this.logFile,
      this.dataDir})
      : super._();
  @override
  AiAdminServicesAdminDtosAdminSystemLogSettingsDto rebuild(
          void Function(
                  AiAdminServicesAdminDtosAdminSystemLogSettingsDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAdminDtosAdminSystemLogSettingsDtoBuilder toBuilder() =>
      AiAdminServicesAdminDtosAdminSystemLogSettingsDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAdminDtosAdminSystemLogSettingsDto &&
        logFormat == other.logFormat &&
        logFormatFile == other.logFormatFile &&
        logLevel == other.logLevel &&
        logDir == other.logDir &&
        logFile == other.logFile &&
        dataDir == other.dataDir;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, logFormat.hashCode);
    _$hash = $jc(_$hash, logFormatFile.hashCode);
    _$hash = $jc(_$hash, logLevel.hashCode);
    _$hash = $jc(_$hash, logDir.hashCode);
    _$hash = $jc(_$hash, logFile.hashCode);
    _$hash = $jc(_$hash, dataDir.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesAdminDtosAdminSystemLogSettingsDto')
          ..add('logFormat', logFormat)
          ..add('logFormatFile', logFormatFile)
          ..add('logLevel', logLevel)
          ..add('logDir', logDir)
          ..add('logFile', logFile)
          ..add('dataDir', dataDir))
        .toString();
  }
}

class AiAdminServicesAdminDtosAdminSystemLogSettingsDtoBuilder
    implements
        Builder<AiAdminServicesAdminDtosAdminSystemLogSettingsDto,
            AiAdminServicesAdminDtosAdminSystemLogSettingsDtoBuilder> {
  _$AiAdminServicesAdminDtosAdminSystemLogSettingsDto? _$v;

  String? _logFormat;
  String? get logFormat => _$this._logFormat;
  set logFormat(String? logFormat) => _$this._logFormat = logFormat;

  String? _logFormatFile;
  String? get logFormatFile => _$this._logFormatFile;
  set logFormatFile(String? logFormatFile) =>
      _$this._logFormatFile = logFormatFile;

  String? _logLevel;
  String? get logLevel => _$this._logLevel;
  set logLevel(String? logLevel) => _$this._logLevel = logLevel;

  String? _logDir;
  String? get logDir => _$this._logDir;
  set logDir(String? logDir) => _$this._logDir = logDir;

  String? _logFile;
  String? get logFile => _$this._logFile;
  set logFile(String? logFile) => _$this._logFile = logFile;

  String? _dataDir;
  String? get dataDir => _$this._dataDir;
  set dataDir(String? dataDir) => _$this._dataDir = dataDir;

  AiAdminServicesAdminDtosAdminSystemLogSettingsDtoBuilder() {
    AiAdminServicesAdminDtosAdminSystemLogSettingsDto._defaults(this);
  }

  AiAdminServicesAdminDtosAdminSystemLogSettingsDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _logFormat = $v.logFormat;
      _logFormatFile = $v.logFormatFile;
      _logLevel = $v.logLevel;
      _logDir = $v.logDir;
      _logFile = $v.logFile;
      _dataDir = $v.dataDir;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAdminDtosAdminSystemLogSettingsDto other) {
    _$v = other as _$AiAdminServicesAdminDtosAdminSystemLogSettingsDto;
  }

  @override
  void update(
      void Function(AiAdminServicesAdminDtosAdminSystemLogSettingsDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAdminDtosAdminSystemLogSettingsDto build() => _build();

  _$AiAdminServicesAdminDtosAdminSystemLogSettingsDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesAdminDtosAdminSystemLogSettingsDto._(
          logFormat: logFormat,
          logFormatFile: logFormatFile,
          logLevel: logLevel,
          logDir: logDir,
          logFile: logFile,
          dataDir: dataDir,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
