//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_memory_dtos_memory_record_upsert_dto.g.dart';

/// AiAdminServicesMemoryDtosMemoryRecordUpsertDto
///
/// Properties:
/// * [agentId] 
/// * [deviceId] 
/// * [userId] 
/// * [entityId] 
/// * [sessionId] 
/// * [ruleId] 
/// * [ruleCode] 
/// * [entityScope] 
/// * [recordType] 
/// * [title] 
/// * [content] 
/// * [summary] 
/// * [keywords] 
/// * [payloadJson] 
/// * [canonicalKey] 
/// * [contentHash] 
/// * [importance] 
/// * [confidence] 
/// * [isPinned] 
/// * [source_] 
/// * [sourceChatHistoryId] 
/// * [sourceTurnId] 
/// * [sourceRunId] 
/// * [expiresAt] 
@BuiltValue()
abstract class AiAdminServicesMemoryDtosMemoryRecordUpsertDto implements Built<AiAdminServicesMemoryDtosMemoryRecordUpsertDto, AiAdminServicesMemoryDtosMemoryRecordUpsertDtoBuilder> {
  @BuiltValueField(wireName: r'agentId')
  String? get agentId;

  @BuiltValueField(wireName: r'deviceId')
  String? get deviceId;

  @BuiltValueField(wireName: r'userId')
  int? get userId;

  @BuiltValueField(wireName: r'entityId')
  String? get entityId;

  @BuiltValueField(wireName: r'sessionId')
  String? get sessionId;

  @BuiltValueField(wireName: r'ruleId')
  String? get ruleId;

  @BuiltValueField(wireName: r'ruleCode')
  String? get ruleCode;

  @BuiltValueField(wireName: r'entityScope')
  String? get entityScope;

  @BuiltValueField(wireName: r'recordType')
  String? get recordType;

  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'content')
  String? get content;

  @BuiltValueField(wireName: r'summary')
  String? get summary;

  @BuiltValueField(wireName: r'keywords')
  JsonObject? get keywords;

  @BuiltValueField(wireName: r'payloadJson')
  JsonObject? get payloadJson;

  @BuiltValueField(wireName: r'canonicalKey')
  String? get canonicalKey;

  @BuiltValueField(wireName: r'contentHash')
  String? get contentHash;

  @BuiltValueField(wireName: r'importance')
  int? get importance;

  @BuiltValueField(wireName: r'confidence')
  double? get confidence;

  @BuiltValueField(wireName: r'isPinned')
  int? get isPinned;

  @BuiltValueField(wireName: r'source')
  String? get source_;

  @BuiltValueField(wireName: r'sourceChatHistoryId')
  String? get sourceChatHistoryId;

  @BuiltValueField(wireName: r'sourceTurnId')
  String? get sourceTurnId;

  @BuiltValueField(wireName: r'sourceRunId')
  String? get sourceRunId;

  @BuiltValueField(wireName: r'expiresAt')
  DateTime? get expiresAt;

  AiAdminServicesMemoryDtosMemoryRecordUpsertDto._();

  factory AiAdminServicesMemoryDtosMemoryRecordUpsertDto([void updates(AiAdminServicesMemoryDtosMemoryRecordUpsertDtoBuilder b)]) = _$AiAdminServicesMemoryDtosMemoryRecordUpsertDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesMemoryDtosMemoryRecordUpsertDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesMemoryDtosMemoryRecordUpsertDto> get serializer => _$AiAdminServicesMemoryDtosMemoryRecordUpsertDtoSerializer();
}

