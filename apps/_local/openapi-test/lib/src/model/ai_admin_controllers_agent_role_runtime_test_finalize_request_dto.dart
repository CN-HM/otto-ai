//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_controllers_agent_role_runtime_test_finalize_request_dto.g.dart';

/// AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto
///
/// Properties:
/// * [sessionId] 
@BuiltValue()
abstract class AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto implements Built<AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto, AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDtoBuilder> {
  @BuiltValueField(wireName: r'sessionId')
  String? get sessionId;

  AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto._();

  factory AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto([void updates(AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDtoBuilder b)]) = _$AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto> get serializer => _$AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDtoSerializer();
}

class _$AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDtoSerializer implements PrimitiveSerializer<AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto> {
  @override
  final Iterable<Type> types = const [AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto, _$AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto];

  @override
  final String wireName = r'AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDtoBuilder();
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

