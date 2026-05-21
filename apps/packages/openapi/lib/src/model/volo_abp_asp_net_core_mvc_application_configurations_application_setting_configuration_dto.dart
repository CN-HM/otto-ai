//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_asp_net_core_mvc_application_configurations_application_setting_configuration_dto.g.dart';

/// VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto
///
/// Properties:
/// * [values] 
@BuiltValue()
abstract class VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto implements Built<VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto, VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDtoBuilder> {
  @BuiltValueField(wireName: r'values')
  BuiltMap<String, String?>? get values;

  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto._();

  factory VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto([void updates(VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDtoBuilder b)]) = _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto> get serializer => _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDtoSerializer();
}

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDtoSerializer implements PrimitiveSerializer<VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto> {
  @override
  final Iterable<Type> types = const [VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto, _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto];

  @override
  final String wireName = r'VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.values != null) {
      yield r'values';
      yield serializers.serialize(
        object.values,
        specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType.nullable(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'values':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType.nullable(String)]),
          ) as BuiltMap<String, String?>?;
          if (valueDes == null) continue;
          result.values.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationSettingConfigurationDtoBuilder();
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

