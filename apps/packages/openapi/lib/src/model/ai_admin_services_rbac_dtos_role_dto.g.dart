// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_rbac_dtos_role_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesRbacDtosRoleDto extends AiAdminServicesRbacDtosRoleDto {
  @override
  final int? id;
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
  @override
  final DateTime? createDate;

  factory _$AiAdminServicesRbacDtosRoleDto(
          [void Function(AiAdminServicesRbacDtosRoleDtoBuilder)? updates]) =>
      (AiAdminServicesRbacDtosRoleDtoBuilder()..update(updates))._build();

  _$AiAdminServicesRbacDtosRoleDto._(
      {this.id,
      this.name,
      this.code,
      this.remark,
      this.status,
      this.sort,
      this.createDate})
      : super._();
  @override
  AiAdminServicesRbacDtosRoleDto rebuild(
          void Function(AiAdminServicesRbacDtosRoleDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesRbacDtosRoleDtoBuilder toBuilder() =>
      AiAdminServicesRbacDtosRoleDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesRbacDtosRoleDto &&
        id == other.id &&
        name == other.name &&
        code == other.code &&
        remark == other.remark &&
        status == other.status &&
        sort == other.sort &&
        createDate == other.createDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, remark.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, sort.hashCode);
    _$hash = $jc(_$hash, createDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AiAdminServicesRbacDtosRoleDto')
          ..add('id', id)
          ..add('name', name)
          ..add('code', code)
          ..add('remark', remark)
          ..add('status', status)
          ..add('sort', sort)
          ..add('createDate', createDate))
        .toString();
  }
}

class AiAdminServicesRbacDtosRoleDtoBuilder
    implements
        Builder<AiAdminServicesRbacDtosRoleDto,
            AiAdminServicesRbacDtosRoleDtoBuilder> {
  _$AiAdminServicesRbacDtosRoleDto? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

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

  DateTime? _createDate;
  DateTime? get createDate => _$this._createDate;
  set createDate(DateTime? createDate) => _$this._createDate = createDate;

  AiAdminServicesRbacDtosRoleDtoBuilder() {
    AiAdminServicesRbacDtosRoleDto._defaults(this);
  }

  AiAdminServicesRbacDtosRoleDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _code = $v.code;
      _remark = $v.remark;
      _status = $v.status;
      _sort = $v.sort;
      _createDate = $v.createDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesRbacDtosRoleDto other) {
    _$v = other as _$AiAdminServicesRbacDtosRoleDto;
  }

  @override
  void update(void Function(AiAdminServicesRbacDtosRoleDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesRbacDtosRoleDto build() => _build();

  _$AiAdminServicesRbacDtosRoleDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesRbacDtosRoleDto._(
          id: id,
          name: name,
          code: code,
          remark: remark,
          status: status,
          sort: sort,
          createDate: createDate,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
