//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_auth_dtos_retrieve_password_dto.g.dart';

/// AiAdminServicesAuthDtosRetrievePasswordDto
///
/// Properties:
/// * [phone] 
/// * [code] 
/// * [password] 
/// * [captchaId] 
/// * [turnstileToken] 
@BuiltValue()
abstract class AiAdminServicesAuthDtosRetrievePasswordDto implements Built<AiAdminServicesAuthDtosRetrievePasswordDto, AiAdminServicesAuthDtosRetrievePasswordDtoBuilder> {
  @BuiltValueField(wireName: r'phone')
  String? get phone;

  @BuiltValueField(wireName: r'code')
  String? get code;

  @BuiltValueField(wireName: r'password')
  String? get password;

  @BuiltValueField(wireName: r'captchaId')
  String? get captchaId;

  @BuiltValueField(wireName: r'turnstileToken')
  String? get turnstileToken;

  AiAdminServicesAuthDtosRetrievePasswordDto._();

  factory AiAdminServicesAuthDtosRetrievePasswordDto([void updates(AiAdminServicesAuthDtosRetrievePasswordDtoBuilder b)]) = _$AiAdminServicesAuthDtosRetrievePasswordDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesAuthDtosRetrievePasswordDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesAuthDtosRetrievePasswordDto> get serializer => _$AiAdminServicesAuthDtosRetrievePasswordDtoSerializer();
}

class _$AiAdminServicesAuthDtosRetrievePasswordDtoSerializer implements PrimitiveSerializer<AiAdminServicesAuthDtosRetrievePasswordDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesAuthDtosRetrievePasswordDto, _$AiAdminServicesAuthDtosRetrievePasswordDto];

  @override
  final String wireName = r'AiAdminServicesAuthDtosRetrievePasswordDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesAuthDtosRetrievePasswordDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.phone != null) {
      yield r'phone';
      yield serializers.serialize(
        object.phone,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.code != null) {
      yield r'code';
      yield serializers.serialize(
        object.code,
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
    AiAdminServicesAuthDtosRetrievePasswordDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesAuthDtosRetrievePasswordDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'phone':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.phone = valueDes;
          break;
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.code = valueDes;
          break;
        case r'password':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.password = valueDes;
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
  AiAdminServicesAuthDtosRetrievePasswordDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesAuthDtosRetrievePasswordDtoBuilder();
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

