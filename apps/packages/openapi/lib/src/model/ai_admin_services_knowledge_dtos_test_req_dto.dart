//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_knowledge_dtos_test_req_dto.g.dart';

/// AiAdminServicesKnowledgeDtosTestReqDto
///
/// Properties:
/// * [question] 
/// * [query] 
/// * [rewriteQuery] 
/// * [topK] 
/// * [threshold] 
/// * [page] 
/// * [highlight] 
@BuiltValue()
abstract class AiAdminServicesKnowledgeDtosTestReqDto implements Built<AiAdminServicesKnowledgeDtosTestReqDto, AiAdminServicesKnowledgeDtosTestReqDtoBuilder> {
  @BuiltValueField(wireName: r'question')
  String? get question;

  @BuiltValueField(wireName: r'query')
  String? get query;

  @BuiltValueField(wireName: r'rewriteQuery')
  String? get rewriteQuery;

  @BuiltValueField(wireName: r'topK')
  int? get topK;

  @BuiltValueField(wireName: r'threshold')
  double? get threshold;

  @BuiltValueField(wireName: r'page')
  int? get page;

  @BuiltValueField(wireName: r'highlight')
  bool? get highlight;

  AiAdminServicesKnowledgeDtosTestReqDto._();

  factory AiAdminServicesKnowledgeDtosTestReqDto([void updates(AiAdminServicesKnowledgeDtosTestReqDtoBuilder b)]) = _$AiAdminServicesKnowledgeDtosTestReqDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesKnowledgeDtosTestReqDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesKnowledgeDtosTestReqDto> get serializer => _$AiAdminServicesKnowledgeDtosTestReqDtoSerializer();
}

class _$AiAdminServicesKnowledgeDtosTestReqDtoSerializer implements PrimitiveSerializer<AiAdminServicesKnowledgeDtosTestReqDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesKnowledgeDtosTestReqDto, _$AiAdminServicesKnowledgeDtosTestReqDto];

  @override
  final String wireName = r'AiAdminServicesKnowledgeDtosTestReqDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesKnowledgeDtosTestReqDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.question != null) {
      yield r'question';
      yield serializers.serialize(
        object.question,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.query != null) {
      yield r'query';
      yield serializers.serialize(
        object.query,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.rewriteQuery != null) {
      yield r'rewriteQuery';
      yield serializers.serialize(
        object.rewriteQuery,
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
    if (object.page != null) {
      yield r'page';
      yield serializers.serialize(
        object.page,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.highlight != null) {
      yield r'highlight';
      yield serializers.serialize(
        object.highlight,
        specifiedType: const FullType.nullable(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesKnowledgeDtosTestReqDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesKnowledgeDtosTestReqDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'question':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.question = valueDes;
          break;
        case r'query':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.query = valueDes;
          break;
        case r'rewriteQuery':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.rewriteQuery = valueDes;
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
        case r'page':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.page = valueDes;
          break;
        case r'highlight':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.highlight = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesKnowledgeDtosTestReqDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesKnowledgeDtosTestReqDtoBuilder();
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

