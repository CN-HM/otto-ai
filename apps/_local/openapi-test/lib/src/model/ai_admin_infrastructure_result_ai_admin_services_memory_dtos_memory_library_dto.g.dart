// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_memory_dtos_memory_library_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDto
    extends AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesMemoryDtosMemoryLibraryDto? data;

  factory _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDto rebuild(
          void Function(
                  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDto &&
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
            r'AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDto,
            AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDto? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesMemoryDtosMemoryLibraryDtoBuilder? _data;
  AiAdminServicesMemoryDtosMemoryLibraryDtoBuilder get data =>
      _$this._data ??= AiAdminServicesMemoryDtosMemoryLibraryDtoBuilder();
  set data(AiAdminServicesMemoryDtosMemoryLibraryDtoBuilder? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDtoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDtoBuilder
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
      AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDto
      build() => _build();

  _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDto
      _build() {
    _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDto
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
            r'AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDto',
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
