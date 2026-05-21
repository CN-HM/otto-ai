//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_knowledge_dtos_hit_vo_dto.g.dart';

/// AiAdminServicesKnowledgeDtosHitVoDto
///
/// Properties:
/// * [id] 
/// * [content] 
/// * [similarity] 
/// * [documentId] 
/// * [datasetId] 
/// * [documentName] 
@BuiltValue()
abstract class AiAdminServicesKnowledgeDtosHitVoDto implements Built<AiAdminServicesKnowledgeDtosHitVoDto, AiAdminServicesKnowledgeDtosHitVoDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'content')
  String? get content;

  @BuiltValueField(wireName: r'similarity')
  double? get similarity;

  @BuiltValueField(wireName: r'documentId')
  String? get documentId;

  @BuiltValueField(wireName: r'datasetId')
  String? get datasetId;

  @BuiltValueField(wireName: r'documentName')
  String? get documentName;

  AiAdminServicesKnowledgeDtosHitVoDto._();

  factory AiAdminServicesKnowledgeDtosHitVoDto([void updates(AiAdminServicesKnowledgeDtosHitVoDtoBuilder b)]) = _$AiAdminServicesKnowledgeDtosHitVoDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesKnowledgeDtosHitVoDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesKnowledgeDtosHitVoDto> get serializer => _$AiAdminServicesKnowledgeDtosHitVoDtoSerializer();
}

class _$AiAdminServicesKnowledgeDtosHitVoDtoSerializer implements PrimitiveSerializer<AiAdminServicesKnowledgeDtosHitVoDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesKnowledgeDtosHitVoDto, _$AiAdminServicesKnowledgeDtosHitVoDto];

  @override
  final String wireName = r'AiAdminServicesKnowledgeDtosHitVoDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesKnowledgeDtosHitVoDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.content != null) {
      yield r'content';
      yield serializers.serialize(
        object.content,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.similarity != null) {
      yield r'similarity';
      yield serializers.serialize(
        object.similarity,
        specifiedType: const FullType(double),
      );
    }
    if (object.documentId != null) {
      yield r'documentId';
      yield serializers.serialize(
        object.documentId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.datasetId != null) {
      yield r'datasetId';
      yield serializers.serialize(
        object.datasetId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.documentName != null) {
      yield r'documentName';
      yield serializers.serialize(
        object.documentName,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesKnowledgeDtosHitVoDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesKnowledgeDtosHitVoDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.id = valueDes;
          break;
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.content = valueDes;
          break;
        case r'similarity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.similarity = valueDes;
          break;
        case r'documentId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.documentId = valueDes;
          break;
        case r'datasetId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.datasetId = valueDes;
          break;
        case r'documentName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.documentName = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesKnowledgeDtosHitVoDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesKnowledgeDtosHitVoDtoBuilder();
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

