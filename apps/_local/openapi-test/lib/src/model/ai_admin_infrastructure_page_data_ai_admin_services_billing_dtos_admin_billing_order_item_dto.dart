//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_billing_dtos_admin_billing_order_item_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_page_data_ai_admin_services_billing_dtos_admin_billing_order_item_dto.g.dart';

/// AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto
///
/// Properties:
/// * [total] 
/// * [list] 
@BuiltValue()
abstract class AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto implements Built<AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto, AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDtoBuilder> {
  @BuiltValueField(wireName: r'total')
  int? get total;

  @BuiltValueField(wireName: r'list')
  BuiltList<AiAdminServicesBillingDtosAdminBillingOrderItemDto>? get list;

  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto._();

  factory AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto([void updates(AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDtoBuilder b)]) = _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto> get serializer => _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDtoSerializer();
}

class _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDtoSerializer implements PrimitiveSerializer<AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto, _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto];

  @override
  final String wireName = r'AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto object, {
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
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesBillingDtosAdminBillingOrderItemDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDtoBuilder result,
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
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesBillingDtosAdminBillingOrderItemDto)]),
          ) as BuiltList<AiAdminServicesBillingDtosAdminBillingOrderItemDto>?;
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
  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDtoBuilder();
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

