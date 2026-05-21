//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_memory_dtos_memory_search_hit_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_memory_dtos_memory_search_result_dto.g.dart';

/// AiAdminServicesMemoryDtosMemorySearchResultDto
///
/// Properties:
/// * [libraryId] 
/// * [entityId] 
/// * [query] 
/// * [minScore] 
/// * [total] 
/// * [hits] 
@BuiltValue()
abstract class AiAdminServicesMemoryDtosMemorySearchResultDto implements Built<AiAdminServicesMemoryDtosMemorySearchResultDto, AiAdminServicesMemoryDtosMemorySearchResultDtoBuilder> {
  @BuiltValueField(wireName: r'libraryId')
  String? get libraryId;

  @BuiltValueField(wireName: r'entityId')
  String? get entityId;

  @BuiltValueField(wireName: r'query')
  String? get query;

  @BuiltValueField(wireName: r'minScore')
  double? get minScore;

  @BuiltValueField(wireName: r'total')
  int? get total;

  @BuiltValueField(wireName: r'hits')
  BuiltList<AiAdminServicesMemoryDtosMemorySearchHitDto>? get hits;

  AiAdminServicesMemoryDtosMemorySearchResultDto._();

  factory AiAdminServicesMemoryDtosMemorySearchResultDto([void updates(AiAdminServicesMemoryDtosMemorySearchResultDtoBuilder b)]) = _$AiAdminServicesMemoryDtosMemorySearchResultDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesMemoryDtosMemorySearchResultDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesMemoryDtosMemorySearchResultDto> get serializer => _$AiAdminServicesMemoryDtosMemorySearchResultDtoSerializer();
}

class _$AiAdminServicesMemoryDtosMemorySearchResultDtoSerializer implements PrimitiveSerializer<AiAdminServicesMemoryDtosMemorySearchResultDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesMemoryDtosMemorySearchResultDto, _$AiAdminServicesMemoryDtosMemorySearchResultDto];

  @override
  final String wireName = r'AiAdminServicesMemoryDtosMemorySearchResultDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesMemoryDtosMemorySearchResultDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.libraryId != null) {
      yield r'libraryId';
      yield serializers.serialize(
        object.libraryId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.entityId != null) {
      yield r'entityId';
      yield serializers.serialize(
        object.entityId,
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
    if (object.minScore != null) {
      yield r'minScore';
      yield serializers.serialize(
        object.minScore,
        specifiedType: const FullType(double),
      );
    }
    if (object.total != null) {
      yield r'total';
      yield serializers.serialize(
        object.total,
        specifiedType: const FullType(int),
      );
    }
    if (object.hits != null) {
      yield r'hits';
      yield serializers.serialize(
        object.hits,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesMemoryDtosMemorySearchHitDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesMemoryDtosMemorySearchResultDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesMemoryDtosMemorySearchResultDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'libraryId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.libraryId = valueDes;
          break;
        case r'entityId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.entityId = valueDes;
          break;
        case r'query':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.query = valueDes;
          break;
        case r'minScore':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.minScore = valueDes;
          break;
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.total = valueDes;
          break;
        case r'hits':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesMemoryDtosMemorySearchHitDto)]),
          ) as BuiltList<AiAdminServicesMemoryDtosMemorySearchHitDto>?;
          if (valueDes == null) continue;
          result.hits.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesMemoryDtosMemorySearchResultDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesMemoryDtosMemorySearchResultDtoBuilder();
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

