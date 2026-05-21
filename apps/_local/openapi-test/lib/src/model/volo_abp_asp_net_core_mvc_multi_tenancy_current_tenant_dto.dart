//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_asp_net_core_mvc_multi_tenancy_current_tenant_dto.g.dart';

/// VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto
///
/// Properties:
/// * [id] 
/// * [name] 
/// * [isAvailable] 
@BuiltValue()
abstract class VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto implements Built<VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto, VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'isAvailable')
  bool? get isAvailable;

  VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto._();

  factory VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto([void updates(VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDtoBuilder b)]) = _$VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto> get serializer => _$VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDtoSerializer();
}

class _$VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDtoSerializer implements PrimitiveSerializer<VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto> {
  @override
  final Iterable<Type> types = const [VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto, _$VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto];

  @override
  final String wireName = r'VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.isAvailable != null) {
      yield r'isAvailable';
      yield serializers.serialize(
        object.isAvailable,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.id = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'isAvailable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isAvailable = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpAspNetCoreMvcMultiTenancyCurrentTenantDtoBuilder();
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

