//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_knowledge_dtos_doc_agg_vo_dto.g.dart';

/// AiAdminServicesKnowledgeDtosDocAggVoDto
///
/// Properties:
/// * [count] 
/// * [docName] 
/// * [docId] 
@BuiltValue()
abstract class AiAdminServicesKnowledgeDtosDocAggVoDto implements Built<AiAdminServicesKnowledgeDtosDocAggVoDto, AiAdminServicesKnowledgeDtosDocAggVoDtoBuilder> {
  @BuiltValueField(wireName: r'count')
  int? get count;

  @BuiltValueField(wireName: r'docName')
  String? get docName;

  @BuiltValueField(wireName: r'docId')
  String? get docId;

  AiAdminServicesKnowledgeDtosDocAggVoDto._();

  factory AiAdminServicesKnowledgeDtosDocAggVoDto([void updates(AiAdminServicesKnowledgeDtosDocAggVoDtoBuilder b)]) = _$AiAdminServicesKnowledgeDtosDocAggVoDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesKnowledgeDtosDocAggVoDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesKnowledgeDtosDocAggVoDto> get serializer => _$AiAdminServicesKnowledgeDtosDocAggVoDtoSerializer();
}

class _$AiAdminServicesKnowledgeDtosDocAggVoDtoSerializer implements PrimitiveSerializer<AiAdminServicesKnowledgeDtosDocAggVoDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesKnowledgeDtosDocAggVoDto, _$AiAdminServicesKnowledgeDtosDocAggVoDto];

  @override
  final String wireName = r'AiAdminServicesKnowledgeDtosDocAggVoDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesKnowledgeDtosDocAggVoDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.count != null) {
      yield r'count';
      yield serializers.serialize(
        object.count,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.docName != null) {
      yield r'docName';
      yield serializers.serialize(
        object.docName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.docId != null) {
      yield r'docId';
      yield serializers.serialize(
        object.docId,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesKnowledgeDtosDocAggVoDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesKnowledgeDtosDocAggVoDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.count = valueDes;
          break;
        case r'docName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.docName = valueDes;
          break;
        case r'docId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.docId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesKnowledgeDtosDocAggVoDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesKnowledgeDtosDocAggVoDtoBuilder();
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

