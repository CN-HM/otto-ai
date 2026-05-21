// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_auth_dtos_token_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDto
    extends AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesAuthDtosTokenDto? data;

  factory _$AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDto rebuild(
          void Function(
                  AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDto &&
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
            r'AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDtoBuilder
    implements
        Builder<AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDto,
            AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDto? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesAuthDtosTokenDtoBuilder? _data;
  AiAdminServicesAuthDtosTokenDtoBuilder get data =>
      _$this._data ??= AiAdminServicesAuthDtosTokenDtoBuilder();
  set data(AiAdminServicesAuthDtosTokenDtoBuilder? data) => _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDtoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDto._defaults(this);
  }

  AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDtoBuilder get _$this {
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
      AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDto other) {
    _$v = other as _$AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDto build() =>
      _build();

  _$AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDto _build() {
    _$AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDto._(
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
            r'AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDto',
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
