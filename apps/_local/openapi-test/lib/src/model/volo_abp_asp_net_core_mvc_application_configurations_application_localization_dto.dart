//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/volo_abp_asp_net_core_mvc_application_configurations_application_localization_resource_dto.dart';
import 'package:openapi/src/model/volo_abp_asp_net_core_mvc_application_configurations_current_culture_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_asp_net_core_mvc_application_configurations_application_localization_dto.g.dart';

/// VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto
///
/// Properties:
/// * [resources] 
/// * [currentCulture] 
@BuiltValue()
abstract class VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto implements Built<VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto, VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDtoBuilder> {
  @BuiltValueField(wireName: r'resources')
  BuiltMap<String, VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto>? get resources;

  @BuiltValueField(wireName: r'currentCulture')
  VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDto? get currentCulture;

  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto._();

  factory VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto([void updates(VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDtoBuilder b)]) = _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto> get serializer => _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDtoSerializer();
}

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDtoSerializer implements PrimitiveSerializer<VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto> {
  @override
  final Iterable<Type> types = const [VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto, _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto];

  @override
  final String wireName = r'VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.resources != null) {
      yield r'resources';
      yield serializers.serialize(
        object.resources,
        specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto)]),
      );
    }
    if (object.currentCulture != null) {
      yield r'currentCulture';
      yield serializers.serialize(
        object.currentCulture,
        specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'resources':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto)]),
          ) as BuiltMap<String, VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto>?;
          if (valueDes == null) continue;
          result.resources.replace(valueDes);
          break;
        case r'currentCulture':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDto),
          ) as VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDto;
          result.currentCulture.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDtoBuilder();
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

