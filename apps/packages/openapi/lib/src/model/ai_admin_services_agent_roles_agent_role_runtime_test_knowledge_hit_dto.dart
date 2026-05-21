//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_agent_roles_agent_role_runtime_test_knowledge_hit_dto.g.dart';

/// AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto
///
/// Properties:
/// * [datasetId] 
/// * [documentId] 
/// * [documentName] 
/// * [content] 
/// * [score] 
@BuiltValue()
abstract class AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto implements Built<AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto, AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDtoBuilder> {
  @BuiltValueField(wireName: r'datasetId')
  String? get datasetId;

  @BuiltValueField(wireName: r'documentId')
  String? get documentId;

  @BuiltValueField(wireName: r'documentName')
  String? get documentName;

  @BuiltValueField(wireName: r'content')
  String? get content;

  @BuiltValueField(wireName: r'score')
  double? get score;

  AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto._();

  factory AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto([void updates(AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDtoBuilder b)]) = _$AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto> get serializer => _$AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDtoSerializer();
}

class _$AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDtoSerializer implements PrimitiveSerializer<AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto, _$AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto];

  @override
  final String wireName = r'AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.datasetId != null) {
      yield r'datasetId';
      yield serializers.serialize(
        object.datasetId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.documentId != null) {
      yield r'documentId';
      yield serializers.serialize(
        object.documentId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.documentName != null) {
      yield r'documentName';
      yield serializers.serialize(
        object.documentName,
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
    if (object.score != null) {
      yield r'score';
      yield serializers.serialize(
        object.score,
        specifiedType: const FullType(double),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'datasetId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.datasetId = valueDes;
          break;
        case r'documentId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.documentId = valueDes;
          break;
        case r'documentName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.documentName = valueDes;
          break;
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.content = valueDes;
          break;
        case r'score':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.score = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDtoBuilder();
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

