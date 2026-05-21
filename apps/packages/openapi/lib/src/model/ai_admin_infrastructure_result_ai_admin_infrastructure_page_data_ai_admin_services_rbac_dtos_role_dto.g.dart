// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_infrastructure_page_data_ai_admin_services_rbac_dtos_role_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto
    extends AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto? data;

  factory _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto
      rebuild(
              void Function(
                      AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto &&
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
            r'AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto,
            AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto?
      _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoBuilder? _data;
  AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoBuilder get data =>
      _$this._data ??=
          AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoBuilder();
  set data(
          AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoBuilder?
              data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoBuilder() {
    AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoBuilder
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
      AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto
      build() => _build();

  _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto
      _build() {
    _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto
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
            r'AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto',
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
