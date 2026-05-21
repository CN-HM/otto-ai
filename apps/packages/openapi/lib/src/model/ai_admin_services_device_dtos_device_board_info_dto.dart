//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_device_dtos_device_board_info_dto.g.dart';

/// AiAdminServicesDeviceDtosDeviceBoardInfoDto
///
/// Properties:
/// * [name] 
@BuiltValue()
abstract class AiAdminServicesDeviceDtosDeviceBoardInfoDto implements Built<AiAdminServicesDeviceDtosDeviceBoardInfoDto, AiAdminServicesDeviceDtosDeviceBoardInfoDtoBuilder> {
  @BuiltValueField(wireName: r'name')
  String? get name;

  AiAdminServicesDeviceDtosDeviceBoardInfoDto._();

  factory AiAdminServicesDeviceDtosDeviceBoardInfoDto([void updates(AiAdminServicesDeviceDtosDeviceBoardInfoDtoBuilder b)]) = _$AiAdminServicesDeviceDtosDeviceBoardInfoDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesDeviceDtosDeviceBoardInfoDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesDeviceDtosDeviceBoardInfoDto> get serializer => _$AiAdminServicesDeviceDtosDeviceBoardInfoDtoSerializer();
}

class _$AiAdminServicesDeviceDtosDeviceBoardInfoDtoSerializer implements PrimitiveSerializer<AiAdminServicesDeviceDtosDeviceBoardInfoDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesDeviceDtosDeviceBoardInfoDto, _$AiAdminServicesDeviceDtosDeviceBoardInfoDto];

  @override
  final String wireName = r'AiAdminServicesDeviceDtosDeviceBoardInfoDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesDeviceDtosDeviceBoardInfoDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesDeviceDtosDeviceBoardInfoDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesDeviceDtosDeviceBoardInfoDtoBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesDeviceDtosDeviceBoardInfoDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesDeviceDtosDeviceBoardInfoDtoBuilder();
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

