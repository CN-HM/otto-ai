//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_device_dtos_device_tools_call_req_dto.g.dart';

/// AiAdminServicesDeviceDtosDeviceToolsCallReqDto
///
/// Properties:
/// * [name] 
/// * [arguments] 
@BuiltValue()
abstract class AiAdminServicesDeviceDtosDeviceToolsCallReqDto implements Built<AiAdminServicesDeviceDtosDeviceToolsCallReqDto, AiAdminServicesDeviceDtosDeviceToolsCallReqDtoBuilder> {
  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'arguments')
  BuiltMap<String, JsonObject?>? get arguments;

  AiAdminServicesDeviceDtosDeviceToolsCallReqDto._();

  factory AiAdminServicesDeviceDtosDeviceToolsCallReqDto([void updates(AiAdminServicesDeviceDtosDeviceToolsCallReqDtoBuilder b)]) = _$AiAdminServicesDeviceDtosDeviceToolsCallReqDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesDeviceDtosDeviceToolsCallReqDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesDeviceDtosDeviceToolsCallReqDto> get serializer => _$AiAdminServicesDeviceDtosDeviceToolsCallReqDtoSerializer();
}

class _$AiAdminServicesDeviceDtosDeviceToolsCallReqDtoSerializer implements PrimitiveSerializer<AiAdminServicesDeviceDtosDeviceToolsCallReqDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesDeviceDtosDeviceToolsCallReqDto, _$AiAdminServicesDeviceDtosDeviceToolsCallReqDto];

  @override
  final String wireName = r'AiAdminServicesDeviceDtosDeviceToolsCallReqDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesDeviceDtosDeviceToolsCallReqDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.arguments != null) {
      yield r'arguments';
      yield serializers.serialize(
        object.arguments,
        specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesDeviceDtosDeviceToolsCallReqDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesDeviceDtosDeviceToolsCallReqDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'arguments':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
          ) as BuiltMap<String, JsonObject?>?;
          if (valueDes == null) continue;
          result.arguments.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesDeviceDtosDeviceToolsCallReqDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesDeviceDtosDeviceToolsCallReqDtoBuilder();
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

