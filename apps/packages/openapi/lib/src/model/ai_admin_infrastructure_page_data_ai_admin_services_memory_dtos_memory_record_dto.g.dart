// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_page_data_ai_admin_services_memory_dtos_memory_record_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto
    extends AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto {
  @override
  final int? total;
  @override
  final BuiltList<AiAdminServicesMemoryDtosMemoryRecordDto>? list;

  factory _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto(
          [void Function(
                  AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto._(
      {this.total, this.list})
      : super._();
  @override
  AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto rebuild(
          void Function(
                  AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDtoBuilder
      toBuilder() =>
          AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto &&
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
            r'AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto')
          ..add('total', total)
          ..add('list', list))
        .toString();
  }
}

class AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDtoBuilder
    implements
        Builder<
            AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto,
            AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDtoBuilder> {
  _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto? _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  ListBuilder<AiAdminServicesMemoryDtosMemoryRecordDto>? _list;
  ListBuilder<AiAdminServicesMemoryDtosMemoryRecordDto> get list =>
      _$this._list ??= ListBuilder<AiAdminServicesMemoryDtosMemoryRecordDto>();
  set list(ListBuilder<AiAdminServicesMemoryDtosMemoryRecordDto>? list) =>
      _$this._list = list;

  AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDtoBuilder() {
    AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto
        ._defaults(this);
  }

  AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDtoBuilder
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
      AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto
          other) {
    _$v = other
        as _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto
      build() => _build();

  _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto
      _build() {
    _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto
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
            r'AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto',
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
