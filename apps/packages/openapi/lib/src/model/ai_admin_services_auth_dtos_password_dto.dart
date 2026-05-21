//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_auth_dtos_password_dto.g.dart';

/// AiAdminServicesAuthDtosPasswordDto
///
/// Properties:
/// * [password] 
/// * [newPassword] 
@BuiltValue()
abstract class AiAdminServicesAuthDtosPasswordDto implements Built<AiAdminServicesAuthDtosPasswordDto, AiAdminServicesAuthDtosPasswordDtoBuilder> {
  @BuiltValueField(wireName: r'password')
  String? get password;

  @BuiltValueField(wireName: r'newPassword')
  String? get newPassword;

  AiAdminServicesAuthDtosPasswordDto._();

  factory AiAdminServicesAuthDtosPasswordDto([void updates(AiAdminServicesAuthDtosPasswordDtoBuilder b)]) = _$AiAdminServicesAuthDtosPasswordDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesAuthDtosPasswordDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesAuthDtosPasswordDto> get serializer => _$AiAdminServicesAuthDtosPasswordDtoSerializer();
}

class _$AiAdminServicesAuthDtosPasswordDtoSerializer implements PrimitiveSerializer<AiAdminServicesAuthDtosPasswordDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesAuthDtosPasswordDto, _$AiAdminServicesAuthDtosPasswordDto];

  @override
  final String wireName = r'AiAdminServicesAuthDtosPasswordDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesAuthDtosPasswordDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.password != null) {
      yield r'password';
      yield serializers.serialize(
        object.password,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.newPassword != null) {
      yield r'newPassword';
      yield serializers.serialize(
        object.newPassword,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesAuthDtosPasswordDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesAuthDtosPasswordDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'password':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.password = valueDes;
          break;
        case r'newPassword':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.newPassword = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesAuthDtosPasswordDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesAuthDtosPasswordDtoBuilder();
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

