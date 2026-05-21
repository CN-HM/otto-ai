//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_billing_dtos_admin_billing_order_item_dto.g.dart';

/// AiAdminServicesBillingDtosAdminBillingOrderItemDto
///
/// Properties:
/// * [id] 
/// * [orderNo] 
/// * [planId] 
/// * [planCode] 
/// * [planName] 
/// * [orderType] 
/// * [providerCode] 
/// * [currencyCode] 
/// * [amount] 
/// * [grantedTokens] 
/// * [status] 
/// * [externalTradeNo] 
/// * [paidAt] 
/// * [activatedAt] 
/// * [createDate] 
/// * [userId] 
/// * [username] 
/// * [mobile] 
@BuiltValue()
abstract class AiAdminServicesBillingDtosAdminBillingOrderItemDto implements Built<AiAdminServicesBillingDtosAdminBillingOrderItemDto, AiAdminServicesBillingDtosAdminBillingOrderItemDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'orderNo')
  String? get orderNo;

  @BuiltValueField(wireName: r'planId')
  String? get planId;

  @BuiltValueField(wireName: r'planCode')
  String? get planCode;

  @BuiltValueField(wireName: r'planName')
  String? get planName;

  @BuiltValueField(wireName: r'orderType')
  String? get orderType;

  @BuiltValueField(wireName: r'providerCode')
  String? get providerCode;

  @BuiltValueField(wireName: r'currencyCode')
  String? get currencyCode;

  @BuiltValueField(wireName: r'amount')
  double? get amount;

  @BuiltValueField(wireName: r'grantedTokens')
  int? get grantedTokens;

  @BuiltValueField(wireName: r'status')
  String? get status;

  @BuiltValueField(wireName: r'externalTradeNo')
  String? get externalTradeNo;

  @BuiltValueField(wireName: r'paidAt')
  String? get paidAt;

  @BuiltValueField(wireName: r'activatedAt')
  String? get activatedAt;

  @BuiltValueField(wireName: r'createDate')
  String? get createDate;

  @BuiltValueField(wireName: r'userId')
  int? get userId;

  @BuiltValueField(wireName: r'username')
  String? get username;

  @BuiltValueField(wireName: r'mobile')
  String? get mobile;

  AiAdminServicesBillingDtosAdminBillingOrderItemDto._();

  factory AiAdminServicesBillingDtosAdminBillingOrderItemDto([void updates(AiAdminServicesBillingDtosAdminBillingOrderItemDtoBuilder b)]) = _$AiAdminServicesBillingDtosAdminBillingOrderItemDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesBillingDtosAdminBillingOrderItemDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesBillingDtosAdminBillingOrderItemDto> get serializer => _$AiAdminServicesBillingDtosAdminBillingOrderItemDtoSerializer();
}

class _$AiAdminServicesBillingDtosAdminBillingOrderItemDtoSerializer implements PrimitiveSerializer<AiAdminServicesBillingDtosAdminBillingOrderItemDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesBillingDtosAdminBillingOrderItemDto, _$AiAdminServicesBillingDtosAdminBillingOrderItemDto];

  @override
  final String wireName = r'AiAdminServicesBillingDtosAdminBillingOrderItemDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesBillingDtosAdminBillingOrderItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
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
    if (object.planId != null) {
      yield r'planId';
      yield serializers.serialize(
        object.planId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.planCode != null) {
      yield r'planCode';
      yield serializers.serialize(
        object.planCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.planName != null) {
      yield r'planName';
      yield serializers.serialize(
        object.planName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.orderType != null) {
      yield r'orderType';
      yield serializers.serialize(
        object.orderType,
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
    if (object.currencyCode != null) {
      yield r'currencyCode';
      yield serializers.serialize(
        object.currencyCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.amount != null) {
      yield r'amount';
      yield serializers.serialize(
        object.amount,
        specifiedType: const FullType(double),
      );
    }
    if (object.grantedTokens != null) {
      yield r'grantedTokens';
      yield serializers.serialize(
        object.grantedTokens,
        specifiedType: const FullType(int),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
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
    if (object.paidAt != null) {
      yield r'paidAt';
      yield serializers.serialize(
        object.paidAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.activatedAt != null) {
      yield r'activatedAt';
      yield serializers.serialize(
        object.activatedAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.createDate != null) {
      yield r'createDate';
      yield serializers.serialize(
        object.createDate,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.userId != null) {
      yield r'userId';
      yield serializers.serialize(
        object.userId,
        specifiedType: const FullType(int),
      );
    }
    if (object.username != null) {
      yield r'username';
      yield serializers.serialize(
        object.username,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.mobile != null) {
      yield r'mobile';
      yield serializers.serialize(
        object.mobile,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesBillingDtosAdminBillingOrderItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesBillingDtosAdminBillingOrderItemDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.id = valueDes;
          break;
        case r'orderNo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.orderNo = valueDes;
          break;
        case r'planId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.planId = valueDes;
          break;
        case r'planCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.planCode = valueDes;
          break;
        case r'planName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.planName = valueDes;
          break;
        case r'orderType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.orderType = valueDes;
          break;
        case r'providerCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.providerCode = valueDes;
          break;
        case r'currencyCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.currencyCode = valueDes;
          break;
        case r'amount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.amount = valueDes;
          break;
        case r'grantedTokens':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.grantedTokens = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.status = valueDes;
          break;
        case r'externalTradeNo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.externalTradeNo = valueDes;
          break;
        case r'paidAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.paidAt = valueDes;
          break;
        case r'activatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.activatedAt = valueDes;
          break;
        case r'createDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.createDate = valueDes;
          break;
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.userId = valueDes;
          break;
        case r'username':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.username = valueDes;
          break;
        case r'mobile':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.mobile = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesBillingDtosAdminBillingOrderItemDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesBillingDtosAdminBillingOrderItemDtoBuilder();
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

