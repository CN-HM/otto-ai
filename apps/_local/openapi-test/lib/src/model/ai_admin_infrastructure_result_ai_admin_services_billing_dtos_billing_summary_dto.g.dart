// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_billing_dtos_billing_summary_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto
    extends AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesBillingDtosBillingSummaryDto? data;

  factory _$AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto rebuild(
          void Function(
                  AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto &&
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
            r'AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto,
            AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesBillingDtosBillingSummaryDtoBuilder? _data;
  AiAdminServicesBillingDtosBillingSummaryDtoBuilder get data =>
      _$this._data ??= AiAdminServicesBillingDtosBillingSummaryDtoBuilder();
  set data(AiAdminServicesBillingDtosBillingSummaryDtoBuilder? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDtoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDtoBuilder
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
      AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto
      build() => _build();

  _$AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto
      _build() {
    _$AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto
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
            r'AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto',
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
