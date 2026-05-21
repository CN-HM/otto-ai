//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_agent_roles_agent_role_runtime_test_request_dto.g.dart';

/// AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto
///
/// Properties:
/// * [agentRoleId] 
/// * [agentRoleCode] 
/// * [agentRoleReleaseId] 
/// * [sessionId] 
/// * [deviceId] 
/// * [userText] 
/// * [audioBase64] 
/// * [audioFormat] 
/// * [language] 
/// * [responseFormat] 
@BuiltValue()
abstract class AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto implements Built<AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto, AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDtoBuilder> {
  @BuiltValueField(wireName: r'agentRoleId')
  String? get agentRoleId;

  @BuiltValueField(wireName: r'agentRoleCode')
  String? get agentRoleCode;

  @BuiltValueField(wireName: r'agentRoleReleaseId')
  String? get agentRoleReleaseId;

  @BuiltValueField(wireName: r'sessionId')
  String? get sessionId;

  @BuiltValueField(wireName: r'deviceId')
  String? get deviceId;

  @BuiltValueField(wireName: r'userText')
  String? get userText;

  @BuiltValueField(wireName: r'audioBase64')
  String? get audioBase64;

  @BuiltValueField(wireName: r'audioFormat')
  String? get audioFormat;

  @BuiltValueField(wireName: r'language')
  String? get language;

  @BuiltValueField(wireName: r'responseFormat')
  String? get responseFormat;

  AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto._();

  factory AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto([void updates(AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDtoBuilder b)]) = _$AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto> get serializer => _$AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDtoSerializer();
}

class _$AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDtoSerializer implements PrimitiveSerializer<AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto, _$AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto];

  @override
  final String wireName = r'AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.agentRoleId != null) {
      yield r'agentRoleId';
      yield serializers.serialize(
        object.agentRoleId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.agentRoleCode != null) {
      yield r'agentRoleCode';
      yield serializers.serialize(
        object.agentRoleCode,
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
    if (object.sessionId != null) {
      yield r'sessionId';
      yield serializers.serialize(
        object.sessionId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.deviceId != null) {
      yield r'deviceId';
      yield serializers.serialize(
        object.deviceId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.userText != null) {
      yield r'userText';
      yield serializers.serialize(
        object.userText,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.audioBase64 != null) {
      yield r'audioBase64';
      yield serializers.serialize(
        object.audioBase64,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.audioFormat != null) {
      yield r'audioFormat';
      yield serializers.serialize(
        object.audioFormat,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.language != null) {
      yield r'language';
      yield serializers.serialize(
        object.language,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.responseFormat != null) {
      yield r'responseFormat';
      yield serializers.serialize(
        object.responseFormat,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'agentRoleId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.agentRoleId = valueDes;
          break;
        case r'agentRoleCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.agentRoleCode = valueDes;
          break;
        case r'agentRoleReleaseId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.agentRoleReleaseId = valueDes;
          break;
        case r'sessionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sessionId = valueDes;
          break;
        case r'deviceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.deviceId = valueDes;
          break;
        case r'userText':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.userText = valueDes;
          break;
        case r'audioBase64':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.audioBase64 = valueDes;
          break;
        case r'audioFormat':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.audioFormat = valueDes;
          break;
        case r'language':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.language = valueDes;
          break;
        case r'responseFormat':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.responseFormat = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDtoBuilder();
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

