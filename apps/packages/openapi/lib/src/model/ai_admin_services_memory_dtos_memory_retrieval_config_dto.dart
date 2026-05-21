//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_memory_dtos_memory_retrieval_config_dto.g.dart';

/// AiAdminServicesMemoryDtosMemoryRetrievalConfigDto
///
/// Properties:
/// * [topK] 
/// * [minScore] 
/// * [intentRecall] 
/// * [queryRewrite] 
/// * [rerank] 
@BuiltValue()
abstract class AiAdminServicesMemoryDtosMemoryRetrievalConfigDto implements Built<AiAdminServicesMemoryDtosMemoryRetrievalConfigDto, AiAdminServicesMemoryDtosMemoryRetrievalConfigDtoBuilder> {
  @BuiltValueField(wireName: r'topK')
  int? get topK;

  @BuiltValueField(wireName: r'minScore')
  double? get minScore;

  @BuiltValueField(wireName: r'intentRecall')
  bool? get intentRecall;

  @BuiltValueField(wireName: r'queryRewrite')
  bool? get queryRewrite;

  @BuiltValueField(wireName: r'rerank')
  bool? get rerank;

  AiAdminServicesMemoryDtosMemoryRetrievalConfigDto._();

  factory AiAdminServicesMemoryDtosMemoryRetrievalConfigDto([void updates(AiAdminServicesMemoryDtosMemoryRetrievalConfigDtoBuilder b)]) = _$AiAdminServicesMemoryDtosMemoryRetrievalConfigDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesMemoryDtosMemoryRetrievalConfigDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesMemoryDtosMemoryRetrievalConfigDto> get serializer => _$AiAdminServicesMemoryDtosMemoryRetrievalConfigDtoSerializer();
}

class _$AiAdminServicesMemoryDtosMemoryRetrievalConfigDtoSerializer implements PrimitiveSerializer<AiAdminServicesMemoryDtosMemoryRetrievalConfigDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesMemoryDtosMemoryRetrievalConfigDto, _$AiAdminServicesMemoryDtosMemoryRetrievalConfigDto];

  @override
  final String wireName = r'AiAdminServicesMemoryDtosMemoryRetrievalConfigDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesMemoryDtosMemoryRetrievalConfigDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.topK != null) {
      yield r'topK';
      yield serializers.serialize(
        object.topK,
        specifiedType: const FullType(int),
      );
    }
    if (object.minScore != null) {
      yield r'minScore';
      yield serializers.serialize(
        object.minScore,
        specifiedType: const FullType(double),
      );
    }
    if (object.intentRecall != null) {
      yield r'intentRecall';
      yield serializers.serialize(
        object.intentRecall,
        specifiedType: const FullType(bool),
      );
    }
    if (object.queryRewrite != null) {
      yield r'queryRewrite';
      yield serializers.serialize(
        object.queryRewrite,
        specifiedType: const FullType(bool),
      );
    }
    if (object.rerank != null) {
      yield r'rerank';
      yield serializers.serialize(
        object.rerank,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesMemoryDtosMemoryRetrievalConfigDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesMemoryDtosMemoryRetrievalConfigDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'topK':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.topK = valueDes;
          break;
        case r'minScore':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.minScore = valueDes;
          break;
        case r'intentRecall':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.intentRecall = valueDes;
          break;
        case r'queryRewrite':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.queryRewrite = valueDes;
          break;
        case r'rerank':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.rerank = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesMemoryDtosMemoryRetrievalConfigDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesMemoryDtosMemoryRetrievalConfigDtoBuilder();
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

