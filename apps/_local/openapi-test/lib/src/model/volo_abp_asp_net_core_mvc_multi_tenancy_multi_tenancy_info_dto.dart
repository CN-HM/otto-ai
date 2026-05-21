//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_asp_net_core_mvc_multi_tenancy_multi_tenancy_info_dto.g.dart';

/// VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto
///
/// Properties:
/// * [isEnabled] 
@BuiltValue()
abstract class VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto implements Built<VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto, VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDtoBuilder> {
  @BuiltValueField(wireName: r'isEnabled')
  bool? get isEnabled;

  VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto._();

  factory VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto([void updates(VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDtoBuilder b)]) = _$VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto> get serializer => _$VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDtoSerializer();
}

class _$VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDtoSerializer implements PrimitiveSerializer<VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto> {
  @override
  final Iterable<Type> types = const [VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto, _$VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto];

  @override
  final String wireName = r'VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.isEnabled != null) {
      yield r'isEnabled';
      yield serializers.serialize(
        object.isEnabled,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'isEnabled':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isEnabled = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpAspNetCoreMvcMultiTenancyMultiTenancyInfoDtoBuilder();
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

