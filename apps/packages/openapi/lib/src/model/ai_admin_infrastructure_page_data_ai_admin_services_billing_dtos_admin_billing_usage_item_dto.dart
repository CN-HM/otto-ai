//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_billing_dtos_admin_billing_usage_item_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_page_data_ai_admin_services_billing_dtos_admin_billing_usage_item_dto.g.dart';

/// AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto
///
/// Properties:
/// * [total] 
/// * [list] 
@BuiltValue()
abstract class AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto implements Built<AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto, AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder> {
  @BuiltValueField(wireName: r'total')
  int? get total;

  @BuiltValueField(wireName: r'list')
  BuiltList<AiAdminServicesBillingDtosAdminBillingUsageItemDto>? get list;

  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto._();

  factory AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto([void updates(AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder b)]) = _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto> get serializer => _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDtoSerializer();
}

class _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDtoSerializer implements PrimitiveSerializer<AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto, _$AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto];

  @override
  final String wireName = r'AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto object, {
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
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesBillingDtosAdminBillingUsageItemDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder result,
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
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesBillingDtosAdminBillingUsageItemDto)]),
          ) as BuiltList<AiAdminServicesBillingDtosAdminBillingUsageItemDto>?;
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
  AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder();
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

