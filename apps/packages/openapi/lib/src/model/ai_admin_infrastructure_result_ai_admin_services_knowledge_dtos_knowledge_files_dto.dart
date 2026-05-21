//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_knowledge_dtos_knowledge_files_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_result_ai_admin_services_knowledge_dtos_knowledge_files_dto.g.dart';

/// AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto
///
/// Properties:
/// * [code] 
/// * [msg] 
/// * [data] 
@BuiltValue()
abstract class AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto implements Built<AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto, AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'msg')
  String? get msg;

  @BuiltValueField(wireName: r'data')
  AiAdminServicesKnowledgeDtosKnowledgeFilesDto? get data;

  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto._();

  factory AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto([void updates(AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder b)]) = _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto> get serializer => _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDtoSerializer();
}

class _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDtoSerializer implements PrimitiveSerializer<AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto, _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto];

  @override
  final String wireName = r'AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto object, {
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
        specifiedType: const FullType(AiAdminServicesKnowledgeDtosKnowledgeFilesDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder result,
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
            specifiedType: const FullType(AiAdminServicesKnowledgeDtosKnowledgeFilesDto),
          ) as AiAdminServicesKnowledgeDtosKnowledgeFilesDto;
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
  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder();
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

