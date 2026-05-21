//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_infrastructure_page_data_ai_admin_services_billing_dtos_admin_billing_subscription_item_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_result_ai_admin_infrastructure_page_data_ai_admin_services_billing_dtos_admin_billing_subscription_item_dto.g.dart';

/// AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto
///
/// Properties:
/// * [code] 
/// * [msg] 
/// * [data] 
@BuiltValue()
abstract class AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto implements Built<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto, AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'msg')
  String? get msg;

  @BuiltValueField(wireName: r'data')
  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto? get data;

  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto._();

  factory AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto([void updates(AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder b)]) = _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto> get serializer => _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoSerializer();
}

class _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoSerializer implements PrimitiveSerializer<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto, _$AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto];

  @override
  final String wireName = r'AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.code != null) {
      yield r'code';
      yield serializers.serialize(
        object.code,
        specifiedType: const FullType(int),
      );
    }
    if (object.msg != null) {
      yield r'msg';
      yield serializers.serialize(
        object.msg,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.code = valueDes;
          break;
        case r'msg':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.msg = valueDes;
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto),
          ) as AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto;
          result.data.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder();
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

