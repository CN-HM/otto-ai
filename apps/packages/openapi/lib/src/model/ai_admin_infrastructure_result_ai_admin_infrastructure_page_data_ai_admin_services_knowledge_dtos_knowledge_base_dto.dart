//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_infrastructure_page_data_ai_admin_services_knowledge_dtos_knowledge_base_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_result_ai_admin_infrastructure_page_data_ai_admin_services_knowledge_dtos_knowledge_base_dto.g.dart';

/// AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto
///
/// Properties:
/// * [code] 
/// * [msg] 
/// * [data] 
@BuiltValue()
abstract class AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto implements Built<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto, AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'msg')
  String? get msg;

  @BuiltValueField(wireName: r'data')
  AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto? get data;

  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto._();

  factory AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto([void updates(AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder b)]) = _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto> get serializer => _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDtoSerializer();
}

class _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDtoSerializer implements PrimitiveSerializer<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto, _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto];

  @override
  final String wireName = r'AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.code != null) {
      yield r'code';
      yield serializers.serialize(
        object.code,
        specifiedType: const FullType(int),
      );
    }
    if (object.msg != null) {
      yield r'msg';
      yield serializers.serialize(
        object.msg,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.code = valueDes;
          break;
        case r'msg':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.msg = valueDes;
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto),
          ) as AiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto;
          result.data.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder();
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

