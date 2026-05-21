// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_infrastructure_page_data_ai_admin_services_binding_configs_dtos_binding_config_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto
    extends AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto?
      data;

  factory _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto
      rebuild(
              void Function(
                      AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto &&
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
            r'AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto,
            AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto?
      _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder?
      _data;
  AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder
      get data => _$this._data ??=
          AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder();
  set data(
          AiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder?
              data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder() {
    AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder
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
      AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto
      build() => _build();

  _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto
      _build() {
    _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto
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
            r'AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto',
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
