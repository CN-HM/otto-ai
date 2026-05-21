//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_http_modeling_return_value_api_description_model.g.dart';

/// VoloAbpHttpModelingReturnValueApiDescriptionModel
///
/// Properties:
/// * [type] 
/// * [typeSimple] 
@BuiltValue()
abstract class VoloAbpHttpModelingReturnValueApiDescriptionModel implements Built<VoloAbpHttpModelingReturnValueApiDescriptionModel, VoloAbpHttpModelingReturnValueApiDescriptionModelBuilder> {
  @BuiltValueField(wireName: r'type')
  String? get type;

  @BuiltValueField(wireName: r'typeSimple')
  String? get typeSimple;

  VoloAbpHttpModelingReturnValueApiDescriptionModel._();

  factory VoloAbpHttpModelingReturnValueApiDescriptionModel([void updates(VoloAbpHttpModelingReturnValueApiDescriptionModelBuilder b)]) = _$VoloAbpHttpModelingReturnValueApiDescriptionModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpHttpModelingReturnValueApiDescriptionModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpHttpModelingReturnValueApiDescriptionModel> get serializer => _$VoloAbpHttpModelingReturnValueApiDescriptionModelSerializer();
}

class _$VoloAbpHttpModelingReturnValueApiDescriptionModelSerializer implements PrimitiveSerializer<VoloAbpHttpModelingReturnValueApiDescriptionModel> {
  @override
  final Iterable<Type> types = const [VoloAbpHttpModelingReturnValueApiDescriptionModel, _$VoloAbpHttpModelingReturnValueApiDescriptionModel];

  @override
  final String wireName = r'VoloAbpHttpModelingReturnValueApiDescriptionModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpHttpModelingReturnValueApiDescriptionModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpHttpModelingReturnValueApiDescriptionModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpHttpModelingReturnValueApiDescriptionModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpHttpModelingReturnValueApiDescriptionModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpHttpModelingReturnValueApiDescriptionModelBuilder();
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

