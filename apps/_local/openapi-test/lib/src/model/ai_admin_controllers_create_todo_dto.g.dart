// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_controllers_create_todo_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminControllersCreateTodoDto
    extends AiAdminControllersCreateTodoDto {
  @override
  final String? title;
  @override
  final String? content;
  @override
  final DateTime? scheduledAt;
  @override
  final int? userId;
  @override
  final String? deviceId;
  @override
  final String? agentRoleId;

  factory _$AiAdminControllersCreateTodoDto(
          [void Function(AiAdminControllersCreateTodoDtoBuilder)? updates]) =>
      (AiAdminControllersCreateTodoDtoBuilder()..update(updates))._build();

  _$AiAdminControllersCreateTodoDto._(
      {this.title,
      this.content,
      this.scheduledAt,
      this.userId,
      this.deviceId,
      this.agentRoleId})
      : super._();
  @override
  AiAdminControllersCreateTodoDto rebuild(
          void Function(AiAdminControllersCreateTodoDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminControllersCreateTodoDtoBuilder toBuilder() =>
      AiAdminControllersCreateTodoDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminControllersCreateTodoDto &&
        title == other.title &&
        content == other.content &&
        scheduledAt == other.scheduledAt &&
        userId == other.userId &&
        deviceId == other.deviceId &&
        agentRoleId == other.agentRoleId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, scheduledAt.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, deviceId.hashCode);
    _$hash = $jc(_$hash, agentRoleId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AiAdminControllersCreateTodoDto')
          ..add('title', title)
          ..add('content', content)
          ..add('scheduledAt', scheduledAt)
          ..add('userId', userId)
          ..add('deviceId', deviceId)
          ..add('agentRoleId', agentRoleId))
        .toString();
  }
}

class AiAdminControllersCreateTodoDtoBuilder
    implements
        Builder<AiAdminControllersCreateTodoDto,
            AiAdminControllersCreateTodoDtoBuilder> {
  _$AiAdminControllersCreateTodoDto? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  DateTime? _scheduledAt;
  DateTime? get scheduledAt => _$this._scheduledAt;
  set scheduledAt(DateTime? scheduledAt) => _$this._scheduledAt = scheduledAt;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  String? _deviceId;
  String? get deviceId => _$this._deviceId;
  set deviceId(String? deviceId) => _$this._deviceId = deviceId;

  String? _agentRoleId;
  String? get agentRoleId => _$this._agentRoleId;
  set agentRoleId(String? agentRoleId) => _$this._agentRoleId = agentRoleId;

  AiAdminControllersCreateTodoDtoBuilder() {
    AiAdminControllersCreateTodoDto._defaults(this);
  }

  AiAdminControllersCreateTodoDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _content = $v.content;
      _scheduledAt = $v.scheduledAt;
      _userId = $v.userId;
      _deviceId = $v.deviceId;
      _agentRoleId = $v.agentRoleId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminControllersCreateTodoDto other) {
    _$v = other as _$AiAdminControllersCreateTodoDto;
  }

  @override
  void update(void Function(AiAdminControllersCreateTodoDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminControllersCreateTodoDto build() => _build();

  _$AiAdminControllersCreateTodoDto _build() {
    final _$result = _$v ??
        _$AiAdminControllersCreateTodoDto._(
          title: title,
          content: content,
          scheduledAt: scheduledAt,
          userId: userId,
          deviceId: deviceId,
          agentRoleId: agentRoleId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
