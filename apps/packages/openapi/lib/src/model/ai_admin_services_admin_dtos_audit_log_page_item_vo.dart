//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_admin_dtos_audit_log_action_vo.dart';
import 'package:openapi/src/model/ai_admin_services_admin_dtos_audit_entity_change_vo.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_admin_dtos_audit_log_page_item_vo.g.dart';

/// AiAdminServicesAdminDtosAuditLogPageItemVo
///
/// Properties:
/// * [id] 
/// * [applicationName] 
/// * [operatorId] 
/// * [userName] 
/// * [clientIpAddress] 
/// * [browserInfo] 
/// * [correlationId] 
/// * [httpMethod] 
/// * [httpStatusCode] 
/// * [url] 
/// * [executionTime] 
/// * [executionDuration] 
/// * [hasException] 
/// * [exceptions] 
/// * [comments] 
/// * [actionCount] 
/// * [entityChangeCount] 
/// * [actions] 
/// * [entityChanges] 
@BuiltValue()
abstract class AiAdminServicesAdminDtosAuditLogPageItemVo implements Built<AiAdminServicesAdminDtosAuditLogPageItemVo, AiAdminServicesAdminDtosAuditLogPageItemVoBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'applicationName')
  String? get applicationName;

  @BuiltValueField(wireName: r'operatorId')
  String? get operatorId;

  @BuiltValueField(wireName: r'userName')
  String? get userName;

  @BuiltValueField(wireName: r'clientIpAddress')
  String? get clientIpAddress;

  @BuiltValueField(wireName: r'browserInfo')
  String? get browserInfo;

  @BuiltValueField(wireName: r'correlationId')
  String? get correlationId;

  @BuiltValueField(wireName: r'httpMethod')
  String? get httpMethod;

  @BuiltValueField(wireName: r'httpStatusCode')
  int? get httpStatusCode;

  @BuiltValueField(wireName: r'url')
  String? get url;

  @BuiltValueField(wireName: r'executionTime')
  DateTime? get executionTime;

  @BuiltValueField(wireName: r'executionDuration')
  int? get executionDuration;

  @BuiltValueField(wireName: r'hasException')
  bool? get hasException;

  @BuiltValueField(wireName: r'exceptions')
  String? get exceptions;

  @BuiltValueField(wireName: r'comments')
  String? get comments;

  @BuiltValueField(wireName: r'actionCount')
  int? get actionCount;

  @BuiltValueField(wireName: r'entityChangeCount')
  int? get entityChangeCount;

  @BuiltValueField(wireName: r'actions')
  BuiltList<AiAdminServicesAdminDtosAuditLogActionVo>? get actions;

  @BuiltValueField(wireName: r'entityChanges')
  BuiltList<AiAdminServicesAdminDtosAuditEntityChangeVo>? get entityChanges;

  AiAdminServicesAdminDtosAuditLogPageItemVo._();

  factory AiAdminServicesAdminDtosAuditLogPageItemVo([void updates(AiAdminServicesAdminDtosAuditLogPageItemVoBuilder b)]) = _$AiAdminServicesAdminDtosAuditLogPageItemVo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesAdminDtosAuditLogPageItemVoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesAdminDtosAuditLogPageItemVo> get serializer => _$AiAdminServicesAdminDtosAuditLogPageItemVoSerializer();
}

class _$AiAdminServicesAdminDtosAuditLogPageItemVoSerializer implements PrimitiveSerializer<AiAdminServicesAdminDtosAuditLogPageItemVo> {
  @override
  final Iterable<Type> types = const [AiAdminServicesAdminDtosAuditLogPageItemVo, _$AiAdminServicesAdminDtosAuditLogPageItemVo];

  @override
  final String wireName = r'AiAdminServicesAdminDtosAuditLogPageItemVo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesAdminDtosAuditLogPageItemVo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.applicationName != null) {
      yield r'applicationName';
      yield serializers.serialize(
        object.applicationName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.operatorId != null) {
      yield r'operatorId';
      yield serializers.serialize(
        object.operatorId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.userName != null) {
      yield r'userName';
      yield serializers.serialize(
        object.userName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.clientIpAddress != null) {
      yield r'clientIpAddress';
      yield serializers.serialize(
        object.clientIpAddress,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.browserInfo != null) {
      yield r'browserInfo';
      yield serializers.serialize(
        object.browserInfo,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.correlationId != null) {
      yield r'correlationId';
      yield serializers.serialize(
        object.correlationId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.httpMethod != null) {
      yield r'httpMethod';
      yield serializers.serialize(
        object.httpMethod,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.httpStatusCode != null) {
      yield r'httpStatusCode';
      yield serializers.serialize(
        object.httpStatusCode,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.url != null) {
      yield r'url';
      yield serializers.serialize(
        object.url,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.executionTime != null) {
      yield r'executionTime';
      yield serializers.serialize(
        object.executionTime,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.executionDuration != null) {
      yield r'executionDuration';
      yield serializers.serialize(
        object.executionDuration,
        specifiedType: const FullType(int),
      );
    }
    if (object.hasException != null) {
      yield r'hasException';
      yield serializers.serialize(
        object.hasException,
        specifiedType: const FullType(bool),
      );
    }
    if (object.exceptions != null) {
      yield r'exceptions';
      yield serializers.serialize(
        object.exceptions,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.comments != null) {
      yield r'comments';
      yield serializers.serialize(
        object.comments,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.actionCount != null) {
      yield r'actionCount';
      yield serializers.serialize(
        object.actionCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.entityChangeCount != null) {
      yield r'entityChangeCount';
      yield serializers.serialize(
        object.entityChangeCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.actions != null) {
      yield r'actions';
      yield serializers.serialize(
        object.actions,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAdminDtosAuditLogActionVo)]),
      );
    }
    if (object.entityChanges != null) {
      yield r'entityChanges';
      yield serializers.serialize(
        object.entityChanges,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAdminDtosAuditEntityChangeVo)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesAdminDtosAuditLogPageItemVo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesAdminDtosAuditLogPageItemVoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.id = valueDes;
          break;
        case r'applicationName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.applicationName = valueDes;
          break;
        case r'operatorId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.operatorId = valueDes;
          break;
        case r'userName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.userName = valueDes;
          break;
        case r'clientIpAddress':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.clientIpAddress = valueDes;
          break;
        case r'browserInfo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.browserInfo = valueDes;
          break;
        case r'correlationId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.correlationId = valueDes;
          break;
        case r'httpMethod':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.httpMethod = valueDes;
          break;
        case r'httpStatusCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.httpStatusCode = valueDes;
          break;
        case r'url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.url = valueDes;
          break;
        case r'executionTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.executionTime = valueDes;
          break;
        case r'executionDuration':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.executionDuration = valueDes;
          break;
        case r'hasException':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.hasException = valueDes;
          break;
        case r'exceptions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.exceptions = valueDes;
          break;
        case r'comments':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.comments = valueDes;
          break;
        case r'actionCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.actionCount = valueDes;
          break;
        case r'entityChangeCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.entityChangeCount = valueDes;
          break;
        case r'actions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAdminDtosAuditLogActionVo)]),
          ) as BuiltList<AiAdminServicesAdminDtosAuditLogActionVo>?;
          if (valueDes == null) continue;
          result.actions.replace(valueDes);
          break;
        case r'entityChanges':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAdminDtosAuditEntityChangeVo)]),
          ) as BuiltList<AiAdminServicesAdminDtosAuditEntityChangeVo>?;
          if (valueDes == null) continue;
          result.entityChanges.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesAdminDtosAuditLogPageItemVo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesAdminDtosAuditLogPageItemVoBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

