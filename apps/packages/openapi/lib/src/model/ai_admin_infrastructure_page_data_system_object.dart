//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_page_data_system_object.g.dart';

/// AiAdminInfrastructurePageDataSystemObject
///
/// Properties:
/// * [total] 
/// * [list] 
@BuiltValue()
abstract class AiAdminInfrastructurePageDataSystemObject implements Built<AiAdminInfrastructurePageDataSystemObject, AiAdminInfrastructurePageDataSystemObjectBuilder> {
  @BuiltValueField(wireName: r'total')
  int? get total;

  @BuiltValueField(wireName: r'list')
  BuiltList<JsonObject?>? get list;

  AiAdminInfrastructurePageDataSystemObject._();

  factory AiAdminInfrastructurePageDataSystemObject([void updates(AiAdminInfrastructurePageDataSystemObjectBuilder b)]) = _$AiAdminInfrastructurePageDataSystemObject;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructurePageDataSystemObjectBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructurePageDataSystemObject> get serializer => _$AiAdminInfrastructurePageDataSystemObjectSerializer();
}

class _$AiAdminInfrastructurePageDataSystemObjectSerializer implements PrimitiveSerializer<AiAdminInfrastructurePageDataSystemObject> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructurePageDataSystemObject, _$AiAdminInfrastructurePageDataSystemObject];

  @override
  final String wireName = r'AiAdminInfrastructurePageDataSystemObject';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructurePageDataSystemObject object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.total != null) {
      yield r'total';
      yield serializers.serialize(
        object.total,
        specifiedType: const FullType(int),
      );
    }
    if (object.list != null) {
      yield r'list';
      yield serializers.serialize(
        object.list,
        specifiedType: const FullType.nullable(BuiltList, [FullType.nullable(JsonObject)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructurePageDataSystemObject object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructurePageDataSystemObjectBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.total = valueDes;
          break;
        case r'list':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType.nullable(JsonObject)]),
          ) as BuiltList<JsonObject?>?;
          if (valueDes == null) continue;
          result.list.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminInfrastructurePageDataSystemObject deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructurePageDataSystemObjectBuilder();
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

