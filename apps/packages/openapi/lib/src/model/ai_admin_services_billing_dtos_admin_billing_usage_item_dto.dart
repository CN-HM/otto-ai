//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_billing_dtos_admin_billing_usage_item_dto.g.dart';

/// AiAdminServicesBillingDtosAdminBillingUsageItemDto
///
/// Properties:
/// * [id] 
/// * [userId] 
/// * [username] 
/// * [mobile] 
/// * [agentId] 
/// * [deviceId] 
/// * [sessionId] 
/// * [serviceType] 
/// * [providerCode] 
/// * [unitType] 
/// * [rawUnits] 
/// * [normalizedTokens] 
/// * [chargeStatus] 
/// * [happenedAt] 
@BuiltValue()
abstract class AiAdminServicesBillingDtosAdminBillingUsageItemDto implements Built<AiAdminServicesBillingDtosAdminBillingUsageItemDto, AiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'userId')
  int? get userId;

  @BuiltValueField(wireName: r'username')
  String? get username;

  @BuiltValueField(wireName: r'mobile')
  String? get mobile;

  @BuiltValueField(wireName: r'agentId')
  String? get agentId;

  @BuiltValueField(wireName: r'deviceId')
  String? get deviceId;

  @BuiltValueField(wireName: r'sessionId')
  String? get sessionId;

  @BuiltValueField(wireName: r'serviceType')
  String? get serviceType;

  @BuiltValueField(wireName: r'providerCode')
  String? get providerCode;

  @BuiltValueField(wireName: r'unitType')
  String? get unitType;

  @BuiltValueField(wireName: r'rawUnits')
  double? get rawUnits;

  @BuiltValueField(wireName: r'normalizedTokens')
  int? get normalizedTokens;

  @BuiltValueField(wireName: r'chargeStatus')
  String? get chargeStatus;

  @BuiltValueField(wireName: r'happenedAt')
  String? get happenedAt;

  AiAdminServicesBillingDtosAdminBillingUsageItemDto._();

  factory AiAdminServicesBillingDtosAdminBillingUsageItemDto([void updates(AiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder b)]) = _$AiAdminServicesBillingDtosAdminBillingUsageItemDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesBillingDtosAdminBillingUsageItemDto> get serializer => _$AiAdminServicesBillingDtosAdminBillingUsageItemDtoSerializer();
}

class _$AiAdminServicesBillingDtosAdminBillingUsageItemDtoSerializer implements PrimitiveSerializer<AiAdminServicesBillingDtosAdminBillingUsageItemDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesBillingDtosAdminBillingUsageItemDto, _$AiAdminServicesBillingDtosAdminBillingUsageItemDto];

  @override
  final String wireName = r'AiAdminServicesBillingDtosAdminBillingUsageItemDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesBillingDtosAdminBillingUsageItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
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
    if (object.agentId != null) {
      yield r'agentId';
      yield serializers.serialize(
        object.agentId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.deviceId != null) {
      yield r'deviceId';
      yield serializers.serialize(
        object.deviceId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.sessionId != null) {
      yield r'sessionId';
      yield serializers.serialize(
        object.sessionId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.serviceType != null) {
      yield r'serviceType';
      yield serializers.serialize(
        object.serviceType,
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
    if (object.unitType != null) {
      yield r'unitType';
      yield serializers.serialize(
        object.unitType,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.rawUnits != null) {
      yield r'rawUnits';
      yield serializers.serialize(
        object.rawUnits,
        specifiedType: const FullType(double),
      );
    }
    if (object.normalizedTokens != null) {
      yield r'normalizedTokens';
      yield serializers.serialize(
        object.normalizedTokens,
        specifiedType: const FullType(int),
      );
    }
    if (object.chargeStatus != null) {
      yield r'chargeStatus';
      yield serializers.serialize(
        object.chargeStatus,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.happenedAt != null) {
      yield r'happenedAt';
      yield serializers.serialize(
        object.happenedAt,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesBillingDtosAdminBillingUsageItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder result,
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
        case r'agentId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.agentId = valueDes;
          break;
        case r'deviceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.deviceId = valueDes;
          break;
        case r'sessionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sessionId = valueDes;
          break;
        case r'serviceType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.serviceType = valueDes;
          break;
        case r'providerCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.providerCode = valueDes;
          break;
        case r'unitType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.unitType = valueDes;
          break;
        case r'rawUnits':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.rawUnits = valueDes;
          break;
        case r'normalizedTokens':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.normalizedTokens = valueDes;
          break;
        case r'chargeStatus':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.chargeStatus = valueDes;
          break;
        case r'happenedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.happenedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesBillingDtosAdminBillingUsageItemDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesBillingDtosAdminBillingUsageItemDtoBuilder();
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

