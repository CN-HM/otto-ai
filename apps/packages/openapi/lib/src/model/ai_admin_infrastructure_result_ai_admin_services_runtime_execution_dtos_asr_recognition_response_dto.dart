//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_runtime_execution_dtos_asr_recognition_response_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_result_ai_admin_services_runtime_execution_dtos_asr_recognition_response_dto.g.dart';

/// AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto
///
/// Properties:
/// * [code] 
/// * [msg] 
/// * [data] 
@BuiltValue()
abstract class AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto implements Built<AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto, AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'msg')
  String? get msg;

  @BuiltValueField(wireName: r'data')
  AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto? get data;

  AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto._();

  factory AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto([void updates(AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder b)]) = _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto> get serializer => _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoSerializer();
}

class _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoSerializer implements PrimitiveSerializer<AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto, _$AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto];

  @override
  final String wireName = r'AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.code != null) {
      yield r'code';
      yield serializers.serialize(
        object.code,
        specifiedType: const FullType(int),
      );
    }
    if (object.msg != null) {
      yield r'msg';
      yield serializers.serialize(
        object.msg,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.code = valueDes;
          break;
        case r'msg':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.msg = valueDes;
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto),
          ) as AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto;
          result.data.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDtoBuilder();
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

