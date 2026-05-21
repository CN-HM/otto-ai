//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/volo_abp_asp_net_core_mvc_application_configurations_iana_time_zone.dart';
import 'package:openapi/src/model/volo_abp_asp_net_core_mvc_application_configurations_windows_time_zone.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_asp_net_core_mvc_application_configurations_time_zone.g.dart';

/// VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone
///
/// Properties:
/// * [iana] 
/// * [windows] 
@BuiltValue()
abstract class VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone implements Built<VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone, VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZoneBuilder> {
  @BuiltValueField(wireName: r'iana')
  VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone? get iana;

  @BuiltValueField(wireName: r'windows')
  VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone? get windows;

  VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone._();

  factory VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone([void updates(VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZoneBuilder b)]) = _$VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZoneBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone> get serializer => _$VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZoneSerializer();
}

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZoneSerializer implements PrimitiveSerializer<VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone> {
  @override
  final Iterable<Type> types = const [VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone, _$VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone];

  @override
  final String wireName = r'VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.iana != null) {
      yield r'iana';
      yield serializers.serialize(
        object.iana,
        specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone),
      );
    }
    if (object.windows != null) {
      yield r'windows';
      yield serializers.serialize(
        object.windows,
        specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZoneBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'iana':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone),
          ) as VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone;
          result.iana.replace(valueDes);
          break;
        case r'windows':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone),
          ) as VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone;
          result.windows.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZoneBuilder();
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

