//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_knowledge_dtos_knowledge_base_dto.g.dart';

/// AiAdminServicesKnowledgeDtosKnowledgeBaseDto
///
/// Properties:
/// * [id] 
/// * [datasetId] 
/// * [name] 
/// * [avatar] 
/// * [description] 
/// * [permission] 
/// * [chunkMethod] 
/// * [parserConfig] 
/// * [chunkCount] 
/// * [tokenNum] 
/// * [status] 
/// * [creator] 
/// * [createdAt] 
/// * [updater] 
/// * [updatedAt] 
/// * [documentCount] 
@BuiltValue()
abstract class AiAdminServicesKnowledgeDtosKnowledgeBaseDto implements Built<AiAdminServicesKnowledgeDtosKnowledgeBaseDto, AiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'datasetId')
  String? get datasetId;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'avatar')
  String? get avatar;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'permission')
  String? get permission;

  @BuiltValueField(wireName: r'chunkMethod')
  String? get chunkMethod;

  @BuiltValueField(wireName: r'parserConfig')
  String? get parserConfig;

  @BuiltValueField(wireName: r'chunkCount')
  int? get chunkCount;

  @BuiltValueField(wireName: r'tokenNum')
  int? get tokenNum;

  @BuiltValueField(wireName: r'status')
  int? get status;

  @BuiltValueField(wireName: r'creator')
  int? get creator;

  @BuiltValueField(wireName: r'createdAt')
  String? get createdAt;

  @BuiltValueField(wireName: r'updater')
  int? get updater;

  @BuiltValueField(wireName: r'updatedAt')
  String? get updatedAt;

  @BuiltValueField(wireName: r'documentCount')
  int? get documentCount;

  AiAdminServicesKnowledgeDtosKnowledgeBaseDto._();

  factory AiAdminServicesKnowledgeDtosKnowledgeBaseDto([void updates(AiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder b)]) = _$AiAdminServicesKnowledgeDtosKnowledgeBaseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesKnowledgeDtosKnowledgeBaseDto> get serializer => _$AiAdminServicesKnowledgeDtosKnowledgeBaseDtoSerializer();
}

class _$AiAdminServicesKnowledgeDtosKnowledgeBaseDtoSerializer implements PrimitiveSerializer<AiAdminServicesKnowledgeDtosKnowledgeBaseDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesKnowledgeDtosKnowledgeBaseDto, _$AiAdminServicesKnowledgeDtosKnowledgeBaseDto];

  @override
  final String wireName = r'AiAdminServicesKnowledgeDtosKnowledgeBaseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesKnowledgeDtosKnowledgeBaseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.datasetId != null) {
      yield r'datasetId';
      yield serializers.serialize(
        object.datasetId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.avatar != null) {
      yield r'avatar';
      yield serializers.serialize(
        object.avatar,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.permission != null) {
      yield r'permission';
      yield serializers.serialize(
        object.permission,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.chunkMethod != null) {
      yield r'chunkMethod';
      yield serializers.serialize(
        object.chunkMethod,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.parserConfig != null) {
      yield r'parserConfig';
      yield serializers.serialize(
        object.parserConfig,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.chunkCount != null) {
      yield r'chunkCount';
      yield serializers.serialize(
        object.chunkCount,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.tokenNum != null) {
      yield r'tokenNum';
      yield serializers.serialize(
        object.tokenNum,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.creator != null) {
      yield r'creator';
      yield serializers.serialize(
        object.creator,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.createdAt != null) {
      yield r'createdAt';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.updater != null) {
      yield r'updater';
      yield serializers.serialize(
        object.updater,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.updatedAt != null) {
      yield r'updatedAt';
      yield serializers.serialize(
        object.updatedAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.documentCount != null) {
      yield r'documentCount';
      yield serializers.serialize(
        object.documentCount,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesKnowledgeDtosKnowledgeBaseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder result,
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
        case r'datasetId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.datasetId = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'avatar':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.avatar = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'permission':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.permission = valueDes;
          break;
        case r'chunkMethod':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.chunkMethod = valueDes;
          break;
        case r'parserConfig':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.parserConfig = valueDes;
          break;
        case r'chunkCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.chunkCount = valueDes;
          break;
        case r'tokenNum':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.tokenNum = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.status = valueDes;
          break;
        case r'creator':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.creator = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.createdAt = valueDes;
          break;
        case r'updater':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.updater = valueDes;
          break;
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.updatedAt = valueDes;
          break;
        case r'documentCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.documentCount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesKnowledgeDtosKnowledgeBaseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder();
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

