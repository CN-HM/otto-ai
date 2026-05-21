//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_http_modeling_parameter_api_description_model.g.dart';

/// VoloAbpHttpModelingParameterApiDescriptionModel
///
/// Properties:
/// * [nameOnMethod] 
/// * [name] 
/// * [jsonName] 
/// * [type] 
/// * [typeSimple] 
/// * [isOptional] 
/// * [defaultValue] 
/// * [constraintTypes] 
/// * [bindingSourceId] 
/// * [descriptorName] 
@BuiltValue()
abstract class VoloAbpHttpModelingParameterApiDescriptionModel implements Built<VoloAbpHttpModelingParameterApiDescriptionModel, VoloAbpHttpModelingParameterApiDescriptionModelBuilder> {
  @BuiltValueField(wireName: r'nameOnMethod')
  String? get nameOnMethod;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'jsonName')
  String? get jsonName;

  @BuiltValueField(wireName: r'type')
  String? get type;

  @BuiltValueField(wireName: r'typeSimple')
  String? get typeSimple;

  @BuiltValueField(wireName: r'isOptional')
  bool? get isOptional;

  @BuiltValueField(wireName: r'defaultValue')
  JsonObject? get defaultValue;

  @BuiltValueField(wireName: r'constraintTypes')
  BuiltList<String>? get constraintTypes;

  @BuiltValueField(wireName: r'bindingSourceId')
  String? get bindingSourceId;

  @BuiltValueField(wireName: r'descriptorName')
  String? get descriptorName;

  VoloAbpHttpModelingParameterApiDescriptionModel._();

  factory VoloAbpHttpModelingParameterApiDescriptionModel([void updates(VoloAbpHttpModelingParameterApiDescriptionModelBuilder b)]) = _$VoloAbpHttpModelingParameterApiDescriptionModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpHttpModelingParameterApiDescriptionModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpHttpModelingParameterApiDescriptionModel> get serializer => _$VoloAbpHttpModelingParameterApiDescriptionModelSerializer();
}

class _$VoloAbpHttpModelingParameterApiDescriptionModelSerializer implements PrimitiveSerializer<VoloAbpHttpModelingParameterApiDescriptionModel> {
  @override
  final Iterable<Type> types = const [VoloAbpHttpModelingParameterApiDescriptionModel, _$VoloAbpHttpModelingParameterApiDescriptionModel];

  @override
  final String wireName = r'VoloAbpHttpModelingParameterApiDescriptionModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpHttpModelingParameterApiDescriptionModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.nameOnMethod != null) {
      yield r'nameOnMethod';
      yield serializers.serialize(
        object.nameOnMethod,
        specifiedType: const FullType.nullable(String),
      );
    }
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
    if (object.isOptional != null) {
      yield r'isOptional';
      yield serializers.serialize(
        object.isOptional,
        specifiedType: const FullType(bool),
      );
    }
    if (object.defaultValue != null) {
      yield r'defaultValue';
      yield serializers.serialize(
        object.defaultValue,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.constraintTypes != null) {
      yield r'constraintTypes';
      yield serializers.serialize(
        object.constraintTypes,
        specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
      );
    }
    if (object.bindingSourceId != null) {
      yield r'bindingSourceId';
      yield serializers.serialize(
        object.bindingSourceId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.descriptorName != null) {
      yield r'descriptorName';
      yield serializers.serialize(
        object.descriptorName,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpHttpModelingParameterApiDescriptionModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpHttpModelingParameterApiDescriptionModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'nameOnMethod':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.nameOnMethod = valueDes;
          break;
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
        case r'isOptional':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isOptional = valueDes;
          break;
        case r'defaultValue':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.defaultValue = valueDes;
          break;
        case r'constraintTypes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.constraintTypes.replace(valueDes);
          break;
        case r'bindingSourceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.bindingSourceId = valueDes;
          break;
        case r'descriptorName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.descriptorName = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpHttpModelingParameterApiDescriptionModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpHttpModelingParameterApiDescriptionModelBuilder();
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

