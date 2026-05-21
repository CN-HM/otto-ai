// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_page_data_ai_admin_services_billing_dtos_admin_billing_order_item_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto
    extends AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto {
  @override
  final int? total;
  @override
  final BuiltList<AiAdminServicesBillingDtosAdminBillingOrderItemDto>? list;

  factory _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto(
          [void Function(
                  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto._(
      {this.total, this.list})
      : super._();
  @override
  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto
      rebuild(
              void Function(
                      AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDtoBuilder
      toBuilder() =>
          AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto &&
        total == other.total &&
        list == other.list;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, list.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto')
          ..add('total', total)
          ..add('list', list))
        .toString();
  }
}

class AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDtoBuilder
    implements
        Builder<
            AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto,
            AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDtoBuilder> {
  _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto?
      _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  ListBuilder<AiAdminServicesBillingDtosAdminBillingOrderItemDto>? _list;
  ListBuilder<AiAdminServicesBillingDtosAdminBillingOrderItemDto> get list =>
      _$this._list ??=
          ListBuilder<AiAdminServicesBillingDtosAdminBillingOrderItemDto>();
  set list(
          ListBuilder<AiAdminServicesBillingDtosAdminBillingOrderItemDto>?
              list) =>
      _$this._list = list;

  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDtoBuilder() {
    AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto
        ._defaults(this);
  }

  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDtoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _total = $v.total;
      _list = $v.list?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto
          other) {
    _$v = other
        as _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto
      build() => _build();

  _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto
      _build() {
    _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto
              ._(
            total: total,
            list: _list?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'list';
        _list?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto',
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
