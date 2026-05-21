//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/ai_admin_services_rbac_dtos_role_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_page_data_ai_admin_services_rbac_dtos_role_dto.g.dart';

/// AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto
///
/// Properties:
/// * [total] 
/// * [list] 
@BuiltValue()
abstract class AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto implements Built<AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto, AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoBuilder> {
  @BuiltValueField(wireName: r'total')
  int? get total;

  @BuiltValueField(wireName: r'list')
  BuiltList<AiAdminServicesRbacDtosRoleDto>? get list;

  AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto._();

  factory AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto([void updates(AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoBuilder b)]) = _$AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto> get serializer => _$AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoSerializer();
}

class _$AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoSerializer implements PrimitiveSerializer<AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto, _$AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto];

  @override
  final String wireName = r'AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.total != null) {
      yield r'total';
      yield serializers.serialize(
        object.total,
        specifiedType: const FullType(int),
      );
    }
    if (object.list != null) {
      yield r'list';
      yield serializers.serialize(
        object.list,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesRbacDtosRoleDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.total = valueDes;
          break;
        case r'list':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesRbacDtosRoleDto)]),
          ) as BuiltList<AiAdminServicesRbacDtosRoleDto>?;
          if (valueDes == null) continue;
          result.list.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDtoBuilder();
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

