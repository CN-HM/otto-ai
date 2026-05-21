//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_result_system_collections_generic_list_system_string.g.dart';

/// AiAdminInfrastructureResultSystemCollectionsGenericListSystemString
///
/// Properties:
/// * [code] 
/// * [msg] 
/// * [data] 
@BuiltValue()
abstract class AiAdminInfrastructureResultSystemCollectionsGenericListSystemString implements Built<AiAdminInfrastructureResultSystemCollectionsGenericListSystemString, AiAdminInfrastructureResultSystemCollectionsGenericListSystemStringBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'msg')
  String? get msg;

  @BuiltValueField(wireName: r'data')
  BuiltList<String>? get data;

  AiAdminInfrastructureResultSystemCollectionsGenericListSystemString._();

  factory AiAdminInfrastructureResultSystemCollectionsGenericListSystemString([void updates(AiAdminInfrastructureResultSystemCollectionsGenericListSystemStringBuilder b)]) = _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemString;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructureResultSystemCollectionsGenericListSystemStringBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructureResultSystemCollectionsGenericListSystemString> get serializer => _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemStringSerializer();
}

class _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemStringSerializer implements PrimitiveSerializer<AiAdminInfrastructureResultSystemCollectionsGenericListSystemString> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructureResultSystemCollectionsGenericListSystemString, _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemString];

  @override
  final String wireName = r'AiAdminInfrastructureResultSystemCollectionsGenericListSystemString';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructureResultSystemCollectionsGenericListSystemString object, {
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
        specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructureResultSystemCollectionsGenericListSystemString object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructureResultSystemCollectionsGenericListSystemStringBuilder result,
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
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
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
  AiAdminInfrastructureResultSystemCollectionsGenericListSystemString deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructureResultSystemCollectionsGenericListSystemStringBuilder();
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

