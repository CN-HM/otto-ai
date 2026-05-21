//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/volo_abp_http_modeling_method_parameter_api_description_model.dart';
import 'package:openapi/src/model/volo_abp_http_modeling_parameter_api_description_model.dart';
import 'package:openapi/src/model/volo_abp_http_modeling_return_value_api_description_model.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_http_modeling_action_api_description_model.g.dart';

/// VoloAbpHttpModelingActionApiDescriptionModel
///
/// Properties:
/// * [uniqueName] 
/// * [name] 
/// * [httpMethod] 
/// * [url] 
/// * [supportedVersions] 
/// * [parametersOnMethod] 
/// * [parameters] 
/// * [returnValue] 
/// * [allowAnonymous] 
/// * [implementFrom] 
@BuiltValue()
abstract class VoloAbpHttpModelingActionApiDescriptionModel implements Built<VoloAbpHttpModelingActionApiDescriptionModel, VoloAbpHttpModelingActionApiDescriptionModelBuilder> {
  @BuiltValueField(wireName: r'uniqueName')
  String? get uniqueName;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'httpMethod')
  String? get httpMethod;

  @BuiltValueField(wireName: r'url')
  String? get url;

  @BuiltValueField(wireName: r'supportedVersions')
  BuiltList<String>? get supportedVersions;

  @BuiltValueField(wireName: r'parametersOnMethod')
  BuiltList<VoloAbpHttpModelingMethodParameterApiDescriptionModel>? get parametersOnMethod;

  @BuiltValueField(wireName: r'parameters')
  BuiltList<VoloAbpHttpModelingParameterApiDescriptionModel>? get parameters;

  @BuiltValueField(wireName: r'returnValue')
  VoloAbpHttpModelingReturnValueApiDescriptionModel? get returnValue;

  @BuiltValueField(wireName: r'allowAnonymous')
  bool? get allowAnonymous;

  @BuiltValueField(wireName: r'implementFrom')
  String? get implementFrom;

  VoloAbpHttpModelingActionApiDescriptionModel._();

  factory VoloAbpHttpModelingActionApiDescriptionModel([void updates(VoloAbpHttpModelingActionApiDescriptionModelBuilder b)]) = _$VoloAbpHttpModelingActionApiDescriptionModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpHttpModelingActionApiDescriptionModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpHttpModelingActionApiDescriptionModel> get serializer => _$VoloAbpHttpModelingActionApiDescriptionModelSerializer();
}

class _$VoloAbpHttpModelingActionApiDescriptionModelSerializer implements PrimitiveSerializer<VoloAbpHttpModelingActionApiDescriptionModel> {
  @override
  final Iterable<Type> types = const [VoloAbpHttpModelingActionApiDescriptionModel, _$VoloAbpHttpModelingActionApiDescriptionModel];

  @override
  final String wireName = r'VoloAbpHttpModelingActionApiDescriptionModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpHttpModelingActionApiDescriptionModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.uniqueName != null) {
      yield r'uniqueName';
      yield serializers.serialize(
        object.uniqueName,
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
    if (object.httpMethod != null) {
      yield r'httpMethod';
      yield serializers.serialize(
        object.httpMethod,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.url != null) {
      yield r'url';
      yield serializers.serialize(
        object.url,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.supportedVersions != null) {
      yield r'supportedVersions';
      yield serializers.serialize(
        object.supportedVersions,
        specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
      );
    }
    if (object.parametersOnMethod != null) {
      yield r'parametersOnMethod';
      yield serializers.serialize(
        object.parametersOnMethod,
        specifiedType: const FullType.nullable(BuiltList, [FullType(VoloAbpHttpModelingMethodParameterApiDescriptionModel)]),
      );
    }
    if (object.parameters != null) {
      yield r'parameters';
      yield serializers.serialize(
        object.parameters,
        specifiedType: const FullType.nullable(BuiltList, [FullType(VoloAbpHttpModelingParameterApiDescriptionModel)]),
      );
    }
    if (object.returnValue != null) {
      yield r'returnValue';
      yield serializers.serialize(
        object.returnValue,
        specifiedType: const FullType(VoloAbpHttpModelingReturnValueApiDescriptionModel),
      );
    }
    if (object.allowAnonymous != null) {
      yield r'allowAnonymous';
      yield serializers.serialize(
        object.allowAnonymous,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.implementFrom != null) {
      yield r'implementFrom';
      yield serializers.serialize(
        object.implementFrom,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpHttpModelingActionApiDescriptionModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpHttpModelingActionApiDescriptionModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'uniqueName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.uniqueName = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'httpMethod':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.httpMethod = valueDes;
          break;
        case r'url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.url = valueDes;
          break;
        case r'supportedVersions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.supportedVersions.replace(valueDes);
          break;
        case r'parametersOnMethod':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(VoloAbpHttpModelingMethodParameterApiDescriptionModel)]),
          ) as BuiltList<VoloAbpHttpModelingMethodParameterApiDescriptionModel>?;
          if (valueDes == null) continue;
          result.parametersOnMethod.replace(valueDes);
          break;
        case r'parameters':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(VoloAbpHttpModelingParameterApiDescriptionModel)]),
          ) as BuiltList<VoloAbpHttpModelingParameterApiDescriptionModel>?;
          if (valueDes == null) continue;
          result.parameters.replace(valueDes);
          break;
        case r'returnValue':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VoloAbpHttpModelingReturnValueApiDescriptionModel),
          ) as VoloAbpHttpModelingReturnValueApiDescriptionModel;
          result.returnValue.replace(valueDes);
          break;
        case r'allowAnonymous':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.allowAnonymous = valueDes;
          break;
        case r'implementFrom':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.implementFrom = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpHttpModelingActionApiDescriptionModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpHttpModelingActionApiDescriptionModelBuilder();
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

