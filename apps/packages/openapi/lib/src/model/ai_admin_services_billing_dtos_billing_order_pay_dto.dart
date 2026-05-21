//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_billing_dtos_billing_order_pay_dto.g.dart';

/// AiAdminServicesBillingDtosBillingOrderPayDto
///
/// Properties:
/// * [providerCode] 
/// * [returnUrl] 
@BuiltValue()
abstract class AiAdminServicesBillingDtosBillingOrderPayDto implements Built<AiAdminServicesBillingDtosBillingOrderPayDto, AiAdminServicesBillingDtosBillingOrderPayDtoBuilder> {
  @BuiltValueField(wireName: r'providerCode')
  String? get providerCode;

  @BuiltValueField(wireName: r'returnUrl')
  String? get returnUrl;

  AiAdminServicesBillingDtosBillingOrderPayDto._();

  factory AiAdminServicesBillingDtosBillingOrderPayDto([void updates(AiAdminServicesBillingDtosBillingOrderPayDtoBuilder b)]) = _$AiAdminServicesBillingDtosBillingOrderPayDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesBillingDtosBillingOrderPayDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesBillingDtosBillingOrderPayDto> get serializer => _$AiAdminServicesBillingDtosBillingOrderPayDtoSerializer();
}

class _$AiAdminServicesBillingDtosBillingOrderPayDtoSerializer implements PrimitiveSerializer<AiAdminServicesBillingDtosBillingOrderPayDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesBillingDtosBillingOrderPayDto, _$AiAdminServicesBillingDtosBillingOrderPayDto];

  @override
  final String wireName = r'AiAdminServicesBillingDtosBillingOrderPayDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesBillingDtosBillingOrderPayDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.providerCode != null) {
      yield r'providerCode';
      yield serializers.serialize(
        object.providerCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.returnUrl != null) {
      yield r'returnUrl';
      yield serializers.serialize(
        object.returnUrl,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesBillingDtosBillingOrderPayDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesBillingDtosBillingOrderPayDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'providerCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.providerCode = valueDes;
          break;
        case r'returnUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.returnUrl = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesBillingDtosBillingOrderPayDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesBillingDtosBillingOrderPayDtoBuilder();
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

