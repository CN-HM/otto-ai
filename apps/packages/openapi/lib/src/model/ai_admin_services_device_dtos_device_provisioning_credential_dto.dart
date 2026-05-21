//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_device_dtos_device_provisioning_credential_dto.g.dart';

/// AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto
///
/// Properties:
/// * [deviceEntityId] 
/// * [deviceId] 
/// * [credentialId] 
/// * [credentialSecret] 
/// * [provisioningServiceUuid] 
/// * [provisioningCharacteristicUuid] 
/// * [envelopeJson] 
/// * [message] 
@BuiltValue()
abstract class AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto implements Built<AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto, AiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoBuilder> {
  @BuiltValueField(wireName: r'deviceEntityId')
  String? get deviceEntityId;

  @BuiltValueField(wireName: r'deviceId')
  String? get deviceId;

  @BuiltValueField(wireName: r'credentialId')
  String? get credentialId;

  @BuiltValueField(wireName: r'credentialSecret')
  String? get credentialSecret;

  @BuiltValueField(wireName: r'provisioningServiceUuid')
  String? get provisioningServiceUuid;

  @BuiltValueField(wireName: r'provisioningCharacteristicUuid')
  String? get provisioningCharacteristicUuid;

  @BuiltValueField(wireName: r'envelopeJson')
  String? get envelopeJson;

  @BuiltValueField(wireName: r'message')
  String? get message;

  AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto._();

  factory AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto([void updates(AiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoBuilder b)]) = _$AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto> get serializer => _$AiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoSerializer();
}

class _$AiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoSerializer implements PrimitiveSerializer<AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto, _$AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto];

  @override
  final String wireName = r'AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto object, {
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
    if (object.credentialId != null) {
      yield r'credentialId';
      yield serializers.serialize(
        object.credentialId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.credentialSecret != null) {
      yield r'credentialSecret';
      yield serializers.serialize(
        object.credentialSecret,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.provisioningServiceUuid != null) {
      yield r'provisioningServiceUuid';
      yield serializers.serialize(
        object.provisioningServiceUuid,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.provisioningCharacteristicUuid != null) {
      yield r'provisioningCharacteristicUuid';
      yield serializers.serialize(
        object.provisioningCharacteristicUuid,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.envelopeJson != null) {
      yield r'envelopeJson';
      yield serializers.serialize(
        object.envelopeJson,
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
    AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoBuilder result,
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
        case r'credentialId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.credentialId = valueDes;
          break;
        case r'credentialSecret':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.credentialSecret = valueDes;
          break;
        case r'provisioningServiceUuid':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.provisioningServiceUuid = valueDes;
          break;
        case r'provisioningCharacteristicUuid':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.provisioningCharacteristicUuid = valueDes;
          break;
        case r'envelopeJson':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.envelopeJson = valueDes;
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
  AiAdminServicesDeviceDtosDeviceProvisioningCredentialDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesDeviceDtosDeviceProvisioningCredentialDtoBuilder();
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

