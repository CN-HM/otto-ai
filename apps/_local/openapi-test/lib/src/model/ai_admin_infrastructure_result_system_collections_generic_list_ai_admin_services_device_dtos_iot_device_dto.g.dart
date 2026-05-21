// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_system_collections_generic_list_ai_admin_services_device_dtos_iot_device_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDto
    extends AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final BuiltList<AiAdminServicesDeviceDtosIotDeviceDto>? data;

  factory _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDto(
          [void Function(
                  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDto
      rebuild(
              void Function(
                      AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDto &&
        code == other.code &&
        msg == other.msg &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, msg.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDto,
            AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDtoBuilder> {
  _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDto?
      _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  ListBuilder<AiAdminServicesDeviceDtosIotDeviceDto>? _data;
  ListBuilder<AiAdminServicesDeviceDtosIotDeviceDto> get data =>
      _$this._data ??= ListBuilder<AiAdminServicesDeviceDtosIotDeviceDto>();
  set data(ListBuilder<AiAdminServicesDeviceDtosIotDeviceDto>? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDtoBuilder() {
    AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDtoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _msg = $v.msg;
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDto
      build() => _build();

  _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDto
      _build() {
    _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDto
              ._(
            code: code,
            msg: msg,
            data: _data?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDto',
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
