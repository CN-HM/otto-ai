//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_runtime_execution_dtos_tts_synthesis_response_dto.dart';
import 'package:openapi/src/model/ai_admin_services_agent_roles_agent_role_runtime_test_knowledge_dto.dart';
import 'package:openapi/src/model/ai_admin_services_agent_roles_agent_role_runtime_test_stage_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/ai_admin_services_runtime_execution_dtos_stage_execution_trace_dto.dart';
import 'package:openapi/src/model/ai_admin_services_memory_dtos_memory_runtime_context_dto.dart';
import 'package:openapi/src/model/ai_admin_services_runtime_execution_dtos_asr_recognition_response_dto.dart';
import 'package:openapi/src/model/ai_admin_services_runtime_execution_dtos_llm_chat_response_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_agent_roles_agent_role_runtime_test_result_dto.g.dart';

/// AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto
///
/// Properties:
/// * [sessionId] 
/// * [inputMode] 
/// * [agentRoleId] 
/// * [agentRoleCode] 
/// * [agentRoleName] 
/// * [agentRoleReleaseId] 
/// * [agentRoleVersion] 
/// * [runtimeConfigSource] 
/// * [deviceId] 
/// * [transcript] 
/// * [replyText] 
/// * [asrStage] 
/// * [memoryRetrievalStage] 
/// * [knowledgeRetrievalStage] 
/// * [llmStage] 
/// * [ttsStage] 
/// * [memoryExtractionStage] 
/// * [asr] 
/// * [knowledge] 
/// * [memoryBefore] 
/// * [llm] 
/// * [tts] 
/// * [memoryChangedCount] 
/// * [memoryAfter] 
/// * [stageTraces] 
/// * [warnings] 
@BuiltValue()
abstract class AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto implements Built<AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto, AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDtoBuilder> {
  @BuiltValueField(wireName: r'sessionId')
  String? get sessionId;

  @BuiltValueField(wireName: r'inputMode')
  String? get inputMode;

  @BuiltValueField(wireName: r'agentRoleId')
  String? get agentRoleId;

  @BuiltValueField(wireName: r'agentRoleCode')
  String? get agentRoleCode;

  @BuiltValueField(wireName: r'agentRoleName')
  String? get agentRoleName;

  @BuiltValueField(wireName: r'agentRoleReleaseId')
  String? get agentRoleReleaseId;

  @BuiltValueField(wireName: r'agentRoleVersion')
  String? get agentRoleVersion;

  @BuiltValueField(wireName: r'runtimeConfigSource')
  String? get runtimeConfigSource;

  @BuiltValueField(wireName: r'deviceId')
  String? get deviceId;

  @BuiltValueField(wireName: r'transcript')
  String? get transcript;

  @BuiltValueField(wireName: r'replyText')
  String? get replyText;

  @BuiltValueField(wireName: r'asrStage')
  AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto? get asrStage;

  @BuiltValueField(wireName: r'memoryRetrievalStage')
  AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto? get memoryRetrievalStage;

  @BuiltValueField(wireName: r'knowledgeRetrievalStage')
  AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto? get knowledgeRetrievalStage;

  @BuiltValueField(wireName: r'llmStage')
  AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto? get llmStage;

  @BuiltValueField(wireName: r'ttsStage')
  AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto? get ttsStage;

  @BuiltValueField(wireName: r'memoryExtractionStage')
  AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto? get memoryExtractionStage;

  @BuiltValueField(wireName: r'asr')
  AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto? get asr;

  @BuiltValueField(wireName: r'knowledge')
  AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto? get knowledge;

  @BuiltValueField(wireName: r'memoryBefore')
  AiAdminServicesMemoryDtosMemoryRuntimeContextDto? get memoryBefore;

  @BuiltValueField(wireName: r'llm')
  AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto? get llm;

  @BuiltValueField(wireName: r'tts')
  AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto? get tts;

  @BuiltValueField(wireName: r'memoryChangedCount')
  int? get memoryChangedCount;

  @BuiltValueField(wireName: r'memoryAfter')
  AiAdminServicesMemoryDtosMemoryRuntimeContextDto? get memoryAfter;

  @BuiltValueField(wireName: r'stageTraces')
  BuiltList<AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto>? get stageTraces;

  @BuiltValueField(wireName: r'warnings')
  BuiltList<String>? get warnings;

  AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto._();

  factory AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto([void updates(AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDtoBuilder b)]) = _$AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto> get serializer => _$AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDtoSerializer();
}

