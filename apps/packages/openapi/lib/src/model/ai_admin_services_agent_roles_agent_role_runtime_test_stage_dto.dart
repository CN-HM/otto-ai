//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_runtime_execution_dtos_stage_execution_trace_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_agent_roles_agent_role_runtime_test_stage_dto.g.dart';

/// AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto
///
/// Properties:
/// * [status] 
/// * [durationMs] 
/// * [errorMessage] 
/// * [trace] 
@BuiltValue()
abstract class AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto implements Built<AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto, AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder> {
  @BuiltValueField(wireName: r'status')
  String? get status;

  @BuiltValueField(wireName: r'durationMs')
  int? get durationMs;

  @BuiltValueField(wireName: r'errorMessage')
  String? get errorMessage;

  @BuiltValueField(wireName: r'trace')
  AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto? get trace;

  AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto._();

  factory AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto([void updates(AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder b)]) = _$AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto> get serializer => _$AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoSerializer();
}

class _$AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoSerializer implements PrimitiveSerializer<AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto, _$AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto];

  @override
  final String wireName = r'AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.durationMs != null) {
      yield r'durationMs';
      yield serializers.serialize(
        object.durationMs,
        specifiedType: const FullType(int),
      );
    }
    if (object.errorMessage != null) {
      yield r'errorMessage';
      yield serializers.serialize(
        object.errorMessage,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.trace != null) {
      yield r'trace';
      yield serializers.serialize(
        object.trace,
        specifiedType: const FullType(AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.status = valueDes;
          break;
        case r'durationMs':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.durationMs = valueDes;
          break;
        case r'errorMessage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.errorMessage = valueDes;
          break;
        case r'trace':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto),
          ) as AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto;
          result.trace.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDtoBuilder();
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

