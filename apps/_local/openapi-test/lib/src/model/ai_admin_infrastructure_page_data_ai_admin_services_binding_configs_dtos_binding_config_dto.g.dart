// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_page_data_ai_admin_services_binding_configs_dtos_binding_config_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto
    extends AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto {
  @override
  final int? total;
  @override
  final BuiltList<AiAdminServicesBindingConfigsDtosBindingConfigDto>? list;

  factory _$AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto(
          [void Function(
                  AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto._(
      {this.total, this.list})
      : super._();
  @override
  AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto
      rebuild(
              void Function(
                      AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder
      toBuilder() =>
          AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto &&
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
            r'AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto')
          ..add('total', total)
          ..add('list', list))
        .toString();
  }
}

class AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder
    implements
        Builder<
            AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto,
            AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder> {
  _$AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto?
      _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  ListBuilder<AiAdminServicesBindingConfigsDtosBindingConfigDto>? _list;
  ListBuilder<AiAdminServicesBindingConfigsDtosBindingConfigDto> get list =>
      _$this._list ??=
          ListBuilder<AiAdminServicesBindingConfigsDtosBindingConfigDto>();
  set list(
          ListBuilder<AiAdminServicesBindingConfigsDtosBindingConfigDto>?
              list) =>
      _$this._list = list;

  AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder() {
    AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto
        ._defaults(this);
  }

  AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder
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
      AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto
          other) {
    _$v = other
        as _$AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto
      build() => _build();

  _$AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto
      _build() {
    _$AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto
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
            r'AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto',
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
