//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_auth_dtos_login_dto.g.dart';

/// AiAdminServicesAuthDtosLoginDto
///
/// Properties:
/// * [username] 
/// * [password] 
/// * [mobileCaptcha] 
/// * [captchaId] 
/// * [turnstileToken] 
@BuiltValue()
abstract class AiAdminServicesAuthDtosLoginDto implements Built<AiAdminServicesAuthDtosLoginDto, AiAdminServicesAuthDtosLoginDtoBuilder> {
  @BuiltValueField(wireName: r'username')
  String? get username;

  @BuiltValueField(wireName: r'password')
  String? get password;

  @BuiltValueField(wireName: r'mobileCaptcha')
  String? get mobileCaptcha;

  @BuiltValueField(wireName: r'captchaId')
  String? get captchaId;

  @BuiltValueField(wireName: r'turnstileToken')
  String? get turnstileToken;

  AiAdminServicesAuthDtosLoginDto._();

  factory AiAdminServicesAuthDtosLoginDto([void updates(AiAdminServicesAuthDtosLoginDtoBuilder b)]) = _$AiAdminServicesAuthDtosLoginDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesAuthDtosLoginDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesAuthDtosLoginDto> get serializer => _$AiAdminServicesAuthDtosLoginDtoSerializer();
}

class _$AiAdminServicesAuthDtosLoginDtoSerializer implements PrimitiveSerializer<AiAdminServicesAuthDtosLoginDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesAuthDtosLoginDto, _$AiAdminServicesAuthDtosLoginDto];

  @override
  final String wireName = r'AiAdminServicesAuthDtosLoginDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesAuthDtosLoginDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.username != null) {
      yield r'username';
      yield serializers.serialize(
        object.username,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.password != null) {
      yield r'password';
      yield serializers.serialize(
        object.password,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.mobileCaptcha != null) {
      yield r'mobileCaptcha';
      yield serializers.serialize(
        object.mobileCaptcha,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.captchaId != null) {
      yield r'captchaId';
      yield serializers.serialize(
        object.captchaId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.turnstileToken != null) {
      yield r'turnstileToken';
      yield serializers.serialize(
        object.turnstileToken,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesAuthDtosLoginDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesAuthDtosLoginDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'username':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.username = valueDes;
          break;
        case r'password':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.password = valueDes;
          break;
        case r'mobileCaptcha':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.mobileCaptcha = valueDes;
          break;
        case r'captchaId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.captchaId = valueDes;
          break;
        case r'turnstileToken':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.turnstileToken = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesAuthDtosLoginDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesAuthDtosLoginDtoBuilder();
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

