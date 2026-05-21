//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/volo_abp_asp_net_core_mvc_application_configurations_object_extending_extension_property_feature_policy_dto.dart';
import 'package:openapi/src/model/volo_abp_asp_net_core_mvc_application_configurations_object_extending_extension_property_permission_policy_dto.dart';
import 'package:openapi/src/model/volo_abp_asp_net_core_mvc_application_configurations_object_extending_extension_property_global_feature_policy_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_asp_net_core_mvc_application_configurations_object_extending_extension_property_policy_dto.g.dart';

/// VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPolicyDto
///
/// Properties:
/// * [globalFeatures] 
/// * [features] 
/// * [permissions] 
@BuiltValue()
abstract class VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPolicyDto implements Built<VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPolicyDto, VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPolicyDtoBuilder> {
  @BuiltValueField(wireName: r'globalFeatures')
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDto? get globalFeatures;

  @BuiltValueField(wireName: r'features')
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDto? get features;

  @BuiltValueField(wireName: r'permissions')
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDto? get permissions;

  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPolicyDto._();

  factory VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPolicyDto([void updates(VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPolicyDtoBuilder b)]) = _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPolicyDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPolicyDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPolicyDto> get serializer => _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPolicyDtoSerializer();
}

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPolicyDtoSerializer implements PrimitiveSerializer<VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPolicyDto> {
  @override
  final Iterable<Type> types = const [VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPolicyDto, _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPolicyDto];

  @override
  final String wireName = r'VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPolicyDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPolicyDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.globalFeatures != null) {
      yield r'globalFeatures';
      yield serializers.serialize(
        object.globalFeatures,
        specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDto),
      );
    }
    if (object.features != null) {
      yield r'features';
      yield serializers.serialize(
        object.features,
        specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDto),
      );
    }
    if (object.permissions != null) {
      yield r'permissions';
      yield serializers.serialize(
        object.permissions,
        specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPolicyDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPolicyDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'globalFeatures':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDto),
          ) as VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyGlobalFeaturePolicyDto;
          result.globalFeatures.replace(valueDes);
          break;
        case r'features':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDto),
          ) as VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyFeaturePolicyDto;
          result.features.replace(valueDes);
          break;
        case r'permissions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDto),
          ) as VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPermissionPolicyDto;
          result.permissions.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPolicyDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionPropertyPolicyDtoBuilder();
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

