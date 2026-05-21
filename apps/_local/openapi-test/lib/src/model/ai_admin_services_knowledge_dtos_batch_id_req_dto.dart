//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_knowledge_dtos_batch_id_req_dto.g.dart';

/// AiAdminServicesKnowledgeDtosBatchIdReqDto
///
/// Properties:
/// * [ids] 
@BuiltValue()
abstract class AiAdminServicesKnowledgeDtosBatchIdReqDto implements Built<AiAdminServicesKnowledgeDtosBatchIdReqDto, AiAdminServicesKnowledgeDtosBatchIdReqDtoBuilder> {
  @BuiltValueField(wireName: r'ids')
  BuiltList<String>? get ids;

  AiAdminServicesKnowledgeDtosBatchIdReqDto._();

  factory AiAdminServicesKnowledgeDtosBatchIdReqDto([void updates(AiAdminServicesKnowledgeDtosBatchIdReqDtoBuilder b)]) = _$AiAdminServicesKnowledgeDtosBatchIdReqDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesKnowledgeDtosBatchIdReqDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesKnowledgeDtosBatchIdReqDto> get serializer => _$AiAdminServicesKnowledgeDtosBatchIdReqDtoSerializer();
}

class _$AiAdminServicesKnowledgeDtosBatchIdReqDtoSerializer implements PrimitiveSerializer<AiAdminServicesKnowledgeDtosBatchIdReqDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesKnowledgeDtosBatchIdReqDto, _$AiAdminServicesKnowledgeDtosBatchIdReqDto];

  @override
  final String wireName = r'AiAdminServicesKnowledgeDtosBatchIdReqDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesKnowledgeDtosBatchIdReqDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.ids != null) {
      yield r'ids';
      yield serializers.serialize(
        object.ids,
        specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesKnowledgeDtosBatchIdReqDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesKnowledgeDtosBatchIdReqDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'ids':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.ids.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesKnowledgeDtosBatchIdReqDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesKnowledgeDtosBatchIdReqDtoBuilder();
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

