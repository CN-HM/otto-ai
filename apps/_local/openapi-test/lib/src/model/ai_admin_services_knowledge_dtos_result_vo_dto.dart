//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_knowledge_dtos_doc_agg_vo_dto.dart';
import 'package:openapi/src/model/ai_admin_services_knowledge_dtos_hit_vo_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_knowledge_dtos_result_vo_dto.g.dart';

/// AiAdminServicesKnowledgeDtosResultVoDto
///
/// Properties:
/// * [chunks] 
/// * [total] 
/// * [docAggs] 
/// * [query] 
/// * [effectiveQuery] 
/// * [topK] 
/// * [threshold] 
/// * [rewriteApplied] 
@BuiltValue()
abstract class AiAdminServicesKnowledgeDtosResultVoDto implements Built<AiAdminServicesKnowledgeDtosResultVoDto, AiAdminServicesKnowledgeDtosResultVoDtoBuilder> {
  @BuiltValueField(wireName: r'chunks')
  BuiltList<AiAdminServicesKnowledgeDtosHitVoDto>? get chunks;

  @BuiltValueField(wireName: r'total')
  int? get total;

  @BuiltValueField(wireName: r'docAggs')
  BuiltList<AiAdminServicesKnowledgeDtosDocAggVoDto>? get docAggs;

  @BuiltValueField(wireName: r'query')
  String? get query;

  @BuiltValueField(wireName: r'effectiveQuery')
  String? get effectiveQuery;

  @BuiltValueField(wireName: r'topK')
  int? get topK;

  @BuiltValueField(wireName: r'threshold')
  double? get threshold;

  @BuiltValueField(wireName: r'rewriteApplied')
  bool? get rewriteApplied;

  AiAdminServicesKnowledgeDtosResultVoDto._();

  factory AiAdminServicesKnowledgeDtosResultVoDto([void updates(AiAdminServicesKnowledgeDtosResultVoDtoBuilder b)]) = _$AiAdminServicesKnowledgeDtosResultVoDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesKnowledgeDtosResultVoDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesKnowledgeDtosResultVoDto> get serializer => _$AiAdminServicesKnowledgeDtosResultVoDtoSerializer();
}

class _$AiAdminServicesKnowledgeDtosResultVoDtoSerializer implements PrimitiveSerializer<AiAdminServicesKnowledgeDtosResultVoDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesKnowledgeDtosResultVoDto, _$AiAdminServicesKnowledgeDtosResultVoDto];

  @override
  final String wireName = r'AiAdminServicesKnowledgeDtosResultVoDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesKnowledgeDtosResultVoDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.chunks != null) {
      yield r'chunks';
      yield serializers.serialize(
        object.chunks,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesKnowledgeDtosHitVoDto)]),
      );
    }
    if (object.total != null) {
      yield r'total';
      yield serializers.serialize(
        object.total,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.docAggs != null) {
      yield r'docAggs';
      yield serializers.serialize(
        object.docAggs,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesKnowledgeDtosDocAggVoDto)]),
      );
    }
    if (object.query != null) {
      yield r'query';
      yield serializers.serialize(
        object.query,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.effectiveQuery != null) {
      yield r'effectiveQuery';
      yield serializers.serialize(
        object.effectiveQuery,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.topK != null) {
      yield r'topK';
      yield serializers.serialize(
        object.topK,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.threshold != null) {
      yield r'threshold';
      yield serializers.serialize(
        object.threshold,
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.rewriteApplied != null) {
      yield r'rewriteApplied';
      yield serializers.serialize(
        object.rewriteApplied,
        specifiedType: const FullType.nullable(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesKnowledgeDtosResultVoDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesKnowledgeDtosResultVoDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'chunks':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesKnowledgeDtosHitVoDto)]),
          ) as BuiltList<AiAdminServicesKnowledgeDtosHitVoDto>?;
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
        case r'docAggs':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesKnowledgeDtosDocAggVoDto)]),
          ) as BuiltList<AiAdminServicesKnowledgeDtosDocAggVoDto>?;
          if (valueDes == null) continue;
          result.docAggs.replace(valueDes);
          break;
        case r'query':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.query = valueDes;
          break;
        case r'effectiveQuery':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.effectiveQuery = valueDes;
          break;
        case r'topK':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.topK = valueDes;
          break;
        case r'threshold':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.threshold = valueDes;
          break;
        case r'rewriteApplied':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.rewriteApplied = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesKnowledgeDtosResultVoDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesKnowledgeDtosResultVoDtoBuilder();
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

