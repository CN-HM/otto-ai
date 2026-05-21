//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_admin_dtos_audit_log_action_vo.g.dart';

/// AiAdminServicesAdminDtosAuditLogActionVo
///
/// Properties:
/// * [serviceName] 
/// * [methodName] 
/// * [parameters] 
/// * [executionTime] 
/// * [executionDuration] 
@BuiltValue()
abstract class AiAdminServicesAdminDtosAuditLogActionVo implements Built<AiAdminServicesAdminDtosAuditLogActionVo, AiAdminServicesAdminDtosAuditLogActionVoBuilder> {
  @BuiltValueField(wireName: r'serviceName')
  String? get serviceName;

  @BuiltValueField(wireName: r'methodName')
  String? get methodName;

  @BuiltValueField(wireName: r'parameters')
  String? get parameters;

  @BuiltValueField(wireName: r'executionTime')
  DateTime? get executionTime;

  @BuiltValueField(wireName: r'executionDuration')
  int? get executionDuration;

  AiAdminServicesAdminDtosAuditLogActionVo._();

  factory AiAdminServicesAdminDtosAuditLogActionVo([void updates(AiAdminServicesAdminDtosAuditLogActionVoBuilder b)]) = _$AiAdminServicesAdminDtosAuditLogActionVo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesAdminDtosAuditLogActionVoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesAdminDtosAuditLogActionVo> get serializer => _$AiAdminServicesAdminDtosAuditLogActionVoSerializer();
}

class _$AiAdminServicesAdminDtosAuditLogActionVoSerializer implements PrimitiveSerializer<AiAdminServicesAdminDtosAuditLogActionVo> {
  @override
  final Iterable<Type> types = const [AiAdminServicesAdminDtosAuditLogActionVo, _$AiAdminServicesAdminDtosAuditLogActionVo];

  @override
  final String wireName = r'AiAdminServicesAdminDtosAuditLogActionVo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesAdminDtosAuditLogActionVo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.serviceName != null) {
      yield r'serviceName';
      yield serializers.serialize(
        object.serviceName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.methodName != null) {
      yield r'methodName';
      yield serializers.serialize(
        object.methodName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.parameters != null) {
      yield r'parameters';
      yield serializers.serialize(
        object.parameters,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.executionTime != null) {
      yield r'executionTime';
      yield serializers.serialize(
        object.executionTime,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.executionDuration != null) {
      yield r'executionDuration';
      yield serializers.serialize(
        object.executionDuration,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesAdminDtosAuditLogActionVo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesAdminDtosAuditLogActionVoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'serviceName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.serviceName = valueDes;
          break;
        case r'methodName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.methodName = valueDes;
          break;
        case r'parameters':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.parameters = valueDes;
          break;
        case r'executionTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.executionTime = valueDes;
          break;
        case r'executionDuration':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.executionDuration = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesAdminDtosAuditLogActionVo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesAdminDtosAuditLogActionVoBuilder();
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

