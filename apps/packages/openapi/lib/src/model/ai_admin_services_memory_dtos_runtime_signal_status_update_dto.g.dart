// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_memory_dtos_runtime_signal_status_update_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto
    extends AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto {
  @override
  final String? status;
  @override
  final String? errorMessage;
  @override
  final DateTime? scheduledAt;

  factory _$AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto(
          [void Function(
                  AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDtoBuilder)?
              updates]) =>
      (AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto._(
      {this.status, this.errorMessage, this.scheduledAt})
      : super._();
  @override
  AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto rebuild(
          void Function(
                  AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDtoBuilder toBuilder() =>
      AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDtoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto &&
        status == other.status &&
        errorMessage == other.errorMessage &&
        scheduledAt == other.scheduledAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, errorMessage.hashCode);
    _$hash = $jc(_$hash, scheduledAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto')
          ..add('status', status)
          ..add('errorMessage', errorMessage)
          ..add('scheduledAt', scheduledAt))
        .toString();
  }
}

class AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDtoBuilder
    implements
        Builder<AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto,
            AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDtoBuilder> {
  _$AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  DateTime? _scheduledAt;
  DateTime? get scheduledAt => _$this._scheduledAt;
  set scheduledAt(DateTime? scheduledAt) => _$this._scheduledAt = scheduledAt;

  AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDtoBuilder() {
    AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto._defaults(this);
  }

  AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _errorMessage = $v.errorMessage;
      _scheduledAt = $v.scheduledAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto other) {
    _$v = other as _$AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto build() => _build();

  _$AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto._(
          status: status,
          errorMessage: errorMessage,
          scheduledAt: scheduledAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
