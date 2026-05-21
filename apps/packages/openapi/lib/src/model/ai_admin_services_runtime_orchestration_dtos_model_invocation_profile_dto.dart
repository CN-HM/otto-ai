//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/ai_admin_entities_provider_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_runtime_orchestration_dtos_model_invocation_profile_dto.g.dart';

/// AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto
///
/// Properties:
/// * [stage] 
/// * [profileId] 
/// * [modelType] 
/// * [modelCode] 
/// * [modelName] 
/// * [providerCode] 
/// * [providerType] 
/// * [providerName] 
/// * [providerFamily] 
/// * [invocationMode] 
/// * [supportsStreamingInput] 
/// * [supportsStreamingOutput] 
/// * [firstPacketTimeoutMs] 
/// * [streamIdleTimeoutMs] 
/// * [capabilitySource] 
/// * [capabilityTags] 
@BuiltValue()
abstract class AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto implements Built<AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto, AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder> {
  @BuiltValueField(wireName: r'stage')
  String? get stage;

  @BuiltValueField(wireName: r'profileId')
  String? get profileId;

  @BuiltValueField(wireName: r'modelType')
  String? get modelType;

  @BuiltValueField(wireName: r'modelCode')
  String? get modelCode;

  @BuiltValueField(wireName: r'modelName')
  String? get modelName;

  @BuiltValueField(wireName: r'providerCode')
  String? get providerCode;

  @BuiltValueField(wireName: r'providerType')
  AiAdminEntitiesProviderType? get providerType;
  // enum providerTypeEnum {  Ark,  DoubaoSpeech,  DashScope,  };

  @BuiltValueField(wireName: r'providerName')
  String? get providerName;

  @BuiltValueField(wireName: r'providerFamily')
  String? get providerFamily;

  @BuiltValueField(wireName: r'invocationMode')
  String? get invocationMode;

  @BuiltValueField(wireName: r'supportsStreamingInput')
  bool? get supportsStreamingInput;

  @BuiltValueField(wireName: r'supportsStreamingOutput')
  bool? get supportsStreamingOutput;

  @BuiltValueField(wireName: r'firstPacketTimeoutMs')
  int? get firstPacketTimeoutMs;

  @BuiltValueField(wireName: r'streamIdleTimeoutMs')
  int? get streamIdleTimeoutMs;

  @BuiltValueField(wireName: r'capabilitySource')
  String? get capabilitySource;

  @BuiltValueField(wireName: r'capabilityTags')
  BuiltList<String>? get capabilityTags;

  AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto._();

  factory AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto([void updates(AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder b)]) = _$AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto> get serializer => _$AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoSerializer();
}

class _$AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoSerializer implements PrimitiveSerializer<AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto, _$AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto];

  @override
  final String wireName = r'AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.stage != null) {
      yield r'stage';
      yield serializers.serialize(
        object.stage,
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
    if (object.modelType != null) {
      yield r'modelType';
      yield serializers.serialize(
        object.modelType,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.modelCode != null) {
      yield r'modelCode';
      yield serializers.serialize(
        object.modelCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.modelName != null) {
      yield r'modelName';
      yield serializers.serialize(
        object.modelName,
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
    if (object.invocationMode != null) {
      yield r'invocationMode';
      yield serializers.serialize(
        object.invocationMode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.supportsStreamingInput != null) {
      yield r'supportsStreamingInput';
      yield serializers.serialize(
        object.supportsStreamingInput,
        specifiedType: const FullType(bool),
      );
    }
    if (object.supportsStreamingOutput != null) {
      yield r'supportsStreamingOutput';
      yield serializers.serialize(
        object.supportsStreamingOutput,
        specifiedType: const FullType(bool),
      );
    }
    if (object.firstPacketTimeoutMs != null) {
      yield r'firstPacketTimeoutMs';
      yield serializers.serialize(
        object.firstPacketTimeoutMs,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.streamIdleTimeoutMs != null) {
      yield r'streamIdleTimeoutMs';
      yield serializers.serialize(
        object.streamIdleTimeoutMs,
        specifiedType: const FullType.nullable(int),
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
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'stage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.stage = valueDes;
          break;
        case r'profileId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.profileId = valueDes;
          break;
        case r'modelType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.modelType = valueDes;
          break;
        case r'modelCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.modelCode = valueDes;
          break;
        case r'modelName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.modelName = valueDes;
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
        case r'invocationMode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.invocationMode = valueDes;
          break;
        case r'supportsStreamingInput':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.supportsStreamingInput = valueDes;
          break;
        case r'supportsStreamingOutput':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.supportsStreamingOutput = valueDes;
          break;
        case r'firstPacketTimeoutMs':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.firstPacketTimeoutMs = valueDes;
          break;
        case r'streamIdleTimeoutMs':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.streamIdleTimeoutMs = valueDes;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesRuntimeOrchestrationDtosModelInvocationProfileDtoBuilder();
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

