// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_page_data_ai_admin_services_billing_dtos_billing_order_item_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto
    extends AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto {
  @override
  final int? total;
  @override
  final BuiltList<AiAdminServicesBillingDtosBillingOrderItemDto>? list;

  factory _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto(
          [void Function(
                  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto._(
      {this.total, this.list})
      : super._();
  @override
  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto
      rebuild(
              void Function(
                      AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDtoBuilder
      toBuilder() =>
          AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto &&
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
            r'AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto')
          ..add('total', total)
          ..add('list', list))
        .toString();
  }
}

class AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDtoBuilder
    implements
        Builder<
            AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto,
            AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDtoBuilder> {
  _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto?
      _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  ListBuilder<AiAdminServicesBillingDtosBillingOrderItemDto>? _list;
  ListBuilder<AiAdminServicesBillingDtosBillingOrderItemDto> get list =>
      _$this._list ??=
          ListBuilder<AiAdminServicesBillingDtosBillingOrderItemDto>();
  set list(ListBuilder<AiAdminServicesBillingDtosBillingOrderItemDto>? list) =>
      _$this._list = list;

  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDtoBuilder() {
    AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto
        ._defaults(this);
  }

  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDtoBuilder
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
      AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto
          other) {
    _$v = other
        as _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto
      build() => _build();

  _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto
      _build() {
    _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto
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
            r'AiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto',
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
