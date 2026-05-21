//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_infrastructure_page_data_ai_admin_services_admin_dtos_admin_page_user_vo.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_result_ai_admin_infrastructure_page_data_ai_admin_services_admin_dtos_admin_page_user_vo.g.dart';

/// AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo
///
/// Properties:
/// * [code] 
/// * [msg] 
/// * [data] 
@BuiltValue()
abstract class AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo implements Built<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo, AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVoBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'msg')
  String? get msg;

  @BuiltValueField(wireName: r'data')
  AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo? get data;

  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo._();

  factory AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo([void updates(AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVoBuilder b)]) = _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo> get serializer => _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVoSerializer();
}

class _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVoSerializer implements PrimitiveSerializer<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo, _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo];

  @override
  final String wireName = r'AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo object, {
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
        specifiedType: const FullType(AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVoBuilder result,
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
            specifiedType: const FullType(AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo),
          ) as AiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo;
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
  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVoBuilder();
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

