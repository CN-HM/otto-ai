//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_runtime_orchestration_dtos_conversation_orchestration_request_dto.dart';
import 'package:openapi/src/model/ai_admin_services_runtime_execution_dtos_asr_recognition_request_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_runtime_execution_dtos_conversation_asr_execution_request_dto.g.dart';

/// AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto
///
/// Properties:
/// * [orchestration] 
/// * [request] 
@BuiltValue()
abstract class AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto implements Built<AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto, AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDtoBuilder> {
  @BuiltValueField(wireName: r'orchestration')
  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto? get orchestration;

  @BuiltValueField(wireName: r'request')
  AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto? get request;

  AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto._();

  factory AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto([void updates(AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDtoBuilder b)]) = _$AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto> get serializer => _$AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDtoSerializer();
}

class _$AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDtoSerializer implements PrimitiveSerializer<AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto, _$AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto];

  @override
  final String wireName = r'AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto object, {
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
        specifiedType: const FullType(AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDtoBuilder result,
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
            specifiedType: const FullType(AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto),
          ) as AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto;
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
  AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDtoBuilder();
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

