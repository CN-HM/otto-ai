//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:openapi/src/model/volo_abp_asp_net_core_mvc_application_configurations_object_extending_extension_property_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_asp_net_core_mvc_application_configurations_object_extending_entity_extension_dto.g.dart';

/// VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto
///
/// Properties:
/// * [properties] 
/// * [configuration] 
@BuiltValue()
abstract class VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto implements Built<VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto, VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDtoBuilder> {
  @BuiltValueField(wireName: r'properties')
  BuiltMap<String, VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyDto>? get properties;

  @BuiltValueField(wireName: r'configuration')
  BuiltMap<String, JsonObject?>? get configuration;

  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto._();

  factory VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto([void updates(VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDtoBuilder b)]) = _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto> get serializer => _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDtoSerializer();
}

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDtoSerializer implements PrimitiveSerializer<VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto> {
  @override
  final Iterable<Type> types = const [VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto, _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto];

  @override
  final String wireName = r'VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.properties != null) {
      yield r'properties';
      yield serializers.serialize(
        object.properties,
        specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyDto)]),
      );
    }
    if (object.configuration != null) {
      yield r'configuration';
      yield serializers.serialize(
        object.configuration,
        specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'properties':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyDto)]),
          ) as BuiltMap<String, VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyDto>?;
          if (valueDes == null) continue;
          result.properties.replace(valueDes);
          break;
        case r'configuration':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
          ) as BuiltMap<String, JsonObject?>?;
          if (valueDes == null) continue;
          result.configuration.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingEntityExtensionDtoBuilder();
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

