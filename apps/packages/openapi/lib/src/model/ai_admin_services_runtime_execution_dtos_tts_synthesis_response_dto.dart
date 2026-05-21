//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_runtime_execution_dtos_stage_execution_trace_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_runtime_execution_dtos_tts_synthesis_response_dto.g.dart';

/// AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto
///
/// Properties:
/// * [invocationMode] 
/// * [contentType] 
/// * [format] 
/// * [audioBase64] 
/// * [audioSize] 
/// * [rawResponseJson] 
/// * [stageTrace] 
@BuiltValue()
abstract class AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto implements Built<AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto, AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder> {
  @BuiltValueField(wireName: r'invocationMode')
  String? get invocationMode;

  @BuiltValueField(wireName: r'contentType')
  String? get contentType;

  @BuiltValueField(wireName: r'format')
  String? get format;

  @BuiltValueField(wireName: r'audioBase64')
  String? get audioBase64;

  @BuiltValueField(wireName: r'audioSize')
  int? get audioSize;

  @BuiltValueField(wireName: r'rawResponseJson')
  String? get rawResponseJson;

  @BuiltValueField(wireName: r'stageTrace')
  AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto? get stageTrace;

  AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto._();

  factory AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto([void updates(AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder b)]) = _$AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto> get serializer => _$AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoSerializer();
}

class _$AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoSerializer implements PrimitiveSerializer<AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto, _$AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto];

  @override
  final String wireName = r'AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.invocationMode != null) {
      yield r'invocationMode';
      yield serializers.serialize(
        object.invocationMode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.contentType != null) {
      yield r'contentType';
      yield serializers.serialize(
        object.contentType,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.format != null) {
      yield r'format';
      yield serializers.serialize(
        object.format,
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
    if (object.audioSize != null) {
      yield r'audioSize';
      yield serializers.serialize(
        object.audioSize,
        specifiedType: const FullType(int),
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
    AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder result,
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
        case r'contentType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.contentType = valueDes;
          break;
        case r'format':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.format = valueDes;
          break;
        case r'audioBase64':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.audioBase64 = valueDes;
          break;
        case r'audioSize':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.audioSize = valueDes;
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
  AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDtoBuilder();
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

