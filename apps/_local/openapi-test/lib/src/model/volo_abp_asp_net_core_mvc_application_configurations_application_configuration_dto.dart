//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/volo_abp_asp_net_core_mvc_application_configurations_application_feature_configuration_dto.dart';
import 'package:openapi/src/model/volo_abp_asp_net_core_mvc_application_configurations_application_localization_configuration_dto.dart';
import 'package:openapi/src/model/volo_abp_asp_net_core_mvc_application_configurations_application_auth_configuration_dto.dart';
import 'package:openapi/src/model/volo_abp_asp_net_core_mvc_application_configurations_clock_dto.dart';
import 'package:openapi/src/model/volo_abp_asp_net_core_mvc_application_configurations_current_user_dto.dart';
import 'package:openapi/src/model/volo_abp_asp_net_core_mvc_application_configurations_application_global_feature_configuration_dto.dart';
import 'package:openapi/src/model/volo_abp_asp_net_core_mvc_application_configurations_application_setting_configuration_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/volo_abp_asp_net_core_mvc_application_configurations_object_extending_object_extensions_dto.dart';
import 'package:openapi/src/model/volo_abp_asp_net_core_mvc_application_configurations_timing_dto.dart';
import 'package:openapi/src/model/volo_abp_asp_net_core_mvc_multi_tenancy_current_tenant_dto.dart';
import 'package:openapi/src/model/volo_abp_asp_net_core_mvc_multi_tenancy_multi_tenancy_info_dto.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_asp_net_core_mvc_application_configurations_application_configuration_dto.g.dart';

/// VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto
///
/// Properties:
/// * [localization] 
/// * [auth] 
/// * [setting] 
/// * [currentUser] 
/// * [features] 
/// * [globalFeatures] 
/// * [multiTenancy] 
/// * [currentTenant] 
/// * [timing] 
/// * [clock] 
/// * [objectExtensions] 
/// * [extraProperties] 
@BuiltValue()
abstract class VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto implements Built<VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto, VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDtoBuilder> {
  @BuiltValueField(wireName: r'localization')
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto? get localization;

  @BuiltValueField(wireName: r'auth')
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto? get auth;

  @BuiltValueField(wireName: r'setting')
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto? get setting;

  @BuiltValueField(wireName: r'currentUser')
  VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto? get currentUser;

  @BuiltValueField(wireName: r'features')
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDto? get features;

  @BuiltValueField(wireName: r'globalFeatures')
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDto? get globalFeatures;

  @BuiltValueField(wireName: r'multiTenancy')
  VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto? get multiTenancy;

  @BuiltValueField(wireName: r'currentTenant')
  VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto? get currentTenant;

  @BuiltValueField(wireName: r'timing')
  VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto? get timing;

  @BuiltValueField(wireName: r'clock')
  VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto? get clock;

  @BuiltValueField(wireName: r'objectExtensions')
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto? get objectExtensions;

  @BuiltValueField(wireName: r'extraProperties')
  BuiltMap<String, JsonObject?>? get extraProperties;

  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto._();

  factory VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto([void updates(VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDtoBuilder b)]) = _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto> get serializer => _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDtoSerializer();
}

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDtoSerializer implements PrimitiveSerializer<VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto> {
  @override
  final Iterable<Type> types = const [VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto, _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto];

  @override
  final String wireName = r'VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.localization != null) {
      yield r'localization';
      yield serializers.serialize(
        object.localization,
        specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto),
      );
    }
    if (object.auth != null) {
      yield r'auth';
      yield serializers.serialize(
        object.auth,
        specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto),
      );
    }
    if (object.setting != null) {
      yield r'setting';
      yield serializers.serialize(
        object.setting,
        specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto),
      );
    }
    if (object.currentUser != null) {
      yield r'currentUser';
      yield serializers.serialize(
        object.currentUser,
        specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto),
      );
    }
    if (object.features != null) {
      yield r'features';
      yield serializers.serialize(
        object.features,
        specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDto),
      );
    }
    if (object.globalFeatures != null) {
      yield r'globalFeatures';
      yield serializers.serialize(
        object.globalFeatures,
        specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDto),
      );
    }
    if (object.multiTenancy != null) {
      yield r'multiTenancy';
      yield serializers.serialize(
        object.multiTenancy,
        specifiedType: const FullType(VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto),
      );
    }
    if (object.currentTenant != null) {
      yield r'currentTenant';
      yield serializers.serialize(
        object.currentTenant,
        specifiedType: const FullType(VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto),
      );
    }
    if (object.timing != null) {
      yield r'timing';
      yield serializers.serialize(
        object.timing,
        specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto),
      );
    }
    if (object.clock != null) {
      yield r'clock';
      yield serializers.serialize(
        object.clock,
        specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto),
      );
    }
    if (object.objectExtensions != null) {
      yield r'objectExtensions';
      yield serializers.serialize(
        object.objectExtensions,
        specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto),
      );
    }
    if (object.extraProperties != null) {
      yield r'extraProperties';
      yield serializers.serialize(
        object.extraProperties,
        specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'localization':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto),
          ) as VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationConfigurationDto;
          result.localization.replace(valueDes);
          break;
        case r'auth':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto),
          ) as VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto;
          result.auth.replace(valueDes);
          break;
        case r'setting':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto),
          ) as VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto;
          result.setting.replace(valueDes);
          break;
        case r'currentUser':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto),
          ) as VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentUserDto;
          result.currentUser.replace(valueDes);
          break;
        case r'features':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDto),
          ) as VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationFeatureConfigurationDto;
          result.features.replace(valueDes);
          break;
        case r'globalFeatures':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDto),
          ) as VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationGlobalFeatureConfigurationDto;
          result.globalFeatures.replace(valueDes);
          break;
        case r'multiTenancy':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto),
          ) as VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto;
          result.multiTenancy.replace(valueDes);
          break;
        case r'currentTenant':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto),
          ) as VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto;
          result.currentTenant.replace(valueDes);
          break;
        case r'timing':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto),
          ) as VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto;
          result.timing.replace(valueDes);
          break;
        case r'clock':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto),
          ) as VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto;
          result.clock.replace(valueDes);
          break;
        case r'objectExtensions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto),
          ) as VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto;
          result.objectExtensions.replace(valueDes);
          break;
        case r'extraProperties':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
          ) as BuiltMap<String, JsonObject?>?;
          if (valueDes == null) continue;
          result.extraProperties.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDtoBuilder();
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

