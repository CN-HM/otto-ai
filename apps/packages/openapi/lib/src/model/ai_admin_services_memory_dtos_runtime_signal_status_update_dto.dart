//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_memory_dtos_runtime_signal_status_update_dto.g.dart';

/// AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto
///
/// Properties:
/// * [status] 
/// * [errorMessage] 
/// * [scheduledAt] 
@BuiltValue()
abstract class AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto implements Built<AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto, AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDtoBuilder> {
  @BuiltValueField(wireName: r'status')
  String? get status;

  @BuiltValueField(wireName: r'errorMessage')
  String? get errorMessage;

  @BuiltValueField(wireName: r'scheduledAt')
  DateTime? get scheduledAt;

  AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto._();

  factory AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto([void updates(AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDtoBuilder b)]) = _$AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto> get serializer => _$AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDtoSerializer();
}

class _$AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDtoSerializer implements PrimitiveSerializer<AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto, _$AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto];

  @override
  final String wireName = r'AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.errorMessage != null) {
      yield r'errorMessage';
      yield serializers.serialize(
        object.errorMessage,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.scheduledAt != null) {
      yield r'scheduledAt';
      yield serializers.serialize(
        object.scheduledAt,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.status = valueDes;
          break;
        case r'errorMessage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.errorMessage = valueDes;
          break;
        case r'scheduledAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.scheduledAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDtoBuilder();
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

