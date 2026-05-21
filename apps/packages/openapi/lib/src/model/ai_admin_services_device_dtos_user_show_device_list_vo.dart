//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_device_dtos_user_show_device_list_vo.g.dart';

/// AiAdminServicesDeviceDtosUserShowDeviceListVo
///
/// Properties:
/// * [id] 
/// * [appVersion] 
/// * [bindUserName] 
/// * [macAddress] 
/// * [board] 
/// * [alias] 
/// * [agentRoleId] 
/// * [agentRoleName] 
/// * [agentRoleReleaseId] 
/// * [agentRoleVersion] 
/// * [lastConnectedAt] 
/// * [createDate] 
@BuiltValue()
abstract class AiAdminServicesDeviceDtosUserShowDeviceListVo implements Built<AiAdminServicesDeviceDtosUserShowDeviceListVo, AiAdminServicesDeviceDtosUserShowDeviceListVoBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'appVersion')
  String? get appVersion;

  @BuiltValueField(wireName: r'bindUserName')
  String? get bindUserName;

  @BuiltValueField(wireName: r'macAddress')
  String? get macAddress;

  @BuiltValueField(wireName: r'board')
  String? get board;

  @BuiltValueField(wireName: r'alias')
  String? get alias;

  @BuiltValueField(wireName: r'agentRoleId')
  String? get agentRoleId;

  @BuiltValueField(wireName: r'agentRoleName')
  String? get agentRoleName;

  @BuiltValueField(wireName: r'agentRoleReleaseId')
  String? get agentRoleReleaseId;

  @BuiltValueField(wireName: r'agentRoleVersion')
  String? get agentRoleVersion;

  @BuiltValueField(wireName: r'lastConnectedAt')
  String? get lastConnectedAt;

  @BuiltValueField(wireName: r'createDate')
  String? get createDate;

  AiAdminServicesDeviceDtosUserShowDeviceListVo._();

  factory AiAdminServicesDeviceDtosUserShowDeviceListVo([void updates(AiAdminServicesDeviceDtosUserShowDeviceListVoBuilder b)]) = _$AiAdminServicesDeviceDtosUserShowDeviceListVo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesDeviceDtosUserShowDeviceListVoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesDeviceDtosUserShowDeviceListVo> get serializer => _$AiAdminServicesDeviceDtosUserShowDeviceListVoSerializer();
}

class _$AiAdminServicesDeviceDtosUserShowDeviceListVoSerializer implements PrimitiveSerializer<AiAdminServicesDeviceDtosUserShowDeviceListVo> {
  @override
  final Iterable<Type> types = const [AiAdminServicesDeviceDtosUserShowDeviceListVo, _$AiAdminServicesDeviceDtosUserShowDeviceListVo];

  @override
  final String wireName = r'AiAdminServicesDeviceDtosUserShowDeviceListVo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesDeviceDtosUserShowDeviceListVo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
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
    if (object.bindUserName != null) {
      yield r'bindUserName';
      yield serializers.serialize(
        object.bindUserName,
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
    if (object.board != null) {
      yield r'board';
      yield serializers.serialize(
        object.board,
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
    if (object.agentRoleId != null) {
      yield r'agentRoleId';
      yield serializers.serialize(
        object.agentRoleId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.agentRoleName != null) {
      yield r'agentRoleName';
      yield serializers.serialize(
        object.agentRoleName,
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
    if (object.agentRoleVersion != null) {
      yield r'agentRoleVersion';
      yield serializers.serialize(
        object.agentRoleVersion,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.lastConnectedAt != null) {
      yield r'lastConnectedAt';
      yield serializers.serialize(
        object.lastConnectedAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.createDate != null) {
      yield r'createDate';
      yield serializers.serialize(
        object.createDate,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesDeviceDtosUserShowDeviceListVo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesDeviceDtosUserShowDeviceListVoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.id = valueDes;
          break;
        case r'appVersion':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.appVersion = valueDes;
          break;
        case r'bindUserName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.bindUserName = valueDes;
          break;
        case r'macAddress':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.macAddress = valueDes;
          break;
        case r'board':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.board = valueDes;
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
        case r'agentRoleName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.agentRoleName = valueDes;
          break;
        case r'agentRoleReleaseId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.agentRoleReleaseId = valueDes;
          break;
        case r'agentRoleVersion':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.agentRoleVersion = valueDes;
          break;
        case r'lastConnectedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.lastConnectedAt = valueDes;
          break;
        case r'createDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.createDate = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesDeviceDtosUserShowDeviceListVo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesDeviceDtosUserShowDeviceListVoBuilder();
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

