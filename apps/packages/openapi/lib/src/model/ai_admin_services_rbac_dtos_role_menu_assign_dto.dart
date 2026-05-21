//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_rbac_dtos_role_menu_assign_dto.g.dart';

/// AiAdminServicesRbacDtosRoleMenuAssignDto
///
/// Properties:
/// * [menuIds] 
@BuiltValue()
abstract class AiAdminServicesRbacDtosRoleMenuAssignDto implements Built<AiAdminServicesRbacDtosRoleMenuAssignDto, AiAdminServicesRbacDtosRoleMenuAssignDtoBuilder> {
  @BuiltValueField(wireName: r'menuIds')
  BuiltList<int>? get menuIds;

  AiAdminServicesRbacDtosRoleMenuAssignDto._();

  factory AiAdminServicesRbacDtosRoleMenuAssignDto([void updates(AiAdminServicesRbacDtosRoleMenuAssignDtoBuilder b)]) = _$AiAdminServicesRbacDtosRoleMenuAssignDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesRbacDtosRoleMenuAssignDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesRbacDtosRoleMenuAssignDto> get serializer => _$AiAdminServicesRbacDtosRoleMenuAssignDtoSerializer();
}

class _$AiAdminServicesRbacDtosRoleMenuAssignDtoSerializer implements PrimitiveSerializer<AiAdminServicesRbacDtosRoleMenuAssignDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesRbacDtosRoleMenuAssignDto, _$AiAdminServicesRbacDtosRoleMenuAssignDto];

  @override
  final String wireName = r'AiAdminServicesRbacDtosRoleMenuAssignDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesRbacDtosRoleMenuAssignDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.menuIds != null) {
      yield r'menuIds';
      yield serializers.serialize(
        object.menuIds,
        specifiedType: const FullType.nullable(BuiltList, [FullType(int)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesRbacDtosRoleMenuAssignDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesRbacDtosRoleMenuAssignDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'menuIds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(int)]),
          ) as BuiltList<int>?;
          if (valueDes == null) continue;
          result.menuIds.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesRbacDtosRoleMenuAssignDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesRbacDtosRoleMenuAssignDtoBuilder();
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

