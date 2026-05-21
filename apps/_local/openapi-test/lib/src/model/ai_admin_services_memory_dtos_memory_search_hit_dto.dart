//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_memory_dtos_memory_search_hit_dto.g.dart';

/// AiAdminServicesMemoryDtosMemorySearchHitDto
///
/// Properties:
/// * [id] 
/// * [entityId] 
/// * [sessionId] 
/// * [ruleId] 
/// * [recordType] 
/// * [title] 
/// * [content] 
/// * [summary] 
/// * [keywords] 
/// * [payloadJson] 
/// * [embeddingModelId] 
/// * [embeddingDimension] 
/// * [hasEmbedding] 
/// * [importance] 
/// * [isPinned] 
/// * [score] 
/// * [expiresAt] 
/// * [updatedAt] 
@BuiltValue()
abstract class AiAdminServicesMemoryDtosMemorySearchHitDto implements Built<AiAdminServicesMemoryDtosMemorySearchHitDto, AiAdminServicesMemoryDtosMemorySearchHitDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'entityId')
  String? get entityId;

  @BuiltValueField(wireName: r'sessionId')
  String? get sessionId;

  @BuiltValueField(wireName: r'ruleId')
  String? get ruleId;

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

  @BuiltValueField(wireName: r'embeddingModelId')
  String? get embeddingModelId;

  @BuiltValueField(wireName: r'embeddingDimension')
  int? get embeddingDimension;

  @BuiltValueField(wireName: r'hasEmbedding')
  bool? get hasEmbedding;

  @BuiltValueField(wireName: r'importance')
  int? get importance;

  @BuiltValueField(wireName: r'isPinned')
  int? get isPinned;

  @BuiltValueField(wireName: r'score')
  double? get score;

  @BuiltValueField(wireName: r'expiresAt')
  String? get expiresAt;

  @BuiltValueField(wireName: r'updatedAt')
  String? get updatedAt;

  AiAdminServicesMemoryDtosMemorySearchHitDto._();

  factory AiAdminServicesMemoryDtosMemorySearchHitDto([void updates(AiAdminServicesMemoryDtosMemorySearchHitDtoBuilder b)]) = _$AiAdminServicesMemoryDtosMemorySearchHitDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesMemoryDtosMemorySearchHitDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesMemoryDtosMemorySearchHitDto> get serializer => _$AiAdminServicesMemoryDtosMemorySearchHitDtoSerializer();
}

class _$AiAdminServicesMemoryDtosMemorySearchHitDtoSerializer implements PrimitiveSerializer<AiAdminServicesMemoryDtosMemorySearchHitDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesMemoryDtosMemorySearchHitDto, _$AiAdminServicesMemoryDtosMemorySearchHitDto];

  @override
  final String wireName = r'AiAdminServicesMemoryDtosMemorySearchHitDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesMemoryDtosMemorySearchHitDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType.nullable(String),
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
    if (object.embeddingModelId != null) {
      yield r'embeddingModelId';
      yield serializers.serialize(
        object.embeddingModelId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.embeddingDimension != null) {
      yield r'embeddingDimension';
      yield serializers.serialize(
        object.embeddingDimension,
        specifiedType: const FullType(int),
      );
    }
    if (object.hasEmbedding != null) {
      yield r'hasEmbedding';
      yield serializers.serialize(
        object.hasEmbedding,
        specifiedType: const FullType(bool),
      );
    }
    if (object.importance != null) {
      yield r'importance';
      yield serializers.serialize(
        object.importance,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.isPinned != null) {
      yield r'isPinned';
      yield serializers.serialize(
        object.isPinned,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.score != null) {
      yield r'score';
      yield serializers.serialize(
        object.score,
        specifiedType: const FullType(double),
      );
    }
    if (object.expiresAt != null) {
      yield r'expiresAt';
      yield serializers.serialize(
        object.expiresAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.updatedAt != null) {
      yield r'updatedAt';
      yield serializers.serialize(
        object.updatedAt,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesMemoryDtosMemorySearchHitDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesMemoryDtosMemorySearchHitDtoBuilder result,
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
        case r'embeddingModelId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.embeddingModelId = valueDes;
          break;
        case r'embeddingDimension':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.embeddingDimension = valueDes;
          break;
        case r'hasEmbedding':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.hasEmbedding = valueDes;
          break;
        case r'importance':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.importance = valueDes;
          break;
        case r'isPinned':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.isPinned = valueDes;
          break;
        case r'score':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.score = valueDes;
          break;
        case r'expiresAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.expiresAt = valueDes;
          break;
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.updatedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesMemoryDtosMemorySearchHitDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesMemoryDtosMemorySearchHitDtoBuilder();
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