class _$AiAdminServicesMemoryDtosMemoryRecordUpsertDtoSerializer implements PrimitiveSerializer<AiAdminServicesMemoryDtosMemoryRecordUpsertDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesMemoryDtosMemoryRecordUpsertDto, _$AiAdminServicesMemoryDtosMemoryRecordUpsertDto];

  @override
  final String wireName = r'AiAdminServicesMemoryDtosMemoryRecordUpsertDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesMemoryDtosMemoryRecordUpsertDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.agentId != null) {
      yield r'agentId';
      yield serializers.serialize(
        object.agentId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.deviceId != null) {
      yield r'deviceId';
      yield serializers.serialize(
        object.deviceId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.userId != null) {
      yield r'userId';
      yield serializers.serialize(
        object.userId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.entityId != null) {
      yield r'entityId';
      yield serializers.serialize(
        object.entityId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.sessionId != null) {
      yield r'sessionId';
      yield serializers.serialize(
        object.sessionId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.ruleId != null) {
      yield r'ruleId';
      yield serializers.serialize(
        object.ruleId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.ruleCode != null) {
      yield r'ruleCode';
      yield serializers.serialize(
        object.ruleCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.entityScope != null) {
      yield r'entityScope';
      yield serializers.serialize(
        object.entityScope,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.recordType != null) {
      yield r'recordType';
      yield serializers.serialize(
        object.recordType,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.title != null) {
      yield r'title';
      yield serializers.serialize(
        object.title,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.content != null) {
      yield r'content';
      yield serializers.serialize(
        object.content,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.summary != null) {
      yield r'summary';
      yield serializers.serialize(
        object.summary,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.keywords != null) {
      yield r'keywords';
      yield serializers.serialize(
        object.keywords,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.payloadJson != null) {
      yield r'payloadJson';
      yield serializers.serialize(
        object.payloadJson,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.canonicalKey != null) {
      yield r'canonicalKey';
      yield serializers.serialize(
        object.canonicalKey,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.contentHash != null) {
      yield r'contentHash';
      yield serializers.serialize(
        object.contentHash,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.importance != null) {
      yield r'importance';
      yield serializers.serialize(
        object.importance,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.confidence != null) {
      yield r'confidence';
      yield serializers.serialize(
        object.confidence,
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.isPinned != null) {
      yield r'isPinned';
      yield serializers.serialize(
        object.isPinned,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.source_ != null) {
      yield r'source';
      yield serializers.serialize(
        object.source_,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.sourceChatHistoryId != null) {
      yield r'sourceChatHistoryId';
      yield serializers.serialize(
        object.sourceChatHistoryId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.sourceTurnId != null) {
      yield r'sourceTurnId';
      yield serializers.serialize(
        object.sourceTurnId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.sourceRunId != null) {
      yield r'sourceRunId';
      yield serializers.serialize(
        object.sourceRunId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.expiresAt != null) {
      yield r'expiresAt';
      yield serializers.serialize(
        object.expiresAt,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesMemoryDtosMemoryRecordUpsertDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesMemoryDtosMemoryRecordUpsertDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'agentId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.agentId = valueDes;
          break;
        case r'deviceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.deviceId = valueDes;
          break;
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.userId = valueDes;
          break;
        case r'entityId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.entityId = valueDes;
          break;
        case r'sessionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sessionId = valueDes;
          break;
        case r'ruleId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.ruleId = valueDes;
          break;
        case r'ruleCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.ruleCode = valueDes;
          break;
        case r'entityScope':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.entityScope = valueDes;
          break;
        case r'recordType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.recordType = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.title = valueDes;
          break;
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.content = valueDes;
          break;
        case r'summary':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.summary = valueDes;
          break;
        case r'keywords':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.keywords = valueDes;
          break;
        case r'payloadJson':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.payloadJson = valueDes;
          break;
        case r'canonicalKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.canonicalKey = valueDes;
          break;
        case r'contentHash':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.contentHash = valueDes;
          break;
        case r'importance':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.importance = valueDes;
          break;
        case r'confidence':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.confidence = valueDes;
          break;
        case r'isPinned':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.isPinned = valueDes;
          break;
        case r'source':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.source_ = valueDes;
          break;
        case r'sourceChatHistoryId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sourceChatHistoryId = valueDes;
          break;
        case r'sourceTurnId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sourceTurnId = valueDes;
          break;
        case r'sourceRunId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sourceRunId = valueDes;
          break;
        case r'expiresAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.expiresAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesMemoryDtosMemoryRecordUpsertDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesMemoryDtosMemoryRecordUpsertDtoBuilder();
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

