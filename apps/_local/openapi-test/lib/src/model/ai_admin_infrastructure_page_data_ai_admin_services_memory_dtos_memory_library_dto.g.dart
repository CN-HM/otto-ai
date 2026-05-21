// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_page_data_ai_admin_services_memory_dtos_memory_library_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDto
    extends AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDto {
  @override
  final int? total;
  @override
  final BuiltList<AiAdminServicesMemoryDtosMemoryLibraryDto>? list;

  factory _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDto(
          [void Function(
                  AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDto._(
      {this.total, this.list})
      : super._();
  @override
  AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDto rebuild(
          void Function(
                  AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDtoBuilder
      toBuilder() =>
          AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDto &&
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
            r'AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDto')
          ..add('total', total)
          ..add('list', list))
        .toString();
  }
}

class AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDtoBuilder
    implements
        Builder<
            AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDto,
            AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDtoBuilder> {
  _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDto? _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  ListBuilder<AiAdminServicesMemoryDtosMemoryLibraryDto>? _list;
  ListBuilder<AiAdminServicesMemoryDtosMemoryLibraryDto> get list =>
      _$this._list ??= ListBuilder<AiAdminServicesMemoryDtosMemoryLibraryDto>();
  set list(ListBuilder<AiAdminServicesMemoryDtosMemoryLibraryDto>? list) =>
      _$this._list = list;

  AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDtoBuilder() {
    AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDto
        ._defaults(this);
  }

  AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDtoBuilder
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
      AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDto
          other) {
    _$v = other
        as _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDto
      build() => _build();

  _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDto
      _build() {
    _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDto
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
            r'AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDto',
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
