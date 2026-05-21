//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_runtime_execution_dtos_asr_recognition_request_dto.g.dart';

/// AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto
///
/// Properties:
/// * [audioBase64] 
/// * [audioFormat] 
/// * [language] 
/// * [extraOptions] 
@BuiltValue()
abstract class AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto implements Built<AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto, AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDtoBuilder> {
  @BuiltValueField(wireName: r'audioBase64')
  String? get audioBase64;

  @BuiltValueField(wireName: r'audioFormat')
  String? get audioFormat;

  @BuiltValueField(wireName: r'language')
  String? get language;

  @BuiltValueField(wireName: r'extraOptions')
  BuiltMap<String, JsonObject?>? get extraOptions;

  AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto._();

  factory AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto([void updates(AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDtoBuilder b)]) = _$AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto> get serializer => _$AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDtoSerializer();
}

class _$AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDtoSerializer implements PrimitiveSerializer<AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto, _$AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto];

  @override
  final String wireName = r'AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesRuntimeExecutionDtosAsrRecognitionRequestDtoBuilder();
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

