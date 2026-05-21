//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/ai_admin_services_runtime_execution_dtos_llm_chat_message_dto.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_runtime_execution_dtos_llm_chat_request_dto.g.dart';

/// AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto
///
/// Properties:
/// * [systemPrompt] 
/// * [messages] 
/// * [stream] 
/// * [temperature] 
/// * [maxTokens] 
/// * [topP] 
/// * [extraOptions] 
@BuiltValue()
abstract class AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto implements Built<AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto, AiAdminServicesRuntimeExecutionDtosLlmChatRequestDtoBuilder> {
  @BuiltValueField(wireName: r'systemPrompt')
  String? get systemPrompt;

  @BuiltValueField(wireName: r'messages')
  BuiltList<AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto>? get messages;

  @BuiltValueField(wireName: r'stream')
  bool? get stream;

  @BuiltValueField(wireName: r'temperature')
  double? get temperature;

  @BuiltValueField(wireName: r'maxTokens')
  int? get maxTokens;

  @BuiltValueField(wireName: r'topP')
  double? get topP;

  @BuiltValueField(wireName: r'extraOptions')
  BuiltMap<String, JsonObject?>? get extraOptions;

  AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto._();

  factory AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto([void updates(AiAdminServicesRuntimeExecutionDtosLlmChatRequestDtoBuilder b)]) = _$AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesRuntimeExecutionDtosLlmChatRequestDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto> get serializer => _$AiAdminServicesRuntimeExecutionDtosLlmChatRequestDtoSerializer();
}

class _$AiAdminServicesRuntimeExecutionDtosLlmChatRequestDtoSerializer implements PrimitiveSerializer<AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto, _$AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto];

  @override
  final String wireName = r'AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.systemPrompt != null) {
      yield r'systemPrompt';
      yield serializers.serialize(
        object.systemPrompt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.messages != null) {
      yield r'messages';
      yield serializers.serialize(
        object.messages,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto)]),
      );
    }
    if (object.stream != null) {
      yield r'stream';
      yield serializers.serialize(
        object.stream,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.temperature != null) {
      yield r'temperature';
      yield serializers.serialize(
        object.temperature,
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.maxTokens != null) {
      yield r'maxTokens';
      yield serializers.serialize(
        object.maxTokens,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.topP != null) {
      yield r'topP';
      yield serializers.serialize(
        object.topP,
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.extraOptions != null) {
      yield r'extraOptions';
      yield serializers.serialize(
        object.extraOptions,
        specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesRuntimeExecutionDtosLlmChatRequestDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'systemPrompt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.systemPrompt = valueDes;
          break;
        case r'messages':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto)]),
          ) as BuiltList<AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto>?;
          if (valueDes == null) continue;
          result.messages.replace(valueDes);
          break;
        case r'stream':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.stream = valueDes;
          break;
        case r'temperature':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.temperature = valueDes;
          break;
        case r'maxTokens':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.maxTokens = valueDes;
          break;
        case r'topP':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.topP = valueDes;
          break;
        case r'extraOptions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
          ) as BuiltMap<String, JsonObject?>?;
          if (valueDes == null) continue;
          result.extraOptions.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesRuntimeExecutionDtosLlmChatRequestDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesRuntimeExecutionDtosLlmChatRequestDtoBuilder();
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

