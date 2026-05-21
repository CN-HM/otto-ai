//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_agent_roles_agent_role_runtime_test_knowledge_hit_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_agent_roles_agent_role_runtime_test_knowledge_dto.g.dart';

/// AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto
///
/// Properties:
/// * [hasBindings] 
/// * [hasHits] 
/// * [fallbackReplyText] 
/// * [injectedSystemPrompt] 
/// * [hits] 
@BuiltValue()
abstract class AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto implements Built<AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto, AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDtoBuilder> {
  @BuiltValueField(wireName: r'hasBindings')
  bool? get hasBindings;

  @BuiltValueField(wireName: r'hasHits')
  bool? get hasHits;

  @BuiltValueField(wireName: r'fallbackReplyText')
  String? get fallbackReplyText;

  @BuiltValueField(wireName: r'injectedSystemPrompt')
  String? get injectedSystemPrompt;

  @BuiltValueField(wireName: r'hits')
  BuiltList<AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto>? get hits;

  AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto._();

  factory AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto([void updates(AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDtoBuilder b)]) = _$AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto> get serializer => _$AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDtoSerializer();
}

class _$AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDtoSerializer implements PrimitiveSerializer<AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto, _$AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto];

  @override
  final String wireName = r'AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.hasBindings != null) {
      yield r'hasBindings';
      yield serializers.serialize(
        object.hasBindings,
        specifiedType: const FullType(bool),
      );
    }
    if (object.hasHits != null) {
      yield r'hasHits';
      yield serializers.serialize(
        object.hasHits,
        specifiedType: const FullType(bool),
      );
    }
    if (object.fallbackReplyText != null) {
      yield r'fallbackReplyText';
      yield serializers.serialize(
        object.fallbackReplyText,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.injectedSystemPrompt != null) {
      yield r'injectedSystemPrompt';
      yield serializers.serialize(
        object.injectedSystemPrompt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.hits != null) {
      yield r'hits';
      yield serializers.serialize(
        object.hits,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'hasBindings':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.hasBindings = valueDes;
          break;
        case r'hasHits':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.hasHits = valueDes;
          break;
        case r'fallbackReplyText':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.fallbackReplyText = valueDes;
          break;
        case r'injectedSystemPrompt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.injectedSystemPrompt = valueDes;
          break;
        case r'hits':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto)]),
          ) as BuiltList<AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto>?;
          if (valueDes == null) continue;
          result.hits.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDtoBuilder();
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

