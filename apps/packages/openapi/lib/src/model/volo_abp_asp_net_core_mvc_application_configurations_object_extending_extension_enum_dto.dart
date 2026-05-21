//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/volo_abp_asp_net_core_mvc_application_configurations_object_extending_extension_enum_field_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_asp_net_core_mvc_application_configurations_object_extending_extension_enum_dto.g.dart';

/// VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto
///
/// Properties:
/// * [fields] 
/// * [localizationResource] 
@BuiltValue()
abstract class VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto implements Built<VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto, VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDtoBuilder> {
  @BuiltValueField(wireName: r'fields')
  BuiltList<VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumFieldDto>? get fields;

  @BuiltValueField(wireName: r'localizationResource')
  String? get localizationResource;

  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto._();

  factory VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto([void updates(VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDtoBuilder b)]) = _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto> get serializer => _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDtoSerializer();
}

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDtoSerializer implements PrimitiveSerializer<VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto> {
  @override
  final Iterable<Type> types = const [VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto, _$VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto];

  @override
  final String wireName = r'VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.fields != null) {
      yield r'fields';
      yield serializers.serialize(
        object.fields,
        specifiedType: const FullType.nullable(BuiltList, [FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumFieldDto)]),
      );
    }
    if (object.localizationResource != null) {
      yield r'localizationResource';
      yield serializers.serialize(
        object.localizationResource,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'fields':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumFieldDto)]),
          ) as BuiltList<VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumFieldDto>?;
          if (valueDes == null) continue;
          result.fields.replace(valueDes);
          break;
        case r'localizationResource':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.localizationResource = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpAspNetCoreMvcApplicationConfigurationsObjectExtendingExtensionEnumDtoBuilder();
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

