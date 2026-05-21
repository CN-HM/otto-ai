// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_page_data_ai_admin_services_rbac_dtos_role_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto
    extends AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto {
  @override
  final int? total;
  @override
  final BuiltList<AiAdminServicesRbacDtosRoleDto>? list;

  factory _$AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto(
          [void Function(
                  AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto._(
      {this.total, this.list})
      : super._();
  @override
  AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto rebuild(
          void Function(
                  AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoBuilder
      toBuilder() =>
          AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto &&
        total == other.total &&
        list == other.list;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, list.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto')
          ..add('total', total)
          ..add('list', list))
        .toString();
  }
}

class AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoBuilder
    implements
        Builder<AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto,
            AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoBuilder> {
  _$AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto? _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  ListBuilder<AiAdminServicesRbacDtosRoleDto>? _list;
  ListBuilder<AiAdminServicesRbacDtosRoleDto> get list =>
      _$this._list ??= ListBuilder<AiAdminServicesRbacDtosRoleDto>();
  set list(ListBuilder<AiAdminServicesRbacDtosRoleDto>? list) =>
      _$this._list = list;

  AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoBuilder() {
    AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto._defaults(this);
  }

  AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _total = $v.total;
      _list = $v.list?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto other) {
    _$v =
        other as _$AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto build() =>
      _build();

  _$AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto _build() {
    _$AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto._(
            total: total,
            list: _list?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'list';
        _list?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto',
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
