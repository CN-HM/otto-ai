//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_runtime_orchestration_dtos_conversation_orchestration_request_dto.dart';
import 'package:openapi/src/model/ai_admin_services_runtime_execution_dtos_llm_chat_request_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_runtime_execution_dtos_conversation_llm_execution_request_dto.g.dart';

/// AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto
///
/// Properties:
/// * [orchestration] 
/// * [request] 
@BuiltValue()
abstract class AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto implements Built<AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto, AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDtoBuilder> {
  @BuiltValueField(wireName: r'orchestration')
  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto? get orchestration;

  @BuiltValueField(wireName: r'request')
  AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto? get request;

  AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto._();

  factory AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto([void updates(AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDtoBuilder b)]) = _$AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto> get serializer => _$AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDtoSerializer();
}

class _$AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDtoSerializer implements PrimitiveSerializer<AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto, _$AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto];

  @override
  final String wireName = r'AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.orchestration != null) {
      yield r'orchestration';
      yield serializers.serialize(
        object.orchestration,
        specifiedType: const FullType(AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto),
      );
    }
    if (object.request != null) {
      yield r'request';
      yield serializers.serialize(
        object.request,
        specifiedType: const FullType(AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'orchestration':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto),
          ) as AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto;
          result.orchestration.replace(valueDes);
          break;
        case r'request':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto),
          ) as AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto;
          result.request.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDtoBuilder();
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

