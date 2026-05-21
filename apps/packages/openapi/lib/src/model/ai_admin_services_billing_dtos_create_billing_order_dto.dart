//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_billing_dtos_create_billing_order_dto.g.dart';

/// AiAdminServicesBillingDtosCreateBillingOrderDto
///
/// Properties:
/// * [planId] 
/// * [providerCode] 
@BuiltValue()
abstract class AiAdminServicesBillingDtosCreateBillingOrderDto implements Built<AiAdminServicesBillingDtosCreateBillingOrderDto, AiAdminServicesBillingDtosCreateBillingOrderDtoBuilder> {
  @BuiltValueField(wireName: r'planId')
  String? get planId;

  @BuiltValueField(wireName: r'providerCode')
  String? get providerCode;

  AiAdminServicesBillingDtosCreateBillingOrderDto._();

  factory AiAdminServicesBillingDtosCreateBillingOrderDto([void updates(AiAdminServicesBillingDtosCreateBillingOrderDtoBuilder b)]) = _$AiAdminServicesBillingDtosCreateBillingOrderDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesBillingDtosCreateBillingOrderDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesBillingDtosCreateBillingOrderDto> get serializer => _$AiAdminServicesBillingDtosCreateBillingOrderDtoSerializer();
}

class _$AiAdminServicesBillingDtosCreateBillingOrderDtoSerializer implements PrimitiveSerializer<AiAdminServicesBillingDtosCreateBillingOrderDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesBillingDtosCreateBillingOrderDto, _$AiAdminServicesBillingDtosCreateBillingOrderDto];

  @override
  final String wireName = r'AiAdminServicesBillingDtosCreateBillingOrderDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesBillingDtosCreateBillingOrderDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.planId != null) {
      yield r'planId';
      yield serializers.serialize(
        object.planId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.providerCode != null) {
      yield r'providerCode';
      yield serializers.serialize(
        object.providerCode,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesBillingDtosCreateBillingOrderDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesBillingDtosCreateBillingOrderDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'planId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.planId = valueDes;
          break;
        case r'providerCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.providerCode = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesBillingDtosCreateBillingOrderDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesBillingDtosCreateBillingOrderDtoBuilder();
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

