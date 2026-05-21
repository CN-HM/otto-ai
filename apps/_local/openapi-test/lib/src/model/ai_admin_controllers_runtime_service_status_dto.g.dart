// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_controllers_runtime_service_status_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminControllersRuntimeServiceStatusDto
    extends AiAdminControllersRuntimeServiceStatusDto {
  @override
  final String? key;
  @override
  final String? name;
  @override
  final String? protocol;
  @override
  final String? statusText;
  @override
  final String? severity;
  @override
  final String? endpoint;
  @override
  final String? description;

  factory _$AiAdminControllersRuntimeServiceStatusDto(
          [void Function(AiAdminControllersRuntimeServiceStatusDtoBuilder)?
              updates]) =>
      (AiAdminControllersRuntimeServiceStatusDtoBuilder()..update(updates))
          ._build();

  _$AiAdminControllersRuntimeServiceStatusDto._(
      {this.key,
      this.name,
      this.protocol,
      this.statusText,
      this.severity,
      this.endpoint,
      this.description})
      : super._();
  @override
  AiAdminControllersRuntimeServiceStatusDto rebuild(
          void Function(AiAdminControllersRuntimeServiceStatusDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminControllersRuntimeServiceStatusDtoBuilder toBuilder() =>
      AiAdminControllersRuntimeServiceStatusDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminControllersRuntimeServiceStatusDto &&
        key == other.key &&
        name == other.name &&
        protocol == other.protocol &&
        statusText == other.statusText &&
        severity == other.severity &&
        endpoint == other.endpoint &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, protocol.hashCode);
    _$hash = $jc(_$hash, statusText.hashCode);
    _$hash = $jc(_$hash, severity.hashCode);
    _$hash = $jc(_$hash, endpoint.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminControllersRuntimeServiceStatusDto')
          ..add('key', key)
          ..add('name', name)
          ..add('protocol', protocol)
          ..add('statusText', statusText)
          ..add('severity', severity)
          ..add('endpoint', endpoint)
          ..add('description', description))
        .toString();
  }
}

class AiAdminControllersRuntimeServiceStatusDtoBuilder
    implements
        Builder<AiAdminControllersRuntimeServiceStatusDto,
            AiAdminControllersRuntimeServiceStatusDtoBuilder> {
  _$AiAdminControllersRuntimeServiceStatusDto? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _protocol;
  String? get protocol => _$this._protocol;
  set protocol(String? protocol) => _$this._protocol = protocol;

  String? _statusText;
  String? get statusText => _$this._statusText;
  set statusText(String? statusText) => _$this._statusText = statusText;

  String? _severity;
  String? get severity => _$this._severity;
  set severity(String? severity) => _$this._severity = severity;

  String? _endpoint;
  String? get endpoint => _$this._endpoint;
  set endpoint(String? endpoint) => _$this._endpoint = endpoint;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  AiAdminControllersRuntimeServiceStatusDtoBuilder() {
    AiAdminControllersRuntimeServiceStatusDto._defaults(this);
  }

  AiAdminControllersRuntimeServiceStatusDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _name = $v.name;
      _protocol = $v.protocol;
      _statusText = $v.statusText;
      _severity = $v.severity;
      _endpoint = $v.endpoint;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminControllersRuntimeServiceStatusDto other) {
    _$v = other as _$AiAdminControllersRuntimeServiceStatusDto;
  }

  @override
  void update(
      void Function(AiAdminControllersRuntimeServiceStatusDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminControllersRuntimeServiceStatusDto build() => _build();

  _$AiAdminControllersRuntimeServiceStatusDto _build() {
    final _$result = _$v ??
        _$AiAdminControllersRuntimeServiceStatusDto._(
          key: key,
          name: name,
          protocol: protocol,
          statusText: statusText,
          severity: severity,
          endpoint: endpoint,
          description: description,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
