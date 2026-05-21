//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_controllers_device_status_request.g.dart';

/// AiAdminControllersDeviceStatusRequest
///
/// Properties:
/// * [macAddress] 
/// * [isOnline] 
@BuiltValue()
abstract class AiAdminControllersDeviceStatusRequest implements Built<AiAdminControllersDeviceStatusRequest, AiAdminControllersDeviceStatusRequestBuilder> {
  @BuiltValueField(wireName: r'macAddress')
  String? get macAddress;

  @BuiltValueField(wireName: r'isOnline')
  bool? get isOnline;

  AiAdminControllersDeviceStatusRequest._();

  factory AiAdminControllersDeviceStatusRequest([void updates(AiAdminControllersDeviceStatusRequestBuilder b)]) = _$AiAdminControllersDeviceStatusRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminControllersDeviceStatusRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminControllersDeviceStatusRequest> get serializer => _$AiAdminControllersDeviceStatusRequestSerializer();
}

class _$AiAdminControllersDeviceStatusRequestSerializer implements PrimitiveSerializer<AiAdminControllersDeviceStatusRequest> {
  @override
  final Iterable<Type> types = const [AiAdminControllersDeviceStatusRequest, _$AiAdminControllersDeviceStatusRequest];

  @override
  final String wireName = r'AiAdminControllersDeviceStatusRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminControllersDeviceStatusRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.macAddress != null) {
      yield r'macAddress';
      yield serializers.serialize(
        object.macAddress,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.isOnline != null) {
      yield r'isOnline';
      yield serializers.serialize(
        object.isOnline,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminControllersDeviceStatusRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminControllersDeviceStatusRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'macAddress':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.macAddress = valueDes;
          break;
        case r'isOnline':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isOnline = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminControllersDeviceStatusRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminControllersDeviceStatusRequestBuilder();
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