class _$AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDtoSerializer implements PrimitiveSerializer<AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto, _$AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto];

  @override
  final String wireName = r'AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.sessionId != null) {
      yield r'sessionId';
      yield serializers.serialize(
        object.sessionId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.inputMode != null) {
      yield r'inputMode';
      yield serializers.serialize(
        object.inputMode,
        specifiedType: const FullType.nullable(String),
      );
    }
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
    if (object.agentRoleReleaseId != null) {
      yield r'agentRoleReleaseId';
      yield serializers.serialize(
        object.agentRoleReleaseId,
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
    if (object.runtimeConfigSource != null) {
      yield r'runtimeConfigSource';
      yield serializers.serialize(
        object.runtimeConfigSource,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.deviceId != null) {
      yield r'deviceId';
      yield serializers.serialize(
        object.deviceId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.transcript != null) {
      yield r'transcript';
      yield serializers.serialize(
        object.transcript,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.replyText != null) {
      yield r'replyText';
      yield serializers.serialize(
        object.replyText,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.asrStage != null) {
      yield r'asrStage';
      yield serializers.serialize(
        object.asrStage,
        specifiedType: const FullType(AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto),
      );
    }
    if (object.memoryRetrievalStage != null) {
      yield r'memoryRetrievalStage';
      yield serializers.serialize(
        object.memoryRetrievalStage,
        specifiedType: const FullType(AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto),
      );
    }
    if (object.knowledgeRetrievalStage != null) {
      yield r'knowledgeRetrievalStage';
      yield serializers.serialize(
        object.knowledgeRetrievalStage,
        specifiedType: const FullType(AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto),
      );
    }
    if (object.llmStage != null) {
      yield r'llmStage';
      yield serializers.serialize(
        object.llmStage,
        specifiedType: const FullType(AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto),
      );
    }
    if (object.ttsStage != null) {
      yield r'ttsStage';
      yield serializers.serialize(
        object.ttsStage,
        specifiedType: const FullType(AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto),
      );
    }
    if (object.memoryExtractionStage != null) {
      yield r'memoryExtractionStage';
      yield serializers.serialize(
        object.memoryExtractionStage,
        specifiedType: const FullType(AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto),
      );
    }
    if (object.asr != null) {
      yield r'asr';
      yield serializers.serialize(
        object.asr,
        specifiedType: const FullType(AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto),
      );
    }
    if (object.knowledge != null) {
      yield r'knowledge';
      yield serializers.serialize(
        object.knowledge,
        specifiedType: const FullType(AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto),
      );
    }
    if (object.memoryBefore != null) {
      yield r'memoryBefore';
      yield serializers.serialize(
        object.memoryBefore,
        specifiedType: const FullType(AiAdminServicesMemoryDtosMemoryRuntimeContextDto),
      );
    }
    if (object.llm != null) {
      yield r'llm';
      yield serializers.serialize(
        object.llm,
        specifiedType: const FullType(AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto),
      );
    }
    if (object.tts != null) {
      yield r'tts';
      yield serializers.serialize(
        object.tts,
        specifiedType: const FullType(AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto),
      );
    }
    if (object.memoryChangedCount != null) {
      yield r'memoryChangedCount';
      yield serializers.serialize(
        object.memoryChangedCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.memoryAfter != null) {
      yield r'memoryAfter';
      yield serializers.serialize(
        object.memoryAfter,
        specifiedType: const FullType(AiAdminServicesMemoryDtosMemoryRuntimeContextDto),
      );
    }
    if (object.stageTraces != null) {
      yield r'stageTraces';
      yield serializers.serialize(
        object.stageTraces,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto)]),
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
    AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'sessionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sessionId = valueDes;
          break;
        case r'inputMode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.inputMode = valueDes;
          break;
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
        case r'agentRoleReleaseId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.agentRoleReleaseId = valueDes;
          break;
        case r'agentRoleVersion':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.agentRoleVersion = valueDes;
          break;
        case r'runtimeConfigSource':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.runtimeConfigSource = valueDes;
          break;
        case r'deviceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.deviceId = valueDes;
          break;
        case r'transcript':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.transcript = valueDes;
          break;
        case r'replyText':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.replyText = valueDes;
          break;
        case r'asrStage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto),
          ) as AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto;
          result.asrStage.replace(valueDes);
          break;
        case r'memoryRetrievalStage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto),
          ) as AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto;
          result.memoryRetrievalStage.replace(valueDes);
          break;
        case r'knowledgeRetrievalStage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto),
          ) as AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto;
          result.knowledgeRetrievalStage.replace(valueDes);
          break;
        case r'llmStage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto),
          ) as AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto;
          result.llmStage.replace(valueDes);
          break;
        case r'ttsStage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto),
          ) as AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto;
          result.ttsStage.replace(valueDes);
          break;
        case r'memoryExtractionStage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto),
          ) as AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto;
          result.memoryExtractionStage.replace(valueDes);
          break;
        case r'asr':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto),
          ) as AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto;
          result.asr.replace(valueDes);
          break;
        case r'knowledge':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto),
          ) as AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto;
          result.knowledge.replace(valueDes);
          break;
        case r'memoryBefore':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesMemoryDtosMemoryRuntimeContextDto),
          ) as AiAdminServicesMemoryDtosMemoryRuntimeContextDto;
          result.memoryBefore.replace(valueDes);
          break;
        case r'llm':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto),
          ) as AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto;
          result.llm.replace(valueDes);
          break;
        case r'tts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto),
          ) as AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto;
          result.tts.replace(valueDes);
          break;
        case r'memoryChangedCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.memoryChangedCount = valueDes;
          break;
        case r'memoryAfter':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesMemoryDtosMemoryRuntimeContextDto),
          ) as AiAdminServicesMemoryDtosMemoryRuntimeContextDto;
          result.memoryAfter.replace(valueDes);
          break;
        case r'stageTraces':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto)]),
          ) as BuiltList<AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto>?;
          if (valueDes == null) continue;
          result.stageTraces.replace(valueDes);
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
  AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDtoBuilder();
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

