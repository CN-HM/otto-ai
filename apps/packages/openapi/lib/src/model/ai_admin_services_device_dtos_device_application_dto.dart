//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_device_dtos_device_application_dto.g.dart';

/// AiAdminServicesDeviceDtosDeviceApplicationDto
///
/// Properties:
/// * [name] 
/// * [version] 
/// * [compileTime] 
/// * [idfVersion] 
@BuiltValue()
abstract class AiAdminServicesDeviceDtosDeviceApplicationDto implements Built<AiAdminServicesDeviceDtosDeviceApplicationDto, AiAdminServicesDeviceDtosDeviceApplicationDtoBuilder> {
  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'version')
  String? get version;

  @BuiltValueField(wireName: r'compile_time')
  String? get compileTime;

  @BuiltValueField(wireName: r'idf_version')
  String? get idfVersion;

  AiAdminServicesDeviceDtosDeviceApplicationDto._();

  factory AiAdminServicesDeviceDtosDeviceApplicationDto([void updates(AiAdminServicesDeviceDtosDeviceApplicationDtoBuilder b)]) = _$AiAdminServicesDeviceDtosDeviceApplicationDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesDeviceDtosDeviceApplicationDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesDeviceDtosDeviceApplicationDto> get serializer => _$AiAdminServicesDeviceDtosDeviceApplicationDtoSerializer();
}

class _$AiAdminServicesDeviceDtosDeviceApplicationDtoSerializer implements PrimitiveSerializer<AiAdminServicesDeviceDtosDeviceApplicationDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesDeviceDtosDeviceApplicationDto, _$AiAdminServicesDeviceDtosDeviceApplicationDto];

  @override
  final String wireName = r'AiAdminServicesDeviceDtosDeviceApplicationDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesDeviceDtosDeviceApplicationDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.version != null) {
      yield r'version';
      yield serializers.serialize(
        object.version,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.compileTime != null) {
      yield r'compile_time';
      yield serializers.serialize(
        object.compileTime,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.idfVersion != null) {
      yield r'idf_version';
      yield serializers.serialize(
        object.idfVersion,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesDeviceDtosDeviceApplicationDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesDeviceDtosDeviceApplicationDtoBuilder result,
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
        case r'version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.version = valueDes;
          break;
        case r'compile_time':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.compileTime = valueDes;
          break;
        case r'idf_version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.idfVersion = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesDeviceDtosDeviceApplicationDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesDeviceDtosDeviceApplicationDtoBuilder();
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

