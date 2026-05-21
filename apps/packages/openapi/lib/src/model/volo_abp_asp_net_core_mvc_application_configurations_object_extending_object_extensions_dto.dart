//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/volo_abp_asp_net_core_mvc_application_configurations_object_extending_extension_enum_dto.dart';
import 'package:openapi/src/model/volo_abp_asp_net_core_mvc_application_configurations_object_extending_module_extension_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_asp_net_core_mvc_application_configurations_object_extending_object_extensions_dto.g.dart';

/// VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto
///
/// Properties:
/// * [modules] 
/// * [enums] 
@BuiltValue()
abstract class VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto implements Built<VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto, VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDtoBuilder> {
  @BuiltValueField(wireName: r'modules')
  BuiltMap<String, VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDto>? get modules;

  @BuiltValueField(wireName: r'enums')
  BuiltMap<String, VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto>? get enums;

  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto._();

  factory VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto([void updates(VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDtoBuilder b)]) = _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto> get serializer => _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDtoSerializer();
}

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDtoSerializer implements PrimitiveSerializer<VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto> {
  @override
  final Iterable<Type> types = const [VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto, _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto];

  @override
  final String wireName = r'VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.modules != null) {
      yield r'modules';
      yield serializers.serialize(
        object.modules,
        specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDto)]),
      );
    }
    if (object.enums != null) {
      yield r'enums';
      yield serializers.serialize(
        object.enums,
        specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'modules':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDto)]),
          ) as BuiltMap<String, VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingModuleExtensionDto>?;
          if (valueDes == null) continue;
          result.modules.replace(valueDes);
          break;
        case r'enums':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto)]),
          ) as BuiltMap<String, VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto>?;
          if (valueDes == null) continue;
          result.enums.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingObjectExtensionsDtoBuilder();
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

