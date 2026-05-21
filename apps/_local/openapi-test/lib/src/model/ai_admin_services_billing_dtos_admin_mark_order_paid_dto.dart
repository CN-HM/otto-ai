//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_billing_dtos_admin_mark_order_paid_dto.g.dart';

/// AiAdminServicesBillingDtosAdminMarkOrderPaidDto
///
/// Properties:
/// * [transactionNo] 
/// * [paidAt] 
/// * [remark] 
@BuiltValue()
abstract class AiAdminServicesBillingDtosAdminMarkOrderPaidDto implements Built<AiAdminServicesBillingDtosAdminMarkOrderPaidDto, AiAdminServicesBillingDtosAdminMarkOrderPaidDtoBuilder> {
  @BuiltValueField(wireName: r'transactionNo')
  String? get transactionNo;

  @BuiltValueField(wireName: r'paidAt')
  DateTime? get paidAt;

  @BuiltValueField(wireName: r'remark')
  String? get remark;

  AiAdminServicesBillingDtosAdminMarkOrderPaidDto._();

  factory AiAdminServicesBillingDtosAdminMarkOrderPaidDto([void updates(AiAdminServicesBillingDtosAdminMarkOrderPaidDtoBuilder b)]) = _$AiAdminServicesBillingDtosAdminMarkOrderPaidDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesBillingDtosAdminMarkOrderPaidDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesBillingDtosAdminMarkOrderPaidDto> get serializer => _$AiAdminServicesBillingDtosAdminMarkOrderPaidDtoSerializer();
}

class _$AiAdminServicesBillingDtosAdminMarkOrderPaidDtoSerializer implements PrimitiveSerializer<AiAdminServicesBillingDtosAdminMarkOrderPaidDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesBillingDtosAdminMarkOrderPaidDto, _$AiAdminServicesBillingDtosAdminMarkOrderPaidDto];

  @override
  final String wireName = r'AiAdminServicesBillingDtosAdminMarkOrderPaidDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesBillingDtosAdminMarkOrderPaidDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.transactionNo != null) {
      yield r'transactionNo';
      yield serializers.serialize(
        object.transactionNo,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.paidAt != null) {
      yield r'paidAt';
      yield serializers.serialize(
        object.paidAt,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.remark != null) {
      yield r'remark';
      yield serializers.serialize(
        object.remark,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesBillingDtosAdminMarkOrderPaidDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesBillingDtosAdminMarkOrderPaidDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'transactionNo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.transactionNo = valueDes;
          break;
        case r'paidAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.paidAt = valueDes;
          break;
        case r'remark':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.remark = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesBillingDtosAdminMarkOrderPaidDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesBillingDtosAdminMarkOrderPaidDtoBuilder();
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

