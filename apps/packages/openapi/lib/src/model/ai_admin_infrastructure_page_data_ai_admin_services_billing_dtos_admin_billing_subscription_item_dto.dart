//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_billing_dtos_admin_billing_subscription_item_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_page_data_ai_admin_services_billing_dtos_admin_billing_subscription_item_dto.g.dart';

/// AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto
///
/// Properties:
/// * [total] 
/// * [list] 
@BuiltValue()
abstract class AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto implements Built<AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto, AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder> {
  @BuiltValueField(wireName: r'total')
  int? get total;

  @BuiltValueField(wireName: r'list')
  BuiltList<AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto>? get list;

  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto._();

  factory AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto([void updates(AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder b)]) = _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto> get serializer => _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoSerializer();
}

class _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoSerializer implements PrimitiveSerializer<AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto, _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto];

  @override
  final String wireName = r'AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.total != null) {
      yield r'total';
      yield serializers.serialize(
        object.total,
        specifiedType: const FullType(int),
      );
    }
    if (object.list != null) {
      yield r'list';
      yield serializers.serialize(
        object.list,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.total = valueDes;
          break;
        case r'list':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto)]),
          ) as BuiltList<AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto>?;
          if (valueDes == null) continue;
          result.list.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder();
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

