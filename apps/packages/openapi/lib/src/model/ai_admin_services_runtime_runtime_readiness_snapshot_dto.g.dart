// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_runtime_runtime_readiness_snapshot_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesRuntimeRuntimeReadinessSnapshotDto
    extends AiAdminServicesRuntimeRuntimeReadinessSnapshotDto {
  @override
  final bool? ready;
  @override
  final String? severity;
  @override
  final int? passedCheckCount;
  @override
  final int? warningCheckCount;
  @override
  final int? failedCheckCount;
  @override
  final BuiltList<AiAdminServicesRuntimeRuntimeReadinessCheckDto>? checks;

  factory _$AiAdminServicesRuntimeRuntimeReadinessSnapshotDto(
          [void Function(
                  AiAdminServicesRuntimeRuntimeReadinessSnapshotDtoBuilder)?
              updates]) =>
      (AiAdminServicesRuntimeRuntimeReadinessSnapshotDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesRuntimeRuntimeReadinessSnapshotDto._(
      {this.ready,
      this.severity,
      this.passedCheckCount,
      this.warningCheckCount,
      this.failedCheckCount,
      this.checks})
      : super._();
  @override
  AiAdminServicesRuntimeRuntimeReadinessSnapshotDto rebuild(
          void Function(
                  AiAdminServicesRuntimeRuntimeReadinessSnapshotDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesRuntimeRuntimeReadinessSnapshotDtoBuilder toBuilder() =>
      AiAdminServicesRuntimeRuntimeReadinessSnapshotDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesRuntimeRuntimeReadinessSnapshotDto &&
        ready == other.ready &&
        severity == other.severity &&
        passedCheckCount == other.passedCheckCount &&
        warningCheckCount == other.warningCheckCount &&
        failedCheckCount == other.failedCheckCount &&
        checks == other.checks;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ready.hashCode);
    _$hash = $jc(_$hash, severity.hashCode);
    _$hash = $jc(_$hash, passedCheckCount.hashCode);
    _$hash = $jc(_$hash, warningCheckCount.hashCode);
    _$hash = $jc(_$hash, failedCheckCount.hashCode);
    _$hash = $jc(_$hash, checks.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesRuntimeRuntimeReadinessSnapshotDto')
          ..add('ready', ready)
          ..add('severity', severity)
          ..add('passedCheckCount', passedCheckCount)
          ..add('warningCheckCount', warningCheckCount)
          ..add('failedCheckCount', failedCheckCount)
          ..add('checks', checks))
        .toString();
  }
}

class AiAdminServicesRuntimeRuntimeReadinessSnapshotDtoBuilder
    implements
        Builder<AiAdminServicesRuntimeRuntimeReadinessSnapshotDto,
            AiAdminServicesRuntimeRuntimeReadinessSnapshotDtoBuilder> {
  _$AiAdminServicesRuntimeRuntimeReadinessSnapshotDto? _$v;

  bool? _ready;
  bool? get ready => _$this._ready;
  set ready(bool? ready) => _$this._ready = ready;

  String? _severity;
  String? get severity => _$this._severity;
  set severity(String? severity) => _$this._severity = severity;

  int? _passedCheckCount;
  int? get passedCheckCount => _$this._passedCheckCount;
  set passedCheckCount(int? passedCheckCount) =>
      _$this._passedCheckCount = passedCheckCount;

  int? _warningCheckCount;
  int? get warningCheckCount => _$this._warningCheckCount;
  set warningCheckCount(int? warningCheckCount) =>
      _$this._warningCheckCount = warningCheckCount;

  int? _failedCheckCount;
  int? get failedCheckCount => _$this._failedCheckCount;
  set failedCheckCount(int? failedCheckCount) =>
      _$this._failedCheckCount = failedCheckCount;

  ListBuilder<AiAdminServicesRuntimeRuntimeReadinessCheckDto>? _checks;
  ListBuilder<AiAdminServicesRuntimeRuntimeReadinessCheckDto> get checks =>
      _$this._checks ??=
          ListBuilder<AiAdminServicesRuntimeRuntimeReadinessCheckDto>();
  set checks(
          ListBuilder<AiAdminServicesRuntimeRuntimeReadinessCheckDto>?
              checks) =>
      _$this._checks = checks;

  AiAdminServicesRuntimeRuntimeReadinessSnapshotDtoBuilder() {
    AiAdminServicesRuntimeRuntimeReadinessSnapshotDto._defaults(this);
  }

  AiAdminServicesRuntimeRuntimeReadinessSnapshotDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ready = $v.ready;
      _severity = $v.severity;
      _passedCheckCount = $v.passedCheckCount;
      _warningCheckCount = $v.warningCheckCount;
      _failedCheckCount = $v.failedCheckCount;
      _checks = $v.checks?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesRuntimeRuntimeReadinessSnapshotDto other) {
    _$v = other as _$AiAdminServicesRuntimeRuntimeReadinessSnapshotDto;
  }

  @override
  void update(
      void Function(AiAdminServicesRuntimeRuntimeReadinessSnapshotDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesRuntimeRuntimeReadinessSnapshotDto build() => _build();

  _$AiAdminServicesRuntimeRuntimeReadinessSnapshotDto _build() {
    _$AiAdminServicesRuntimeRuntimeReadinessSnapshotDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesRuntimeRuntimeReadinessSnapshotDto._(
            ready: ready,
            severity: severity,
            passedCheckCount: passedCheckCount,
            warningCheckCount: warningCheckCount,
            failedCheckCount: failedCheckCount,
            checks: _checks?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'checks';
        _checks?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesRuntimeRuntimeReadinessSnapshotDto',
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
