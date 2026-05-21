//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_auth_dtos_sms_verification_dto.g.dart';

/// AiAdminServicesAuthDtosSmsVerificationDto
///
/// Properties:
/// * [phone] 
/// * [captcha] 
/// * [captchaId] 
@BuiltValue()
abstract class AiAdminServicesAuthDtosSmsVerificationDto implements Built<AiAdminServicesAuthDtosSmsVerificationDto, AiAdminServicesAuthDtosSmsVerificationDtoBuilder> {
  @BuiltValueField(wireName: r'phone')
  String? get phone;

  @BuiltValueField(wireName: r'captcha')
  String? get captcha;

  @BuiltValueField(wireName: r'captchaId')
  String? get captchaId;

  AiAdminServicesAuthDtosSmsVerificationDto._();

  factory AiAdminServicesAuthDtosSmsVerificationDto([void updates(AiAdminServicesAuthDtosSmsVerificationDtoBuilder b)]) = _$AiAdminServicesAuthDtosSmsVerificationDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesAuthDtosSmsVerificationDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesAuthDtosSmsVerificationDto> get serializer => _$AiAdminServicesAuthDtosSmsVerificationDtoSerializer();
}

class _$AiAdminServicesAuthDtosSmsVerificationDtoSerializer implements PrimitiveSerializer<AiAdminServicesAuthDtosSmsVerificationDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesAuthDtosSmsVerificationDto, _$AiAdminServicesAuthDtosSmsVerificationDto];

  @override
  final String wireName = r'AiAdminServicesAuthDtosSmsVerificationDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesAuthDtosSmsVerificationDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.phone != null) {
      yield r'phone';
      yield serializers.serialize(
        object.phone,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.captcha != null) {
      yield r'captcha';
      yield serializers.serialize(
        object.captcha,
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
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesAuthDtosSmsVerificationDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesAuthDtosSmsVerificationDtoBuilder result,
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
        case r'captcha':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.captcha = valueDes;
          break;
        case r'captchaId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.captchaId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesAuthDtosSmsVerificationDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesAuthDtosSmsVerificationDtoBuilder();
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

