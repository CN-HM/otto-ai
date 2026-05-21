//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/volo_abp_http_modeling_interface_method_api_description_model.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_http_modeling_controller_interface_api_description_model.g.dart';

/// VoloAbpHttpModelingControllerInterfaceApiDescriptionModel
///
/// Properties:
/// * [type] 
/// * [name] 
/// * [methods] 
@BuiltValue()
abstract class VoloAbpHttpModelingControllerInterfaceApiDescriptionModel implements Built<VoloAbpHttpModelingControllerInterfaceApiDescriptionModel, VoloAbpHttpModelingControllerInterfaceApiDescriptionModelBuilder> {
  @BuiltValueField(wireName: r'type')
  String? get type;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'methods')
  BuiltList<VoloAbpHttpModelingInterfaceMethodApiDescriptionModel>? get methods;

  VoloAbpHttpModelingControllerInterfaceApiDescriptionModel._();

  factory VoloAbpHttpModelingControllerInterfaceApiDescriptionModel([void updates(VoloAbpHttpModelingControllerInterfaceApiDescriptionModelBuilder b)]) = _$VoloAbpHttpModelingControllerInterfaceApiDescriptionModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpHttpModelingControllerInterfaceApiDescriptionModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpHttpModelingControllerInterfaceApiDescriptionModel> get serializer => _$VoloAbpHttpModelingControllerInterfaceApiDescriptionModelSerializer();
}

class _$VoloAbpHttpModelingControllerInterfaceApiDescriptionModelSerializer implements PrimitiveSerializer<VoloAbpHttpModelingControllerInterfaceApiDescriptionModel> {
  @override
  final Iterable<Type> types = const [VoloAbpHttpModelingControllerInterfaceApiDescriptionModel, _$VoloAbpHttpModelingControllerInterfaceApiDescriptionModel];

  @override
  final String wireName = r'VoloAbpHttpModelingControllerInterfaceApiDescriptionModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpHttpModelingControllerInterfaceApiDescriptionModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
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
    if (object.methods != null) {
      yield r'methods';
      yield serializers.serialize(
        object.methods,
        specifiedType: const FullType.nullable(BuiltList, [FullType(VoloAbpHttpModelingInterfaceMethodApiDescriptionModel)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpHttpModelingControllerInterfaceApiDescriptionModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpHttpModelingControllerInterfaceApiDescriptionModelBuilder result,
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
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'methods':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(VoloAbpHttpModelingInterfaceMethodApiDescriptionModel)]),
          ) as BuiltList<VoloAbpHttpModelingInterfaceMethodApiDescriptionModel>?;
          if (valueDes == null) continue;
          result.methods.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpHttpModelingControllerInterfaceApiDescriptionModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpHttpModelingControllerInterfaceApiDescriptionModelBuilder();
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

