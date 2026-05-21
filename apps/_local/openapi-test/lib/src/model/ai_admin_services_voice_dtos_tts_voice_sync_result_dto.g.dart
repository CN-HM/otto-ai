// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_voice_dtos_tts_voice_sync_result_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesVoiceDtosTtsVoiceSyncResultDto
    extends AiAdminServicesVoiceDtosTtsVoiceSyncResultDto {
  @override
  final String? providerCode;
  @override
  final String? ttsProfileId;
  @override
  final int? remoteCount;
  @override
  final int? createdCount;
  @override
  final int? updatedCount;
  @override
  final int? skippedCount;
  @override
  final String? message;

  factory _$AiAdminServicesVoiceDtosTtsVoiceSyncResultDto(
          [void Function(AiAdminServicesVoiceDtosTtsVoiceSyncResultDtoBuilder)?
              updates]) =>
      (AiAdminServicesVoiceDtosTtsVoiceSyncResultDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesVoiceDtosTtsVoiceSyncResultDto._(
      {this.providerCode,
      this.ttsProfileId,
      this.remoteCount,
      this.createdCount,
      this.updatedCount,
      this.skippedCount,
      this.message})
      : super._();
  @override
  AiAdminServicesVoiceDtosTtsVoiceSyncResultDto rebuild(
          void Function(AiAdminServicesVoiceDtosTtsVoiceSyncResultDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesVoiceDtosTtsVoiceSyncResultDtoBuilder toBuilder() =>
      AiAdminServicesVoiceDtosTtsVoiceSyncResultDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesVoiceDtosTtsVoiceSyncResultDto &&
        providerCode == other.providerCode &&
        ttsProfileId == other.ttsProfileId &&
        remoteCount == other.remoteCount &&
        createdCount == other.createdCount &&
        updatedCount == other.updatedCount &&
        skippedCount == other.skippedCount &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, providerCode.hashCode);
    _$hash = $jc(_$hash, ttsProfileId.hashCode);
    _$hash = $jc(_$hash, remoteCount.hashCode);
    _$hash = $jc(_$hash, createdCount.hashCode);
    _$hash = $jc(_$hash, updatedCount.hashCode);
    _$hash = $jc(_$hash, skippedCount.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesVoiceDtosTtsVoiceSyncResultDto')
          ..add('providerCode', providerCode)
          ..add('ttsProfileId', ttsProfileId)
          ..add('remoteCount', remoteCount)
          ..add('createdCount', createdCount)
          ..add('updatedCount', updatedCount)
          ..add('skippedCount', skippedCount)
          ..add('message', message))
        .toString();
  }
}

class AiAdminServicesVoiceDtosTtsVoiceSyncResultDtoBuilder
    implements
        Builder<AiAdminServicesVoiceDtosTtsVoiceSyncResultDto,
            AiAdminServicesVoiceDtosTtsVoiceSyncResultDtoBuilder> {
  _$AiAdminServicesVoiceDtosTtsVoiceSyncResultDto? _$v;

  String? _providerCode;
  String? get providerCode => _$this._providerCode;
  set providerCode(String? providerCode) => _$this._providerCode = providerCode;

  String? _ttsProfileId;
  String? get ttsProfileId => _$this._ttsProfileId;
  set ttsProfileId(String? ttsProfileId) => _$this._ttsProfileId = ttsProfileId;

  int? _remoteCount;
  int? get remoteCount => _$this._remoteCount;
  set remoteCount(int? remoteCount) => _$this._remoteCount = remoteCount;

  int? _createdCount;
  int? get createdCount => _$this._createdCount;
  set createdCount(int? createdCount) => _$this._createdCount = createdCount;

  int? _updatedCount;
  int? get updatedCount => _$this._updatedCount;
  set updatedCount(int? updatedCount) => _$this._updatedCount = updatedCount;

  int? _skippedCount;
  int? get skippedCount => _$this._skippedCount;
  set skippedCount(int? skippedCount) => _$this._skippedCount = skippedCount;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  AiAdminServicesVoiceDtosTtsVoiceSyncResultDtoBuilder() {
    AiAdminServicesVoiceDtosTtsVoiceSyncResultDto._defaults(this);
  }

  AiAdminServicesVoiceDtosTtsVoiceSyncResultDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _providerCode = $v.providerCode;
      _ttsProfileId = $v.ttsProfileId;
      _remoteCount = $v.remoteCount;
      _createdCount = $v.createdCount;
      _updatedCount = $v.updatedCount;
      _skippedCount = $v.skippedCount;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesVoiceDtosTtsVoiceSyncResultDto other) {
    _$v = other as _$AiAdminServicesVoiceDtosTtsVoiceSyncResultDto;
  }

  @override
  void update(
      void Function(AiAdminServicesVoiceDtosTtsVoiceSyncResultDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesVoiceDtosTtsVoiceSyncResultDto build() => _build();

  _$AiAdminServicesVoiceDtosTtsVoiceSyncResultDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesVoiceDtosTtsVoiceSyncResultDto._(
          providerCode: providerCode,
          ttsProfileId: ttsProfileId,
          remoteCount: remoteCount,
          createdCount: createdCount,
          updatedCount: updatedCount,
          skippedCount: skippedCount,
          message: message,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
