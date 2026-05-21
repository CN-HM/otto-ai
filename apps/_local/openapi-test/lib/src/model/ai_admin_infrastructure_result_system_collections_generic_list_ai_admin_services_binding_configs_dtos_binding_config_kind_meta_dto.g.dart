// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_system_collections_generic_list_ai_admin_services_binding_configs_dtos_binding_config_kind_meta_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto
    extends AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final BuiltList<AiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto>?
      data;

  factory _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto(
          [void Function(
                  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto
      rebuild(
              void Function(
                      AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto &&
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
            r'AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto,
            AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDtoBuilder> {
  _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto?
      _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  ListBuilder<AiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto>? _data;
  ListBuilder<AiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto>
      get data => _$this._data ??= ListBuilder<
          AiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto>();
  set data(
          ListBuilder<
                  AiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto>?
              data) =>
      _$this._data = data;

  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDtoBuilder() {
    AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDtoBuilder
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
      AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto
      build() => _build();

  _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto
      _build() {
    _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto
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
            r'AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto',
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
