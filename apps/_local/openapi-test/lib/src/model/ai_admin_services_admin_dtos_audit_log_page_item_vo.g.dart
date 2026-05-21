// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_admin_dtos_audit_log_page_item_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAdminDtosAuditLogPageItemVo
    extends AiAdminServicesAdminDtosAuditLogPageItemVo {
  @override
  final String? id;
  @override
  final String? applicationName;
  @override
  final String? operatorId;
  @override
  final String? userName;
  @override
  final String? clientIpAddress;
  @override
  final String? browserInfo;
  @override
  final String? correlationId;
  @override
  final String? httpMethod;
  @override
  final int? httpStatusCode;
  @override
  final String? url;
  @override
  final DateTime? executionTime;
  @override
  final int? executionDuration;
  @override
  final bool? hasException;
  @override
  final String? exceptions;
  @override
  final String? comments;
  @override
  final int? actionCount;
  @override
  final int? entityChangeCount;
  @override
  final BuiltList<AiAdminServicesAdminDtosAuditLogActionVo>? actions;
  @override
  final BuiltList<AiAdminServicesAdminDtosAuditEntityChangeVo>? entityChanges;

  factory _$AiAdminServicesAdminDtosAuditLogPageItemVo(
          [void Function(AiAdminServicesAdminDtosAuditLogPageItemVoBuilder)?
              updates]) =>
      (AiAdminServicesAdminDtosAuditLogPageItemVoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesAdminDtosAuditLogPageItemVo._(
      {this.id,
      this.applicationName,
      this.operatorId,
      this.userName,
      this.clientIpAddress,
      this.browserInfo,
      this.correlationId,
      this.httpMethod,
      this.httpStatusCode,
      this.url,
      this.executionTime,
      this.executionDuration,
      this.hasException,
      this.exceptions,
      this.comments,
      this.actionCount,
      this.entityChangeCount,
      this.actions,
      this.entityChanges})
      : super._();
  @override
  AiAdminServicesAdminDtosAuditLogPageItemVo rebuild(
          void Function(AiAdminServicesAdminDtosAuditLogPageItemVoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAdminDtosAuditLogPageItemVoBuilder toBuilder() =>
      AiAdminServicesAdminDtosAuditLogPageItemVoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAdminDtosAuditLogPageItemVo &&
        id == other.id &&
        applicationName == other.applicationName &&
        operatorId == other.operatorId &&
        userName == other.userName &&
        clientIpAddress == other.clientIpAddress &&
        browserInfo == other.browserInfo &&
        correlationId == other.correlationId &&
        httpMethod == other.httpMethod &&
        httpStatusCode == other.httpStatusCode &&
        url == other.url &&
        executionTime == other.executionTime &&
        executionDuration == other.executionDuration &&
        hasException == other.hasException &&
        exceptions == other.exceptions &&
        comments == other.comments &&
        actionCount == other.actionCount &&
        entityChangeCount == other.entityChangeCount &&
        actions == other.actions &&
        entityChanges == other.entityChanges;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, applicationName.hashCode);
    _$hash = $jc(_$hash, operatorId.hashCode);
    _$hash = $jc(_$hash, userName.hashCode);
    _$hash = $jc(_$hash, clientIpAddress.hashCode);
    _$hash = $jc(_$hash, browserInfo.hashCode);
    _$hash = $jc(_$hash, correlationId.hashCode);
    _$hash = $jc(_$hash, httpMethod.hashCode);
    _$hash = $jc(_$hash, httpStatusCode.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, executionTime.hashCode);
    _$hash = $jc(_$hash, executionDuration.hashCode);
    _$hash = $jc(_$hash, hasException.hashCode);
    _$hash = $jc(_$hash, exceptions.hashCode);
    _$hash = $jc(_$hash, comments.hashCode);
    _$hash = $jc(_$hash, actionCount.hashCode);
    _$hash = $jc(_$hash, entityChangeCount.hashCode);
    _$hash = $jc(_$hash, actions.hashCode);
    _$hash = $jc(_$hash, entityChanges.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesAdminDtosAuditLogPageItemVo')
          ..add('id', id)
          ..add('applicationName', applicationName)
          ..add('operatorId', operatorId)
          ..add('userName', userName)
          ..add('clientIpAddress', clientIpAddress)
          ..add('browserInfo', browserInfo)
          ..add('correlationId', correlationId)
          ..add('httpMethod', httpMethod)
          ..add('httpStatusCode', httpStatusCode)
          ..add('url', url)
          ..add('executionTime', executionTime)
          ..add('executionDuration', executionDuration)
          ..add('hasException', hasException)
          ..add('exceptions', exceptions)
          ..add('comments', comments)
          ..add('actionCount', actionCount)
          ..add('entityChangeCount', entityChangeCount)
          ..add('actions', actions)
          ..add('entityChanges', entityChanges))
        .toString();
  }
}

class AiAdminServicesAdminDtosAuditLogPageItemVoBuilder
    implements
        Builder<AiAdminServicesAdminDtosAuditLogPageItemVo,
            AiAdminServicesAdminDtosAuditLogPageItemVoBuilder> {
  _$AiAdminServicesAdminDtosAuditLogPageItemVo? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _applicationName;
  String? get applicationName => _$this._applicationName;
  set applicationName(String? applicationName) =>
      _$this._applicationName = applicationName;

  String? _operatorId;
  String? get operatorId => _$this._operatorId;
  set operatorId(String? operatorId) => _$this._operatorId = operatorId;

  String? _userName;
  String? get userName => _$this._userName;
  set userName(String? userName) => _$this._userName = userName;

  String? _clientIpAddress;
  String? get clientIpAddress => _$this._clientIpAddress;
  set clientIpAddress(String? clientIpAddress) =>
      _$this._clientIpAddress = clientIpAddress;

  String? _browserInfo;
  String? get browserInfo => _$this._browserInfo;
  set browserInfo(String? browserInfo) => _$this._browserInfo = browserInfo;

  String? _correlationId;
  String? get correlationId => _$this._correlationId;
  set correlationId(String? correlationId) =>
      _$this._correlationId = correlationId;

  String? _httpMethod;
  String? get httpMethod => _$this._httpMethod;
  set httpMethod(String? httpMethod) => _$this._httpMethod = httpMethod;

  int? _httpStatusCode;
  int? get httpStatusCode => _$this._httpStatusCode;
  set httpStatusCode(int? httpStatusCode) =>
      _$this._httpStatusCode = httpStatusCode;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  DateTime? _executionTime;
  DateTime? get executionTime => _$this._executionTime;
  set executionTime(DateTime? executionTime) =>
      _$this._executionTime = executionTime;

  int? _executionDuration;
  int? get executionDuration => _$this._executionDuration;
  set executionDuration(int? executionDuration) =>
      _$this._executionDuration = executionDuration;

  bool? _hasException;
  bool? get hasException => _$this._hasException;
  set hasException(bool? hasException) => _$this._hasException = hasException;

  String? _exceptions;
  String? get exceptions => _$this._exceptions;
  set exceptions(String? exceptions) => _$this._exceptions = exceptions;

  String? _comments;
  String? get comments => _$this._comments;
  set comments(String? comments) => _$this._comments = comments;

  int? _actionCount;
  int? get actionCount => _$this._actionCount;
  set actionCount(int? actionCount) => _$this._actionCount = actionCount;

  int? _entityChangeCount;
  int? get entityChangeCount => _$this._entityChangeCount;
  set entityChangeCount(int? entityChangeCount) =>
      _$this._entityChangeCount = entityChangeCount;

  ListBuilder<AiAdminServicesAdminDtosAuditLogActionVo>? _actions;
  ListBuilder<AiAdminServicesAdminDtosAuditLogActionVo> get actions =>
      _$this._actions ??=
          ListBuilder<AiAdminServicesAdminDtosAuditLogActionVo>();
  set actions(ListBuilder<AiAdminServicesAdminDtosAuditLogActionVo>? actions) =>
      _$this._actions = actions;

  ListBuilder<AiAdminServicesAdminDtosAuditEntityChangeVo>? _entityChanges;
  ListBuilder<AiAdminServicesAdminDtosAuditEntityChangeVo> get entityChanges =>
      _$this._entityChanges ??=
          ListBuilder<AiAdminServicesAdminDtosAuditEntityChangeVo>();
  set entityChanges(
          ListBuilder<AiAdminServicesAdminDtosAuditEntityChangeVo>?
              entityChanges) =>
      _$this._entityChanges = entityChanges;

  AiAdminServicesAdminDtosAuditLogPageItemVoBuilder() {
    AiAdminServicesAdminDtosAuditLogPageItemVo._defaults(this);
  }

  AiAdminServicesAdminDtosAuditLogPageItemVoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _applicationName = $v.applicationName;
      _operatorId = $v.operatorId;
      _userName = $v.userName;
      _clientIpAddress = $v.clientIpAddress;
      _browserInfo = $v.browserInfo;
      _correlationId = $v.correlationId;
      _httpMethod = $v.httpMethod;
      _httpStatusCode = $v.httpStatusCode;
      _url = $v.url;
      _executionTime = $v.executionTime;
      _executionDuration = $v.executionDuration;
      _hasException = $v.hasException;
      _exceptions = $v.exceptions;
      _comments = $v.comments;
      _actionCount = $v.actionCount;
      _entityChangeCount = $v.entityChangeCount;
      _actions = $v.actions?.toBuilder();
      _entityChanges = $v.entityChanges?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAdminDtosAuditLogPageItemVo other) {
    _$v = other as _$AiAdminServicesAdminDtosAuditLogPageItemVo;
  }

  @override
  void update(
      void Function(AiAdminServicesAdminDtosAuditLogPageItemVoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAdminDtosAuditLogPageItemVo build() => _build();

  _$AiAdminServicesAdminDtosAuditLogPageItemVo _build() {
    _$AiAdminServicesAdminDtosAuditLogPageItemVo _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesAdminDtosAuditLogPageItemVo._(
            id: id,
            applicationName: applicationName,
            operatorId: operatorId,
            userName: userName,
            clientIpAddress: clientIpAddress,
            browserInfo: browserInfo,
            correlationId: correlationId,
            httpMethod: httpMethod,
            httpStatusCode: httpStatusCode,
            url: url,
            executionTime: executionTime,
            executionDuration: executionDuration,
            hasException: hasException,
            exceptions: exceptions,
            comments: comments,
            actionCount: actionCount,
            entityChangeCount: entityChangeCount,
            actions: _actions?.build(),
            entityChanges: _entityChanges?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'actions';
        _actions?.build();
        _$failedField = 'entityChanges';
        _entityChanges?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesAdminDtosAuditLogPageItemVo',
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
