//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_admin_dtos_admin_system_billing_settings_dto.g.dart';

/// AiAdminServicesAdminDtosAdminSystemBillingSettingsDto
///
/// Properties:
/// * [defaultPlanCode] 
/// * [resetTimezone] 
/// * [lowBalanceRatio] 
/// * [exhaustionRemindCooldownHours] 
@BuiltValue()
abstract class AiAdminServicesAdminDtosAdminSystemBillingSettingsDto implements Built<AiAdminServicesAdminDtosAdminSystemBillingSettingsDto, AiAdminServicesAdminDtosAdminSystemBillingSettingsDtoBuilder> {
  @BuiltValueField(wireName: r'defaultPlanCode')
  String? get defaultPlanCode;

  @BuiltValueField(wireName: r'resetTimezone')
  String? get resetTimezone;

  @BuiltValueField(wireName: r'lowBalanceRatio')
  double? get lowBalanceRatio;

  @BuiltValueField(wireName: r'exhaustionRemindCooldownHours')
  int? get exhaustionRemindCooldownHours;

  AiAdminServicesAdminDtosAdminSystemBillingSettingsDto._();

  factory AiAdminServicesAdminDtosAdminSystemBillingSettingsDto([void updates(AiAdminServicesAdminDtosAdminSystemBillingSettingsDtoBuilder b)]) = _$AiAdminServicesAdminDtosAdminSystemBillingSettingsDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesAdminDtosAdminSystemBillingSettingsDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesAdminDtosAdminSystemBillingSettingsDto> get serializer => _$AiAdminServicesAdminDtosAdminSystemBillingSettingsDtoSerializer();
}

class _$AiAdminServicesAdminDtosAdminSystemBillingSettingsDtoSerializer implements PrimitiveSerializer<AiAdminServicesAdminDtosAdminSystemBillingSettingsDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesAdminDtosAdminSystemBillingSettingsDto, _$AiAdminServicesAdminDtosAdminSystemBillingSettingsDto];

  @override
  final String wireName = r'AiAdminServicesAdminDtosAdminSystemBillingSettingsDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesAdminDtosAdminSystemBillingSettingsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.defaultPlanCode != null) {
      yield r'defaultPlanCode';
      yield serializers.serialize(
        object.defaultPlanCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.resetTimezone != null) {
      yield r'resetTimezone';
      yield serializers.serialize(
        object.resetTimezone,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.lowBalanceRatio != null) {
      yield r'lowBalanceRatio';
      yield serializers.serialize(
        object.lowBalanceRatio,
        specifiedType: const FullType(double),
      );
    }
    if (object.exhaustionRemindCooldownHours != null) {
      yield r'exhaustionRemindCooldownHours';
      yield serializers.serialize(
        object.exhaustionRemindCooldownHours,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesAdminDtosAdminSystemBillingSettingsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesAdminDtosAdminSystemBillingSettingsDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'defaultPlanCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.defaultPlanCode = valueDes;
          break;
        case r'resetTimezone':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.resetTimezone = valueDes;
          break;
        case r'lowBalanceRatio':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.lowBalanceRatio = valueDes;
          break;
        case r'exhaustionRemindCooldownHours':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.exhaustionRemindCooldownHours = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesAdminDtosAdminSystemBillingSettingsDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesAdminDtosAdminSystemBillingSettingsDtoBuilder();
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

