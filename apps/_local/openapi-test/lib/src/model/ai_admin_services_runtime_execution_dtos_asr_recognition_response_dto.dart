//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_runtime_execution_dtos_stage_execution_trace_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_runtime_execution_dtos_asr_recognition_response_dto.g.dart';

/// AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto
///
/// Properties:
/// * [invocationMode] 
/// * [transcript] 
/// * [rawResponseJson] 
/// * [stageTrace] 
@BuiltValue()
abstract class AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto implements Built<AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto, AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder> {
  @BuiltValueField(wireName: r'invocationMode')
  String? get invocationMode;

  @BuiltValueField(wireName: r'transcript')
  String? get transcript;

  @BuiltValueField(wireName: r'rawResponseJson')
  String? get rawResponseJson;

  @BuiltValueField(wireName: r'stageTrace')
  AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto? get stageTrace;

  AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto._();

  factory AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto([void updates(AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder b)]) = _$AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto> get serializer => _$AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoSerializer();
}

class _$AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoSerializer implements PrimitiveSerializer<AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto, _$AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto];

  @override
  final String wireName = r'AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.invocationMode != null) {
      yield r'invocationMode';
      yield serializers.serialize(
        object.invocationMode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.transcript != null) {
      yield r'transcript';
      yield serializers.serialize(
        object.transcript,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.rawResponseJson != null) {
      yield r'rawResponseJson';
      yield serializers.serialize(
        object.rawResponseJson,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.stageTrace != null) {
      yield r'stageTrace';
      yield serializers.serialize(
        object.stageTrace,
        specifiedType: const FullType(AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'invocationMode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.invocationMode = valueDes;
          break;
        case r'transcript':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.transcript = valueDes;
          break;
        case r'rawResponseJson':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.rawResponseJson = valueDes;
          break;
        case r'stageTrace':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto),
          ) as AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto;
          result.stageTrace.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder();
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

