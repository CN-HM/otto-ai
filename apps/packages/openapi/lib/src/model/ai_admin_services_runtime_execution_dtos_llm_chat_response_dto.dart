//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_runtime_execution_dtos_llm_chat_usage_dto.dart';
import 'package:openapi/src/model/ai_admin_services_runtime_execution_dtos_stage_execution_trace_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_runtime_execution_dtos_llm_chat_response_dto.g.dart';

/// AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto
///
/// Properties:
/// * [invocationMode] 
/// * [providerResponseId] 
/// * [model] 
/// * [text] 
/// * [finishReason] 
/// * [usage] 
/// * [rawResponseJson] 
/// * [stageTrace] 
@BuiltValue()
abstract class AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto implements Built<AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto, AiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder> {
  @BuiltValueField(wireName: r'invocationMode')
  String? get invocationMode;

  @BuiltValueField(wireName: r'providerResponseId')
  String? get providerResponseId;

  @BuiltValueField(wireName: r'model')
  String? get model;

  @BuiltValueField(wireName: r'text')
  String? get text;

  @BuiltValueField(wireName: r'finishReason')
  String? get finishReason;

  @BuiltValueField(wireName: r'usage')
  AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto? get usage;

  @BuiltValueField(wireName: r'rawResponseJson')
  String? get rawResponseJson;

  @BuiltValueField(wireName: r'stageTrace')
  AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto? get stageTrace;

  AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto._();

  factory AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto([void updates(AiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder b)]) = _$AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto> get serializer => _$AiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoSerializer();
}

class _$AiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoSerializer implements PrimitiveSerializer<AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto, _$AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto];

  @override
  final String wireName = r'AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.invocationMode != null) {
      yield r'invocationMode';
      yield serializers.serialize(
        object.invocationMode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.providerResponseId != null) {
      yield r'providerResponseId';
      yield serializers.serialize(
        object.providerResponseId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.model != null) {
      yield r'model';
      yield serializers.serialize(
        object.model,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.text != null) {
      yield r'text';
      yield serializers.serialize(
        object.text,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.finishReason != null) {
      yield r'finishReason';
      yield serializers.serialize(
        object.finishReason,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.usage != null) {
      yield r'usage';
      yield serializers.serialize(
        object.usage,
        specifiedType: const FullType(AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto),
      );
    }
    if (object.rawResponseJson != null) {
      yield r'rawResponseJson';
      yield serializers.serialize(
        object.rawResponseJson,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.stageTrace != null) {
      yield r'stageTrace';
      yield serializers.serialize(
        object.stageTrace,
        specifiedType: const FullType(AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'invocationMode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.invocationMode = valueDes;
          break;
        case r'providerResponseId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.providerResponseId = valueDes;
          break;
        case r'model':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.model = valueDes;
          break;
        case r'text':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.text = valueDes;
          break;
        case r'finishReason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.finishReason = valueDes;
          break;
        case r'usage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto),
          ) as AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto;
          result.usage.replace(valueDes);
          break;
        case r'rawResponseJson':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.rawResponseJson = valueDes;
          break;
        case r'stageTrace':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto),
          ) as AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto;
          result.stageTrace.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesRuntimeExecutionDtosLlmChatResponseDtoBuilder();
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

