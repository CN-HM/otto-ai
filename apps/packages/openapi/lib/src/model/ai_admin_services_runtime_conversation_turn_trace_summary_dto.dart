//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_runtime_conversation_turn_trace_summary_dto.g.dart';

/// AiAdminServicesRuntimeConversationTurnTraceSummaryDto
///
/// Properties:
/// * [recordedAtUtc] 
/// * [sessionId] 
/// * [deviceId] 
/// * [succeeded] 
/// * [stageCount] 
/// * [failedStageCount] 
/// * [fallbackStageCount] 
/// * [outcome] 
/// * [failureReason] 
/// * [errorCode] 
@BuiltValue()
abstract class AiAdminServicesRuntimeConversationTurnTraceSummaryDto implements Built<AiAdminServicesRuntimeConversationTurnTraceSummaryDto, AiAdminServicesRuntimeConversationTurnTraceSummaryDtoBuilder> {
  @BuiltValueField(wireName: r'recordedAtUtc')
  DateTime? get recordedAtUtc;

  @BuiltValueField(wireName: r'sessionId')
  String? get sessionId;

  @BuiltValueField(wireName: r'deviceId')
  String? get deviceId;

  @BuiltValueField(wireName: r'succeeded')
  bool? get succeeded;

  @BuiltValueField(wireName: r'stageCount')
  int? get stageCount;

  @BuiltValueField(wireName: r'failedStageCount')
  int? get failedStageCount;

  @BuiltValueField(wireName: r'fallbackStageCount')
  int? get fallbackStageCount;

  @BuiltValueField(wireName: r'outcome')
  String? get outcome;

  @BuiltValueField(wireName: r'failureReason')
  String? get failureReason;

  @BuiltValueField(wireName: r'errorCode')
  String? get errorCode;

  AiAdminServicesRuntimeConversationTurnTraceSummaryDto._();

  factory AiAdminServicesRuntimeConversationTurnTraceSummaryDto([void updates(AiAdminServicesRuntimeConversationTurnTraceSummaryDtoBuilder b)]) = _$AiAdminServicesRuntimeConversationTurnTraceSummaryDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesRuntimeConversationTurnTraceSummaryDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesRuntimeConversationTurnTraceSummaryDto> get serializer => _$AiAdminServicesRuntimeConversationTurnTraceSummaryDtoSerializer();
}

class _$AiAdminServicesRuntimeConversationTurnTraceSummaryDtoSerializer implements PrimitiveSerializer<AiAdminServicesRuntimeConversationTurnTraceSummaryDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesRuntimeConversationTurnTraceSummaryDto, _$AiAdminServicesRuntimeConversationTurnTraceSummaryDto];

  @override
  final String wireName = r'AiAdminServicesRuntimeConversationTurnTraceSummaryDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesRuntimeConversationTurnTraceSummaryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.recordedAtUtc != null) {
      yield r'recordedAtUtc';
      yield serializers.serialize(
        object.recordedAtUtc,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.sessionId != null) {
      yield r'sessionId';
      yield serializers.serialize(
        object.sessionId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.deviceId != null) {
      yield r'deviceId';
      yield serializers.serialize(
        object.deviceId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.succeeded != null) {
      yield r'succeeded';
      yield serializers.serialize(
        object.succeeded,
        specifiedType: const FullType(bool),
      );
    }
    if (object.stageCount != null) {
      yield r'stageCount';
      yield serializers.serialize(
        object.stageCount,
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
    if (object.outcome != null) {
      yield r'outcome';
      yield serializers.serialize(
        object.outcome,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.failureReason != null) {
      yield r'failureReason';
      yield serializers.serialize(
        object.failureReason,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.errorCode != null) {
      yield r'errorCode';
      yield serializers.serialize(
        object.errorCode,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesRuntimeConversationTurnTraceSummaryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesRuntimeConversationTurnTraceSummaryDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'recordedAtUtc':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.recordedAtUtc = valueDes;
          break;
        case r'sessionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sessionId = valueDes;
          break;
        case r'deviceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.deviceId = valueDes;
          break;
        case r'succeeded':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.succeeded = valueDes;
          break;
        case r'stageCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.stageCount = valueDes;
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
        case r'outcome':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.outcome = valueDes;
          break;
        case r'failureReason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.failureReason = valueDes;
          break;
        case r'errorCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.errorCode = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesRuntimeConversationTurnTraceSummaryDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesRuntimeConversationTurnTraceSummaryDtoBuilder();
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

