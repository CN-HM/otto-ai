//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_billing_dtos_billing_usage_report_dto.g.dart';

/// AiAdminServicesBillingDtosBillingUsageReportDto
///
/// Properties:
/// * [macAddress] 
/// * [sessionId] 
/// * [serviceType] 
/// * [providerCode] 
/// * [modelConfigId] 
/// * [unitType] 
/// * [rawUnits] 
/// * [normalizedTokens] 
/// * [rawUsageJson] 
/// * [idempotencyKey] 
/// * [reportTime] 
@BuiltValue()
abstract class AiAdminServicesBillingDtosBillingUsageReportDto implements Built<AiAdminServicesBillingDtosBillingUsageReportDto, AiAdminServicesBillingDtosBillingUsageReportDtoBuilder> {
  @BuiltValueField(wireName: r'macAddress')
  String? get macAddress;

  @BuiltValueField(wireName: r'sessionId')
  String? get sessionId;

  @BuiltValueField(wireName: r'serviceType')
  String? get serviceType;

  @BuiltValueField(wireName: r'providerCode')
  String? get providerCode;

  @BuiltValueField(wireName: r'modelConfigId')
  String? get modelConfigId;

  @BuiltValueField(wireName: r'unitType')
  String? get unitType;

  @BuiltValueField(wireName: r'rawUnits')
  double? get rawUnits;

  @BuiltValueField(wireName: r'normalizedTokens')
  int? get normalizedTokens;

  @BuiltValueField(wireName: r'rawUsageJson')
  String? get rawUsageJson;

  @BuiltValueField(wireName: r'idempotencyKey')
  String? get idempotencyKey;

  @BuiltValueField(wireName: r'reportTime')
  int? get reportTime;

  AiAdminServicesBillingDtosBillingUsageReportDto._();

  factory AiAdminServicesBillingDtosBillingUsageReportDto([void updates(AiAdminServicesBillingDtosBillingUsageReportDtoBuilder b)]) = _$AiAdminServicesBillingDtosBillingUsageReportDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesBillingDtosBillingUsageReportDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesBillingDtosBillingUsageReportDto> get serializer => _$AiAdminServicesBillingDtosBillingUsageReportDtoSerializer();
}

class _$AiAdminServicesBillingDtosBillingUsageReportDtoSerializer implements PrimitiveSerializer<AiAdminServicesBillingDtosBillingUsageReportDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesBillingDtosBillingUsageReportDto, _$AiAdminServicesBillingDtosBillingUsageReportDto];

  @override
  final String wireName = r'AiAdminServicesBillingDtosBillingUsageReportDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesBillingDtosBillingUsageReportDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.macAddress != null) {
      yield r'macAddress';
      yield serializers.serialize(
        object.macAddress,
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
    if (object.modelConfigId != null) {
      yield r'modelConfigId';
      yield serializers.serialize(
        object.modelConfigId,
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
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.rawUsageJson != null) {
      yield r'rawUsageJson';
      yield serializers.serialize(
        object.rawUsageJson,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.idempotencyKey != null) {
      yield r'idempotencyKey';
      yield serializers.serialize(
        object.idempotencyKey,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.reportTime != null) {
      yield r'reportTime';
      yield serializers.serialize(
        object.reportTime,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesBillingDtosBillingUsageReportDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesBillingDtosBillingUsageReportDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'macAddress':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.macAddress = valueDes;
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
        case r'modelConfigId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.modelConfigId = valueDes;
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
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.normalizedTokens = valueDes;
          break;
        case r'rawUsageJson':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.rawUsageJson = valueDes;
          break;
        case r'idempotencyKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.idempotencyKey = valueDes;
          break;
        case r'reportTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.reportTime = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesBillingDtosBillingUsageReportDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesBillingDtosBillingUsageReportDtoBuilder();
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

