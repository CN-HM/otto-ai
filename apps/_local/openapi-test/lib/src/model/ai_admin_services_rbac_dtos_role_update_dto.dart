//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_rbac_dtos_role_update_dto.g.dart';

/// AiAdminServicesRbacDtosRoleUpdateDto
///
/// Properties:
/// * [name] 
/// * [code] 
/// * [remark] 
/// * [status] 
/// * [sort] 
@BuiltValue()
abstract class AiAdminServicesRbacDtosRoleUpdateDto implements Built<AiAdminServicesRbacDtosRoleUpdateDto, AiAdminServicesRbacDtosRoleUpdateDtoBuilder> {
  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'code')
  String? get code;

  @BuiltValueField(wireName: r'remark')
  String? get remark;

  @BuiltValueField(wireName: r'status')
  int? get status;

  @BuiltValueField(wireName: r'sort')
  int? get sort;

  AiAdminServicesRbacDtosRoleUpdateDto._();

  factory AiAdminServicesRbacDtosRoleUpdateDto([void updates(AiAdminServicesRbacDtosRoleUpdateDtoBuilder b)]) = _$AiAdminServicesRbacDtosRoleUpdateDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesRbacDtosRoleUpdateDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesRbacDtosRoleUpdateDto> get serializer => _$AiAdminServicesRbacDtosRoleUpdateDtoSerializer();
}

class _$AiAdminServicesRbacDtosRoleUpdateDtoSerializer implements PrimitiveSerializer<AiAdminServicesRbacDtosRoleUpdateDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesRbacDtosRoleUpdateDto, _$AiAdminServicesRbacDtosRoleUpdateDto];

  @override
  final String wireName = r'AiAdminServicesRbacDtosRoleUpdateDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesRbacDtosRoleUpdateDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.code != null) {
      yield r'code';
      yield serializers.serialize(
        object.code,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.remark != null) {
      yield r'remark';
      yield serializers.serialize(
        object.remark,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(int),
      );
    }
    if (object.sort != null) {
      yield r'sort';
      yield serializers.serialize(
        object.sort,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesRbacDtosRoleUpdateDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesRbacDtosRoleUpdateDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.code = valueDes;
          break;
        case r'remark':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.remark = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.status = valueDes;
          break;
        case r'sort':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.sort = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesRbacDtosRoleUpdateDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesRbacDtosRoleUpdateDtoBuilder();
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

