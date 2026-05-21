//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_name_value.g.dart';

/// VoloAbpNameValue
///
/// Properties:
/// * [name] 
/// * [value] 
@BuiltValue()
abstract class VoloAbpNameValue implements Built<VoloAbpNameValue, VoloAbpNameValueBuilder> {
  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'value')
  String? get value;

  VoloAbpNameValue._();

  factory VoloAbpNameValue([void updates(VoloAbpNameValueBuilder b)]) = _$VoloAbpNameValue;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpNameValueBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpNameValue> get serializer => _$VoloAbpNameValueSerializer();
}

class _$VoloAbpNameValueSerializer implements PrimitiveSerializer<VoloAbpNameValue> {
  @override
  final Iterable<Type> types = const [VoloAbpNameValue, _$VoloAbpNameValue];

  @override
  final String wireName = r'VoloAbpNameValue';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpNameValue object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.value != null) {
      yield r'value';
      yield serializers.serialize(
        object.value,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpNameValue object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpNameValueBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'value':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.value = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpNameValue deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpNameValueBuilder();
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

