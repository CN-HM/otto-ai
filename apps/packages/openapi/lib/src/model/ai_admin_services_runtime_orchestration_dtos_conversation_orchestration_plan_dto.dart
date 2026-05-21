//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/ai_admin_services_runtime_orchestration_dtos_model_invocation_profile_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_runtime_orchestration_dtos_conversation_orchestration_plan_dto.g.dart';

/// AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto
///
/// Properties:
/// * [agentRoleId] 
/// * [agentRoleCode] 
/// * [agentRoleName] 
/// * [agentRoleVersion] 
/// * [agentRoleReleaseId] 
/// * [agentRoleConfigSource] 
/// * [pipelineTemplateId] 
/// * [requestedInvocationMode] 
/// * [effectiveInvocationMode] 
/// * [fallbackMode] 
/// * [baselineNodes] 
/// * [enabledStages] 
/// * [disabledStages] 
/// * [providerRoute] 
/// * [usesMixedProviders] 
/// * [vad] 
/// * [asr] 
/// * [llm] 
/// * [tts] 
/// * [warnings] 
@BuiltValue()
abstract class AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto implements Built<AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto, AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder> {
  @BuiltValueField(wireName: r'agentRoleId')
  String? get agentRoleId;

  @BuiltValueField(wireName: r'agentRoleCode')
  String? get agentRoleCode;

  @BuiltValueField(wireName: r'agentRoleName')
  String? get agentRoleName;

  @BuiltValueField(wireName: r'agentRoleVersion')
  String? get agentRoleVersion;

  @BuiltValueField(wireName: r'agentRoleReleaseId')
  String? get agentRoleReleaseId;

  @BuiltValueField(wireName: r'agentRoleConfigSource')
  String? get agentRoleConfigSource;

  @BuiltValueField(wireName: r'pipelineTemplateId')
  String? get pipelineTemplateId;

  @BuiltValueField(wireName: r'requestedInvocationMode')
  String? get requestedInvocationMode;

  @BuiltValueField(wireName: r'effectiveInvocationMode')
  String? get effectiveInvocationMode;

  @BuiltValueField(wireName: r'fallbackMode')
  String? get fallbackMode;

  @BuiltValueField(wireName: r'baselineNodes')
  BuiltList<String>? get baselineNodes;

  @BuiltValueField(wireName: r'enabledStages')
  BuiltList<String>? get enabledStages;

  @BuiltValueField(wireName: r'disabledStages')
  BuiltList<String>? get disabledStages;

  @BuiltValueField(wireName: r'providerRoute')
  BuiltList<String>? get providerRoute;

  @BuiltValueField(wireName: r'usesMixedProviders')
  bool? get usesMixedProviders;

  @BuiltValueField(wireName: r'vad')
  AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto? get vad;

  @BuiltValueField(wireName: r'asr')
  AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto? get asr;

  @BuiltValueField(wireName: r'llm')
  AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto? get llm;

  @BuiltValueField(wireName: r'tts')
  AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto? get tts;

  @BuiltValueField(wireName: r'warnings')
  BuiltList<String>? get warnings;

  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto._();

  factory AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto([void updates(AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder b)]) = _$AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto> get serializer => _$AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoSerializer();
}

class _$AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoSerializer implements PrimitiveSerializer<AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto, _$AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto];

  @override
  final String wireName = r'AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.agentRoleId != null) {
      yield r'agentRoleId';
      yield serializers.serialize(
        object.agentRoleId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.agentRoleCode != null) {
      yield r'agentRoleCode';
      yield serializers.serialize(
        object.agentRoleCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.agentRoleName != null) {
      yield r'agentRoleName';
      yield serializers.serialize(
        object.agentRoleName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.agentRoleVersion != null) {
      yield r'agentRoleVersion';
      yield serializers.serialize(
        object.agentRoleVersion,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.agentRoleReleaseId != null) {
      yield r'agentRoleReleaseId';
      yield serializers.serialize(
        object.agentRoleReleaseId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.agentRoleConfigSource != null) {
      yield r'agentRoleConfigSource';
      yield serializers.serialize(
        object.agentRoleConfigSource,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.pipelineTemplateId != null) {
      yield r'pipelineTemplateId';
      yield serializers.serialize(
        object.pipelineTemplateId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.requestedInvocationMode != null) {
      yield r'requestedInvocationMode';
      yield serializers.serialize(
        object.requestedInvocationMode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.effectiveInvocationMode != null) {
      yield r'effectiveInvocationMode';
      yield serializers.serialize(
        object.effectiveInvocationMode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.fallbackMode != null) {
      yield r'fallbackMode';
      yield serializers.serialize(
        object.fallbackMode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.baselineNodes != null) {
      yield r'baselineNodes';
      yield serializers.serialize(
        object.baselineNodes,
        specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
      );
    }
    if (object.enabledStages != null) {
      yield r'enabledStages';
      yield serializers.serialize(
        object.enabledStages,
        specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
      );
    }
    if (object.disabledStages != null) {
      yield r'disabledStages';
      yield serializers.serialize(
        object.disabledStages,
        specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
      );
    }
    if (object.providerRoute != null) {
      yield r'providerRoute';
      yield serializers.serialize(
        object.providerRoute,
        specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
      );
    }
    if (object.usesMixedProviders != null) {
      yield r'usesMixedProviders';
      yield serializers.serialize(
        object.usesMixedProviders,
        specifiedType: const FullType(bool),
      );
    }
    if (object.vad != null) {
      yield r'vad';
      yield serializers.serialize(
        object.vad,
        specifiedType: const FullType(AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto),
      );
    }
    if (object.asr != null) {
      yield r'asr';
      yield serializers.serialize(
        object.asr,
        specifiedType: const FullType(AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto),
      );
    }
    if (object.llm != null) {
      yield r'llm';
      yield serializers.serialize(
        object.llm,
        specifiedType: const FullType(AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto),
      );
    }
    if (object.tts != null) {
      yield r'tts';
      yield serializers.serialize(
        object.tts,
        specifiedType: const FullType(AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto),
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
    AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'agentRoleId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.agentRoleId = valueDes;
          break;
        case r'agentRoleCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.agentRoleCode = valueDes;
          break;
        case r'agentRoleName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.agentRoleName = valueDes;
          break;
        case r'agentRoleVersion':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.agentRoleVersion = valueDes;
          break;
        case r'agentRoleReleaseId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.agentRoleReleaseId = valueDes;
          break;
        case r'agentRoleConfigSource':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.agentRoleConfigSource = valueDes;
          break;
        case r'pipelineTemplateId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.pipelineTemplateId = valueDes;
          break;
        case r'requestedInvocationMode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.requestedInvocationMode = valueDes;
          break;
        case r'effectiveInvocationMode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.effectiveInvocationMode = valueDes;
          break;
        case r'fallbackMode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.fallbackMode = valueDes;
          break;
        case r'baselineNodes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.baselineNodes.replace(valueDes);
          break;
        case r'enabledStages':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.enabledStages.replace(valueDes);
          break;
        case r'disabledStages':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.disabledStages.replace(valueDes);
          break;
        case r'providerRoute':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.providerRoute.replace(valueDes);
          break;
        case r'usesMixedProviders':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.usesMixedProviders = valueDes;
          break;
        case r'vad':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto),
          ) as AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto;
          result.vad.replace(valueDes);
          break;
        case r'asr':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto),
          ) as AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto;
          result.asr.replace(valueDes);
          break;
        case r'llm':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto),
          ) as AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto;
          result.llm.replace(valueDes);
          break;
        case r'tts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto),
          ) as AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto;
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
  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDtoBuilder();
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

