// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_page_data_ai_admin_services_billing_dtos_admin_billing_usage_item_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto
    extends AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto {
  @override
  final int? total;
  @override
  final BuiltList<AiAdminServicesBillingDtosAdminBillingUsageItemDto>? list;

  factory _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto(
          [void Function(
                  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto._(
      {this.total, this.list})
      : super._();
  @override
  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto
      rebuild(
              void Function(
                      AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder
      toBuilder() =>
          AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto &&
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
            r'AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto')
          ..add('total', total)
          ..add('list', list))
        .toString();
  }
}

class AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder
    implements
        Builder<
            AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto,
            AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder> {
  _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto?
      _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  ListBuilder<AiAdminServicesBillingDtosAdminBillingUsageItemDto>? _list;
  ListBuilder<AiAdminServicesBillingDtosAdminBillingUsageItemDto> get list =>
      _$this._list ??=
          ListBuilder<AiAdminServicesBillingDtosAdminBillingUsageItemDto>();
  set list(
          ListBuilder<AiAdminServicesBillingDtosAdminBillingUsageItemDto>?
              list) =>
      _$this._list = list;

  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder() {
    AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto
        ._defaults(this);
  }

  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder
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
      AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto
          other) {
    _$v = other
        as _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto
      build() => _build();

  _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto
      _build() {
    _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto
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
            r'AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto',
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
