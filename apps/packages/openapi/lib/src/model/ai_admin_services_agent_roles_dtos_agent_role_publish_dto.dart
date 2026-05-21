//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_agent_roles_dtos_agent_role_publish_dto.g.dart';

/// AiAdminServicesAgentRolesDtosAgentRolePublishDto
///
/// Properties:
/// * [version] 
/// * [remark] 
@BuiltValue()
abstract class AiAdminServicesAgentRolesDtosAgentRolePublishDto implements Built<AiAdminServicesAgentRolesDtosAgentRolePublishDto, AiAdminServicesAgentRolesDtosAgentRolePublishDtoBuilder> {
  @BuiltValueField(wireName: r'version')
  String? get version;

  @BuiltValueField(wireName: r'remark')
  String? get remark;

  AiAdminServicesAgentRolesDtosAgentRolePublishDto._();

  factory AiAdminServicesAgentRolesDtosAgentRolePublishDto([void updates(AiAdminServicesAgentRolesDtosAgentRolePublishDtoBuilder b)]) = _$AiAdminServicesAgentRolesDtosAgentRolePublishDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesAgentRolesDtosAgentRolePublishDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesAgentRolesDtosAgentRolePublishDto> get serializer => _$AiAdminServicesAgentRolesDtosAgentRolePublishDtoSerializer();
}

class _$AiAdminServicesAgentRolesDtosAgentRolePublishDtoSerializer implements PrimitiveSerializer<AiAdminServicesAgentRolesDtosAgentRolePublishDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesAgentRolesDtosAgentRolePublishDto, _$AiAdminServicesAgentRolesDtosAgentRolePublishDto];

  @override
  final String wireName = r'AiAdminServicesAgentRolesDtosAgentRolePublishDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesAgentRolesDtosAgentRolePublishDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.version != null) {
      yield r'version';
      yield serializers.serialize(
        object.version,
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
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesAgentRolesDtosAgentRolePublishDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesAgentRolesDtosAgentRolePublishDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.version = valueDes;
          break;
        case r'remark':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.remark = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesAgentRolesDtosAgentRolePublishDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesAgentRolesDtosAgentRolePublishDtoBuilder();
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

