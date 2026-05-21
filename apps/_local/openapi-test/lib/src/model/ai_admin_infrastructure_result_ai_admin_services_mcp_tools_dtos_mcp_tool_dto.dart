//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_mcp_tools_dtos_mcp_tool_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_result_ai_admin_services_mcp_tools_dtos_mcp_tool_dto.g.dart';

/// AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto
///
/// Properties:
/// * [code] 
/// * [msg] 
/// * [data] 
@BuiltValue()
abstract class AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto implements Built<AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto, AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDtoBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'msg')
  String? get msg;

  @BuiltValueField(wireName: r'data')
  AiAdminServicesMcpToolsDtosMcpToolDto? get data;

  AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto._();

  factory AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto([void updates(AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDtoBuilder b)]) = _$AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto> get serializer => _$AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDtoSerializer();
}

class _$AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDtoSerializer implements PrimitiveSerializer<AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto, _$AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto];

  @override
  final String wireName = r'AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto object, {
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
        specifiedType: const FullType(AiAdminServicesMcpToolsDtosMcpToolDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDtoBuilder result,
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
            specifiedType: const FullType(AiAdminServicesMcpToolsDtosMcpToolDto),
          ) as AiAdminServicesMcpToolsDtosMcpToolDto;
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
  AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDtoBuilder();
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

