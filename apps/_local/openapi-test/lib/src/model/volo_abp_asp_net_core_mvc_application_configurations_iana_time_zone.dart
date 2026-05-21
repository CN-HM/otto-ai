//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_asp_net_core_mvc_application_configurations_iana_time_zone.g.dart';

/// VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone
///
/// Properties:
/// * [timeZoneName] 
@BuiltValue()
abstract class VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone implements Built<VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone, VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZoneBuilder> {
  @BuiltValueField(wireName: r'timeZoneName')
  String? get timeZoneName;

  VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone._();

  factory VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone([void updates(VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZoneBuilder b)]) = _$VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZoneBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone> get serializer => _$VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZoneSerializer();
}

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZoneSerializer implements PrimitiveSerializer<VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone> {
  @override
  final Iterable<Type> types = const [VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone, _$VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone];

  @override
  final String wireName = r'VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.timeZoneName != null) {
      yield r'timeZoneName';
      yield serializers.serialize(
        object.timeZoneName,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZoneBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'timeZoneName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.timeZoneName = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZone deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpAspNetCoreMvcApplicationConfigurationsIanaTimeZoneBuilder();
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

