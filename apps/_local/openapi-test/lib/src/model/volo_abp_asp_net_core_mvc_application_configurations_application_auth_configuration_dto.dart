//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_asp_net_core_mvc_application_configurations_application_auth_configuration_dto.g.dart';

/// VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto
///
/// Properties:
/// * [grantedPolicies] 
@BuiltValue()
abstract class VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto implements Built<VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto, VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDtoBuilder> {
  @BuiltValueField(wireName: r'grantedPolicies')
  BuiltMap<String, bool>? get grantedPolicies;

  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto._();

  factory VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto([void updates(VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDtoBuilder b)]) = _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto> get serializer => _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDtoSerializer();
}

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDtoSerializer implements PrimitiveSerializer<VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto> {
  @override
  final Iterable<Type> types = const [VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto, _$VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto];

  @override
  final String wireName = r'VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.grantedPolicies != null) {
      yield r'grantedPolicies';
      yield serializers.serialize(
        object.grantedPolicies,
        specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(bool)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'grantedPolicies':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(bool)]),
          ) as BuiltMap<String, bool>?;
          if (valueDes == null) continue;
          result.grantedPolicies.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationAuthConfigurationDtoBuilder();
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

