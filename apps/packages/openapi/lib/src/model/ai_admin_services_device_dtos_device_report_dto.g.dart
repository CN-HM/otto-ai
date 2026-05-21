// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_device_dtos_device_report_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesDeviceDtosDeviceReportDto
    extends AiAdminServicesDeviceDtosDeviceReportDto {
  @override
  final int? version;
  @override
  final String? uuid;
  @override
  final AiAdminServicesDeviceDtosDeviceApplicationDto? application;
  @override
  final AiAdminServicesDeviceDtosDeviceBoardInfoDto? board;
  @override
  final String? macAddress;
  @override
  final String? chipModelName;

  factory _$AiAdminServicesDeviceDtosDeviceReportDto(
          [void Function(AiAdminServicesDeviceDtosDeviceReportDtoBuilder)?
              updates]) =>
      (AiAdminServicesDeviceDtosDeviceReportDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesDeviceDtosDeviceReportDto._(
      {this.version,
      this.uuid,
      this.application,
      this.board,
      this.macAddress,
      this.chipModelName})
      : super._();
  @override
  AiAdminServicesDeviceDtosDeviceReportDto rebuild(
          void Function(AiAdminServicesDeviceDtosDeviceReportDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesDeviceDtosDeviceReportDtoBuilder toBuilder() =>
      AiAdminServicesDeviceDtosDeviceReportDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesDeviceDtosDeviceReportDto &&
        version == other.version &&
        uuid == other.uuid &&
        application == other.application &&
        board == other.board &&
        macAddress == other.macAddress &&
        chipModelName == other.chipModelName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, uuid.hashCode);
    _$hash = $jc(_$hash, application.hashCode);
    _$hash = $jc(_$hash, board.hashCode);
    _$hash = $jc(_$hash, macAddress.hashCode);
    _$hash = $jc(_$hash, chipModelName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesDeviceDtosDeviceReportDto')
          ..add('version', version)
          ..add('uuid', uuid)
          ..add('application', application)
          ..add('board', board)
          ..add('macAddress', macAddress)
          ..add('chipModelName', chipModelName))
        .toString();
  }
}

class AiAdminServicesDeviceDtosDeviceReportDtoBuilder
    implements
        Builder<AiAdminServicesDeviceDtosDeviceReportDto,
            AiAdminServicesDeviceDtosDeviceReportDtoBuilder> {
  _$AiAdminServicesDeviceDtosDeviceReportDto? _$v;

  int? _version;
  int? get version => _$this._version;
  set version(int? version) => _$this._version = version;

  String? _uuid;
  String? get uuid => _$this._uuid;
  set uuid(String? uuid) => _$this._uuid = uuid;

  AiAdminServicesDeviceDtosDeviceApplicationDtoBuilder? _application;
  AiAdminServicesDeviceDtosDeviceApplicationDtoBuilder get application =>
      _$this._application ??=
          AiAdminServicesDeviceDtosDeviceApplicationDtoBuilder();
  set application(
          AiAdminServicesDeviceDtosDeviceApplicationDtoBuilder? application) =>
      _$this._application = application;

  AiAdminServicesDeviceDtosDeviceBoardInfoDtoBuilder? _board;
  AiAdminServicesDeviceDtosDeviceBoardInfoDtoBuilder get board =>
      _$this._board ??= AiAdminServicesDeviceDtosDeviceBoardInfoDtoBuilder();
  set board(AiAdminServicesDeviceDtosDeviceBoardInfoDtoBuilder? board) =>
      _$this._board = board;

  String? _macAddress;
  String? get macAddress => _$this._macAddress;
  set macAddress(String? macAddress) => _$this._macAddress = macAddress;

  String? _chipModelName;
  String? get chipModelName => _$this._chipModelName;
  set chipModelName(String? chipModelName) =>
      _$this._chipModelName = chipModelName;

  AiAdminServicesDeviceDtosDeviceReportDtoBuilder() {
    AiAdminServicesDeviceDtosDeviceReportDto._defaults(this);
  }

  AiAdminServicesDeviceDtosDeviceReportDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _version = $v.version;
      _uuid = $v.uuid;
      _application = $v.application?.toBuilder();
      _board = $v.board?.toBuilder();
      _macAddress = $v.macAddress;
      _chipModelName = $v.chipModelName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesDeviceDtosDeviceReportDto other) {
    _$v = other as _$AiAdminServicesDeviceDtosDeviceReportDto;
  }

  @override
  void update(
      void Function(AiAdminServicesDeviceDtosDeviceReportDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesDeviceDtosDeviceReportDto build() => _build();

  _$AiAdminServicesDeviceDtosDeviceReportDto _build() {
    _$AiAdminServicesDeviceDtosDeviceReportDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesDeviceDtosDeviceReportDto._(
            version: version,
            uuid: uuid,
            application: _application?.build(),
            board: _board?.build(),
            macAddress: macAddress,
            chipModelName: chipModelName,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'application';
        _application?.build();
        _$failedField = 'board';
        _board?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesDeviceDtosDeviceReportDto',
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
