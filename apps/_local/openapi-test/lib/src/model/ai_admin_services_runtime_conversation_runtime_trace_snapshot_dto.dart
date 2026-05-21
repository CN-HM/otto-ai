//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_runtime_conversation_stage_aggregate_dto.dart';
import 'package:openapi/src/model/ai_admin_services_runtime_conversation_turn_trace_summary_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_runtime_conversation_runtime_trace_snapshot_dto.g.dart';

/// AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto
///
/// Properties:
/// * [totalStageCount] 
/// * [successfulStageCount] 
/// * [failedStageCount] 
/// * [fallbackStageCount] 
/// * [stageAggregates] 
/// * [recentTurns] 
@BuiltValue()
abstract class AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto implements Built<AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto, AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDtoBuilder> {
  @BuiltValueField(wireName: r'totalStageCount')
  int? get totalStageCount;

  @BuiltValueField(wireName: r'successfulStageCount')
  int? get successfulStageCount;

  @BuiltValueField(wireName: r'failedStageCount')
  int? get failedStageCount;

  @BuiltValueField(wireName: r'fallbackStageCount')
  int? get fallbackStageCount;

  @BuiltValueField(wireName: r'stageAggregates')
  BuiltList<AiAdminServicesRuntimeConversationStageAggregateDto>? get stageAggregates;

  @BuiltValueField(wireName: r'recentTurns')
  BuiltList<AiAdminServicesRuntimeConversationTurnTraceSummaryDto>? get recentTurns;

  AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto._();

  factory AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto([void updates(AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDtoBuilder b)]) = _$AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto> get serializer => _$AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDtoSerializer();
}

class _$AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDtoSerializer implements PrimitiveSerializer<AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto, _$AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto];

  @override
  final String wireName = r'AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.totalStageCount != null) {
      yield r'totalStageCount';
      yield serializers.serialize(
        object.totalStageCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.successfulStageCount != null) {
      yield r'successfulStageCount';
      yield serializers.serialize(
        object.successfulStageCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.failedStageCount != null) {
      yield r'failedStageCount';
      yield serializers.serialize(
        object.failedStageCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.fallbackStageCount != null) {
      yield r'fallbackStageCount';
      yield serializers.serialize(
        object.fallbackStageCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.stageAggregates != null) {
      yield r'stageAggregates';
      yield serializers.serialize(
        object.stageAggregates,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesRuntimeConversationStageAggregateDto)]),
      );
    }
    if (object.recentTurns != null) {
      yield r'recentTurns';
      yield serializers.serialize(
        object.recentTurns,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesRuntimeConversationTurnTraceSummaryDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'totalStageCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.totalStageCount = valueDes;
          break;
        case r'successfulStageCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.successfulStageCount = valueDes;
          break;
        case r'failedStageCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.failedStageCount = valueDes;
          break;
        case r'fallbackStageCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.fallbackStageCount = valueDes;
          break;
        case r'stageAggregates':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesRuntimeConversationStageAggregateDto)]),
          ) as BuiltList<AiAdminServicesRuntimeConversationStageAggregateDto>?;
          if (valueDes == null) continue;
          result.stageAggregates.replace(valueDes);
          break;
        case r'recentTurns':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesRuntimeConversationTurnTraceSummaryDto)]),
          ) as BuiltList<AiAdminServicesRuntimeConversationTurnTraceSummaryDto>?;
          if (valueDes == null) continue;
          result.recentTurns.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDtoBuilder();
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

