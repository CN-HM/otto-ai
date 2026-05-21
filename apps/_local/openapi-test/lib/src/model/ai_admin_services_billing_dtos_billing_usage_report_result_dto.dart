//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_billing_dtos_billing_usage_report_result_dto.g.dart';

/// AiAdminServicesBillingDtosBillingUsageReportResultDto
///
/// Properties:
/// * [recorded] 
/// * [idempotencyKey] 
/// * [normalizedTokens] 
/// * [consumedTokens] 
/// * [remainingTokens] 
/// * [isLowBalance] 
/// * [isExhausted] 
/// * [chargeStatus] 
/// * [periodKey] 
@BuiltValue()
abstract class AiAdminServicesBillingDtosBillingUsageReportResultDto implements Built<AiAdminServicesBillingDtosBillingUsageReportResultDto, AiAdminServicesBillingDtosBillingUsageReportResultDtoBuilder> {
  @BuiltValueField(wireName: r'recorded')
  bool? get recorded;

  @BuiltValueField(wireName: r'idempotencyKey')
  String? get idempotencyKey;

  @BuiltValueField(wireName: r'normalizedTokens')
  int? get normalizedTokens;

  @BuiltValueField(wireName: r'consumedTokens')
  int? get consumedTokens;

  @BuiltValueField(wireName: r'remainingTokens')
  int? get remainingTokens;

  @BuiltValueField(wireName: r'isLowBalance')
  bool? get isLowBalance;

  @BuiltValueField(wireName: r'isExhausted')
  bool? get isExhausted;

  @BuiltValueField(wireName: r'chargeStatus')
  String? get chargeStatus;

  @BuiltValueField(wireName: r'periodKey')
  String? get periodKey;

  AiAdminServicesBillingDtosBillingUsageReportResultDto._();

  factory AiAdminServicesBillingDtosBillingUsageReportResultDto([void updates(AiAdminServicesBillingDtosBillingUsageReportResultDtoBuilder b)]) = _$AiAdminServicesBillingDtosBillingUsageReportResultDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesBillingDtosBillingUsageReportResultDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesBillingDtosBillingUsageReportResultDto> get serializer => _$AiAdminServicesBillingDtosBillingUsageReportResultDtoSerializer();
}

class _$AiAdminServicesBillingDtosBillingUsageReportResultDtoSerializer implements PrimitiveSerializer<AiAdminServicesBillingDtosBillingUsageReportResultDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesBillingDtosBillingUsageReportResultDto, _$AiAdminServicesBillingDtosBillingUsageReportResultDto];

  @override
  final String wireName = r'AiAdminServicesBillingDtosBillingUsageReportResultDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesBillingDtosBillingUsageReportResultDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.recorded != null) {
      yield r'recorded';
      yield serializers.serialize(
        object.recorded,
        specifiedType: const FullType(bool),
      );
    }
    if (object.idempotencyKey != null) {
      yield r'idempotencyKey';
      yield serializers.serialize(
        object.idempotencyKey,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.normalizedTokens != null) {
      yield r'normalizedTokens';
      yield serializers.serialize(
        object.normalizedTokens,
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
    if (object.chargeStatus != null) {
      yield r'chargeStatus';
      yield serializers.serialize(
        object.chargeStatus,
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
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesBillingDtosBillingUsageReportResultDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesBillingDtosBillingUsageReportResultDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'recorded':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.recorded = valueDes;
          break;
        case r'idempotencyKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.idempotencyKey = valueDes;
          break;
        case r'normalizedTokens':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.normalizedTokens = valueDes;
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
        case r'chargeStatus':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.chargeStatus = valueDes;
          break;
        case r'periodKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.periodKey = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesBillingDtosBillingUsageReportResultDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesBillingDtosBillingUsageReportResultDtoBuilder();
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

