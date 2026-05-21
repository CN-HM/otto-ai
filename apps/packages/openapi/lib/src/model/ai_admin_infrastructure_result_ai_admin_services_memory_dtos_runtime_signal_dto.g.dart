// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_memory_dtos_runtime_signal_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDto
    extends AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesMemoryDtosRuntimeSignalDto? data;

  factory _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDto rebuild(
          void Function(
                  AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDto &&
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
            r'AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDto,
            AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDto? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesMemoryDtosRuntimeSignalDtoBuilder? _data;
  AiAdminServicesMemoryDtosRuntimeSignalDtoBuilder get data =>
      _$this._data ??= AiAdminServicesMemoryDtosRuntimeSignalDtoBuilder();
  set data(AiAdminServicesMemoryDtosRuntimeSignalDtoBuilder? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDtoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDtoBuilder
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
      AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDto
      build() => _build();

  _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDto
      _build() {
    _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDto
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
            r'AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDto',
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
