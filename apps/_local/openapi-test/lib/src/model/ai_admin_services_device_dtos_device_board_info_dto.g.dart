// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_device_dtos_device_board_info_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesDeviceDtosDeviceBoardInfoDto
    extends AiAdminServicesDeviceDtosDeviceBoardInfoDto {
  @override
  final String? name;

  factory _$AiAdminServicesDeviceDtosDeviceBoardInfoDto(
          [void Function(AiAdminServicesDeviceDtosDeviceBoardInfoDtoBuilder)?
              updates]) =>
      (AiAdminServicesDeviceDtosDeviceBoardInfoDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesDeviceDtosDeviceBoardInfoDto._({this.name}) : super._();
  @override
  AiAdminServicesDeviceDtosDeviceBoardInfoDto rebuild(
          void Function(AiAdminServicesDeviceDtosDeviceBoardInfoDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesDeviceDtosDeviceBoardInfoDtoBuilder toBuilder() =>
      AiAdminServicesDeviceDtosDeviceBoardInfoDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesDeviceDtosDeviceBoardInfoDto &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesDeviceDtosDeviceBoardInfoDto')
          ..add('name', name))
        .toString();
  }
}

class AiAdminServicesDeviceDtosDeviceBoardInfoDtoBuilder
    implements
        Builder<AiAdminServicesDeviceDtosDeviceBoardInfoDto,
            AiAdminServicesDeviceDtosDeviceBoardInfoDtoBuilder> {
  _$AiAdminServicesDeviceDtosDeviceBoardInfoDto? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  AiAdminServicesDeviceDtosDeviceBoardInfoDtoBuilder() {
    AiAdminServicesDeviceDtosDeviceBoardInfoDto._defaults(this);
  }

  AiAdminServicesDeviceDtosDeviceBoardInfoDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesDeviceDtosDeviceBoardInfoDto other) {
    _$v = other as _$AiAdminServicesDeviceDtosDeviceBoardInfoDto;
  }

  @override
  void update(
      void Function(AiAdminServicesDeviceDtosDeviceBoardInfoDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesDeviceDtosDeviceBoardInfoDto build() => _build();

  _$AiAdminServicesDeviceDtosDeviceBoardInfoDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesDeviceDtosDeviceBoardInfoDto._(
          name: name,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
