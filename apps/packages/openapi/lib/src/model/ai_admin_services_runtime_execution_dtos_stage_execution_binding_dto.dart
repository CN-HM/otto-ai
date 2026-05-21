//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/ai_admin_entities_provider_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_runtime_execution_dtos_stage_execution_binding_dto.g.dart';

/// AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto
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
/// * [capabilitySource] 
/// * [capabilityTags] 
/// * [adapterCode] 
/// * [adapterName] 
/// * [isResolved] 
/// * [resolutionMode] 
/// * [resolutionDetail] 
/// * [warnings] 
@BuiltValue()
abstract class AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto implements Built<AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto, AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDtoBuilder> {
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

  @BuiltValueField(wireName: r'capabilitySource')
  String? get capabilitySource;

  @BuiltValueField(wireName: r'capabilityTags')
  BuiltList<String>? get capabilityTags;

  @BuiltValueField(wireName: r'adapterCode')
  String? get adapterCode;

  @BuiltValueField(wireName: r'adapterName')
  String? get adapterName;

  @BuiltValueField(wireName: r'isResolved')
  bool? get isResolved;

  @BuiltValueField(wireName: r'resolutionMode')
  String? get resolutionMode;

  @BuiltValueField(wireName: r'resolutionDetail')
  String? get resolutionDetail;

  @BuiltValueField(wireName: r'warnings')
  BuiltList<String>? get warnings;

  AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto._();

  factory AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto([void updates(AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDtoBuilder b)]) = _$AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto> get serializer => _$AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDtoSerializer();
}

class _$AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDtoSerializer implements PrimitiveSerializer<AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto, _$AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto];

  @override
  final String wireName = r'AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto object, {
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
    if (object.adapterCode != null) {
      yield r'adapterCode';
      yield serializers.serialize(
        object.adapterCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.adapterName != null) {
      yield r'adapterName';
      yield serializers.serialize(
        object.adapterName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.isResolved != null) {
      yield r'isResolved';
      yield serializers.serialize(
        object.isResolved,
        specifiedType: const FullType(bool),
      );
    }
    if (object.resolutionMode != null) {
      yield r'resolutionMode';
      yield serializers.serialize(
        object.resolutionMode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.resolutionDetail != null) {
      yield r'resolutionDetail';
      yield serializers.serialize(
        object.resolutionDetail,
        specifiedType: const FullType.nullable(String),
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
    AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDtoBuilder result,
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
        case r'adapterCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.adapterCode = valueDes;
          break;
        case r'adapterName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.adapterName = valueDes;
          break;
        case r'isResolved':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isResolved = valueDes;
          break;
        case r'resolutionMode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.resolutionMode = valueDes;
          break;
        case r'resolutionDetail':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.resolutionDetail = valueDes;
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
  AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesRuntimeExecutionDtosStageExecutionBindingDtoBuilder();
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

