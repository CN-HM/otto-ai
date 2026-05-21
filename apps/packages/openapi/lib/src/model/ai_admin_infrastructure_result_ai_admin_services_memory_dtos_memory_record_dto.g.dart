// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_memory_dtos_memory_record_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto
    extends AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesMemoryDtosMemoryRecordDto? data;

  factory _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto rebuild(
          void Function(
                  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto &&
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
            r'AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto,
            AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesMemoryDtosMemoryRecordDtoBuilder? _data;
  AiAdminServicesMemoryDtosMemoryRecordDtoBuilder get data =>
      _$this._data ??= AiAdminServicesMemoryDtosMemoryRecordDtoBuilder();
  set data(AiAdminServicesMemoryDtosMemoryRecordDtoBuilder? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDtoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDtoBuilder
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
      AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto build() =>
      _build();

  _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto
      _build() {
    _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto
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
            r'AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto',
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
