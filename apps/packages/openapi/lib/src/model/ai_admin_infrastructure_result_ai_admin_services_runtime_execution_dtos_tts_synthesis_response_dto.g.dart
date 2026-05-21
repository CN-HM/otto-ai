// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_runtime_execution_dtos_tts_synthesis_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto
    extends AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto? data;

  factory _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto
      rebuild(
              void Function(
                      AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto &&
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
            r'AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto,
            AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto?
      _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder? _data;
  AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder get data =>
      _$this._data ??=
          AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder();
  set data(
          AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder?
              data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder
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
      AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto
      build() => _build();

  _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto
      _build() {
    _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto
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
            r'AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto',
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
