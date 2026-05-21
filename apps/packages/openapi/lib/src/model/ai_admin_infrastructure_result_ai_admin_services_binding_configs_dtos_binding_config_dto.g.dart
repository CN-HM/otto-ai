// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_binding_configs_dtos_binding_config_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto
    extends AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesBindingConfigsDtosBindingConfigDto? data;

  factory _$AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto
      rebuild(
              void Function(
                      AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto &&
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
            r'AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto,
            AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto?
      _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder? _data;
  AiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder get data =>
      _$this._data ??=
          AiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder();
  set data(AiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder
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
      AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto
      build() => _build();

  _$AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto
      _build() {
    _$AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto
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
            r'AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto',
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
