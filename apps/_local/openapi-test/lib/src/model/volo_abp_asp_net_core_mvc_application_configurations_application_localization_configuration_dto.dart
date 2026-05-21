//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/volo_abp_name_value.dart';
import 'package:openapi/src/model/volo_abp_asp_net_core_mvc_application_configurations_application_localization_resource_dto.dart';
import 'package:openapi/src/model/volo_abp_asp_net_core_mvc_application_configurations_current_culture_dto.dart';
import 'package:openapi/src/model/volo_abp_localization_language_info.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_asp_net_core_mvc_application_configurations_application_localization_configuration_dto.g.dart';

/// VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto
///
/// Properties:
/// * [values] 
/// * [resources] 
/// * [languages] 
/// * [currentCulture] 
/// * [defaultResourceName] 
/// * [languagesMap] 
/// * [languageFilesMap] 
@BuiltValue()
abstract class VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto implements Built<VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto, VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDtoBuilder> {
  @BuiltValueField(wireName: r'values')
  BuiltMap<String, BuiltMap<String, String>>? get values;

  @BuiltValueField(wireName: r'resources')
  BuiltMap<String, VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto>? get resources;

  @BuiltValueField(wireName: r'languages')
  BuiltList<VoloAbpLocalizationLanguageInfo>? get languages;

  @BuiltValueField(wireName: r'currentCulture')
  VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDto? get currentCulture;

  @BuiltValueField(wireName: r'defaultResourceName')
  String? get defaultResourceName;

  @BuiltValueField(wireName: r'languagesMap')
  BuiltMap<String, BuiltList<VoloAbpNameValue>>? get languagesMap;

  @BuiltValueField(wireName: r'languageFilesMap')
  BuiltMap<String, BuiltList<VoloAbpNameValue>>? get languageFilesMap;

  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto._();

  factory VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto([void updates(VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDtoBuilder b)]) = _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto> get serializer => _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDtoSerializer();
}

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDtoSerializer implements PrimitiveSerializer<VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto> {
  @override
  final Iterable<Type> types = const [VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto, _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto];

  @override
  final String wireName = r'VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.values != null) {
      yield r'values';
      yield serializers.serialize(
        object.values,
        specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(BuiltMap, [FullType(String), FullType(String)])]),
      );
    }
    if (object.resources != null) {
      yield r'resources';
      yield serializers.serialize(
        object.resources,
        specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto)]),
      );
    }
    if (object.languages != null) {
      yield r'languages';
      yield serializers.serialize(
        object.languages,
        specifiedType: const FullType.nullable(BuiltList, [FullType(VoloAbpLocalizationLanguageInfo)]),
      );
    }
    if (object.currentCulture != null) {
      yield r'currentCulture';
      yield serializers.serialize(
        object.currentCulture,
        specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDto),
      );
    }
    if (object.defaultResourceName != null) {
      yield r'defaultResourceName';
      yield serializers.serialize(
        object.defaultResourceName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.languagesMap != null) {
      yield r'languagesMap';
      yield serializers.serialize(
        object.languagesMap,
        specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(BuiltList, [FullType(VoloAbpNameValue)])]),
      );
    }
    if (object.languageFilesMap != null) {
      yield r'languageFilesMap';
      yield serializers.serialize(
        object.languageFilesMap,
        specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(BuiltList, [FullType(VoloAbpNameValue)])]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'values':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(BuiltMap, [FullType(String), FullType(String)])]),
          ) as BuiltMap<String, BuiltMap<String, String>>?;
          if (valueDes == null) continue;
          result.values.replace(valueDes);
          break;
        case r'resources':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto)]),
          ) as BuiltMap<String, VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationResourceDto>?;
          if (valueDes == null) continue;
          result.resources.replace(valueDes);
          break;
        case r'languages':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(VoloAbpLocalizationLanguageInfo)]),
          ) as BuiltList<VoloAbpLocalizationLanguageInfo>?;
          if (valueDes == null) continue;
          result.languages.replace(valueDes);
          break;
        case r'currentCulture':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDto),
          ) as VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDto;
          result.currentCulture.replace(valueDes);
          break;
        case r'defaultResourceName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.defaultResourceName = valueDes;
          break;
        case r'languagesMap':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(BuiltList, [FullType(VoloAbpNameValue)])]),
          ) as BuiltMap<String, BuiltList<VoloAbpNameValue>>?;
          if (valueDes == null) continue;
          result.languagesMap.replace(valueDes);
          break;
        case r'languageFilesMap':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(BuiltList, [FullType(VoloAbpNameValue)])]),
          ) as BuiltMap<String, BuiltList<VoloAbpNameValue>>?;
          if (valueDes == null) continue;
          result.languageFilesMap.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDtoBuilder();
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

