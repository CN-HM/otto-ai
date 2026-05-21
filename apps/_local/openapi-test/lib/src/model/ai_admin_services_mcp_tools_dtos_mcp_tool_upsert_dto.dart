//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_mcp_tools_dtos_mcp_tool_upsert_dto.g.dart';

/// AiAdminServicesMcpToolsDtosMcpToolUpsertDto
///
/// Properties:
/// * [code] 
/// * [name] 
/// * [description] 
/// * [category] 
/// * [paramSchema] 
/// * [status] 
/// * [sort] 
@BuiltValue()
abstract class AiAdminServicesMcpToolsDtosMcpToolUpsertDto implements Built<AiAdminServicesMcpToolsDtosMcpToolUpsertDto, AiAdminServicesMcpToolsDtosMcpToolUpsertDtoBuilder> {
  @BuiltValueField(wireName: r'code')
  String get code;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'category')
  String? get category;

  @BuiltValueField(wireName: r'paramSchema')
  String? get paramSchema;

  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'sort')
  int? get sort;

  AiAdminServicesMcpToolsDtosMcpToolUpsertDto._();

  factory AiAdminServicesMcpToolsDtosMcpToolUpsertDto([void updates(AiAdminServicesMcpToolsDtosMcpToolUpsertDtoBuilder b)]) = _$AiAdminServicesMcpToolsDtosMcpToolUpsertDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesMcpToolsDtosMcpToolUpsertDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesMcpToolsDtosMcpToolUpsertDto> get serializer => _$AiAdminServicesMcpToolsDtosMcpToolUpsertDtoSerializer();
}

class _$AiAdminServicesMcpToolsDtosMcpToolUpsertDtoSerializer implements PrimitiveSerializer<AiAdminServicesMcpToolsDtosMcpToolUpsertDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesMcpToolsDtosMcpToolUpsertDto, _$AiAdminServicesMcpToolsDtosMcpToolUpsertDto];

  @override
  final String wireName = r'AiAdminServicesMcpToolsDtosMcpToolUpsertDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesMcpToolsDtosMcpToolUpsertDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.category != null) {
      yield r'category';
      yield serializers.serialize(
        object.category,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.paramSchema != null) {
      yield r'paramSchema';
      yield serializers.serialize(
        object.paramSchema,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(String),
    );
    if (object.sort != null) {
      yield r'sort';
      yield serializers.serialize(
        object.sort,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesMcpToolsDtosMcpToolUpsertDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesMcpToolsDtosMcpToolUpsertDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'category':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.category = valueDes;
          break;
        case r'paramSchema':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.paramSchema = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        case r'sort':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.sort = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesMcpToolsDtosMcpToolUpsertDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesMcpToolsDtosMcpToolUpsertDtoBuilder();
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

