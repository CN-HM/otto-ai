//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/volo_abp_asp_net_core_mvc_application_configurations_time_zone.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_asp_net_core_mvc_application_configurations_timing_dto.g.dart';

/// VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto
///
/// Properties:
/// * [timeZone] 
@BuiltValue()
abstract class VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto implements Built<VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto, VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDtoBuilder> {
  @BuiltValueField(wireName: r'timeZone')
  VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone? get timeZone;

  VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto._();

  factory VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto([void updates(VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDtoBuilder b)]) = _$VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto> get serializer => _$VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDtoSerializer();
}

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDtoSerializer implements PrimitiveSerializer<VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto> {
  @override
  final Iterable<Type> types = const [VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto, _$VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto];

  @override
  final String wireName = r'VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.timeZone != null) {
      yield r'timeZone';
      yield serializers.serialize(
        object.timeZone,
        specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'timeZone':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone),
          ) as VoloAbpAspNetCoreMvcApplicationConfigurationsTimeZone;
          result.timeZone.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpAspNetCoreMvcApplicationConfigurationsTimingDtoBuilder();
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

