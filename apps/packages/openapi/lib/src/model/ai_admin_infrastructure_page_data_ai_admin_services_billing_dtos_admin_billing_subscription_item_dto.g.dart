// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_page_data_ai_admin_services_billing_dtos_admin_billing_subscription_item_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto
    extends AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto {
  @override
  final int? total;
  @override
  final BuiltList<AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto>?
      list;

  factory _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto(
          [void Function(
                  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto._(
      {this.total, this.list})
      : super._();
  @override
  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto
      rebuild(
              void Function(
                      AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder
      toBuilder() =>
          AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto &&
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
            r'AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto')
          ..add('total', total)
          ..add('list', list))
        .toString();
  }
}

class AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder
    implements
        Builder<
            AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto,
            AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder> {
  _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto?
      _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  ListBuilder<AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto>? _list;
  ListBuilder<AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto>
      get list => _$this._list ??= ListBuilder<
          AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto>();
  set list(
          ListBuilder<
                  AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto>?
              list) =>
      _$this._list = list;

  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder() {
    AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto
        ._defaults(this);
  }

  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder
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
      AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto
          other) {
    _$v = other
        as _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto
      build() => _build();

  _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto
      _build() {
    _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto
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
            r'AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto',
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
