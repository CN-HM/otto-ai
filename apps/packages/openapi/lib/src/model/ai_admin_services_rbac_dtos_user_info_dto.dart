//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_rbac_dtos_user_info_dto.g.dart';

/// AiAdminServicesRbacDtosUserInfoDto
///
/// Properties:
/// * [id] 
/// * [username] 
/// * [superAdmin] 
/// * [status] 
/// * [roles] 
/// * [permissions] 
@BuiltValue()
abstract class AiAdminServicesRbacDtosUserInfoDto implements Built<AiAdminServicesRbacDtosUserInfoDto, AiAdminServicesRbacDtosUserInfoDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'username')
  String? get username;

  @BuiltValueField(wireName: r'superAdmin')
  int? get superAdmin;

  @BuiltValueField(wireName: r'status')
  int? get status;

  @BuiltValueField(wireName: r'roles')
  BuiltList<String>? get roles;

  @BuiltValueField(wireName: r'permissions')
  BuiltList<String>? get permissions;

  AiAdminServicesRbacDtosUserInfoDto._();

  factory AiAdminServicesRbacDtosUserInfoDto([void updates(AiAdminServicesRbacDtosUserInfoDtoBuilder b)]) = _$AiAdminServicesRbacDtosUserInfoDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesRbacDtosUserInfoDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesRbacDtosUserInfoDto> get serializer => _$AiAdminServicesRbacDtosUserInfoDtoSerializer();
}

class _$AiAdminServicesRbacDtosUserInfoDtoSerializer implements PrimitiveSerializer<AiAdminServicesRbacDtosUserInfoDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesRbacDtosUserInfoDto, _$AiAdminServicesRbacDtosUserInfoDto];

  @override
  final String wireName = r'AiAdminServicesRbacDtosUserInfoDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesRbacDtosUserInfoDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.username != null) {
      yield r'username';
      yield serializers.serialize(
        object.username,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.superAdmin != null) {
      yield r'superAdmin';
      yield serializers.serialize(
        object.superAdmin,
        specifiedType: const FullType(int),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(int),
      );
    }
    if (object.roles != null) {
      yield r'roles';
      yield serializers.serialize(
        object.roles,
        specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
      );
    }
    if (object.permissions != null) {
      yield r'permissions';
      yield serializers.serialize(
        object.permissions,
        specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesRbacDtosUserInfoDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesRbacDtosUserInfoDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'username':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.username = valueDes;
          break;
        case r'superAdmin':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.superAdmin = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.status = valueDes;
          break;
        case r'roles':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.roles.replace(valueDes);
          break;
        case r'permissions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.permissions.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesRbacDtosUserInfoDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesRbacDtosUserInfoDtoBuilder();
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

