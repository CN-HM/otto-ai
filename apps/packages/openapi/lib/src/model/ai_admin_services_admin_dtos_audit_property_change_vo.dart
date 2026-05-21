//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_admin_dtos_audit_property_change_vo.g.dart';

/// AiAdminServicesAdminDtosAuditPropertyChangeVo
///
/// Properties:
/// * [propertyName] 
/// * [originalValue] 
/// * [newValue] 
@BuiltValue()
abstract class AiAdminServicesAdminDtosAuditPropertyChangeVo implements Built<AiAdminServicesAdminDtosAuditPropertyChangeVo, AiAdminServicesAdminDtosAuditPropertyChangeVoBuilder> {
  @BuiltValueField(wireName: r'propertyName')
  String? get propertyName;

  @BuiltValueField(wireName: r'originalValue')
  String? get originalValue;

  @BuiltValueField(wireName: r'newValue')
  String? get newValue;

  AiAdminServicesAdminDtosAuditPropertyChangeVo._();

  factory AiAdminServicesAdminDtosAuditPropertyChangeVo([void updates(AiAdminServicesAdminDtosAuditPropertyChangeVoBuilder b)]) = _$AiAdminServicesAdminDtosAuditPropertyChangeVo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesAdminDtosAuditPropertyChangeVoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesAdminDtosAuditPropertyChangeVo> get serializer => _$AiAdminServicesAdminDtosAuditPropertyChangeVoSerializer();
}

class _$AiAdminServicesAdminDtosAuditPropertyChangeVoSerializer implements PrimitiveSerializer<AiAdminServicesAdminDtosAuditPropertyChangeVo> {
  @override
  final Iterable<Type> types = const [AiAdminServicesAdminDtosAuditPropertyChangeVo, _$AiAdminServicesAdminDtosAuditPropertyChangeVo];

  @override
  final String wireName = r'AiAdminServicesAdminDtosAuditPropertyChangeVo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesAdminDtosAuditPropertyChangeVo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.propertyName != null) {
      yield r'propertyName';
      yield serializers.serialize(
        object.propertyName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.originalValue != null) {
      yield r'originalValue';
      yield serializers.serialize(
        object.originalValue,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.newValue != null) {
      yield r'newValue';
      yield serializers.serialize(
        object.newValue,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesAdminDtosAuditPropertyChangeVo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesAdminDtosAuditPropertyChangeVoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'propertyName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.propertyName = valueDes;
          break;
        case r'originalValue':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.originalValue = valueDes;
          break;
        case r'newValue':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.newValue = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesAdminDtosAuditPropertyChangeVo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesAdminDtosAuditPropertyChangeVoBuilder();
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

