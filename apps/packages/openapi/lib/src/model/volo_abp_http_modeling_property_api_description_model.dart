//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_http_modeling_property_api_description_model.g.dart';

/// VoloAbpHttpModelingPropertyApiDescriptionModel
///
/// Properties:
/// * [name] 
/// * [jsonName] 
/// * [type] 
/// * [typeSimple] 
/// * [isRequired] 
/// * [minLength] 
/// * [maxLength] 
/// * [minimum] 
/// * [maximum] 
/// * [regex] 
/// * [isNullable] 
@BuiltValue()
abstract class VoloAbpHttpModelingPropertyApiDescriptionModel implements Built<VoloAbpHttpModelingPropertyApiDescriptionModel, VoloAbpHttpModelingPropertyApiDescriptionModelBuilder> {
  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'jsonName')
  String? get jsonName;

  @BuiltValueField(wireName: r'type')
  String? get type;

  @BuiltValueField(wireName: r'typeSimple')
  String? get typeSimple;

  @BuiltValueField(wireName: r'isRequired')
  bool? get isRequired;

  @BuiltValueField(wireName: r'minLength')
  int? get minLength;

  @BuiltValueField(wireName: r'maxLength')
  int? get maxLength;

  @BuiltValueField(wireName: r'minimum')
  String? get minimum;

  @BuiltValueField(wireName: r'maximum')
  String? get maximum;

  @BuiltValueField(wireName: r'regex')
  String? get regex;

  @BuiltValueField(wireName: r'isNullable')
  bool? get isNullable;

  VoloAbpHttpModelingPropertyApiDescriptionModel._();

  factory VoloAbpHttpModelingPropertyApiDescriptionModel([void updates(VoloAbpHttpModelingPropertyApiDescriptionModelBuilder b)]) = _$VoloAbpHttpModelingPropertyApiDescriptionModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpHttpModelingPropertyApiDescriptionModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpHttpModelingPropertyApiDescriptionModel> get serializer => _$VoloAbpHttpModelingPropertyApiDescriptionModelSerializer();
}

class _$VoloAbpHttpModelingPropertyApiDescriptionModelSerializer implements PrimitiveSerializer<VoloAbpHttpModelingPropertyApiDescriptionModel> {
  @override
  final Iterable<Type> types = const [VoloAbpHttpModelingPropertyApiDescriptionModel, _$VoloAbpHttpModelingPropertyApiDescriptionModel];

  @override
  final String wireName = r'VoloAbpHttpModelingPropertyApiDescriptionModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpHttpModelingPropertyApiDescriptionModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.jsonName != null) {
      yield r'jsonName';
      yield serializers.serialize(
        object.jsonName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.typeSimple != null) {
      yield r'typeSimple';
      yield serializers.serialize(
        object.typeSimple,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.isRequired != null) {
      yield r'isRequired';
      yield serializers.serialize(
        object.isRequired,
        specifiedType: const FullType(bool),
      );
    }
    if (object.minLength != null) {
      yield r'minLength';
      yield serializers.serialize(
        object.minLength,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.maxLength != null) {
      yield r'maxLength';
      yield serializers.serialize(
        object.maxLength,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.minimum != null) {
      yield r'minimum';
      yield serializers.serialize(
        object.minimum,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.maximum != null) {
      yield r'maximum';
      yield serializers.serialize(
        object.maximum,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.regex != null) {
      yield r'regex';
      yield serializers.serialize(
        object.regex,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.isNullable != null) {
      yield r'isNullable';
      yield serializers.serialize(
        object.isNullable,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpHttpModelingPropertyApiDescriptionModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpHttpModelingPropertyApiDescriptionModelBuilder result,
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
        case r'jsonName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.jsonName = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.type = valueDes;
          break;
        case r'typeSimple':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.typeSimple = valueDes;
          break;
        case r'isRequired':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isRequired = valueDes;
          break;
        case r'minLength':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.minLength = valueDes;
          break;
        case r'maxLength':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.maxLength = valueDes;
          break;
        case r'minimum':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.minimum = valueDes;
          break;
        case r'maximum':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.maximum = valueDes;
          break;
        case r'regex':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.regex = valueDes;
          break;
        case r'isNullable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isNullable = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpHttpModelingPropertyApiDescriptionModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpHttpModelingPropertyApiDescriptionModelBuilder();
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

