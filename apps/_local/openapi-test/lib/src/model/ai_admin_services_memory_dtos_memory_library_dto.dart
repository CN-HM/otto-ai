//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_memory_dtos_memory_write_config_dto.dart';
import 'package:openapi/src/model/ai_admin_services_memory_dtos_memory_retrieval_config_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_memory_dtos_memory_library_dto.g.dart';

/// AiAdminServicesMemoryDtosMemoryLibraryDto
///
/// Properties:
/// * [id] 
/// * [userId] 
/// * [agentId] 
/// * [code] 
/// * [name] 
/// * [description] 
/// * [status] 
/// * [isDefault] 
/// * [entityScope] 
/// * [memoryModelId] 
/// * [retrievalConfig] 
/// * [writeConfig] 
/// * [sort] 
/// * [creator] 
/// * [createdAt] 
/// * [updater] 
/// * [updatedAt] 
@BuiltValue()
abstract class AiAdminServicesMemoryDtosMemoryLibraryDto implements Built<AiAdminServicesMemoryDtosMemoryLibraryDto, AiAdminServicesMemoryDtosMemoryLibraryDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'userId')
  int? get userId;

  @BuiltValueField(wireName: r'agentId')
  String? get agentId;

  @BuiltValueField(wireName: r'code')
  String? get code;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'status')
  int? get status;

  @BuiltValueField(wireName: r'isDefault')
  int? get isDefault;

  @BuiltValueField(wireName: r'entityScope')
  String? get entityScope;

  @BuiltValueField(wireName: r'memoryModelId')
  String? get memoryModelId;

  @BuiltValueField(wireName: r'retrievalConfig')
  AiAdminServicesMemoryDtosMemoryRetrievalConfigDto? get retrievalConfig;

  @BuiltValueField(wireName: r'writeConfig')
  AiAdminServicesMemoryDtosMemoryWriteConfigDto? get writeConfig;

  @BuiltValueField(wireName: r'sort')
  int? get sort;

  @BuiltValueField(wireName: r'creator')
  int? get creator;

  @BuiltValueField(wireName: r'createdAt')
  String? get createdAt;

  @BuiltValueField(wireName: r'updater')
  int? get updater;

  @BuiltValueField(wireName: r'updatedAt')
  String? get updatedAt;

  AiAdminServicesMemoryDtosMemoryLibraryDto._();

  factory AiAdminServicesMemoryDtosMemoryLibraryDto([void updates(AiAdminServicesMemoryDtosMemoryLibraryDtoBuilder b)]) = _$AiAdminServicesMemoryDtosMemoryLibraryDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesMemoryDtosMemoryLibraryDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesMemoryDtosMemoryLibraryDto> get serializer => _$AiAdminServicesMemoryDtosMemoryLibraryDtoSerializer();
}

class _$AiAdminServicesMemoryDtosMemoryLibraryDtoSerializer implements PrimitiveSerializer<AiAdminServicesMemoryDtosMemoryLibraryDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesMemoryDtosMemoryLibraryDto, _$AiAdminServicesMemoryDtosMemoryLibraryDto];

  @override
  final String wireName = r'AiAdminServicesMemoryDtosMemoryLibraryDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesMemoryDtosMemoryLibraryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
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
    if (object.agentId != null) {
      yield r'agentId';
      yield serializers.serialize(
        object.agentId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.code != null) {
      yield r'code';
      yield serializers.serialize(
        object.code,
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
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.isDefault != null) {
      yield r'isDefault';
      yield serializers.serialize(
        object.isDefault,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.entityScope != null) {
      yield r'entityScope';
      yield serializers.serialize(
        object.entityScope,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.memoryModelId != null) {
      yield r'memoryModelId';
      yield serializers.serialize(
        object.memoryModelId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.retrievalConfig != null) {
      yield r'retrievalConfig';
      yield serializers.serialize(
        object.retrievalConfig,
        specifiedType: const FullType(AiAdminServicesMemoryDtosMemoryRetrievalConfigDto),
      );
    }
    if (object.writeConfig != null) {
      yield r'writeConfig';
      yield serializers.serialize(
        object.writeConfig,
        specifiedType: const FullType(AiAdminServicesMemoryDtosMemoryWriteConfigDto),
      );
    }
    if (object.sort != null) {
      yield r'sort';
      yield serializers.serialize(
        object.sort,
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
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesMemoryDtosMemoryLibraryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesMemoryDtosMemoryLibraryDtoBuilder result,
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
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.userId = valueDes;
          break;
        case r'agentId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.agentId = valueDes;
          break;
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.code = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.status = valueDes;
          break;
        case r'isDefault':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.isDefault = valueDes;
          break;
        case r'entityScope':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.entityScope = valueDes;
          break;
        case r'memoryModelId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.memoryModelId = valueDes;
          break;
        case r'retrievalConfig':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesMemoryDtosMemoryRetrievalConfigDto),
          ) as AiAdminServicesMemoryDtosMemoryRetrievalConfigDto;
          result.retrievalConfig.replace(valueDes);
          break;
        case r'writeConfig':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesMemoryDtosMemoryWriteConfigDto),
          ) as AiAdminServicesMemoryDtosMemoryWriteConfigDto;
          result.writeConfig.replace(valueDes);
          break;
        case r'sort':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.sort = valueDes;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesMemoryDtosMemoryLibraryDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesMemoryDtosMemoryLibraryDtoBuilder();
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

