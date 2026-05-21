// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_runtime_runtime_readiness_check_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesRuntimeRuntimeReadinessCheckDto
    extends AiAdminServicesRuntimeRuntimeReadinessCheckDto {
  @override
  final String? key;
  @override
  final String? title;
  @override
  final bool? ready;
  @override
  final bool? blocking;
  @override
  final String? severity;
  @override
  final String? summary;
  @override
  final BuiltList<String>? details;

  factory _$AiAdminServicesRuntimeRuntimeReadinessCheckDto(
          [void Function(AiAdminServicesRuntimeRuntimeReadinessCheckDtoBuilder)?
              updates]) =>
      (AiAdminServicesRuntimeRuntimeReadinessCheckDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesRuntimeRuntimeReadinessCheckDto._(
      {this.key,
      this.title,
      this.ready,
      this.blocking,
      this.severity,
      this.summary,
      this.details})
      : super._();
  @override
  AiAdminServicesRuntimeRuntimeReadinessCheckDto rebuild(
          void Function(AiAdminServicesRuntimeRuntimeReadinessCheckDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesRuntimeRuntimeReadinessCheckDtoBuilder toBuilder() =>
      AiAdminServicesRuntimeRuntimeReadinessCheckDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesRuntimeRuntimeReadinessCheckDto &&
        key == other.key &&
        title == other.title &&
        ready == other.ready &&
        blocking == other.blocking &&
        severity == other.severity &&
        summary == other.summary &&
        details == other.details;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, ready.hashCode);
    _$hash = $jc(_$hash, blocking.hashCode);
    _$hash = $jc(_$hash, severity.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, details.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesRuntimeRuntimeReadinessCheckDto')
          ..add('key', key)
          ..add('title', title)
          ..add('ready', ready)
          ..add('blocking', blocking)
          ..add('severity', severity)
          ..add('summary', summary)
          ..add('details', details))
        .toString();
  }
}

class AiAdminServicesRuntimeRuntimeReadinessCheckDtoBuilder
    implements
        Builder<AiAdminServicesRuntimeRuntimeReadinessCheckDto,
            AiAdminServicesRuntimeRuntimeReadinessCheckDtoBuilder> {
  _$AiAdminServicesRuntimeRuntimeReadinessCheckDto? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  bool? _ready;
  bool? get ready => _$this._ready;
  set ready(bool? ready) => _$this._ready = ready;

  bool? _blocking;
  bool? get blocking => _$this._blocking;
  set blocking(bool? blocking) => _$this._blocking = blocking;

  String? _severity;
  String? get severity => _$this._severity;
  set severity(String? severity) => _$this._severity = severity;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(String? summary) => _$this._summary = summary;

  ListBuilder<String>? _details;
  ListBuilder<String> get details => _$this._details ??= ListBuilder<String>();
  set details(ListBuilder<String>? details) => _$this._details = details;

  AiAdminServicesRuntimeRuntimeReadinessCheckDtoBuilder() {
    AiAdminServicesRuntimeRuntimeReadinessCheckDto._defaults(this);
  }

  AiAdminServicesRuntimeRuntimeReadinessCheckDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _title = $v.title;
      _ready = $v.ready;
      _blocking = $v.blocking;
      _severity = $v.severity;
      _summary = $v.summary;
      _details = $v.details?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesRuntimeRuntimeReadinessCheckDto other) {
    _$v = other as _$AiAdminServicesRuntimeRuntimeReadinessCheckDto;
  }

  @override
  void update(
      void Function(AiAdminServicesRuntimeRuntimeReadinessCheckDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesRuntimeRuntimeReadinessCheckDto build() => _build();

  _$AiAdminServicesRuntimeRuntimeReadinessCheckDto _build() {
    _$AiAdminServicesRuntimeRuntimeReadinessCheckDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesRuntimeRuntimeReadinessCheckDto._(
            key: key,
            title: title,
            ready: ready,
            blocking: blocking,
            severity: severity,
            summary: summary,
            details: _details?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'details';
        _details?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesRuntimeRuntimeReadinessCheckDto',
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
