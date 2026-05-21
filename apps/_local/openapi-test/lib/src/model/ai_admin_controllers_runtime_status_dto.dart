//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/ai_admin_controllers_runtime_service_status_dto.dart';
import 'package:openapi/src/model/ai_admin_services_runtime_runtime_readiness_snapshot_dto.dart';
import 'package:openapi/src/model/ai_admin_services_runtime_conversation_runtime_trace_snapshot_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_controllers_runtime_status_dto.g.dart';

/// AiAdminControllersRuntimeStatusDto
///
/// Properties:
/// * [nodeId] 
/// * [runtimeEnabled] 
/// * [nodeStartedAtUtc] 
/// * [onlineDeviceCount] 
/// * [activeConversationCount] 
/// * [aliveConversationCount] 
/// * [udpSessionCount] 
/// * [localSpeechIdleTimeoutMs] 
/// * [services] 
/// * [conversationTrace] 
/// * [readiness] 
@BuiltValue()
abstract class AiAdminControllersRuntimeStatusDto implements Built<AiAdminControllersRuntimeStatusDto, AiAdminControllersRuntimeStatusDtoBuilder> {
  @BuiltValueField(wireName: r'nodeId')
  String? get nodeId;

  @BuiltValueField(wireName: r'runtimeEnabled')
  bool? get runtimeEnabled;

  @BuiltValueField(wireName: r'nodeStartedAtUtc')
  DateTime? get nodeStartedAtUtc;

  @BuiltValueField(wireName: r'onlineDeviceCount')
  int? get onlineDeviceCount;

  @BuiltValueField(wireName: r'activeConversationCount')
  int? get activeConversationCount;

  @BuiltValueField(wireName: r'aliveConversationCount')
  int? get aliveConversationCount;

  @BuiltValueField(wireName: r'udpSessionCount')
  int? get udpSessionCount;

  @BuiltValueField(wireName: r'localSpeechIdleTimeoutMs')
  int? get localSpeechIdleTimeoutMs;

  @BuiltValueField(wireName: r'services')
  BuiltList<AiAdminControllersRuntimeServiceStatusDto>? get services;

  @BuiltValueField(wireName: r'conversationTrace')
  AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto? get conversationTrace;

  @BuiltValueField(wireName: r'readiness')
  AiAdminServicesRuntimeRuntimeReadinessSnapshotDto? get readiness;

  AiAdminControllersRuntimeStatusDto._();

  factory AiAdminControllersRuntimeStatusDto([void updates(AiAdminControllersRuntimeStatusDtoBuilder b)]) = _$AiAdminControllersRuntimeStatusDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminControllersRuntimeStatusDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminControllersRuntimeStatusDto> get serializer => _$AiAdminControllersRuntimeStatusDtoSerializer();
}

class _$AiAdminControllersRuntimeStatusDtoSerializer implements PrimitiveSerializer<AiAdminControllersRuntimeStatusDto> {
  @override
  final Iterable<Type> types = const [AiAdminControllersRuntimeStatusDto, _$AiAdminControllersRuntimeStatusDto];

  @override
  final String wireName = r'AiAdminControllersRuntimeStatusDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminControllersRuntimeStatusDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.nodeId != null) {
      yield r'nodeId';
      yield serializers.serialize(
        object.nodeId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.runtimeEnabled != null) {
      yield r'runtimeEnabled';
      yield serializers.serialize(
        object.runtimeEnabled,
        specifiedType: const FullType(bool),
      );
    }
    if (object.nodeStartedAtUtc != null) {
      yield r'nodeStartedAtUtc';
      yield serializers.serialize(
        object.nodeStartedAtUtc,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.onlineDeviceCount != null) {
      yield r'onlineDeviceCount';
      yield serializers.serialize(
        object.onlineDeviceCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.activeConversationCount != null) {
      yield r'activeConversationCount';
      yield serializers.serialize(
        object.activeConversationCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.aliveConversationCount != null) {
      yield r'aliveConversationCount';
      yield serializers.serialize(
        object.aliveConversationCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.udpSessionCount != null) {
      yield r'udpSessionCount';
      yield serializers.serialize(
        object.udpSessionCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.localSpeechIdleTimeoutMs != null) {
      yield r'localSpeechIdleTimeoutMs';
      yield serializers.serialize(
        object.localSpeechIdleTimeoutMs,
        specifiedType: const FullType(int),
      );
    }
    if (object.services != null) {
      yield r'services';
      yield serializers.serialize(
        object.services,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminControllersRuntimeServiceStatusDto)]),
      );
    }
    if (object.conversationTrace != null) {
      yield r'conversationTrace';
      yield serializers.serialize(
        object.conversationTrace,
        specifiedType: const FullType(AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto),
      );
    }
    if (object.readiness != null) {
      yield r'readiness';
      yield serializers.serialize(
        object.readiness,
        specifiedType: const FullType(AiAdminServicesRuntimeRuntimeReadinessSnapshotDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminControllersRuntimeStatusDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminControllersRuntimeStatusDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'nodeId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.nodeId = valueDes;
          break;
        case r'runtimeEnabled':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.runtimeEnabled = valueDes;
          break;
        case r'nodeStartedAtUtc':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.nodeStartedAtUtc = valueDes;
          break;
        case r'onlineDeviceCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.onlineDeviceCount = valueDes;
          break;
        case r'activeConversationCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.activeConversationCount = valueDes;
          break;
        case r'aliveConversationCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.aliveConversationCount = valueDes;
          break;
        case r'udpSessionCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.udpSessionCount = valueDes;
          break;
        case r'localSpeechIdleTimeoutMs':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.localSpeechIdleTimeoutMs = valueDes;
          break;
        case r'services':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminControllersRuntimeServiceStatusDto)]),
          ) as BuiltList<AiAdminControllersRuntimeServiceStatusDto>?;
          if (valueDes == null) continue;
          result.services.replace(valueDes);
          break;
        case r'conversationTrace':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto),
          ) as AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto;
          result.conversationTrace.replace(valueDes);
          break;
        case r'readiness':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesRuntimeRuntimeReadinessSnapshotDto),
          ) as AiAdminServicesRuntimeRuntimeReadinessSnapshotDto;
          result.readiness.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminControllersRuntimeStatusDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminControllersRuntimeStatusDtoBuilder();
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

