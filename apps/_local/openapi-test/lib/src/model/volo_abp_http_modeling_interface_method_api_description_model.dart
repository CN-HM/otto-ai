//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/volo_abp_http_modeling_method_parameter_api_description_model.dart';
import 'package:openapi/src/model/volo_abp_http_modeling_return_value_api_description_model.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_http_modeling_interface_method_api_description_model.g.dart';

/// VoloAbpHttpModelingInterfaceMethodApiDescriptionModel
///
/// Properties:
/// * [name] 
/// * [parametersOnMethod] 
/// * [returnValue] 
@BuiltValue()
abstract class VoloAbpHttpModelingInterfaceMethodApiDescriptionModel implements Built<VoloAbpHttpModelingInterfaceMethodApiDescriptionModel, VoloAbpHttpModelingInterfaceMethodApiDescriptionModelBuilder> {
  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'parametersOnMethod')
  BuiltList<VoloAbpHttpModelingMethodParameterApiDescriptionModel>? get parametersOnMethod;

  @BuiltValueField(wireName: r'returnValue')
  VoloAbpHttpModelingReturnValueApiDescriptionModel? get returnValue;

  VoloAbpHttpModelingInterfaceMethodApiDescriptionModel._();

  factory VoloAbpHttpModelingInterfaceMethodApiDescriptionModel([void updates(VoloAbpHttpModelingInterfaceMethodApiDescriptionModelBuilder b)]) = _$VoloAbpHttpModelingInterfaceMethodApiDescriptionModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpHttpModelingInterfaceMethodApiDescriptionModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpHttpModelingInterfaceMethodApiDescriptionModel> get serializer => _$VoloAbpHttpModelingInterfaceMethodApiDescriptionModelSerializer();
}

class _$VoloAbpHttpModelingInterfaceMethodApiDescriptionModelSerializer implements PrimitiveSerializer<VoloAbpHttpModelingInterfaceMethodApiDescriptionModel> {
  @override
  final Iterable<Type> types = const [VoloAbpHttpModelingInterfaceMethodApiDescriptionModel, _$VoloAbpHttpModelingInterfaceMethodApiDescriptionModel];

  @override
  final String wireName = r'VoloAbpHttpModelingInterfaceMethodApiDescriptionModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpHttpModelingInterfaceMethodApiDescriptionModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.parametersOnMethod != null) {
      yield r'parametersOnMethod';
      yield serializers.serialize(
        object.parametersOnMethod,
        specifiedType: const FullType.nullable(BuiltList, [FullType(VoloAbpHttpModelingMethodParameterApiDescriptionModel)]),
      );
    }
    if (object.returnValue != null) {
      yield r'returnValue';
      yield serializers.serialize(
        object.returnValue,
        specifiedType: const FullType(VoloAbpHttpModelingReturnValueApiDescriptionModel),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpHttpModelingInterfaceMethodApiDescriptionModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpHttpModelingInterfaceMethodApiDescriptionModelBuilder result,
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
        case r'parametersOnMethod':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(VoloAbpHttpModelingMethodParameterApiDescriptionModel)]),
          ) as BuiltList<VoloAbpHttpModelingMethodParameterApiDescriptionModel>?;
          if (valueDes == null) continue;
          result.parametersOnMethod.replace(valueDes);
          break;
        case r'returnValue':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VoloAbpHttpModelingReturnValueApiDescriptionModel),
          ) as VoloAbpHttpModelingReturnValueApiDescriptionModel;
          result.returnValue.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpHttpModelingInterfaceMethodApiDescriptionModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpHttpModelingInterfaceMethodApiDescriptionModelBuilder();
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

