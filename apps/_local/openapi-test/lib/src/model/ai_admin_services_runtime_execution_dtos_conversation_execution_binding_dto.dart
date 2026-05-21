//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_runtime_execution_dtos_stage_execution_binding_dto.dart';
import 'package:openapi/src/model/ai_admin_services_runtime_orchestration_dtos_conversation_orchestration_plan_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_runtime_execution_dtos_conversation_execution_binding_dto.g.dart';

/// AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto
///
/// Properties:
/// * [orchestration] 
/// * [adapterRoute] 
/// * [usesMixedAdapters] 
/// * [isFullyResolved] 
/// * [missingStages] 
/// * [asr] 
/// * [llm] 
/// * [tts] 
/// * [warnings] 
@BuiltValue()
abstract class AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto implements Built<AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto, AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoBuilder> {
  @BuiltValueField(wireName: r'orchestration')
  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto? get orchestration;

  @BuiltValueField(wireName: r'adapterRoute')
  BuiltList<String>? get adapterRoute;

  @BuiltValueField(wireName: r'usesMixedAdapters')
  bool? get usesMixedAdapters;

  @BuiltValueField(wireName: r'isFullyResolved')
  bool? get isFullyResolved;

  @BuiltValueField(wireName: r'missingStages')
  BuiltList<String>? get missingStages;

  @BuiltValueField(wireName: r'asr')
  AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto? get asr;

  @BuiltValueField(wireName: r'llm')
  AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto? get llm;

  @BuiltValueField(wireName: r'tts')
  AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto? get tts;

  @BuiltValueField(wireName: r'warnings')
  BuiltList<String>? get warnings;

  AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto._();

  factory AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto([void updates(AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoBuilder b)]) = _$AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto> get serializer => _$AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoSerializer();
}

class _$AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoSerializer implements PrimitiveSerializer<AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto, _$AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto];

  @override
  final String wireName = r'AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.orchestration != null) {
      yield r'orchestration';
      yield serializers.serialize(
        object.orchestration,
        specifiedType: const FullType(AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto),
      );
    }
    if (object.adapterRoute != null) {
      yield r'adapterRoute';
      yield serializers.serialize(
        object.adapterRoute,
        specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
      );
    }
    if (object.usesMixedAdapters != null) {
      yield r'usesMixedAdapters';
      yield serializers.serialize(
        object.usesMixedAdapters,
        specifiedType: const FullType(bool),
      );
    }
    if (object.isFullyResolved != null) {
      yield r'isFullyResolved';
      yield serializers.serialize(
        object.isFullyResolved,
        specifiedType: const FullType(bool),
      );
    }
    if (object.missingStages != null) {
      yield r'missingStages';
      yield serializers.serialize(
        object.missingStages,
        specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
      );
    }
    if (object.asr != null) {
      yield r'asr';
      yield serializers.serialize(
        object.asr,
        specifiedType: const FullType(AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto),
      );
    }
    if (object.llm != null) {
      yield r'llm';
      yield serializers.serialize(
        object.llm,
        specifiedType: const FullType(AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto),
      );
    }
    if (object.tts != null) {
      yield r'tts';
      yield serializers.serialize(
        object.tts,
        specifiedType: const FullType(AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto),
      );
    }
    if (object.warnings != null) {
      yield r'warnings';
      yield serializers.serialize(
        object.warnings,
        specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'orchestration':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto),
          ) as AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto;
          result.orchestration.replace(valueDes);
          break;
        case r'adapterRoute':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.adapterRoute.replace(valueDes);
          break;
        case r'usesMixedAdapters':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.usesMixedAdapters = valueDes;
          break;
        case r'isFullyResolved':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isFullyResolved = valueDes;
          break;
        case r'missingStages':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.missingStages.replace(valueDes);
          break;
        case r'asr':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto),
          ) as AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto;
          result.asr.replace(valueDes);
          break;
        case r'llm':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto),
          ) as AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto;
          result.llm.replace(valueDes);
          break;
        case r'tts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto),
          ) as AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto;
          result.tts.replace(valueDes);
          break;
        case r'warnings':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.warnings.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDtoBuilder();
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

