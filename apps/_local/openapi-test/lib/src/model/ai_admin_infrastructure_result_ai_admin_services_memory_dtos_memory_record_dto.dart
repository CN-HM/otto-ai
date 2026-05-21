//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_memory_dtos_memory_record_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_result_ai_admin_services_memory_dtos_memory_record_dto.g.dart';

/// AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto
///
/// Properties:
/// * [code] 
/// * [msg] 
/// * [data] 
@BuiltValue()
abstract class AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto implements Built<AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto, AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDtoBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'msg')
  String? get msg;

  @BuiltValueField(wireName: r'data')
  AiAdminServicesMemoryDtosMemoryRecordDto? get data;

  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto._();

  factory AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto([void updates(AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDtoBuilder b)]) = _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto> get serializer => _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDtoSerializer();
}

class _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDtoSerializer implements PrimitiveSerializer<AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto, _$AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto];

  @override
  final String wireName = r'AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto object, {
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
        specifiedType: const FullType(AiAdminServicesMemoryDtosMemoryRecordDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDtoBuilder result,
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
            specifiedType: const FullType(AiAdminServicesMemoryDtosMemoryRecordDto),
          ) as AiAdminServicesMemoryDtosMemoryRecordDto;
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
  AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDtoBuilder();
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

