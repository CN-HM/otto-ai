//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/ai_admin_services_knowledge_dtos_knowledge_files_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_page_data_ai_admin_services_knowledge_dtos_knowledge_files_dto.g.dart';

/// AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto
///
/// Properties:
/// * [total] 
/// * [list] 
@BuiltValue()
abstract class AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto implements Built<AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto, AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder> {
  @BuiltValueField(wireName: r'total')
  int? get total;

  @BuiltValueField(wireName: r'list')
  BuiltList<AiAdminServicesKnowledgeDtosKnowledgeFilesDto>? get list;

  AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto._();

  factory AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto([void updates(AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder b)]) = _$AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto> get serializer => _$AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDtoSerializer();
}

class _$AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDtoSerializer implements PrimitiveSerializer<AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto, _$AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto];

  @override
  final String wireName = r'AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto object, {
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
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesKnowledgeDtosKnowledgeFilesDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder result,
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
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesKnowledgeDtosKnowledgeFilesDto)]),
          ) as BuiltList<AiAdminServicesKnowledgeDtosKnowledgeFilesDto>?;
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
  AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder();
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

