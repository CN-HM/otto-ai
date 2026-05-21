// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_page_data_ai_admin_services_agent_roles_dtos_agent_role_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto
    extends AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto {
  @override
  final int? total;
  @override
  final BuiltList<AiAdminServicesAgentRolesDtosAgentRoleDto>? list;

  factory _$AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto(
          [void Function(
                  AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto._(
      {this.total, this.list})
      : super._();
  @override
  AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto rebuild(
          void Function(
                  AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder
      toBuilder() =>
          AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto &&
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
            r'AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto')
          ..add('total', total)
          ..add('list', list))
        .toString();
  }
}

class AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder
    implements
        Builder<
            AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto,
            AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder> {
  _$AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto? _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  ListBuilder<AiAdminServicesAgentRolesDtosAgentRoleDto>? _list;
  ListBuilder<AiAdminServicesAgentRolesDtosAgentRoleDto> get list =>
      _$this._list ??= ListBuilder<AiAdminServicesAgentRolesDtosAgentRoleDto>();
  set list(ListBuilder<AiAdminServicesAgentRolesDtosAgentRoleDto>? list) =>
      _$this._list = list;

  AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder() {
    AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto
        ._defaults(this);
  }

  AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder
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
      AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto
          other) {
    _$v = other
        as _$AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto
      build() => _build();

  _$AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto
      _build() {
    _$AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto
              ._(
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
            r'AiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto',
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
