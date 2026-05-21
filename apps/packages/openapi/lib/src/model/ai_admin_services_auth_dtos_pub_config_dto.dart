//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_auth_dtos_menu_item_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_auth_dtos_pub_config_dto.g.dart';

/// AiAdminServicesAuthDtosPubConfigDto
///
/// Properties:
/// * [menus] 
/// * [allowUserRegister] 
/// * [turnstileSiteKey] 
@BuiltValue()
abstract class AiAdminServicesAuthDtosPubConfigDto implements Built<AiAdminServicesAuthDtosPubConfigDto, AiAdminServicesAuthDtosPubConfigDtoBuilder> {
  @BuiltValueField(wireName: r'menus')
  BuiltList<AiAdminServicesAuthDtosMenuItemDto>? get menus;

  @BuiltValueField(wireName: r'allowUserRegister')
  bool? get allowUserRegister;

  @BuiltValueField(wireName: r'turnstileSiteKey')
  String? get turnstileSiteKey;

  AiAdminServicesAuthDtosPubConfigDto._();

  factory AiAdminServicesAuthDtosPubConfigDto([void updates(AiAdminServicesAuthDtosPubConfigDtoBuilder b)]) = _$AiAdminServicesAuthDtosPubConfigDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesAuthDtosPubConfigDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesAuthDtosPubConfigDto> get serializer => _$AiAdminServicesAuthDtosPubConfigDtoSerializer();
}

class _$AiAdminServicesAuthDtosPubConfigDtoSerializer implements PrimitiveSerializer<AiAdminServicesAuthDtosPubConfigDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesAuthDtosPubConfigDto, _$AiAdminServicesAuthDtosPubConfigDto];

  @override
  final String wireName = r'AiAdminServicesAuthDtosPubConfigDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesAuthDtosPubConfigDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.menus != null) {
      yield r'menus';
      yield serializers.serialize(
        object.menus,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAuthDtosMenuItemDto)]),
      );
    }
    if (object.allowUserRegister != null) {
      yield r'allowUserRegister';
      yield serializers.serialize(
        object.allowUserRegister,
        specifiedType: const FullType(bool),
      );
    }
    if (object.turnstileSiteKey != null) {
      yield r'turnstileSiteKey';
      yield serializers.serialize(
        object.turnstileSiteKey,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesAuthDtosPubConfigDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesAuthDtosPubConfigDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'menus':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAuthDtosMenuItemDto)]),
          ) as BuiltList<AiAdminServicesAuthDtosMenuItemDto>?;
          if (valueDes == null) continue;
          result.menus.replace(valueDes);
          break;
        case r'allowUserRegister':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.allowUserRegister = valueDes;
          break;
        case r'turnstileSiteKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.turnstileSiteKey = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesAuthDtosPubConfigDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesAuthDtosPubConfigDtoBuilder();
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

