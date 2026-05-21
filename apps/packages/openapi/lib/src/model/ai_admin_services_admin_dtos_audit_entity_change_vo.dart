//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/ai_admin_services_admin_dtos_audit_property_change_vo.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_admin_dtos_audit_entity_change_vo.g.dart';

/// AiAdminServicesAdminDtosAuditEntityChangeVo
///
/// Properties:
/// * [changeType] 
/// * [entityTypeFullName] 
/// * [entityId] 
/// * [changeTime] 
/// * [propertyChanges] 
@BuiltValue()
abstract class AiAdminServicesAdminDtosAuditEntityChangeVo implements Built<AiAdminServicesAdminDtosAuditEntityChangeVo, AiAdminServicesAdminDtosAuditEntityChangeVoBuilder> {
  @BuiltValueField(wireName: r'changeType')
  String? get changeType;

  @BuiltValueField(wireName: r'entityTypeFullName')
  String? get entityTypeFullName;

  @BuiltValueField(wireName: r'entityId')
  String? get entityId;

  @BuiltValueField(wireName: r'changeTime')
  DateTime? get changeTime;

  @BuiltValueField(wireName: r'propertyChanges')
  BuiltList<AiAdminServicesAdminDtosAuditPropertyChangeVo>? get propertyChanges;

  AiAdminServicesAdminDtosAuditEntityChangeVo._();

  factory AiAdminServicesAdminDtosAuditEntityChangeVo([void updates(AiAdminServicesAdminDtosAuditEntityChangeVoBuilder b)]) = _$AiAdminServicesAdminDtosAuditEntityChangeVo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesAdminDtosAuditEntityChangeVoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesAdminDtosAuditEntityChangeVo> get serializer => _$AiAdminServicesAdminDtosAuditEntityChangeVoSerializer();
}

class _$AiAdminServicesAdminDtosAuditEntityChangeVoSerializer implements PrimitiveSerializer<AiAdminServicesAdminDtosAuditEntityChangeVo> {
  @override
  final Iterable<Type> types = const [AiAdminServicesAdminDtosAuditEntityChangeVo, _$AiAdminServicesAdminDtosAuditEntityChangeVo];

  @override
  final String wireName = r'AiAdminServicesAdminDtosAuditEntityChangeVo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesAdminDtosAuditEntityChangeVo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.changeType != null) {
      yield r'changeType';
      yield serializers.serialize(
        object.changeType,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.entityTypeFullName != null) {
      yield r'entityTypeFullName';
      yield serializers.serialize(
        object.entityTypeFullName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.entityId != null) {
      yield r'entityId';
      yield serializers.serialize(
        object.entityId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.changeTime != null) {
      yield r'changeTime';
      yield serializers.serialize(
        object.changeTime,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.propertyChanges != null) {
      yield r'propertyChanges';
      yield serializers.serialize(
        object.propertyChanges,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAdminDtosAuditPropertyChangeVo)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesAdminDtosAuditEntityChangeVo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesAdminDtosAuditEntityChangeVoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'changeType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.changeType = valueDes;
          break;
        case r'entityTypeFullName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.entityTypeFullName = valueDes;
          break;
        case r'entityId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.entityId = valueDes;
          break;
        case r'changeTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.changeTime = valueDes;
          break;
        case r'propertyChanges':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAdminDtosAuditPropertyChangeVo)]),
          ) as BuiltList<AiAdminServicesAdminDtosAuditPropertyChangeVo>?;
          if (valueDes == null) continue;
          result.propertyChanges.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesAdminDtosAuditEntityChangeVo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesAdminDtosAuditEntityChangeVoBuilder();
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

