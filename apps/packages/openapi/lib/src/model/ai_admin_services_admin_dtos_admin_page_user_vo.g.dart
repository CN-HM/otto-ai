// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_admin_dtos_admin_page_user_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAdminDtosAdminPageUserVo
    extends AiAdminServicesAdminDtosAdminPageUserVo {
  @override
  final String? userid;
  @override
  final String? mobile;
  @override
  final int? status;
  @override
  final String? createDate;
  @override
  final String? deviceCount;

  factory _$AiAdminServicesAdminDtosAdminPageUserVo(
          [void Function(AiAdminServicesAdminDtosAdminPageUserVoBuilder)?
              updates]) =>
      (AiAdminServicesAdminDtosAdminPageUserVoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesAdminDtosAdminPageUserVo._(
      {this.userid,
      this.mobile,
      this.status,
      this.createDate,
      this.deviceCount})
      : super._();
  @override
  AiAdminServicesAdminDtosAdminPageUserVo rebuild(
          void Function(AiAdminServicesAdminDtosAdminPageUserVoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAdminDtosAdminPageUserVoBuilder toBuilder() =>
      AiAdminServicesAdminDtosAdminPageUserVoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAdminDtosAdminPageUserVo &&
        userid == other.userid &&
        mobile == other.mobile &&
        status == other.status &&
        createDate == other.createDate &&
        deviceCount == other.deviceCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userid.hashCode);
    _$hash = $jc(_$hash, mobile.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, createDate.hashCode);
    _$hash = $jc(_$hash, deviceCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesAdminDtosAdminPageUserVo')
          ..add('userid', userid)
          ..add('mobile', mobile)
          ..add('status', status)
          ..add('createDate', createDate)
          ..add('deviceCount', deviceCount))
        .toString();
  }
}

class AiAdminServicesAdminDtosAdminPageUserVoBuilder
    implements
        Builder<AiAdminServicesAdminDtosAdminPageUserVo,
            AiAdminServicesAdminDtosAdminPageUserVoBuilder> {
  _$AiAdminServicesAdminDtosAdminPageUserVo? _$v;

  String? _userid;
  String? get userid => _$this._userid;
  set userid(String? userid) => _$this._userid = userid;

  String? _mobile;
  String? get mobile => _$this._mobile;
  set mobile(String? mobile) => _$this._mobile = mobile;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  String? _createDate;
  String? get createDate => _$this._createDate;
  set createDate(String? createDate) => _$this._createDate = createDate;

  String? _deviceCount;
  String? get deviceCount => _$this._deviceCount;
  set deviceCount(String? deviceCount) => _$this._deviceCount = deviceCount;

  AiAdminServicesAdminDtosAdminPageUserVoBuilder() {
    AiAdminServicesAdminDtosAdminPageUserVo._defaults(this);
  }

  AiAdminServicesAdminDtosAdminPageUserVoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userid = $v.userid;
      _mobile = $v.mobile;
      _status = $v.status;
      _createDate = $v.createDate;
      _deviceCount = $v.deviceCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAdminDtosAdminPageUserVo other) {
    _$v = other as _$AiAdminServicesAdminDtosAdminPageUserVo;
  }

  @override
  void update(
      void Function(AiAdminServicesAdminDtosAdminPageUserVoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAdminDtosAdminPageUserVo build() => _build();

  _$AiAdminServicesAdminDtosAdminPageUserVo _build() {
    final _$result = _$v ??
        _$AiAdminServicesAdminDtosAdminPageUserVo._(
          userid: userid,
          mobile: mobile,
          status: status,
          createDate: createDate,
          deviceCount: deviceCount,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
