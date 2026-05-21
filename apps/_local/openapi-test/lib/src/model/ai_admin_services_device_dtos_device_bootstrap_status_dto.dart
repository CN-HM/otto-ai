//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_device_dtos_device_bootstrap_status_dto.g.dart';

/// AiAdminServicesDeviceDtosDeviceBootstrapStatusDto
///
/// Properties:
/// * [deviceEntityId] 
/// * [deviceId] 
/// * [isBound] 
/// * [agentRoleId] 
/// * [message] 
@BuiltValue()
abstract class AiAdminServicesDeviceDtosDeviceBootstrapStatusDto implements Built<AiAdminServicesDeviceDtosDeviceBootstrapStatusDto, AiAdminServicesDeviceDtosDeviceBootstrapStatusDtoBuilder> {
  @BuiltValueField(wireName: r'deviceEntityId')
  String? get deviceEntityId;

  @BuiltValueField(wireName: r'deviceId')
  String? get deviceId;

  @BuiltValueField(wireName: r'isBound')
  bool? get isBound;

  @BuiltValueField(wireName: r'agentRoleId')
  String? get agentRoleId;

  @BuiltValueField(wireName: r'message')
  String? get message;

  AiAdminServicesDeviceDtosDeviceBootstrapStatusDto._();

  factory AiAdminServicesDeviceDtosDeviceBootstrapStatusDto([void updates(AiAdminServicesDeviceDtosDeviceBootstrapStatusDtoBuilder b)]) = _$AiAdminServicesDeviceDtosDeviceBootstrapStatusDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesDeviceDtosDeviceBootstrapStatusDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesDeviceDtosDeviceBootstrapStatusDto> get serializer => _$AiAdminServicesDeviceDtosDeviceBootstrapStatusDtoSerializer();
}

class _$AiAdminServicesDeviceDtosDeviceBootstrapStatusDtoSerializer implements PrimitiveSerializer<AiAdminServicesDeviceDtosDeviceBootstrapStatusDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesDeviceDtosDeviceBootstrapStatusDto, _$AiAdminServicesDeviceDtosDeviceBootstrapStatusDto];

  @override
  final String wireName = r'AiAdminServicesDeviceDtosDeviceBootstrapStatusDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesDeviceDtosDeviceBootstrapStatusDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.deviceEntityId != null) {
      yield r'deviceEntityId';
      yield serializers.serialize(
        object.deviceEntityId,
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
    if (object.isBound != null) {
      yield r'isBound';
      yield serializers.serialize(
        object.isBound,
        specifiedType: const FullType(bool),
      );
    }
    if (object.agentRoleId != null) {
      yield r'agentRoleId';
      yield serializers.serialize(
        object.agentRoleId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.message != null) {
      yield r'message';
      yield serializers.serialize(
        object.message,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesDeviceDtosDeviceBootstrapStatusDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesDeviceDtosDeviceBootstrapStatusDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'deviceEntityId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.deviceEntityId = valueDes;
          break;
        case r'deviceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.deviceId = valueDes;
          break;
        case r'isBound':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isBound = valueDes;
          break;
        case r'agentRoleId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.agentRoleId = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.message = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesDeviceDtosDeviceBootstrapStatusDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesDeviceDtosDeviceBootstrapStatusDtoBuilder();
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

