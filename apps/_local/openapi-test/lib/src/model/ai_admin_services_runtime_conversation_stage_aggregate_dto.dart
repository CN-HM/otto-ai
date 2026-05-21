//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_runtime_conversation_stage_aggregate_dto.g.dart';

/// AiAdminServicesRuntimeConversationStageAggregateDto
///
/// Properties:
/// * [stage] 
/// * [totalCount] 
/// * [successfulCount] 
/// * [failedCount] 
/// * [fallbackCount] 
/// * [lastSeenAtUtc] 
@BuiltValue()
abstract class AiAdminServicesRuntimeConversationStageAggregateDto implements Built<AiAdminServicesRuntimeConversationStageAggregateDto, AiAdminServicesRuntimeConversationStageAggregateDtoBuilder> {
  @BuiltValueField(wireName: r'stage')
  String? get stage;

  @BuiltValueField(wireName: r'totalCount')
  int? get totalCount;

  @BuiltValueField(wireName: r'successfulCount')
  int? get successfulCount;

  @BuiltValueField(wireName: r'failedCount')
  int? get failedCount;

  @BuiltValueField(wireName: r'fallbackCount')
  int? get fallbackCount;

  @BuiltValueField(wireName: r'lastSeenAtUtc')
  DateTime? get lastSeenAtUtc;

  AiAdminServicesRuntimeConversationStageAggregateDto._();

  factory AiAdminServicesRuntimeConversationStageAggregateDto([void updates(AiAdminServicesRuntimeConversationStageAggregateDtoBuilder b)]) = _$AiAdminServicesRuntimeConversationStageAggregateDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesRuntimeConversationStageAggregateDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesRuntimeConversationStageAggregateDto> get serializer => _$AiAdminServicesRuntimeConversationStageAggregateDtoSerializer();
}

class _$AiAdminServicesRuntimeConversationStageAggregateDtoSerializer implements PrimitiveSerializer<AiAdminServicesRuntimeConversationStageAggregateDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesRuntimeConversationStageAggregateDto, _$AiAdminServicesRuntimeConversationStageAggregateDto];

  @override
  final String wireName = r'AiAdminServicesRuntimeConversationStageAggregateDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesRuntimeConversationStageAggregateDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.stage != null) {
      yield r'stage';
      yield serializers.serialize(
        object.stage,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.totalCount != null) {
      yield r'totalCount';
      yield serializers.serialize(
        object.totalCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.successfulCount != null) {
      yield r'successfulCount';
      yield serializers.serialize(
        object.successfulCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.failedCount != null) {
      yield r'failedCount';
      yield serializers.serialize(
        object.failedCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.fallbackCount != null) {
      yield r'fallbackCount';
      yield serializers.serialize(
        object.fallbackCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.lastSeenAtUtc != null) {
      yield r'lastSeenAtUtc';
      yield serializers.serialize(
        object.lastSeenAtUtc,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesRuntimeConversationStageAggregateDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesRuntimeConversationStageAggregateDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'stage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.stage = valueDes;
          break;
        case r'totalCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.totalCount = valueDes;
          break;
        case r'successfulCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.successfulCount = valueDes;
          break;
        case r'failedCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.failedCount = valueDes;
          break;
        case r'fallbackCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.fallbackCount = valueDes;
          break;
        case r'lastSeenAtUtc':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.lastSeenAtUtc = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesRuntimeConversationStageAggregateDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesRuntimeConversationStageAggregateDtoBuilder();
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

