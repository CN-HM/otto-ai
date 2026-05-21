//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_memory_dtos_memory_search_hit_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_memory_dtos_memory_runtime_context_dto.g.dart';

/// AiAdminServicesMemoryDtosMemoryRuntimeContextDto
///
/// Properties:
/// * [libraryId] 
/// * [libraryName] 
/// * [entityScope] 
/// * [entityId] 
/// * [topK] 
/// * [minScore] 
/// * [intentRecall] 
/// * [queryRewrite] 
/// * [rerank] 
/// * [records] 
@BuiltValue()
abstract class AiAdminServicesMemoryDtosMemoryRuntimeContextDto implements Built<AiAdminServicesMemoryDtosMemoryRuntimeContextDto, AiAdminServicesMemoryDtosMemoryRuntimeContextDtoBuilder> {
  @BuiltValueField(wireName: r'libraryId')
  String? get libraryId;

  @BuiltValueField(wireName: r'libraryName')
  String? get libraryName;

  @BuiltValueField(wireName: r'entityScope')
  String? get entityScope;

  @BuiltValueField(wireName: r'entityId')
  String? get entityId;

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

  @BuiltValueField(wireName: r'records')
  BuiltList<AiAdminServicesMemoryDtosMemorySearchHitDto>? get records;

  AiAdminServicesMemoryDtosMemoryRuntimeContextDto._();

  factory AiAdminServicesMemoryDtosMemoryRuntimeContextDto([void updates(AiAdminServicesMemoryDtosMemoryRuntimeContextDtoBuilder b)]) = _$AiAdminServicesMemoryDtosMemoryRuntimeContextDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesMemoryDtosMemoryRuntimeContextDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesMemoryDtosMemoryRuntimeContextDto> get serializer => _$AiAdminServicesMemoryDtosMemoryRuntimeContextDtoSerializer();
}

class _$AiAdminServicesMemoryDtosMemoryRuntimeContextDtoSerializer implements PrimitiveSerializer<AiAdminServicesMemoryDtosMemoryRuntimeContextDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesMemoryDtosMemoryRuntimeContextDto, _$AiAdminServicesMemoryDtosMemoryRuntimeContextDto];

  @override
  final String wireName = r'AiAdminServicesMemoryDtosMemoryRuntimeContextDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesMemoryDtosMemoryRuntimeContextDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.libraryId != null) {
      yield r'libraryId';
      yield serializers.serialize(
        object.libraryId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.libraryName != null) {
      yield r'libraryName';
      yield serializers.serialize(
        object.libraryName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.entityScope != null) {
      yield r'entityScope';
      yield serializers.serialize(
        object.entityScope,
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
        specifiedType: const FullType.nullable(double),
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
    if (object.records != null) {
      yield r'records';
      yield serializers.serialize(
        object.records,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesMemoryDtosMemorySearchHitDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesMemoryDtosMemoryRuntimeContextDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesMemoryDtosMemoryRuntimeContextDtoBuilder result,
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
        case r'libraryName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.libraryName = valueDes;
          break;
        case r'entityScope':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.entityScope = valueDes;
          break;
        case r'entityId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.entityId = valueDes;
          break;
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
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
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
        case r'records':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesMemoryDtosMemorySearchHitDto)]),
          ) as BuiltList<AiAdminServicesMemoryDtosMemorySearchHitDto>?;
          if (valueDes == null) continue;
          result.records.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesMemoryDtosMemoryRuntimeContextDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesMemoryDtosMemoryRuntimeContextDtoBuilder();
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

