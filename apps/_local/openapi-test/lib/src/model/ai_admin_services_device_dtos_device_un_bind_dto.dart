//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_device_dtos_device_un_bind_dto.g.dart';

/// AiAdminServicesDeviceDtosDeviceUnBindDto
///
/// Properties:
/// * [deviceId] 
@BuiltValue()
abstract class AiAdminServicesDeviceDtosDeviceUnBindDto implements Built<AiAdminServicesDeviceDtosDeviceUnBindDto, AiAdminServicesDeviceDtosDeviceUnBindDtoBuilder> {
  @BuiltValueField(wireName: r'deviceId')
  String? get deviceId;

  AiAdminServicesDeviceDtosDeviceUnBindDto._();

  factory AiAdminServicesDeviceDtosDeviceUnBindDto([void updates(AiAdminServicesDeviceDtosDeviceUnBindDtoBuilder b)]) = _$AiAdminServicesDeviceDtosDeviceUnBindDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesDeviceDtosDeviceUnBindDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesDeviceDtosDeviceUnBindDto> get serializer => _$AiAdminServicesDeviceDtosDeviceUnBindDtoSerializer();
}

class _$AiAdminServicesDeviceDtosDeviceUnBindDtoSerializer implements PrimitiveSerializer<AiAdminServicesDeviceDtosDeviceUnBindDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesDeviceDtosDeviceUnBindDto, _$AiAdminServicesDeviceDtosDeviceUnBindDto];

  @override
  final String wireName = r'AiAdminServicesDeviceDtosDeviceUnBindDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesDeviceDtosDeviceUnBindDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.deviceId != null) {
      yield r'deviceId';
      yield serializers.serialize(
        object.deviceId,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesDeviceDtosDeviceUnBindDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesDeviceDtosDeviceUnBindDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'deviceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.deviceId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesDeviceDtosDeviceUnBindDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesDeviceDtosDeviceUnBindDtoBuilder();
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

