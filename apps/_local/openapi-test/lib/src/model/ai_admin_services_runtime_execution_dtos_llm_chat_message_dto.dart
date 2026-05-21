//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_runtime_execution_dtos_llm_chat_message_dto.g.dart';

/// AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto
///
/// Properties:
/// * [role] 
/// * [content] 
/// * [name] 
@BuiltValue()
abstract class AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto implements Built<AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto, AiAdminServicesRuntimeExecutionDtosLlmChatMessageDtoBuilder> {
  @BuiltValueField(wireName: r'role')
  String? get role;

  @BuiltValueField(wireName: r'content')
  String? get content;

  @BuiltValueField(wireName: r'name')
  String? get name;

  AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto._();

  factory AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto([void updates(AiAdminServicesRuntimeExecutionDtosLlmChatMessageDtoBuilder b)]) = _$AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesRuntimeExecutionDtosLlmChatMessageDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto> get serializer => _$AiAdminServicesRuntimeExecutionDtosLlmChatMessageDtoSerializer();
}

class _$AiAdminServicesRuntimeExecutionDtosLlmChatMessageDtoSerializer implements PrimitiveSerializer<AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto, _$AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto];

  @override
  final String wireName = r'AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.role != null) {
      yield r'role';
      yield serializers.serialize(
        object.role,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.content != null) {
      yield r'content';
      yield serializers.serialize(
        object.content,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesRuntimeExecutionDtosLlmChatMessageDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'role':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.role = valueDes;
          break;
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.content = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesRuntimeExecutionDtosLlmChatMessageDtoBuilder();
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

