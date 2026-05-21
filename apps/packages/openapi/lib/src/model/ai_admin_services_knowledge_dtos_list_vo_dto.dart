//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_knowledge_dtos_list_vo_dto.g.dart';

/// AiAdminServicesKnowledgeDtosListVoDto
///
/// Properties:
/// * [chunks] 
/// * [total] 
@BuiltValue()
abstract class AiAdminServicesKnowledgeDtosListVoDto implements Built<AiAdminServicesKnowledgeDtosListVoDto, AiAdminServicesKnowledgeDtosListVoDtoBuilder> {
  @BuiltValueField(wireName: r'chunks')
  BuiltList<JsonObject?>? get chunks;

  @BuiltValueField(wireName: r'total')
  int? get total;

  AiAdminServicesKnowledgeDtosListVoDto._();

  factory AiAdminServicesKnowledgeDtosListVoDto([void updates(AiAdminServicesKnowledgeDtosListVoDtoBuilder b)]) = _$AiAdminServicesKnowledgeDtosListVoDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesKnowledgeDtosListVoDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesKnowledgeDtosListVoDto> get serializer => _$AiAdminServicesKnowledgeDtosListVoDtoSerializer();
}

class _$AiAdminServicesKnowledgeDtosListVoDtoSerializer implements PrimitiveSerializer<AiAdminServicesKnowledgeDtosListVoDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesKnowledgeDtosListVoDto, _$AiAdminServicesKnowledgeDtosListVoDto];

  @override
  final String wireName = r'AiAdminServicesKnowledgeDtosListVoDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesKnowledgeDtosListVoDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.chunks != null) {
      yield r'chunks';
      yield serializers.serialize(
        object.chunks,
        specifiedType: const FullType.nullable(BuiltList, [FullType.nullable(JsonObject)]),
      );
    }
    if (object.total != null) {
      yield r'total';
      yield serializers.serialize(
        object.total,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesKnowledgeDtosListVoDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesKnowledgeDtosListVoDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'chunks':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType.nullable(JsonObject)]),
          ) as BuiltList<JsonObject?>?;
          if (valueDes == null) continue;
          result.chunks.replace(valueDes);
          break;
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.total = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesKnowledgeDtosListVoDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesKnowledgeDtosListVoDtoBuilder();
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

