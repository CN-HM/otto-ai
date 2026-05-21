//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_runtime_execution_dtos_tts_synthesis_request_dto.g.dart';

/// AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto
///
/// Properties:
/// * [text] 
/// * [voice] 
/// * [responseFormat] 
/// * [speed] 
/// * [extraOptions] 
@BuiltValue()
abstract class AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto implements Built<AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto, AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDtoBuilder> {
  @BuiltValueField(wireName: r'text')
  String? get text;

  @BuiltValueField(wireName: r'voice')
  String? get voice;

  @BuiltValueField(wireName: r'responseFormat')
  String? get responseFormat;

  @BuiltValueField(wireName: r'speed')
  double? get speed;

  @BuiltValueField(wireName: r'extraOptions')
  BuiltMap<String, JsonObject?>? get extraOptions;

  AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto._();

  factory AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto([void updates(AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDtoBuilder b)]) = _$AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto> get serializer => _$AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDtoSerializer();
}

class _$AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDtoSerializer implements PrimitiveSerializer<AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto, _$AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto];

  @override
  final String wireName = r'AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.text != null) {
      yield r'text';
      yield serializers.serialize(
        object.text,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.voice != null) {
      yield r'voice';
      yield serializers.serialize(
        object.voice,
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
    if (object.speed != null) {
      yield r'speed';
      yield serializers.serialize(
        object.speed,
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
    AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'text':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.text = valueDes;
          break;
        case r'voice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.voice = valueDes;
          break;
        case r'responseFormat':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.responseFormat = valueDes;
          break;
        case r'speed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.speed = valueDes;
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
  AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesRuntimeExecutionDtosTtsSynthesisRequestDtoBuilder();
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

