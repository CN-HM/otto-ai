//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_memory_dtos_memory_write_config_dto.g.dart';

/// AiAdminServicesMemoryDtosMemoryWriteConfigDto
///
/// Properties:
/// * [autoWrite] 
/// * [autoExtract] 
/// * [ttlDays] 
/// * [minImportance] 
/// * [importanceThreshold] 
/// * [deduplicate] 
@BuiltValue()
abstract class AiAdminServicesMemoryDtosMemoryWriteConfigDto implements Built<AiAdminServicesMemoryDtosMemoryWriteConfigDto, AiAdminServicesMemoryDtosMemoryWriteConfigDtoBuilder> {
  @BuiltValueField(wireName: r'autoWrite')
  bool? get autoWrite;

  @BuiltValueField(wireName: r'autoExtract')
  bool? get autoExtract;

  @BuiltValueField(wireName: r'ttlDays')
  int? get ttlDays;

  @BuiltValueField(wireName: r'minImportance')
  int? get minImportance;

  @BuiltValueField(wireName: r'importanceThreshold')
  int? get importanceThreshold;

  @BuiltValueField(wireName: r'deduplicate')
  bool? get deduplicate;

  AiAdminServicesMemoryDtosMemoryWriteConfigDto._();

  factory AiAdminServicesMemoryDtosMemoryWriteConfigDto([void updates(AiAdminServicesMemoryDtosMemoryWriteConfigDtoBuilder b)]) = _$AiAdminServicesMemoryDtosMemoryWriteConfigDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesMemoryDtosMemoryWriteConfigDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesMemoryDtosMemoryWriteConfigDto> get serializer => _$AiAdminServicesMemoryDtosMemoryWriteConfigDtoSerializer();
}

class _$AiAdminServicesMemoryDtosMemoryWriteConfigDtoSerializer implements PrimitiveSerializer<AiAdminServicesMemoryDtosMemoryWriteConfigDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesMemoryDtosMemoryWriteConfigDto, _$AiAdminServicesMemoryDtosMemoryWriteConfigDto];

  @override
  final String wireName = r'AiAdminServicesMemoryDtosMemoryWriteConfigDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesMemoryDtosMemoryWriteConfigDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.autoWrite != null) {
      yield r'autoWrite';
      yield serializers.serialize(
        object.autoWrite,
        specifiedType: const FullType(bool),
      );
    }
    if (object.autoExtract != null) {
      yield r'autoExtract';
      yield serializers.serialize(
        object.autoExtract,
        specifiedType: const FullType(bool),
      );
    }
    if (object.ttlDays != null) {
      yield r'ttlDays';
      yield serializers.serialize(
        object.ttlDays,
        specifiedType: const FullType(int),
      );
    }
    if (object.minImportance != null) {
      yield r'minImportance';
      yield serializers.serialize(
        object.minImportance,
        specifiedType: const FullType(int),
      );
    }
    if (object.importanceThreshold != null) {
      yield r'importanceThreshold';
      yield serializers.serialize(
        object.importanceThreshold,
        specifiedType: const FullType(int),
      );
    }
    if (object.deduplicate != null) {
      yield r'deduplicate';
      yield serializers.serialize(
        object.deduplicate,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesMemoryDtosMemoryWriteConfigDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesMemoryDtosMemoryWriteConfigDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'autoWrite':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.autoWrite = valueDes;
          break;
        case r'autoExtract':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.autoExtract = valueDes;
          break;
        case r'ttlDays':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.ttlDays = valueDes;
          break;
        case r'minImportance':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.minImportance = valueDes;
          break;
        case r'importanceThreshold':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.importanceThreshold = valueDes;
          break;
        case r'deduplicate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.deduplicate = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesMemoryDtosMemoryWriteConfigDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesMemoryDtosMemoryWriteConfigDtoBuilder();
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

