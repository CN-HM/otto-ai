// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_memory_dtos_memory_search_result_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDto
    extends AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesMemoryDtosMemorySearchResultDto? data;

  factory _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDto rebuild(
          void Function(
                  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDto &&
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
            r'AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDto,
            AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDto?
      _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesMemoryDtosMemorySearchResultDtoBuilder? _data;
  AiAdminServicesMemoryDtosMemorySearchResultDtoBuilder get data =>
      _$this._data ??= AiAdminServicesMemoryDtosMemorySearchResultDtoBuilder();
  set data(AiAdminServicesMemoryDtosMemorySearchResultDtoBuilder? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDtoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDtoBuilder
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
      AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDto
      build() => _build();

  _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDto
      _build() {
    _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDto
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
            r'AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDto',
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
