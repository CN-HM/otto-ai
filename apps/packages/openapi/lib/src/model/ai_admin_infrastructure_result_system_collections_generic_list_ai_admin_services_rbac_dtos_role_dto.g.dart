// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_system_collections_generic_list_ai_admin_services_rbac_dtos_role_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDto
    extends AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final BuiltList<AiAdminServicesRbacDtosRoleDto>? data;

  factory _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDto(
          [void Function(
                  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDto
      rebuild(
              void Function(
                      AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDto &&
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
            r'AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDto,
            AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDtoBuilder> {
  _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDto?
      _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  ListBuilder<AiAdminServicesRbacDtosRoleDto>? _data;
  ListBuilder<AiAdminServicesRbacDtosRoleDto> get data =>
      _$this._data ??= ListBuilder<AiAdminServicesRbacDtosRoleDto>();
  set data(ListBuilder<AiAdminServicesRbacDtosRoleDto>? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDtoBuilder() {
    AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDtoBuilder
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
      AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDto
      build() => _build();

  _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDto
      _build() {
    _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDto
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
            r'AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDto',
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
