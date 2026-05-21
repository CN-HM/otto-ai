//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_auth_dtos_menu_item_dto.g.dart';

/// AiAdminServicesAuthDtosMenuItemDto
///
/// Properties:
/// * [name] 
/// * [path] 
/// * [icon] 
/// * [children] 
@BuiltValue()
abstract class AiAdminServicesAuthDtosMenuItemDto implements Built<AiAdminServicesAuthDtosMenuItemDto, AiAdminServicesAuthDtosMenuItemDtoBuilder> {
  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'path')
  String? get path;

  @BuiltValueField(wireName: r'icon')
  String? get icon;

  @BuiltValueField(wireName: r'children')
  BuiltList<AiAdminServicesAuthDtosMenuItemDto>? get children;

  AiAdminServicesAuthDtosMenuItemDto._();

  factory AiAdminServicesAuthDtosMenuItemDto([void updates(AiAdminServicesAuthDtosMenuItemDtoBuilder b)]) = _$AiAdminServicesAuthDtosMenuItemDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesAuthDtosMenuItemDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesAuthDtosMenuItemDto> get serializer => _$AiAdminServicesAuthDtosMenuItemDtoSerializer();
}

class _$AiAdminServicesAuthDtosMenuItemDtoSerializer implements PrimitiveSerializer<AiAdminServicesAuthDtosMenuItemDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesAuthDtosMenuItemDto, _$AiAdminServicesAuthDtosMenuItemDto];

  @override
  final String wireName = r'AiAdminServicesAuthDtosMenuItemDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesAuthDtosMenuItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.path != null) {
      yield r'path';
      yield serializers.serialize(
        object.path,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.icon != null) {
      yield r'icon';
      yield serializers.serialize(
        object.icon,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.children != null) {
      yield r'children';
      yield serializers.serialize(
        object.children,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAuthDtosMenuItemDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesAuthDtosMenuItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesAuthDtosMenuItemDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'path':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.path = valueDes;
          break;
        case r'icon':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.icon = valueDes;
          break;
        case r'children':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAuthDtosMenuItemDto)]),
          ) as BuiltList<AiAdminServicesAuthDtosMenuItemDto>?;
          if (valueDes == null) continue;
          result.children.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesAuthDtosMenuItemDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesAuthDtosMenuItemDtoBuilder();
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

