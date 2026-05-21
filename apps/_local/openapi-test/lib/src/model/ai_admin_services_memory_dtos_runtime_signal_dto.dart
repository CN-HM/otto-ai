//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_memory_dtos_runtime_signal_dto.g.dart';

/// AiAdminServicesMemoryDtosRuntimeSignalDto
///
/// Properties:
/// * [id] 
/// * [signalType] 
/// * [signalCode] 
/// * [severity] 
/// * [status] 
/// * [userId] 
/// * [deviceId] 
/// * [agentRoleId] 
/// * [sessionId] 
/// * [sourceRunId] 
/// * [sourceText] 
/// * [payloadJson] 
/// * [scheduledAt] 
/// * [processedAt] 
/// * [dedupeKey] 
/// * [retryCount] 
/// * [errorMessage] 
/// * [createdAt] 
/// * [updatedAt] 
@BuiltValue()
abstract class AiAdminServicesMemoryDtosRuntimeSignalDto implements Built<AiAdminServicesMemoryDtosRuntimeSignalDto, AiAdminServicesMemoryDtosRuntimeSignalDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'signalType')
  String? get signalType;

  @BuiltValueField(wireName: r'signalCode')
  String? get signalCode;

  @BuiltValueField(wireName: r'severity')
  String? get severity;

  @BuiltValueField(wireName: r'status')
  String? get status;

  @BuiltValueField(wireName: r'userId')
  int? get userId;

  @BuiltValueField(wireName: r'deviceId')
  String? get deviceId;

  @BuiltValueField(wireName: r'agentRoleId')
  String? get agentRoleId;

  @BuiltValueField(wireName: r'sessionId')
  String? get sessionId;

  @BuiltValueField(wireName: r'sourceRunId')
  String? get sourceRunId;

  @BuiltValueField(wireName: r'sourceText')
  String? get sourceText;

  @BuiltValueField(wireName: r'payloadJson')
  String? get payloadJson;

  @BuiltValueField(wireName: r'scheduledAt')
  String? get scheduledAt;

  @BuiltValueField(wireName: r'processedAt')
  String? get processedAt;

  @BuiltValueField(wireName: r'dedupeKey')
  String? get dedupeKey;

  @BuiltValueField(wireName: r'retryCount')
  int? get retryCount;

  @BuiltValueField(wireName: r'errorMessage')
  String? get errorMessage;

  @BuiltValueField(wireName: r'createdAt')
  String? get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  String? get updatedAt;

  AiAdminServicesMemoryDtosRuntimeSignalDto._();

  factory AiAdminServicesMemoryDtosRuntimeSignalDto([void updates(AiAdminServicesMemoryDtosRuntimeSignalDtoBuilder b)]) = _$AiAdminServicesMemoryDtosRuntimeSignalDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesMemoryDtosRuntimeSignalDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesMemoryDtosRuntimeSignalDto> get serializer => _$AiAdminServicesMemoryDtosRuntimeSignalDtoSerializer();
}

class _$AiAdminServicesMemoryDtosRuntimeSignalDtoSerializer implements PrimitiveSerializer<AiAdminServicesMemoryDtosRuntimeSignalDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesMemoryDtosRuntimeSignalDto, _$AiAdminServicesMemoryDtosRuntimeSignalDto];

  @override
  final String wireName = r'AiAdminServicesMemoryDtosRuntimeSignalDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesMemoryDtosRuntimeSignalDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.signalType != null) {
      yield r'signalType';
      yield serializers.serialize(
        object.signalType,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.signalCode != null) {
      yield r'signalCode';
      yield serializers.serialize(
        object.signalCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.severity != null) {
      yield r'severity';
      yield serializers.serialize(
        object.severity,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.userId != null) {
      yield r'userId';
      yield serializers.serialize(
        object.userId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.deviceId != null) {
      yield r'deviceId';
      yield serializers.serialize(
        object.deviceId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.agentRoleId != null) {
      yield r'agentRoleId';
      yield serializers.serialize(
        object.agentRoleId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.sessionId != null) {
      yield r'sessionId';
      yield serializers.serialize(
        object.sessionId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.sourceRunId != null) {
      yield r'sourceRunId';
      yield serializers.serialize(
        object.sourceRunId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.sourceText != null) {
      yield r'sourceText';
      yield serializers.serialize(
        object.sourceText,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.payloadJson != null) {
      yield r'payloadJson';
      yield serializers.serialize(
        object.payloadJson,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.scheduledAt != null) {
      yield r'scheduledAt';
      yield serializers.serialize(
        object.scheduledAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.processedAt != null) {
      yield r'processedAt';
      yield serializers.serialize(
        object.processedAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.dedupeKey != null) {
      yield r'dedupeKey';
      yield serializers.serialize(
        object.dedupeKey,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.retryCount != null) {
      yield r'retryCount';
      yield serializers.serialize(
        object.retryCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.errorMessage != null) {
      yield r'errorMessage';
      yield serializers.serialize(
        object.errorMessage,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.createdAt != null) {
      yield r'createdAt';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.updatedAt != null) {
      yield r'updatedAt';
      yield serializers.serialize(
        object.updatedAt,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesMemoryDtosRuntimeSignalDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesMemoryDtosRuntimeSignalDtoBuilder result,
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
        case r'signalType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.signalType = valueDes;
          break;
        case r'signalCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.signalCode = valueDes;
          break;
        case r'severity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.severity = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.status = valueDes;
          break;
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.userId = valueDes;
          break;
        case r'deviceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.deviceId = valueDes;
          break;
        case r'agentRoleId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.agentRoleId = valueDes;
          break;
        case r'sessionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sessionId = valueDes;
          break;
        case r'sourceRunId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sourceRunId = valueDes;
          break;
        case r'sourceText':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sourceText = valueDes;
          break;
        case r'payloadJson':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.payloadJson = valueDes;
          break;
        case r'scheduledAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.scheduledAt = valueDes;
          break;
        case r'processedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.processedAt = valueDes;
          break;
        case r'dedupeKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.dedupeKey = valueDes;
          break;
        case r'retryCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.retryCount = valueDes;
          break;
        case r'errorMessage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.errorMessage = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.createdAt = valueDes;
          break;
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.updatedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesMemoryDtosRuntimeSignalDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesMemoryDtosRuntimeSignalDtoBuilder();
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

