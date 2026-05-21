//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_runtime_execution_dtos_llm_chat_usage_dto.g.dart';

/// AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto
///
/// Properties:
/// * [promptTokens] 
/// * [completionTokens] 
/// * [totalTokens] 
@BuiltValue()
abstract class AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto implements Built<AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto, AiAdminServicesRuntimeExecutionDtosLlmChatUsageDtoBuilder> {
  @BuiltValueField(wireName: r'promptTokens')
  int? get promptTokens;

  @BuiltValueField(wireName: r'completionTokens')
  int? get completionTokens;

  @BuiltValueField(wireName: r'totalTokens')
  int? get totalTokens;

  AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto._();

  factory AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto([void updates(AiAdminServicesRuntimeExecutionDtosLlmChatUsageDtoBuilder b)]) = _$AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesRuntimeExecutionDtosLlmChatUsageDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto> get serializer => _$AiAdminServicesRuntimeExecutionDtosLlmChatUsageDtoSerializer();
}

class _$AiAdminServicesRuntimeExecutionDtosLlmChatUsageDtoSerializer implements PrimitiveSerializer<AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto, _$AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto];

  @override
  final String wireName = r'AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.promptTokens != null) {
      yield r'promptTokens';
      yield serializers.serialize(
        object.promptTokens,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.completionTokens != null) {
      yield r'completionTokens';
      yield serializers.serialize(
        object.completionTokens,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.totalTokens != null) {
      yield r'totalTokens';
      yield serializers.serialize(
        object.totalTokens,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesRuntimeExecutionDtosLlmChatUsageDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'promptTokens':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.promptTokens = valueDes;
          break;
        case r'completionTokens':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.completionTokens = valueDes;
          break;
        case r'totalTokens':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.totalTokens = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesRuntimeExecutionDtosLlmChatUsageDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesRuntimeExecutionDtosLlmChatUsageDtoBuilder();
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

