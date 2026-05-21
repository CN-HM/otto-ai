// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_infrastructure_page_data_ai_admin_services_billing_dtos_billing_order_item_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto
    extends AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto?
      data;

  factory _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto
      rebuild(
              void Function(
                      AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto &&
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
            r'AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto,
            AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto?
      _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDtoBuilder?
      _data;
  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDtoBuilder
      get data => _$this._data ??=
          AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDtoBuilder();
  set data(
          AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDtoBuilder?
              data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDtoBuilder() {
    AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDtoBuilder
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
      AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto
      build() => _build();

  _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto
      _build() {
    _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto
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
            r'AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto',
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
