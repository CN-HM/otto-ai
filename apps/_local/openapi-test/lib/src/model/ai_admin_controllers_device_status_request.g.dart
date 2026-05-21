// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_controllers_device_status_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminControllersDeviceStatusRequest
    extends AiAdminControllersDeviceStatusRequest {
  @override
  final String? macAddress;
  @override
  final bool? isOnline;

  factory _$AiAdminControllersDeviceStatusRequest(
          [void Function(AiAdminControllersDeviceStatusRequestBuilder)?
              updates]) =>
      (AiAdminControllersDeviceStatusRequestBuilder()..update(updates))
          ._build();

  _$AiAdminControllersDeviceStatusRequest._({this.macAddress, this.isOnline})
      : super._();
  @override
  AiAdminControllersDeviceStatusRequest rebuild(
          void Function(AiAdminControllersDeviceStatusRequestBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminControllersDeviceStatusRequestBuilder toBuilder() =>
      AiAdminControllersDeviceStatusRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminControllersDeviceStatusRequest &&
        macAddress == other.macAddress &&
        isOnline == other.isOnline;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, macAddress.hashCode);
    _$hash = $jc(_$hash, isOnline.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminControllersDeviceStatusRequest')
          ..add('macAddress', macAddress)
          ..add('isOnline', isOnline))
        .toString();
  }
}

class AiAdminControllersDeviceStatusRequestBuilder
    implements
        Builder<AiAdminControllersDeviceStatusRequest,
            AiAdminControllersDeviceStatusRequestBuilder> {
  _$AiAdminControllersDeviceStatusRequest? _$v;

  String? _macAddress;
  String? get macAddress => _$this._macAddress;
  set macAddress(String? macAddress) => _$this._macAddress = macAddress;

  bool? _isOnline;
  bool? get isOnline => _$this._isOnline;
  set isOnline(bool? isOnline) => _$this._isOnline = isOnline;

  AiAdminControllersDeviceStatusRequestBuilder() {
    AiAdminControllersDeviceStatusRequest._defaults(this);
  }

  AiAdminControllersDeviceStatusRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _macAddress = $v.macAddress;
      _isOnline = $v.isOnline;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminControllersDeviceStatusRequest other) {
    _$v = other as _$AiAdminControllersDeviceStatusRequest;
  }

  @override
  void update(
      void Function(AiAdminControllersDeviceStatusRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminControllersDeviceStatusRequest build() => _build();

  _$AiAdminControllersDeviceStatusRequest _build() {
    final _$result = _$v ??
        _$AiAdminControllersDeviceStatusRequest._(
          macAddress: macAddress,
          isOnline: isOnline,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
