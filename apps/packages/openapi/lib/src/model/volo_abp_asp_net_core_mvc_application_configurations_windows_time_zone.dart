//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_asp_net_core_mvc_application_configurations_windows_time_zone.g.dart';

/// VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone
///
/// Properties:
/// * [timeZoneId] 
@BuiltValue()
abstract class VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone implements Built<VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone, VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZoneBuilder> {
  @BuiltValueField(wireName: r'timeZoneId')
  String? get timeZoneId;

  VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone._();

  factory VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone([void updates(VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZoneBuilder b)]) = _$VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZoneBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone> get serializer => _$VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZoneSerializer();
}

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZoneSerializer implements PrimitiveSerializer<VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone> {
  @override
  final Iterable<Type> types = const [VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone, _$VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone];

  @override
  final String wireName = r'VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.timeZoneId != null) {
      yield r'timeZoneId';
      yield serializers.serialize(
        object.timeZoneId,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZoneBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'timeZoneId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.timeZoneId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZone deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpAspNetCoreMvcApplicationConfigurationsWindowsTimeZoneBuilder();
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

