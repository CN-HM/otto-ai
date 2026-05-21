//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_billing_dtos_billing_order_pay_result_dto.g.dart';

/// AiAdminServicesBillingDtosBillingOrderPayResultDto
///
/// Properties:
/// * [orderId] 
/// * [orderNo] 
/// * [status] 
/// * [providerCode] 
/// * [actionType] 
/// * [payUrl] 
/// * [externalTradeNo] 
/// * [expireAt] 
/// * [message] 
/// * [payloadJson] 
@BuiltValue()
abstract class AiAdminServicesBillingDtosBillingOrderPayResultDto implements Built<AiAdminServicesBillingDtosBillingOrderPayResultDto, AiAdminServicesBillingDtosBillingOrderPayResultDtoBuilder> {
  @BuiltValueField(wireName: r'orderId')
  String? get orderId;

  @BuiltValueField(wireName: r'orderNo')
  String? get orderNo;

  @BuiltValueField(wireName: r'status')
  String? get status;

  @BuiltValueField(wireName: r'providerCode')
  String? get providerCode;

  @BuiltValueField(wireName: r'actionType')
  String? get actionType;

  @BuiltValueField(wireName: r'payUrl')
  String? get payUrl;

  @BuiltValueField(wireName: r'externalTradeNo')
  String? get externalTradeNo;

  @BuiltValueField(wireName: r'expireAt')
  String? get expireAt;

  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'payloadJson')
  String? get payloadJson;

  AiAdminServicesBillingDtosBillingOrderPayResultDto._();

  factory AiAdminServicesBillingDtosBillingOrderPayResultDto([void updates(AiAdminServicesBillingDtosBillingOrderPayResultDtoBuilder b)]) = _$AiAdminServicesBillingDtosBillingOrderPayResultDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesBillingDtosBillingOrderPayResultDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesBillingDtosBillingOrderPayResultDto> get serializer => _$AiAdminServicesBillingDtosBillingOrderPayResultDtoSerializer();
}

class _$AiAdminServicesBillingDtosBillingOrderPayResultDtoSerializer implements PrimitiveSerializer<AiAdminServicesBillingDtosBillingOrderPayResultDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesBillingDtosBillingOrderPayResultDto, _$AiAdminServicesBillingDtosBillingOrderPayResultDto];

  @override
  final String wireName = r'AiAdminServicesBillingDtosBillingOrderPayResultDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesBillingDtosBillingOrderPayResultDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.orderId != null) {
      yield r'orderId';
      yield serializers.serialize(
        object.orderId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.orderNo != null) {
      yield r'orderNo';
      yield serializers.serialize(
        object.orderNo,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
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
    if (object.actionType != null) {
      yield r'actionType';
      yield serializers.serialize(
        object.actionType,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.payUrl != null) {
      yield r'payUrl';
      yield serializers.serialize(
        object.payUrl,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.externalTradeNo != null) {
      yield r'externalTradeNo';
      yield serializers.serialize(
        object.externalTradeNo,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.expireAt != null) {
      yield r'expireAt';
      yield serializers.serialize(
        object.expireAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.message != null) {
      yield r'message';
      yield serializers.serialize(
        object.message,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.payloadJson != null) {
      yield r'payloadJson';
      yield serializers.serialize(
        object.payloadJson,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesBillingDtosBillingOrderPayResultDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesBillingDtosBillingOrderPayResultDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'orderId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.orderId = valueDes;
          break;
        case r'orderNo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.orderNo = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.status = valueDes;
          break;
        case r'providerCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.providerCode = valueDes;
          break;
        case r'actionType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.actionType = valueDes;
          break;
        case r'payUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.payUrl = valueDes;
          break;
        case r'externalTradeNo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.externalTradeNo = valueDes;
          break;
        case r'expireAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.expireAt = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.message = valueDes;
          break;
        case r'payloadJson':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.payloadJson = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesBillingDtosBillingOrderPayResultDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesBillingDtosBillingOrderPayResultDtoBuilder();
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

