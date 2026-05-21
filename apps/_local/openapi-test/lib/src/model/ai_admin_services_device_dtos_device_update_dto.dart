//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_device_dtos_device_update_dto.g.dart';

/// AiAdminServicesDeviceDtosDeviceUpdateDto
///
/// Properties:
/// * [autoUpdate] 
/// * [alias] 
/// * [agentRoleId] 
/// * [agentRoleReleaseId] 
@BuiltValue()
abstract class AiAdminServicesDeviceDtosDeviceUpdateDto implements Built<AiAdminServicesDeviceDtosDeviceUpdateDto, AiAdminServicesDeviceDtosDeviceUpdateDtoBuilder> {
  @BuiltValueField(wireName: r'autoUpdate')
  int? get autoUpdate;

  @BuiltValueField(wireName: r'alias')
  String? get alias;

  @BuiltValueField(wireName: r'agentRoleId')
  String? get agentRoleId;

  @BuiltValueField(wireName: r'agentRoleReleaseId')
  String? get agentRoleReleaseId;

  AiAdminServicesDeviceDtosDeviceUpdateDto._();

  factory AiAdminServicesDeviceDtosDeviceUpdateDto([void updates(AiAdminServicesDeviceDtosDeviceUpdateDtoBuilder b)]) = _$AiAdminServicesDeviceDtosDeviceUpdateDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesDeviceDtosDeviceUpdateDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesDeviceDtosDeviceUpdateDto> get serializer => _$AiAdminServicesDeviceDtosDeviceUpdateDtoSerializer();
}

class _$AiAdminServicesDeviceDtosDeviceUpdateDtoSerializer implements PrimitiveSerializer<AiAdminServicesDeviceDtosDeviceUpdateDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesDeviceDtosDeviceUpdateDto, _$AiAdminServicesDeviceDtosDeviceUpdateDto];

  @override
  final String wireName = r'AiAdminServicesDeviceDtosDeviceUpdateDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesDeviceDtosDeviceUpdateDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.autoUpdate != null) {
      yield r'autoUpdate';
      yield serializers.serialize(
        object.autoUpdate,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.alias != null) {
      yield r'alias';
      yield serializers.serialize(
        object.alias,
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
    if (object.agentRoleReleaseId != null) {
      yield r'agentRoleReleaseId';
      yield serializers.serialize(
        object.agentRoleReleaseId,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesDeviceDtosDeviceUpdateDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesDeviceDtosDeviceUpdateDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'autoUpdate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.autoUpdate = valueDes;
          break;
        case r'alias':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.alias = valueDes;
          break;
        case r'agentRoleId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.agentRoleId = valueDes;
          break;
        case r'agentRoleReleaseId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.agentRoleReleaseId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesDeviceDtosDeviceUpdateDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesDeviceDtosDeviceUpdateDtoBuilder();
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

