// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_page_data_ai_admin_services_voice_dtos_ota_entity_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDto
    extends AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDto {
  @override
  final int? total;
  @override
  final BuiltList<AiAdminServicesVoiceDtosOtaEntityDto>? list;

  factory _$AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDto(
          [void Function(
                  AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDto._(
      {this.total, this.list})
      : super._();
  @override
  AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDto rebuild(
          void Function(
                  AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDtoBuilder
      toBuilder() =>
          AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDto &&
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
            r'AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDto')
          ..add('total', total)
          ..add('list', list))
        .toString();
  }
}

class AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDtoBuilder
    implements
        Builder<
            AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDto,
            AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDtoBuilder> {
  _$AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDto? _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  ListBuilder<AiAdminServicesVoiceDtosOtaEntityDto>? _list;
  ListBuilder<AiAdminServicesVoiceDtosOtaEntityDto> get list =>
      _$this._list ??= ListBuilder<AiAdminServicesVoiceDtosOtaEntityDto>();
  set list(ListBuilder<AiAdminServicesVoiceDtosOtaEntityDto>? list) =>
      _$this._list = list;

  AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDtoBuilder() {
    AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDto._defaults(
        this);
  }

  AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDtoBuilder
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
      AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDto other) {
    _$v = other
        as _$AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDto build() =>
      _build();

  _$AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDto _build() {
    _$AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDto._(
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
            r'AiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDto',
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
