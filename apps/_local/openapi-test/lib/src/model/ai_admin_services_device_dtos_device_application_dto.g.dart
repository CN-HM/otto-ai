// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_device_dtos_device_application_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesDeviceDtosDeviceApplicationDto
    extends AiAdminServicesDeviceDtosDeviceApplicationDto {
  @override
  final String? name;
  @override
  final String? version;
  @override
  final String? compileTime;
  @override
  final String? idfVersion;

  factory _$AiAdminServicesDeviceDtosDeviceApplicationDto(
          [void Function(AiAdminServicesDeviceDtosDeviceApplicationDtoBuilder)?
              updates]) =>
      (AiAdminServicesDeviceDtosDeviceApplicationDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesDeviceDtosDeviceApplicationDto._(
      {this.name, this.version, this.compileTime, this.idfVersion})
      : super._();
  @override
  AiAdminServicesDeviceDtosDeviceApplicationDto rebuild(
          void Function(AiAdminServicesDeviceDtosDeviceApplicationDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesDeviceDtosDeviceApplicationDtoBuilder toBuilder() =>
      AiAdminServicesDeviceDtosDeviceApplicationDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesDeviceDtosDeviceApplicationDto &&
        name == other.name &&
        version == other.version &&
        compileTime == other.compileTime &&
        idfVersion == other.idfVersion;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, compileTime.hashCode);
    _$hash = $jc(_$hash, idfVersion.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesDeviceDtosDeviceApplicationDto')
          ..add('name', name)
          ..add('version', version)
          ..add('compileTime', compileTime)
          ..add('idfVersion', idfVersion))
        .toString();
  }
}

class AiAdminServicesDeviceDtosDeviceApplicationDtoBuilder
    implements
        Builder<AiAdminServicesDeviceDtosDeviceApplicationDto,
            AiAdminServicesDeviceDtosDeviceApplicationDtoBuilder> {
  _$AiAdminServicesDeviceDtosDeviceApplicationDto? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _version;
  String? get version => _$this._version;
  set version(String? version) => _$this._version = version;

  String? _compileTime;
  String? get compileTime => _$this._compileTime;
  set compileTime(String? compileTime) => _$this._compileTime = compileTime;

  String? _idfVersion;
  String? get idfVersion => _$this._idfVersion;
  set idfVersion(String? idfVersion) => _$this._idfVersion = idfVersion;

  AiAdminServicesDeviceDtosDeviceApplicationDtoBuilder() {
    AiAdminServicesDeviceDtosDeviceApplicationDto._defaults(this);
  }

  AiAdminServicesDeviceDtosDeviceApplicationDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _version = $v.version;
      _compileTime = $v.compileTime;
      _idfVersion = $v.idfVersion;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesDeviceDtosDeviceApplicationDto other) {
    _$v = other as _$AiAdminServicesDeviceDtosDeviceApplicationDto;
  }

  @override
  void update(
      void Function(AiAdminServicesDeviceDtosDeviceApplicationDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesDeviceDtosDeviceApplicationDto build() => _build();

  _$AiAdminServicesDeviceDtosDeviceApplicationDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesDeviceDtosDeviceApplicationDto._(
          name: name,
          version: version,
          compileTime: compileTime,
          idfVersion: idfVersion,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
