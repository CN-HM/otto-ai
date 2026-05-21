// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_auth_dtos_pub_config_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDto
    extends AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesAuthDtosPubConfigDto? data;

  factory _$AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDto rebuild(
          void Function(
                  AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDto &&
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
            r'AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDtoBuilder
    implements
        Builder<AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDto,
            AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDto? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesAuthDtosPubConfigDtoBuilder? _data;
  AiAdminServicesAuthDtosPubConfigDtoBuilder get data =>
      _$this._data ??= AiAdminServicesAuthDtosPubConfigDtoBuilder();
  set data(AiAdminServicesAuthDtosPubConfigDtoBuilder? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDtoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDto._defaults(
        this);
  }

  AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDtoBuilder
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
      AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDto other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDto build() =>
      _build();

  _$AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDto _build() {
    _$AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDto._(
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
            r'AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDto',
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
