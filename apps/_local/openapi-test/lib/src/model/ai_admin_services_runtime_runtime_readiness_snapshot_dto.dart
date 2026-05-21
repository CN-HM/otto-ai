//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_runtime_runtime_readiness_check_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_runtime_runtime_readiness_snapshot_dto.g.dart';

/// AiAdminServicesRuntimeRuntimeReadinessSnapshotDto
///
/// Properties:
/// * [ready] 
/// * [severity] 
/// * [passedCheckCount] 
/// * [warningCheckCount] 
/// * [failedCheckCount] 
/// * [checks] 
@BuiltValue()
abstract class AiAdminServicesRuntimeRuntimeReadinessSnapshotDto implements Built<AiAdminServicesRuntimeRuntimeReadinessSnapshotDto, AiAdminServicesRuntimeRuntimeReadinessSnapshotDtoBuilder> {
  @BuiltValueField(wireName: r'ready')
  bool? get ready;

  @BuiltValueField(wireName: r'severity')
  String? get severity;

  @BuiltValueField(wireName: r'passedCheckCount')
  int? get passedCheckCount;

  @BuiltValueField(wireName: r'warningCheckCount')
  int? get warningCheckCount;

  @BuiltValueField(wireName: r'failedCheckCount')
  int? get failedCheckCount;

  @BuiltValueField(wireName: r'checks')
  BuiltList<AiAdminServicesRuntimeRuntimeReadinessCheckDto>? get checks;

  AiAdminServicesRuntimeRuntimeReadinessSnapshotDto._();

  factory AiAdminServicesRuntimeRuntimeReadinessSnapshotDto([void updates(AiAdminServicesRuntimeRuntimeReadinessSnapshotDtoBuilder b)]) = _$AiAdminServicesRuntimeRuntimeReadinessSnapshotDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesRuntimeRuntimeReadinessSnapshotDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesRuntimeRuntimeReadinessSnapshotDto> get serializer => _$AiAdminServicesRuntimeRuntimeReadinessSnapshotDtoSerializer();
}

class _$AiAdminServicesRuntimeRuntimeReadinessSnapshotDtoSerializer implements PrimitiveSerializer<AiAdminServicesRuntimeRuntimeReadinessSnapshotDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesRuntimeRuntimeReadinessSnapshotDto, _$AiAdminServicesRuntimeRuntimeReadinessSnapshotDto];

  @override
  final String wireName = r'AiAdminServicesRuntimeRuntimeReadinessSnapshotDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesRuntimeRuntimeReadinessSnapshotDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.ready != null) {
      yield r'ready';
      yield serializers.serialize(
        object.ready,
        specifiedType: const FullType(bool),
      );
    }
    if (object.severity != null) {
      yield r'severity';
      yield serializers.serialize(
        object.severity,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.passedCheckCount != null) {
      yield r'passedCheckCount';
      yield serializers.serialize(
        object.passedCheckCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.warningCheckCount != null) {
      yield r'warningCheckCount';
      yield serializers.serialize(
        object.warningCheckCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.failedCheckCount != null) {
      yield r'failedCheckCount';
      yield serializers.serialize(
        object.failedCheckCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.checks != null) {
      yield r'checks';
      yield serializers.serialize(
        object.checks,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesRuntimeRuntimeReadinessCheckDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesRuntimeRuntimeReadinessSnapshotDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesRuntimeRuntimeReadinessSnapshotDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'ready':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.ready = valueDes;
          break;
        case r'severity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.severity = valueDes;
          break;
        case r'passedCheckCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.passedCheckCount = valueDes;
          break;
        case r'warningCheckCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.warningCheckCount = valueDes;
          break;
        case r'failedCheckCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.failedCheckCount = valueDes;
          break;
        case r'checks':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesRuntimeRuntimeReadinessCheckDto)]),
          ) as BuiltList<AiAdminServicesRuntimeRuntimeReadinessCheckDto>?;
          if (valueDes == null) continue;
          result.checks.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesRuntimeRuntimeReadinessSnapshotDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesRuntimeRuntimeReadinessSnapshotDtoBuilder();
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

