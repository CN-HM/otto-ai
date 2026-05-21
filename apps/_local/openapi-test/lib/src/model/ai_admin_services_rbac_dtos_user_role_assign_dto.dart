//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_rbac_dtos_user_role_assign_dto.g.dart';

/// AiAdminServicesRbacDtosUserRoleAssignDto
///
/// Properties:
/// * [roleIds] 
@BuiltValue()
abstract class AiAdminServicesRbacDtosUserRoleAssignDto implements Built<AiAdminServicesRbacDtosUserRoleAssignDto, AiAdminServicesRbacDtosUserRoleAssignDtoBuilder> {
  @BuiltValueField(wireName: r'roleIds')
  BuiltList<int>? get roleIds;

  AiAdminServicesRbacDtosUserRoleAssignDto._();

  factory AiAdminServicesRbacDtosUserRoleAssignDto([void updates(AiAdminServicesRbacDtosUserRoleAssignDtoBuilder b)]) = _$AiAdminServicesRbacDtosUserRoleAssignDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesRbacDtosUserRoleAssignDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesRbacDtosUserRoleAssignDto> get serializer => _$AiAdminServicesRbacDtosUserRoleAssignDtoSerializer();
}

class _$AiAdminServicesRbacDtosUserRoleAssignDtoSerializer implements PrimitiveSerializer<AiAdminServicesRbacDtosUserRoleAssignDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesRbacDtosUserRoleAssignDto, _$AiAdminServicesRbacDtosUserRoleAssignDto];

  @override
  final String wireName = r'AiAdminServicesRbacDtosUserRoleAssignDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesRbacDtosUserRoleAssignDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.roleIds != null) {
      yield r'roleIds';
      yield serializers.serialize(
        object.roleIds,
        specifiedType: const FullType.nullable(BuiltList, [FullType(int)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesRbacDtosUserRoleAssignDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesRbacDtosUserRoleAssignDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'roleIds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(int)]),
          ) as BuiltList<int>?;
          if (valueDes == null) continue;
          result.roleIds.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesRbacDtosUserRoleAssignDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesRbacDtosUserRoleAssignDtoBuilder();
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

