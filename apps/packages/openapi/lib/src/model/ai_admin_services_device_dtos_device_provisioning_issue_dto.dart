//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_device_dtos_device_provisioning_issue_dto.g.dart';

/// AiAdminServicesDeviceDtosDeviceProvisioningIssueDto
///
/// Properties:
/// * [macAddress] 
/// * [alias] 
/// * [board] 
/// * [appVersion] 
/// * [agentRoleId] 
/// * [agentRoleReleaseId] 
/// * [rotateCredential] 
@BuiltValue()
abstract class AiAdminServicesDeviceDtosDeviceProvisioningIssueDto implements Built<AiAdminServicesDeviceDtosDeviceProvisioningIssueDto, AiAdminServicesDeviceDtosDeviceProvisioningIssueDtoBuilder> {
  @BuiltValueField(wireName: r'macAddress')
  String? get macAddress;

  @BuiltValueField(wireName: r'alias')
  String? get alias;

  @BuiltValueField(wireName: r'board')
  String? get board;

  @BuiltValueField(wireName: r'appVersion')
  String? get appVersion;

  @BuiltValueField(wireName: r'agentRoleId')
  String? get agentRoleId;

  @BuiltValueField(wireName: r'agentRoleReleaseId')
  String? get agentRoleReleaseId;

  @BuiltValueField(wireName: r'rotateCredential')
  bool? get rotateCredential;

  AiAdminServicesDeviceDtosDeviceProvisioningIssueDto._();

  factory AiAdminServicesDeviceDtosDeviceProvisioningIssueDto([void updates(AiAdminServicesDeviceDtosDeviceProvisioningIssueDtoBuilder b)]) = _$AiAdminServicesDeviceDtosDeviceProvisioningIssueDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesDeviceDtosDeviceProvisioningIssueDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesDeviceDtosDeviceProvisioningIssueDto> get serializer => _$AiAdminServicesDeviceDtosDeviceProvisioningIssueDtoSerializer();
}

class _$AiAdminServicesDeviceDtosDeviceProvisioningIssueDtoSerializer implements PrimitiveSerializer<AiAdminServicesDeviceDtosDeviceProvisioningIssueDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesDeviceDtosDeviceProvisioningIssueDto, _$AiAdminServicesDeviceDtosDeviceProvisioningIssueDto];

  @override
  final String wireName = r'AiAdminServicesDeviceDtosDeviceProvisioningIssueDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesDeviceDtosDeviceProvisioningIssueDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.macAddress != null) {
      yield r'macAddress';
      yield serializers.serialize(
        object.macAddress,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.alias != null) {
      yield r'alias';
      yield serializers.serialize(
        object.alias,
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
    if (object.rotateCredential != null) {
      yield r'rotateCredential';
      yield serializers.serialize(
        object.rotateCredential,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesDeviceDtosDeviceProvisioningIssueDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesDeviceDtosDeviceProvisioningIssueDtoBuilder result,
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
        case r'alias':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.alias = valueDes;
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
        case r'rotateCredential':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.rotateCredential = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesDeviceDtosDeviceProvisioningIssueDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesDeviceDtosDeviceProvisioningIssueDtoBuilder();
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

