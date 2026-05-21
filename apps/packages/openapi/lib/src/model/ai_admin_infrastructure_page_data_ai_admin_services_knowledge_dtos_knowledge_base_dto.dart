//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/ai_admin_services_knowledge_dtos_knowledge_base_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_page_data_ai_admin_services_knowledge_dtos_knowledge_base_dto.g.dart';

/// AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto
///
/// Properties:
/// * [total] 
/// * [list] 
@BuiltValue()
abstract class AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto implements Built<AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto, AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder> {
  @BuiltValueField(wireName: r'total')
  int? get total;

  @BuiltValueField(wireName: r'list')
  BuiltList<AiAdminServicesKnowledgeDtosKnowledgeBaseDto>? get list;

  AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto._();

  factory AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto([void updates(AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder b)]) = _$AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto> get serializer => _$AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDtoSerializer();
}

class _$AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDtoSerializer implements PrimitiveSerializer<AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto, _$AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto];

  @override
  final String wireName = r'AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.total != null) {
      yield r'total';
      yield serializers.serialize(
        object.total,
        specifiedType: const FullType(int),
      );
    }
    if (object.list != null) {
      yield r'list';
      yield serializers.serialize(
        object.list,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesKnowledgeDtosKnowledgeBaseDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.total = valueDes;
          break;
        case r'list':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesKnowledgeDtosKnowledgeBaseDto)]),
          ) as BuiltList<AiAdminServicesKnowledgeDtosKnowledgeBaseDto>?;
          if (valueDes == null) continue;
          result.list.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder();
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

