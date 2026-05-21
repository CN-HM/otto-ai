//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/ai_admin_entities_provider_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_runtime_execution_dtos_stage_execution_trace_dto.g.dart';

/// AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto
///
/// Properties:
/// * [sessionId] 
/// * [deviceId] 
/// * [agentRoleId] 
/// * [agentRoleCode] 
/// * [agentRoleVersion] 
/// * [agentRoleReleaseId] 
/// * [agentRoleConfigSource] 
/// * [stage] 
/// * [requestedInvocationMode] 
/// * [plannedInvocationMode] 
/// * [actualInvocationMode] 
/// * [fallbackMode] 
/// * [fallbackReason] 
/// * [failureReason] 
/// * [profileId] 
/// * [providerCode] 
/// * [providerType] 
/// * [providerName] 
/// * [providerFamily] 
/// * [capabilitySource] 
/// * [capabilityTags] 
/// * [succeeded] 
/// * [durationMs] 
/// * [errorCode] 
/// * [errorMessage] 
@BuiltValue()
abstract class AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto implements Built<AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto, AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDtoBuilder> {
  @BuiltValueField(wireName: r'sessionId')
  String? get sessionId;

  @BuiltValueField(wireName: r'deviceId')
  String? get deviceId;

  @BuiltValueField(wireName: r'agentRoleId')
  String? get agentRoleId;

  @BuiltValueField(wireName: r'agentRoleCode')
  String? get agentRoleCode;

  @BuiltValueField(wireName: r'agentRoleVersion')
  String? get agentRoleVersion;

  @BuiltValueField(wireName: r'agentRoleReleaseId')
  String? get agentRoleReleaseId;

  @BuiltValueField(wireName: r'agentRoleConfigSource')
  String? get agentRoleConfigSource;

  @BuiltValueField(wireName: r'stage')
  String? get stage;

  @BuiltValueField(wireName: r'requestedInvocationMode')
  String? get requestedInvocationMode;

  @BuiltValueField(wireName: r'plannedInvocationMode')
  String? get plannedInvocationMode;

  @BuiltValueField(wireName: r'actualInvocationMode')
  String? get actualInvocationMode;

  @BuiltValueField(wireName: r'fallbackMode')
  String? get fallbackMode;

  @BuiltValueField(wireName: r'fallbackReason')
  String? get fallbackReason;

  @BuiltValueField(wireName: r'failureReason')
  String? get failureReason;

  @BuiltValueField(wireName: r'profileId')
  String? get profileId;

  @BuiltValueField(wireName: r'providerCode')
  String? get providerCode;

  @BuiltValueField(wireName: r'providerType')
  AiAdminEntitiesProviderType? get providerType;
  // enum providerTypeEnum {  Ark,  DoubaoSpeech,  DashScope,  };

  @BuiltValueField(wireName: r'providerName')
  String? get providerName;

  @BuiltValueField(wireName: r'providerFamily')
  String? get providerFamily;

  @BuiltValueField(wireName: r'capabilitySource')
  String? get capabilitySource;

  @BuiltValueField(wireName: r'capabilityTags')
  BuiltList<String>? get capabilityTags;

  @BuiltValueField(wireName: r'succeeded')
  bool? get succeeded;

  @BuiltValueField(wireName: r'durationMs')
  int? get durationMs;

  @BuiltValueField(wireName: r'errorCode')
  String? get errorCode;

  @BuiltValueField(wireName: r'errorMessage')
  String? get errorMessage;

  AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto._();

  factory AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto([void updates(AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDtoBuilder b)]) = _$AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto> get serializer => _$AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDtoSerializer();
}

class _$AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDtoSerializer implements PrimitiveSerializer<AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto, _$AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto];

  @override
  final String wireName = r'AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    if (object.stage != null) {
      yield r'stage';
      yield serializers.serialize(
        object.stage,
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
    if (object.plannedInvocationMode != null) {
      yield r'plannedInvocationMode';
      yield serializers.serialize(
        object.plannedInvocationMode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.actualInvocationMode != null) {
      yield r'actualInvocationMode';
      yield serializers.serialize(
        object.actualInvocationMode,
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
    if (object.fallbackReason != null) {
      yield r'fallbackReason';
      yield serializers.serialize(
        object.fallbackReason,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.failureReason != null) {
      yield r'failureReason';
      yield serializers.serialize(
        object.failureReason,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.profileId != null) {
      yield r'profileId';
      yield serializers.serialize(
        object.profileId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.providerCode != null) {
      yield r'providerCode';
      yield serializers.serialize(
        object.providerCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.providerType != null) {
      yield r'providerType';
      yield serializers.serialize(
        object.providerType,
        specifiedType: const FullType(AiAdminEntitiesProviderType),
      );
    }
    if (object.providerName != null) {
      yield r'providerName';
      yield serializers.serialize(
        object.providerName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.providerFamily != null) {
      yield r'providerFamily';
      yield serializers.serialize(
        object.providerFamily,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.capabilitySource != null) {
      yield r'capabilitySource';
      yield serializers.serialize(
        object.capabilitySource,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.capabilityTags != null) {
      yield r'capabilityTags';
      yield serializers.serialize(
        object.capabilityTags,
        specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
      );
    }
    if (object.succeeded != null) {
      yield r'succeeded';
      yield serializers.serialize(
        object.succeeded,
        specifiedType: const FullType(bool),
      );
    }
    if (object.durationMs != null) {
      yield r'durationMs';
      yield serializers.serialize(
        object.durationMs,
        specifiedType: const FullType(int),
      );
    }
    if (object.errorCode != null) {
      yield r'errorCode';
      yield serializers.serialize(
        object.errorCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.errorMessage != null) {
      yield r'errorMessage';
      yield serializers.serialize(
        object.errorMessage,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDtoBuilder result,
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
        case r'deviceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.deviceId = valueDes;
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
        case r'stage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.stage = valueDes;
          break;
        case r'requestedInvocationMode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.requestedInvocationMode = valueDes;
          break;
        case r'plannedInvocationMode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.plannedInvocationMode = valueDes;
          break;
        case r'actualInvocationMode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.actualInvocationMode = valueDes;
          break;
        case r'fallbackMode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.fallbackMode = valueDes;
          break;
        case r'fallbackReason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.fallbackReason = valueDes;
          break;
        case r'failureReason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.failureReason = valueDes;
          break;
        case r'profileId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.profileId = valueDes;
          break;
        case r'providerCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.providerCode = valueDes;
          break;
        case r'providerType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminEntitiesProviderType),
          ) as AiAdminEntitiesProviderType;
          result.providerType = valueDes;
          break;
        case r'providerName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.providerName = valueDes;
          break;
        case r'providerFamily':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.providerFamily = valueDes;
          break;
        case r'capabilitySource':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.capabilitySource = valueDes;
          break;
        case r'capabilityTags':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.capabilityTags.replace(valueDes);
          break;
        case r'succeeded':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.succeeded = valueDes;
          break;
        case r'durationMs':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.durationMs = valueDes;
          break;
        case r'errorCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.errorCode = valueDes;
          break;
        case r'errorMessage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.errorMessage = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDtoBuilder();
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

