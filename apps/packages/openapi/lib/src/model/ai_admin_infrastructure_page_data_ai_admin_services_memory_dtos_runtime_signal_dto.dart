//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/ai_admin_services_memory_dtos_runtime_signal_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_page_data_ai_admin_services_memory_dtos_runtime_signal_dto.g.dart';

/// AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto
///
/// Properties:
/// * [total] 
/// * [list] 
@BuiltValue()
abstract class AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto implements Built<AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto, AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDtoBuilder> {
  @BuiltValueField(wireName: r'total')
  int? get total;

  @BuiltValueField(wireName: r'list')
  BuiltList<AiAdminServicesMemoryDtosRuntimeSignalDto>? get list;

  AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto._();

  factory AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto([void updates(AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDtoBuilder b)]) = _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto> get serializer => _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDtoSerializer();
}

class _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDtoSerializer implements PrimitiveSerializer<AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto, _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto];

  @override
  final String wireName = r'AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.total != null) {
      yield r'total';
      yield serializers.serialize(
        object.total,
        specifiedType: const FullType(int),
      );
    }
    if (object.list != null) {
      yield r'list';
      yield serializers.serialize(
        object.list,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesMemoryDtosRuntimeSignalDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.total = valueDes;
          break;
        case r'list':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesMemoryDtosRuntimeSignalDto)]),
          ) as BuiltList<AiAdminServicesMemoryDtosRuntimeSignalDto>?;
          if (valueDes == null) continue;
          result.list.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDtoBuilder();
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

