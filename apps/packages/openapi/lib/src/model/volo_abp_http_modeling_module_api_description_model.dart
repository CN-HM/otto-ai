//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/volo_abp_http_modeling_controller_api_description_model.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_http_modeling_module_api_description_model.g.dart';

/// VoloAbpHttpModelingModuleApiDescriptionModel
///
/// Properties:
/// * [rootPath] 
/// * [remoteServiceName] 
/// * [controllers] 
@BuiltValue()
abstract class VoloAbpHttpModelingModuleApiDescriptionModel implements Built<VoloAbpHttpModelingModuleApiDescriptionModel, VoloAbpHttpModelingModuleApiDescriptionModelBuilder> {
  @BuiltValueField(wireName: r'rootPath')
  String? get rootPath;

  @BuiltValueField(wireName: r'remoteServiceName')
  String? get remoteServiceName;

  @BuiltValueField(wireName: r'controllers')
  BuiltMap<String, VoloAbpHttpModelingControllerApiDescriptionModel>? get controllers;

  VoloAbpHttpModelingModuleApiDescriptionModel._();

  factory VoloAbpHttpModelingModuleApiDescriptionModel([void updates(VoloAbpHttpModelingModuleApiDescriptionModelBuilder b)]) = _$VoloAbpHttpModelingModuleApiDescriptionModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpHttpModelingModuleApiDescriptionModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpHttpModelingModuleApiDescriptionModel> get serializer => _$VoloAbpHttpModelingModuleApiDescriptionModelSerializer();
}

class _$VoloAbpHttpModelingModuleApiDescriptionModelSerializer implements PrimitiveSerializer<VoloAbpHttpModelingModuleApiDescriptionModel> {
  @override
  final Iterable<Type> types = const [VoloAbpHttpModelingModuleApiDescriptionModel, _$VoloAbpHttpModelingModuleApiDescriptionModel];

  @override
  final String wireName = r'VoloAbpHttpModelingModuleApiDescriptionModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpHttpModelingModuleApiDescriptionModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.rootPath != null) {
      yield r'rootPath';
      yield serializers.serialize(
        object.rootPath,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.remoteServiceName != null) {
      yield r'remoteServiceName';
      yield serializers.serialize(
        object.remoteServiceName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.controllers != null) {
      yield r'controllers';
      yield serializers.serialize(
        object.controllers,
        specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(VoloAbpHttpModelingControllerApiDescriptionModel)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpHttpModelingModuleApiDescriptionModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpHttpModelingModuleApiDescriptionModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'rootPath':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.rootPath = valueDes;
          break;
        case r'remoteServiceName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.remoteServiceName = valueDes;
          break;
        case r'controllers':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(VoloAbpHttpModelingControllerApiDescriptionModel)]),
          ) as BuiltMap<String, VoloAbpHttpModelingControllerApiDescriptionModel>?;
          if (valueDes == null) continue;
          result.controllers.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpHttpModelingModuleApiDescriptionModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpHttpModelingModuleApiDescriptionModelBuilder();
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

