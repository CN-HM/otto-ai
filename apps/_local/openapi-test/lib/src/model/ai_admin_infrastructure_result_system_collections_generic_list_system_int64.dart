//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_result_system_collections_generic_list_system_int64.g.dart';

/// AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64
///
/// Properties:
/// * [code] 
/// * [msg] 
/// * [data] 
@BuiltValue()
abstract class AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64 implements Built<AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64, AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64Builder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'msg')
  String? get msg;

  @BuiltValueField(wireName: r'data')
  BuiltList<int>? get data;

  AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64._();

  factory AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64([void updates(AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64Builder b)]) = _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64Builder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64> get serializer => _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64Serializer();
}

class _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64Serializer implements PrimitiveSerializer<AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64, _$AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64];

  @override
  final String wireName = r'AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64 object, {
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
        specifiedType: const FullType.nullable(BuiltList, [FullType(int)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64 object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64Builder result,
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
            specifiedType: const FullType.nullable(BuiltList, [FullType(int)]),
          ) as BuiltList<int>?;
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
  AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64 deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64Builder();
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

