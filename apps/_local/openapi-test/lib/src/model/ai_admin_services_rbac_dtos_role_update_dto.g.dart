// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_rbac_dtos_role_update_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesRbacDtosRoleUpdateDto
    extends AiAdminServicesRbacDtosRoleUpdateDto {
  @override
  final String? name;
  @override
  final String? code;
  @override
  final String? remark;
  @override
  final int? status;
  @override
  final int? sort;

  factory _$AiAdminServicesRbacDtosRoleUpdateDto(
          [void Function(AiAdminServicesRbacDtosRoleUpdateDtoBuilder)?
              updates]) =>
      (AiAdminServicesRbacDtosRoleUpdateDtoBuilder()..update(updates))._build();

  _$AiAdminServicesRbacDtosRoleUpdateDto._(
      {this.name, this.code, this.remark, this.status, this.sort})
      : super._();
  @override
  AiAdminServicesRbacDtosRoleUpdateDto rebuild(
          void Function(AiAdminServicesRbacDtosRoleUpdateDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesRbacDtosRoleUpdateDtoBuilder toBuilder() =>
      AiAdminServicesRbacDtosRoleUpdateDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesRbacDtosRoleUpdateDto &&
        name == other.name &&
        code == other.code &&
        remark == other.remark &&
        status == other.status &&
        sort == other.sort;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, remark.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, sort.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AiAdminServicesRbacDtosRoleUpdateDto')
          ..add('name', name)
          ..add('code', code)
          ..add('remark', remark)
          ..add('status', status)
          ..add('sort', sort))
        .toString();
  }
}

class AiAdminServicesRbacDtosRoleUpdateDtoBuilder
    implements
        Builder<AiAdminServicesRbacDtosRoleUpdateDto,
            AiAdminServicesRbacDtosRoleUpdateDtoBuilder> {
  _$AiAdminServicesRbacDtosRoleUpdateDto? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _remark;
  String? get remark => _$this._remark;
  set remark(String? remark) => _$this._remark = remark;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  int? _sort;
  int? get sort => _$this._sort;
  set sort(int? sort) => _$this._sort = sort;

  AiAdminServicesRbacDtosRoleUpdateDtoBuilder() {
    AiAdminServicesRbacDtosRoleUpdateDto._defaults(this);
  }

  AiAdminServicesRbacDtosRoleUpdateDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _code = $v.code;
      _remark = $v.remark;
      _status = $v.status;
      _sort = $v.sort;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesRbacDtosRoleUpdateDto other) {
    _$v = other as _$AiAdminServicesRbacDtosRoleUpdateDto;
  }

  @override
  void update(
      void Function(AiAdminServicesRbacDtosRoleUpdateDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesRbacDtosRoleUpdateDto build() => _build();

  _$AiAdminServicesRbacDtosRoleUpdateDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesRbacDtosRoleUpdateDto._(
          name: name,
          code: code,
          remark: remark,
          status: status,
          sort: sort,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
