//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_runtime_orchestration_dtos_conversation_orchestration_request_dto.g.dart';

/// AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto
///
/// Properties:
/// * [agentRoleId] 
/// * [agentRoleCode] 
/// * [agentRoleReleaseId] 
/// * [sessionId] 
/// * [deviceId] 
/// * [pipelineTemplateId] 
/// * [vadProfileId] 
/// * [asrProfileId] 
/// * [llmProfileId] 
/// * [ttsProfileId] 
/// * [requestedInvocationMode] 
/// * [preferStreaming] 
@BuiltValue()
abstract class AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto implements Built<AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto, AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDtoBuilder> {
  @BuiltValueField(wireName: r'agentRoleId')
  String? get agentRoleId;

  @BuiltValueField(wireName: r'agentRoleCode')
  String? get agentRoleCode;

  @BuiltValueField(wireName: r'agentRoleReleaseId')
  String? get agentRoleReleaseId;

  @BuiltValueField(wireName: r'sessionId')
  String? get sessionId;

  @BuiltValueField(wireName: r'deviceId')
  String? get deviceId;

  @BuiltValueField(wireName: r'pipelineTemplateId')
  String? get pipelineTemplateId;

  @BuiltValueField(wireName: r'vadProfileId')
  String? get vadProfileId;

  @BuiltValueField(wireName: r'asrProfileId')
  String? get asrProfileId;

  @BuiltValueField(wireName: r'llmProfileId')
  String? get llmProfileId;

  @BuiltValueField(wireName: r'ttsProfileId')
  String? get ttsProfileId;

  @BuiltValueField(wireName: r'requestedInvocationMode')
  String? get requestedInvocationMode;

  @BuiltValueField(wireName: r'preferStreaming')
  bool? get preferStreaming;

  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto._();

  factory AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto([void updates(AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDtoBuilder b)]) = _$AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto> get serializer => _$AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDtoSerializer();
}

class _$AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDtoSerializer implements PrimitiveSerializer<AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto, _$AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto];

  @override
  final String wireName = r'AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto object, {
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
    if (object.agentRoleReleaseId != null) {
      yield r'agentRoleReleaseId';
      yield serializers.serialize(
        object.agentRoleReleaseId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.sessionId != null) {
      yield r'sessionId';
      yield serializers.serialize(
        object.sessionId,
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
    if (object.pipelineTemplateId != null) {
      yield r'pipelineTemplateId';
      yield serializers.serialize(
        object.pipelineTemplateId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.vadProfileId != null) {
      yield r'vadProfileId';
      yield serializers.serialize(
        object.vadProfileId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.asrProfileId != null) {
      yield r'asrProfileId';
      yield serializers.serialize(
        object.asrProfileId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.llmProfileId != null) {
      yield r'llmProfileId';
      yield serializers.serialize(
        object.llmProfileId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.ttsProfileId != null) {
      yield r'ttsProfileId';
      yield serializers.serialize(
        object.ttsProfileId,
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
    if (object.preferStreaming != null) {
      yield r'preferStreaming';
      yield serializers.serialize(
        object.preferStreaming,
        specifiedType: const FullType.nullable(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDtoBuilder result,
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
        case r'agentRoleReleaseId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.agentRoleReleaseId = valueDes;
          break;
        case r'sessionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sessionId = valueDes;
          break;
        case r'deviceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.deviceId = valueDes;
          break;
        case r'pipelineTemplateId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.pipelineTemplateId = valueDes;
          break;
        case r'vadProfileId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.vadProfileId = valueDes;
          break;
        case r'asrProfileId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.asrProfileId = valueDes;
          break;
        case r'llmProfileId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.llmProfileId = valueDes;
          break;
        case r'ttsProfileId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.ttsProfileId = valueDes;
          break;
        case r'requestedInvocationMode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.requestedInvocationMode = valueDes;
          break;
        case r'preferStreaming':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.preferStreaming = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDtoBuilder();
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

