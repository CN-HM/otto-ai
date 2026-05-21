//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/volo_abp_http_modeling_action_api_description_model.dart';
import 'package:openapi/src/model/volo_abp_http_modeling_controller_interface_api_description_model.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_http_modeling_controller_api_description_model.g.dart';

/// VoloAbpHttpModelingControllerApiDescriptionModel
///
/// Properties:
/// * [controllerName] 
/// * [controllerGroupName] 
/// * [isRemoteService] 
/// * [isIntegrationService] 
/// * [apiVersion] 
/// * [type] 
/// * [interfaces] 
/// * [actions] 
@BuiltValue()
abstract class VoloAbpHttpModelingControllerApiDescriptionModel implements Built<VoloAbpHttpModelingControllerApiDescriptionModel, VoloAbpHttpModelingControllerApiDescriptionModelBuilder> {
  @BuiltValueField(wireName: r'controllerName')
  String? get controllerName;

  @BuiltValueField(wireName: r'controllerGroupName')
  String? get controllerGroupName;

  @BuiltValueField(wireName: r'isRemoteService')
  bool? get isRemoteService;

  @BuiltValueField(wireName: r'isIntegrationService')
  bool? get isIntegrationService;

  @BuiltValueField(wireName: r'apiVersion')
  String? get apiVersion;

  @BuiltValueField(wireName: r'type')
  String? get type;

  @BuiltValueField(wireName: r'interfaces')
  BuiltList<VoloAbpHttpModelingControllerInterfaceApiDescriptionModel>? get interfaces;

  @BuiltValueField(wireName: r'actions')
  BuiltMap<String, VoloAbpHttpModelingActionApiDescriptionModel>? get actions;

  VoloAbpHttpModelingControllerApiDescriptionModel._();

  factory VoloAbpHttpModelingControllerApiDescriptionModel([void updates(VoloAbpHttpModelingControllerApiDescriptionModelBuilder b)]) = _$VoloAbpHttpModelingControllerApiDescriptionModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpHttpModelingControllerApiDescriptionModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpHttpModelingControllerApiDescriptionModel> get serializer => _$VoloAbpHttpModelingControllerApiDescriptionModelSerializer();
}

class _$VoloAbpHttpModelingControllerApiDescriptionModelSerializer implements PrimitiveSerializer<VoloAbpHttpModelingControllerApiDescriptionModel> {
  @override
  final Iterable<Type> types = const [VoloAbpHttpModelingControllerApiDescriptionModel, _$VoloAbpHttpModelingControllerApiDescriptionModel];

  @override
  final String wireName = r'VoloAbpHttpModelingControllerApiDescriptionModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpHttpModelingControllerApiDescriptionModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.controllerName != null) {
      yield r'controllerName';
      yield serializers.serialize(
        object.controllerName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.controllerGroupName != null) {
      yield r'controllerGroupName';
      yield serializers.serialize(
        object.controllerGroupName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.isRemoteService != null) {
      yield r'isRemoteService';
      yield serializers.serialize(
        object.isRemoteService,
        specifiedType: const FullType(bool),
      );
    }
    if (object.isIntegrationService != null) {
      yield r'isIntegrationService';
      yield serializers.serialize(
        object.isIntegrationService,
        specifiedType: const FullType(bool),
      );
    }
    if (object.apiVersion != null) {
      yield r'apiVersion';
      yield serializers.serialize(
        object.apiVersion,
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
    if (object.interfaces != null) {
      yield r'interfaces';
      yield serializers.serialize(
        object.interfaces,
        specifiedType: const FullType.nullable(BuiltList, [FullType(VoloAbpHttpModelingControllerInterfaceApiDescriptionModel)]),
      );
    }
    if (object.actions != null) {
      yield r'actions';
      yield serializers.serialize(
        object.actions,
        specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(VoloAbpHttpModelingActionApiDescriptionModel)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpHttpModelingControllerApiDescriptionModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpHttpModelingControllerApiDescriptionModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'controllerName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.controllerName = valueDes;
          break;
        case r'controllerGroupName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.controllerGroupName = valueDes;
          break;
        case r'isRemoteService':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isRemoteService = valueDes;
          break;
        case r'isIntegrationService':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isIntegrationService = valueDes;
          break;
        case r'apiVersion':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.apiVersion = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.type = valueDes;
          break;
        case r'interfaces':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(VoloAbpHttpModelingControllerInterfaceApiDescriptionModel)]),
          ) as BuiltList<VoloAbpHttpModelingControllerInterfaceApiDescriptionModel>?;
          if (valueDes == null) continue;
          result.interfaces.replace(valueDes);
          break;
        case r'actions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(VoloAbpHttpModelingActionApiDescriptionModel)]),
          ) as BuiltMap<String, VoloAbpHttpModelingActionApiDescriptionModel>?;
          if (valueDes == null) continue;
          result.actions.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpHttpModelingControllerApiDescriptionModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpHttpModelingControllerApiDescriptionModelBuilder();
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

