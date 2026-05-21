// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_memory_dtos_memory_write_config_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesMemoryDtosMemoryWriteConfigDto
    extends AiAdminServicesMemoryDtosMemoryWriteConfigDto {
  @override
  final bool? autoWrite;
  @override
  final bool? autoExtract;
  @override
  final int? ttlDays;
  @override
  final int? minImportance;
  @override
  final int? importanceThreshold;
  @override
  final bool? deduplicate;

  factory _$AiAdminServicesMemoryDtosMemoryWriteConfigDto(
          [void Function(AiAdminServicesMemoryDtosMemoryWriteConfigDtoBuilder)?
              updates]) =>
      (AiAdminServicesMemoryDtosMemoryWriteConfigDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesMemoryDtosMemoryWriteConfigDto._(
      {this.autoWrite,
      this.autoExtract,
      this.ttlDays,
      this.minImportance,
      this.importanceThreshold,
      this.deduplicate})
      : super._();
  @override
  AiAdminServicesMemoryDtosMemoryWriteConfigDto rebuild(
          void Function(AiAdminServicesMemoryDtosMemoryWriteConfigDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesMemoryDtosMemoryWriteConfigDtoBuilder toBuilder() =>
      AiAdminServicesMemoryDtosMemoryWriteConfigDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesMemoryDtosMemoryWriteConfigDto &&
        autoWrite == other.autoWrite &&
        autoExtract == other.autoExtract &&
        ttlDays == other.ttlDays &&
        minImportance == other.minImportance &&
        importanceThreshold == other.importanceThreshold &&
        deduplicate == other.deduplicate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, autoWrite.hashCode);
    _$hash = $jc(_$hash, autoExtract.hashCode);
    _$hash = $jc(_$hash, ttlDays.hashCode);
    _$hash = $jc(_$hash, minImportance.hashCode);
    _$hash = $jc(_$hash, importanceThreshold.hashCode);
    _$hash = $jc(_$hash, deduplicate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesMemoryDtosMemoryWriteConfigDto')
          ..add('autoWrite', autoWrite)
          ..add('autoExtract', autoExtract)
          ..add('ttlDays', ttlDays)
          ..add('minImportance', minImportance)
          ..add('importanceThreshold', importanceThreshold)
          ..add('deduplicate', deduplicate))
        .toString();
  }
}

class AiAdminServicesMemoryDtosMemoryWriteConfigDtoBuilder
    implements
        Builder<AiAdminServicesMemoryDtosMemoryWriteConfigDto,
            AiAdminServicesMemoryDtosMemoryWriteConfigDtoBuilder> {
  _$AiAdminServicesMemoryDtosMemoryWriteConfigDto? _$v;

  bool? _autoWrite;
  bool? get autoWrite => _$this._autoWrite;
  set autoWrite(bool? autoWrite) => _$this._autoWrite = autoWrite;

  bool? _autoExtract;
  bool? get autoExtract => _$this._autoExtract;
  set autoExtract(bool? autoExtract) => _$this._autoExtract = autoExtract;

  int? _ttlDays;
  int? get ttlDays => _$this._ttlDays;
  set ttlDays(int? ttlDays) => _$this._ttlDays = ttlDays;

  int? _minImportance;
  int? get minImportance => _$this._minImportance;
  set minImportance(int? minImportance) =>
      _$this._minImportance = minImportance;

  int? _importanceThreshold;
  int? get importanceThreshold => _$this._importanceThreshold;
  set importanceThreshold(int? importanceThreshold) =>
      _$this._importanceThreshold = importanceThreshold;

  bool? _deduplicate;
  bool? get deduplicate => _$this._deduplicate;
  set deduplicate(bool? deduplicate) => _$this._deduplicate = deduplicate;

  AiAdminServicesMemoryDtosMemoryWriteConfigDtoBuilder() {
    AiAdminServicesMemoryDtosMemoryWriteConfigDto._defaults(this);
  }

  AiAdminServicesMemoryDtosMemoryWriteConfigDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _autoWrite = $v.autoWrite;
      _autoExtract = $v.autoExtract;
      _ttlDays = $v.ttlDays;
      _minImportance = $v.minImportance;
      _importanceThreshold = $v.importanceThreshold;
      _deduplicate = $v.deduplicate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesMemoryDtosMemoryWriteConfigDto other) {
    _$v = other as _$AiAdminServicesMemoryDtosMemoryWriteConfigDto;
  }

  @override
  void update(
      void Function(AiAdminServicesMemoryDtosMemoryWriteConfigDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesMemoryDtosMemoryWriteConfigDto build() => _build();

  _$AiAdminServicesMemoryDtosMemoryWriteConfigDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesMemoryDtosMemoryWriteConfigDto._(
          autoWrite: autoWrite,
          autoExtract: autoExtract,
          ttlDays: ttlDays,
          minImportance: minImportance,
          importanceThreshold: importanceThreshold,
          deduplicate: deduplicate,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
