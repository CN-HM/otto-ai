//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_billing_dtos_admin_billing_subscription_item_dto.g.dart';

/// AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto
///
/// Properties:
/// * [userId] 
/// * [username] 
/// * [mobile] 
/// * [planCode] 
/// * [planName] 
/// * [subscriptionStatus] 
/// * [periodKey] 
/// * [totalTokens] 
/// * [consumedTokens] 
/// * [remainingTokens] 
/// * [periodEndAt] 
/// * [isLowBalance] 
/// * [isExhausted] 
@BuiltValue()
abstract class AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto implements Built<AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto, AiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder> {
  @BuiltValueField(wireName: r'userId')
  int? get userId;

  @BuiltValueField(wireName: r'username')
  String? get username;

  @BuiltValueField(wireName: r'mobile')
  String? get mobile;

  @BuiltValueField(wireName: r'planCode')
  String? get planCode;

  @BuiltValueField(wireName: r'planName')
  String? get planName;

  @BuiltValueField(wireName: r'subscriptionStatus')
  String? get subscriptionStatus;

  @BuiltValueField(wireName: r'periodKey')
  String? get periodKey;

  @BuiltValueField(wireName: r'totalTokens')
  int? get totalTokens;

  @BuiltValueField(wireName: r'consumedTokens')
  int? get consumedTokens;

  @BuiltValueField(wireName: r'remainingTokens')
  int? get remainingTokens;

  @BuiltValueField(wireName: r'periodEndAt')
  String? get periodEndAt;

  @BuiltValueField(wireName: r'isLowBalance')
  bool? get isLowBalance;

  @BuiltValueField(wireName: r'isExhausted')
  bool? get isExhausted;

  AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto._();

  factory AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto([void updates(AiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder b)]) = _$AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto> get serializer => _$AiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoSerializer();
}

class _$AiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoSerializer implements PrimitiveSerializer<AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto, _$AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto];

  @override
  final String wireName = r'AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    if (object.subscriptionStatus != null) {
      yield r'subscriptionStatus';
      yield serializers.serialize(
        object.subscriptionStatus,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.periodKey != null) {
      yield r'periodKey';
      yield serializers.serialize(
        object.periodKey,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.totalTokens != null) {
      yield r'totalTokens';
      yield serializers.serialize(
        object.totalTokens,
        specifiedType: const FullType(int),
      );
    }
    if (object.consumedTokens != null) {
      yield r'consumedTokens';
      yield serializers.serialize(
        object.consumedTokens,
        specifiedType: const FullType(int),
      );
    }
    if (object.remainingTokens != null) {
      yield r'remainingTokens';
      yield serializers.serialize(
        object.remainingTokens,
        specifiedType: const FullType(int),
      );
    }
    if (object.periodEndAt != null) {
      yield r'periodEndAt';
      yield serializers.serialize(
        object.periodEndAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.isLowBalance != null) {
      yield r'isLowBalance';
      yield serializers.serialize(
        object.isLowBalance,
        specifiedType: const FullType(bool),
      );
    }
    if (object.isExhausted != null) {
      yield r'isExhausted';
      yield serializers.serialize(
        object.isExhausted,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
        case r'subscriptionStatus':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.subscriptionStatus = valueDes;
          break;
        case r'periodKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.periodKey = valueDes;
          break;
        case r'totalTokens':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.totalTokens = valueDes;
          break;
        case r'consumedTokens':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.consumedTokens = valueDes;
          break;
        case r'remainingTokens':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.remainingTokens = valueDes;
          break;
        case r'periodEndAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.periodEndAt = valueDes;
          break;
        case r'isLowBalance':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isLowBalance = valueDes;
          break;
        case r'isExhausted':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isExhausted = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesBillingDtosAdminBillingSubscriptionItemDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesBillingDtosAdminBillingSubscriptionItemDtoBuilder();
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

