//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_device_dtos_device_manual_add_dto.g.dart';

/// AiAdminServicesDeviceDtosDeviceManualAddDto
///
/// Properties:
/// * [agentRoleId] 
/// * [agentRoleReleaseId] 
/// * [board] 
/// * [appVersion] 
/// * [macAddress] 
@BuiltValue()
abstract class AiAdminServicesDeviceDtosDeviceManualAddDto implements Built<AiAdminServicesDeviceDtosDeviceManualAddDto, AiAdminServicesDeviceDtosDeviceManualAddDtoBuilder> {
  @BuiltValueField(wireName: r'agentRoleId')
  String? get agentRoleId;

  @BuiltValueField(wireName: r'agentRoleReleaseId')
  String? get agentRoleReleaseId;

  @BuiltValueField(wireName: r'board')
  String? get board;

  @BuiltValueField(wireName: r'appVersion')
  String? get appVersion;

  @BuiltValueField(wireName: r'macAddress')
  String? get macAddress;

  AiAdminServicesDeviceDtosDeviceManualAddDto._();

  factory AiAdminServicesDeviceDtosDeviceManualAddDto([void updates(AiAdminServicesDeviceDtosDeviceManualAddDtoBuilder b)]) = _$AiAdminServicesDeviceDtosDeviceManualAddDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesDeviceDtosDeviceManualAddDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesDeviceDtosDeviceManualAddDto> get serializer => _$AiAdminServicesDeviceDtosDeviceManualAddDtoSerializer();
}

class _$AiAdminServicesDeviceDtosDeviceManualAddDtoSerializer implements PrimitiveSerializer<AiAdminServicesDeviceDtosDeviceManualAddDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesDeviceDtosDeviceManualAddDto, _$AiAdminServicesDeviceDtosDeviceManualAddDto];

  @override
  final String wireName = r'AiAdminServicesDeviceDtosDeviceManualAddDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesDeviceDtosDeviceManualAddDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    if (object.board != null) {
      yield r'board';
      yield serializers.serialize(
        object.board,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.appVersion != null) {
      yield r'appVersion';
      yield serializers.serialize(
        object.appVersion,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.macAddress != null) {
      yield r'macAddress';
      yield serializers.serialize(
        object.macAddress,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesDeviceDtosDeviceManualAddDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesDeviceDtosDeviceManualAddDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
        case r'board':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.board = valueDes;
          break;
        case r'appVersion':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.appVersion = valueDes;
          break;
        case r'macAddress':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.macAddress = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesDeviceDtosDeviceManualAddDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesDeviceDtosDeviceManualAddDtoBuilder();
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

