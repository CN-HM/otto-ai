//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/volo_abp_http_modeling_module_api_description_model.dart';
import 'package:openapi/src/model/volo_abp_http_modeling_type_api_description_model.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_http_modeling_application_api_description_model.g.dart';

/// VoloAbpHttpModelingApplicationApiDescriptionModel
///
/// Properties:
/// * [modules] 
/// * [types] 
@BuiltValue()
abstract class VoloAbpHttpModelingApplicationApiDescriptionModel implements Built<VoloAbpHttpModelingApplicationApiDescriptionModel, VoloAbpHttpModelingApplicationApiDescriptionModelBuilder> {
  @BuiltValueField(wireName: r'modules')
  BuiltMap<String, VoloAbpHttpModelingModuleApiDescriptionModel>? get modules;

  @BuiltValueField(wireName: r'types')
  BuiltMap<String, VoloAbpHttpModelingTypeApiDescriptionModel>? get types;

  VoloAbpHttpModelingApplicationApiDescriptionModel._();

  factory VoloAbpHttpModelingApplicationApiDescriptionModel([void updates(VoloAbpHttpModelingApplicationApiDescriptionModelBuilder b)]) = _$VoloAbpHttpModelingApplicationApiDescriptionModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpHttpModelingApplicationApiDescriptionModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpHttpModelingApplicationApiDescriptionModel> get serializer => _$VoloAbpHttpModelingApplicationApiDescriptionModelSerializer();
}

class _$VoloAbpHttpModelingApplicationApiDescriptionModelSerializer implements PrimitiveSerializer<VoloAbpHttpModelingApplicationApiDescriptionModel> {
  @override
  final Iterable<Type> types = const [VoloAbpHttpModelingApplicationApiDescriptionModel, _$VoloAbpHttpModelingApplicationApiDescriptionModel];

  @override
  final String wireName = r'VoloAbpHttpModelingApplicationApiDescriptionModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpHttpModelingApplicationApiDescriptionModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.modules != null) {
      yield r'modules';
      yield serializers.serialize(
        object.modules,
        specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(VoloAbpHttpModelingModuleApiDescriptionModel)]),
      );
    }
    if (object.types != null) {
      yield r'types';
      yield serializers.serialize(
        object.types,
        specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(VoloAbpHttpModelingTypeApiDescriptionModel)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpHttpModelingApplicationApiDescriptionModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpHttpModelingApplicationApiDescriptionModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'modules':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(VoloAbpHttpModelingModuleApiDescriptionModel)]),
          ) as BuiltMap<String, VoloAbpHttpModelingModuleApiDescriptionModel>?;
          if (valueDes == null) continue;
          result.modules.replace(valueDes);
          break;
        case r'types':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(VoloAbpHttpModelingTypeApiDescriptionModel)]),
          ) as BuiltMap<String, VoloAbpHttpModelingTypeApiDescriptionModel>?;
          if (valueDes == null) continue;
          result.types.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpHttpModelingApplicationApiDescriptionModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpHttpModelingApplicationApiDescriptionModelBuilder();
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

