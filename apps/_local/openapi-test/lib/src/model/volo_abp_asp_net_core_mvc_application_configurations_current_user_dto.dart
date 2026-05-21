//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_asp_net_core_mvc_application_configurations_current_user_dto.g.dart';

/// VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto
///
/// Properties:
/// * [isAuthenticated] 
/// * [id] 
/// * [tenantId] 
/// * [impersonatorUserId] 
/// * [impersonatorTenantId] 
/// * [impersonatorUserName] 
/// * [impersonatorTenantName] 
/// * [userName] 
/// * [name] 
/// * [surName] 
/// * [email] 
/// * [emailVerified] 
/// * [phoneNumber] 
/// * [phoneNumberVerified] 
/// * [roles] 
/// * [sessionId] 
@BuiltValue()
abstract class VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto implements Built<VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto, VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDtoBuilder> {
  @BuiltValueField(wireName: r'isAuthenticated')
  bool? get isAuthenticated;

  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'tenantId')
  String? get tenantId;

  @BuiltValueField(wireName: r'impersonatorUserId')
  String? get impersonatorUserId;

  @BuiltValueField(wireName: r'impersonatorTenantId')
  String? get impersonatorTenantId;

  @BuiltValueField(wireName: r'impersonatorUserName')
  String? get impersonatorUserName;

  @BuiltValueField(wireName: r'impersonatorTenantName')
  String? get impersonatorTenantName;

  @BuiltValueField(wireName: r'userName')
  String? get userName;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'surName')
  String? get surName;

  @BuiltValueField(wireName: r'email')
  String? get email;

  @BuiltValueField(wireName: r'emailVerified')
  bool? get emailVerified;

  @BuiltValueField(wireName: r'phoneNumber')
  String? get phoneNumber;

  @BuiltValueField(wireName: r'phoneNumberVerified')
  bool? get phoneNumberVerified;

  @BuiltValueField(wireName: r'roles')
  BuiltList<String>? get roles;

  @BuiltValueField(wireName: r'sessionId')
  String? get sessionId;

  VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto._();

  factory VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto([void updates(VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDtoBuilder b)]) = _$VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto> get serializer => _$VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDtoSerializer();
}

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDtoSerializer implements PrimitiveSerializer<VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto> {
  @override
  final Iterable<Type> types = const [VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto, _$VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto];

  @override
  final String wireName = r'VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.isAuthenticated != null) {
      yield r'isAuthenticated';
      yield serializers.serialize(
        object.isAuthenticated,
        specifiedType: const FullType(bool),
      );
    }
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.tenantId != null) {
      yield r'tenantId';
      yield serializers.serialize(
        object.tenantId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.impersonatorUserId != null) {
      yield r'impersonatorUserId';
      yield serializers.serialize(
        object.impersonatorUserId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.impersonatorTenantId != null) {
      yield r'impersonatorTenantId';
      yield serializers.serialize(
        object.impersonatorTenantId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.impersonatorUserName != null) {
      yield r'impersonatorUserName';
      yield serializers.serialize(
        object.impersonatorUserName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.impersonatorTenantName != null) {
      yield r'impersonatorTenantName';
      yield serializers.serialize(
        object.impersonatorTenantName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.userName != null) {
      yield r'userName';
      yield serializers.serialize(
        object.userName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.surName != null) {
      yield r'surName';
      yield serializers.serialize(
        object.surName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.emailVerified != null) {
      yield r'emailVerified';
      yield serializers.serialize(
        object.emailVerified,
        specifiedType: const FullType(bool),
      );
    }
    if (object.phoneNumber != null) {
      yield r'phoneNumber';
      yield serializers.serialize(
        object.phoneNumber,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.phoneNumberVerified != null) {
      yield r'phoneNumberVerified';
      yield serializers.serialize(
        object.phoneNumberVerified,
        specifiedType: const FullType(bool),
      );
    }
    if (object.roles != null) {
      yield r'roles';
      yield serializers.serialize(
        object.roles,
        specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
      );
    }
    if (object.sessionId != null) {
      yield r'sessionId';
      yield serializers.serialize(
        object.sessionId,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'isAuthenticated':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isAuthenticated = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.id = valueDes;
          break;
        case r'tenantId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.tenantId = valueDes;
          break;
        case r'impersonatorUserId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.impersonatorUserId = valueDes;
          break;
        case r'impersonatorTenantId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.impersonatorTenantId = valueDes;
          break;
        case r'impersonatorUserName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.impersonatorUserName = valueDes;
          break;
        case r'impersonatorTenantName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.impersonatorTenantName = valueDes;
          break;
        case r'userName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.userName = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'surName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.surName = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.email = valueDes;
          break;
        case r'emailVerified':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.emailVerified = valueDes;
          break;
        case r'phoneNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.phoneNumber = valueDes;
          break;
        case r'phoneNumberVerified':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.phoneNumberVerified = valueDes;
          break;
        case r'roles':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.roles.replace(valueDes);
          break;
        case r'sessionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sessionId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDtoBuilder();
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

