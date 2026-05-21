//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_runtime_orchestration_dtos_conversation_orchestration_plan_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_result_ai_admin_services_runtime_orchestration_dtos_conversation_orchestration_plan_dto.g.dart';

/// AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto
///
/// Properties:
/// * [code] 
/// * [msg] 
/// * [data] 
@BuiltValue()
abstract class AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto implements Built<AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto, AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'msg')
  String? get msg;

  @BuiltValueField(wireName: r'data')
  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto? get data;

  AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto._();

  factory AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto([void updates(AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder b)]) = _$AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto> get serializer => _$AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoSerializer();
}

class _$AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoSerializer implements PrimitiveSerializer<AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto, _$AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto];

  @override
  final String wireName = r'AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.code != null) {
      yield r'code';
      yield serializers.serialize(
        object.code,
        specifiedType: const FullType(int),
      );
    }
    if (object.msg != null) {
      yield r'msg';
      yield serializers.serialize(
        object.msg,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.code = valueDes;
          break;
        case r'msg':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.msg = valueDes;
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto),
          ) as AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto;
          result.data.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder();
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

