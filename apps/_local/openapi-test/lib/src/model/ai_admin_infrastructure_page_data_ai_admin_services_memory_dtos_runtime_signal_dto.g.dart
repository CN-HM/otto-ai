// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_page_data_ai_admin_services_memory_dtos_runtime_signal_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto
    extends AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto {
  @override
  final int? total;
  @override
  final BuiltList<AiAdminServicesMemoryDtosRuntimeSignalDto>? list;

  factory _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto(
          [void Function(
                  AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto._(
      {this.total, this.list})
      : super._();
  @override
  AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto rebuild(
          void Function(
                  AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDtoBuilder
      toBuilder() =>
          AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto &&
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
            r'AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto')
          ..add('total', total)
          ..add('list', list))
        .toString();
  }
}

class AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDtoBuilder
    implements
        Builder<
            AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto,
            AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDtoBuilder> {
  _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto? _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  ListBuilder<AiAdminServicesMemoryDtosRuntimeSignalDto>? _list;
  ListBuilder<AiAdminServicesMemoryDtosRuntimeSignalDto> get list =>
      _$this._list ??= ListBuilder<AiAdminServicesMemoryDtosRuntimeSignalDto>();
  set list(ListBuilder<AiAdminServicesMemoryDtosRuntimeSignalDto>? list) =>
      _$this._list = list;

  AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDtoBuilder() {
    AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto
        ._defaults(this);
  }

  AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDtoBuilder
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
      AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto
          other) {
    _$v = other
        as _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto
      build() => _build();

  _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto
      _build() {
    _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto
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
            r'AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto',
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
