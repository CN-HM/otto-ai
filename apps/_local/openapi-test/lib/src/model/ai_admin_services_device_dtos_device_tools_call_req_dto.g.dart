// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_device_dtos_device_tools_call_req_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesDeviceDtosDeviceToolsCallReqDto
    extends AiAdminServicesDeviceDtosDeviceToolsCallReqDto {
  @override
  final String? name;
  @override
  final BuiltMap<String, JsonObject?>? arguments;

  factory _$AiAdminServicesDeviceDtosDeviceToolsCallReqDto(
          [void Function(AiAdminServicesDeviceDtosDeviceToolsCallReqDtoBuilder)?
              updates]) =>
      (AiAdminServicesDeviceDtosDeviceToolsCallReqDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesDeviceDtosDeviceToolsCallReqDto._(
      {this.name, this.arguments})
      : super._();
  @override
  AiAdminServicesDeviceDtosDeviceToolsCallReqDto rebuild(
          void Function(AiAdminServicesDeviceDtosDeviceToolsCallReqDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesDeviceDtosDeviceToolsCallReqDtoBuilder toBuilder() =>
      AiAdminServicesDeviceDtosDeviceToolsCallReqDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesDeviceDtosDeviceToolsCallReqDto &&
        name == other.name &&
        arguments == other.arguments;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, arguments.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesDeviceDtosDeviceToolsCallReqDto')
          ..add('name', name)
          ..add('arguments', arguments))
        .toString();
  }
}

class AiAdminServicesDeviceDtosDeviceToolsCallReqDtoBuilder
    implements
        Builder<AiAdminServicesDeviceDtosDeviceToolsCallReqDto,
            AiAdminServicesDeviceDtosDeviceToolsCallReqDtoBuilder> {
  _$AiAdminServicesDeviceDtosDeviceToolsCallReqDto? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  MapBuilder<String, JsonObject?>? _arguments;
  MapBuilder<String, JsonObject?> get arguments =>
      _$this._arguments ??= MapBuilder<String, JsonObject?>();
  set arguments(MapBuilder<String, JsonObject?>? arguments) =>
      _$this._arguments = arguments;

  AiAdminServicesDeviceDtosDeviceToolsCallReqDtoBuilder() {
    AiAdminServicesDeviceDtosDeviceToolsCallReqDto._defaults(this);
  }

  AiAdminServicesDeviceDtosDeviceToolsCallReqDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _arguments = $v.arguments?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesDeviceDtosDeviceToolsCallReqDto other) {
    _$v = other as _$AiAdminServicesDeviceDtosDeviceToolsCallReqDto;
  }

  @override
  void update(
      void Function(AiAdminServicesDeviceDtosDeviceToolsCallReqDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesDeviceDtosDeviceToolsCallReqDto build() => _build();

  _$AiAdminServicesDeviceDtosDeviceToolsCallReqDto _build() {
    _$AiAdminServicesDeviceDtosDeviceToolsCallReqDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesDeviceDtosDeviceToolsCallReqDto._(
            name: name,
            arguments: _arguments?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'arguments';
        _arguments?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesDeviceDtosDeviceToolsCallReqDto',
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
