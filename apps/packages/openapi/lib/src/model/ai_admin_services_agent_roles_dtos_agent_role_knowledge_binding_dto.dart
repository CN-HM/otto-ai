//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_agent_roles_dtos_agent_role_knowledge_binding_dto.g.dart';

/// AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto
///
/// Properties:
/// * [id] 
/// * [datasetId] 
/// * [datasetName] 
/// * [sort] 
/// * [enabled] 
/// * [topK] 
/// * [minScore] 
/// * [rerankEnabled] 
/// * [maxChunks] 
@BuiltValue()
abstract class AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto implements Built<AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto, AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'datasetId')
  String? get datasetId;

  @BuiltValueField(wireName: r'datasetName')
  String? get datasetName;

  @BuiltValueField(wireName: r'sort')
  int? get sort;

  @BuiltValueField(wireName: r'enabled')
  bool? get enabled;

  @BuiltValueField(wireName: r'topK')
  int? get topK;

  @BuiltValueField(wireName: r'minScore')
  double? get minScore;

  @BuiltValueField(wireName: r'rerankEnabled')
  bool? get rerankEnabled;

  @BuiltValueField(wireName: r'maxChunks')
  int? get maxChunks;

  AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto._();

  factory AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto([void updates(AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDtoBuilder b)]) = _$AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto> get serializer => _$AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDtoSerializer();
}

class _$AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDtoSerializer implements PrimitiveSerializer<AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto, _$AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto];

  @override
  final String wireName = r'AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.datasetId != null) {
      yield r'datasetId';
      yield serializers.serialize(
        object.datasetId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.datasetName != null) {
      yield r'datasetName';
      yield serializers.serialize(
        object.datasetName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.sort != null) {
      yield r'sort';
      yield serializers.serialize(
        object.sort,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.enabled != null) {
      yield r'enabled';
      yield serializers.serialize(
        object.enabled,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.topK != null) {
      yield r'topK';
      yield serializers.serialize(
        object.topK,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.minScore != null) {
      yield r'minScore';
      yield serializers.serialize(
        object.minScore,
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.rerankEnabled != null) {
      yield r'rerankEnabled';
      yield serializers.serialize(
        object.rerankEnabled,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.maxChunks != null) {
      yield r'maxChunks';
      yield serializers.serialize(
        object.maxChunks,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.id = valueDes;
          break;
        case r'datasetId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.datasetId = valueDes;
          break;
        case r'datasetName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.datasetName = valueDes;
          break;
        case r'sort':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.sort = valueDes;
          break;
        case r'enabled':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.enabled = valueDes;
          break;
        case r'topK':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.topK = valueDes;
          break;
        case r'minScore':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.minScore = valueDes;
          break;
        case r'rerankEnabled':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.rerankEnabled = valueDes;
          break;
        case r'maxChunks':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.maxChunks = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDtoBuilder();
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

