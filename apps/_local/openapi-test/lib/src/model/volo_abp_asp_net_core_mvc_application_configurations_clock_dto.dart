//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_asp_net_core_mvc_application_configurations_clock_dto.g.dart';

/// VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto
///
/// Properties:
/// * [kind] 
@BuiltValue()
abstract class VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto implements Built<VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto, VoloAbpAspNetCoreMvcApplicationConfigurationsClockDtoBuilder> {
  @BuiltValueField(wireName: r'kind')
  String? get kind;

  VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto._();

  factory VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto([void updates(VoloAbpAspNetCoreMvcApplicationConfigurationsClockDtoBuilder b)]) = _$VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpAspNetCoreMvcApplicationConfigurationsClockDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto> get serializer => _$VoloAbpAspNetCoreMvcApplicationConfigurationsClockDtoSerializer();
}

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsClockDtoSerializer implements PrimitiveSerializer<VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto> {
  @override
  final Iterable<Type> types = const [VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto, _$VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto];

  @override
  final String wireName = r'VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.kind != null) {
      yield r'kind';
      yield serializers.serialize(
        object.kind,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpAspNetCoreMvcApplicationConfigurationsClockDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'kind':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.kind = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsClockDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpAspNetCoreMvcApplicationConfigurationsClockDtoBuilder();
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

