//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_agent_roles_dtos_agent_role_context_provider_dto.g.dart';

/// AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto
///
/// Properties:
/// * [id] 
/// * [url] 
/// * [headers] 
@BuiltValue()
abstract class AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto implements Built<AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto, AiAdminServicesAgentRolesDtosAgentRoleContextProviderDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'url')
  String? get url;

  @BuiltValueField(wireName: r'headers')
  String? get headers;

  AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto._();

  factory AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto([void updates(AiAdminServicesAgentRolesDtosAgentRoleContextProviderDtoBuilder b)]) = _$AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesAgentRolesDtosAgentRoleContextProviderDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto> get serializer => _$AiAdminServicesAgentRolesDtosAgentRoleContextProviderDtoSerializer();
}

class _$AiAdminServicesAgentRolesDtosAgentRoleContextProviderDtoSerializer implements PrimitiveSerializer<AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto, _$AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto];

  @override
  final String wireName = r'AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.url != null) {
      yield r'url';
      yield serializers.serialize(
        object.url,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.headers != null) {
      yield r'headers';
      yield serializers.serialize(
        object.headers,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesAgentRolesDtosAgentRoleContextProviderDtoBuilder result,
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
        case r'url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.url = valueDes;
          break;
        case r'headers':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.headers = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesAgentRolesDtosAgentRoleContextProviderDtoBuilder();
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

