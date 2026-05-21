//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_runtime_orchestration_dtos_conversation_orchestration_request_dto.dart';
import 'package:openapi/src/model/ai_admin_services_runtime_execution_dtos_tts_synthesis_request_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_runtime_execution_dtos_conversation_tts_execution_request_dto.g.dart';

/// AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto
///
/// Properties:
/// * [orchestration] 
/// * [request] 
@BuiltValue()
abstract class AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto implements Built<AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto, AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDtoBuilder> {
  @BuiltValueField(wireName: r'orchestration')
  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto? get orchestration;

  @BuiltValueField(wireName: r'request')
  AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto? get request;

  AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto._();

  factory AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto([void updates(AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDtoBuilder b)]) = _$AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto> get serializer => _$AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDtoSerializer();
}

class _$AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDtoSerializer implements PrimitiveSerializer<AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto, _$AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto];

  @override
  final String wireName = r'AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto object, {
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
        specifiedType: const FullType(AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDtoBuilder result,
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
            specifiedType: const FullType(AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto),
          ) as AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto;
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
  AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDtoBuilder();
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

