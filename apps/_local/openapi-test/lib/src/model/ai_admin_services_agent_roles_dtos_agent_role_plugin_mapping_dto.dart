//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_agent_roles_dtos_agent_role_plugin_mapping_dto.g.dart';

/// AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto
///
/// Properties:
/// * [pluginId] 
/// * [paramInfo] 
/// * [providerCode] 
@BuiltValue()
abstract class AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto implements Built<AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto, AiAdminServicesAgentRolesDtosAgentRolePluginMappingDtoBuilder> {
  @BuiltValueField(wireName: r'pluginId')
  String? get pluginId;

  @BuiltValueField(wireName: r'paramInfo')
  String? get paramInfo;

  @BuiltValueField(wireName: r'providerCode')
  String? get providerCode;

  AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto._();

  factory AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto([void updates(AiAdminServicesAgentRolesDtosAgentRolePluginMappingDtoBuilder b)]) = _$AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesAgentRolesDtosAgentRolePluginMappingDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto> get serializer => _$AiAdminServicesAgentRolesDtosAgentRolePluginMappingDtoSerializer();
}

class _$AiAdminServicesAgentRolesDtosAgentRolePluginMappingDtoSerializer implements PrimitiveSerializer<AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto, _$AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto];

  @override
  final String wireName = r'AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.pluginId != null) {
      yield r'pluginId';
      yield serializers.serialize(
        object.pluginId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.paramInfo != null) {
      yield r'paramInfo';
      yield serializers.serialize(
        object.paramInfo,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.providerCode != null) {
      yield r'providerCode';
      yield serializers.serialize(
        object.providerCode,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesAgentRolesDtosAgentRolePluginMappingDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'pluginId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.pluginId = valueDes;
          break;
        case r'paramInfo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.paramInfo = valueDes;
          break;
        case r'providerCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.providerCode = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesAgentRolesDtosAgentRolePluginMappingDtoBuilder();
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

