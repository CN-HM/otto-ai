//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_asp_net_core_mvc_application_configurations_application_localization_resource_dto.g.dart';

/// VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto
///
/// Properties:
/// * [texts] 
/// * [baseResources] 
@BuiltValue()
abstract class VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto implements Built<VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto, VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDtoBuilder> {
  @BuiltValueField(wireName: r'texts')
  BuiltMap<String, String>? get texts;

  @BuiltValueField(wireName: r'baseResources')
  BuiltList<String>? get baseResources;

  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto._();

  factory VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto([void updates(VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDtoBuilder b)]) = _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto> get serializer => _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDtoSerializer();
}

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDtoSerializer implements PrimitiveSerializer<VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto> {
  @override
  final Iterable<Type> types = const [VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto, _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto];

  @override
  final String wireName = r'VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.texts != null) {
      yield r'texts';
      yield serializers.serialize(
        object.texts,
        specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(String)]),
      );
    }
    if (object.baseResources != null) {
      yield r'baseResources';
      yield serializers.serialize(
        object.baseResources,
        specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'texts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(String)]),
          ) as BuiltMap<String, String>?;
          if (valueDes == null) continue;
          result.texts.replace(valueDes);
          break;
        case r'baseResources':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.baseResources.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDtoBuilder();
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

