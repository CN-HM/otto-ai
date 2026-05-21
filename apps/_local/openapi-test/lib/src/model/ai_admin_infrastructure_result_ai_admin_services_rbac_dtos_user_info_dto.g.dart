// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_rbac_dtos_user_info_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDto
    extends AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesRbacDtosUserInfoDto? data;

  factory _$AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDto rebuild(
          void Function(
                  AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDto &&
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
            r'AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDtoBuilder
    implements
        Builder<AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDto,
            AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDto? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesRbacDtosUserInfoDtoBuilder? _data;
  AiAdminServicesRbacDtosUserInfoDtoBuilder get data =>
      _$this._data ??= AiAdminServicesRbacDtosUserInfoDtoBuilder();
  set data(AiAdminServicesRbacDtosUserInfoDtoBuilder? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDtoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDto._defaults(
        this);
  }

  AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDtoBuilder
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
      AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDto other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDto build() =>
      _build();

  _$AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDto _build() {
    _$AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDto._(
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
            r'AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDto',
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
