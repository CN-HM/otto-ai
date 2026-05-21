//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_voice_dtos_timbre_details_vo.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_result_ai_admin_services_voice_dtos_timbre_details_vo.g.dart';

/// AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo
///
/// Properties:
/// * [code] 
/// * [msg] 
/// * [data] 
@BuiltValue()
abstract class AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo implements Built<AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo, AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVoBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'msg')
  String? get msg;

  @BuiltValueField(wireName: r'data')
  AiAdminServicesVoiceDtosTimbreDetailsVo? get data;

  AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo._();

  factory AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo([void updates(AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVoBuilder b)]) = _$AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo> get serializer => _$AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVoSerializer();
}

class _$AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVoSerializer implements PrimitiveSerializer<AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo, _$AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo];

  @override
  final String wireName = r'AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo object, {
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
        specifiedType: const FullType(AiAdminServicesVoiceDtosTimbreDetailsVo),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVoBuilder result,
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
            specifiedType: const FullType(AiAdminServicesVoiceDtosTimbreDetailsVo),
          ) as AiAdminServicesVoiceDtosTimbreDetailsVo;
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
  AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVoBuilder();
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

