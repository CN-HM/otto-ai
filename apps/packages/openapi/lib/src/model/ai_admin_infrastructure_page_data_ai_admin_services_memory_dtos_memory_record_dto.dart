//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_memory_dtos_memory_record_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_page_data_ai_admin_services_memory_dtos_memory_record_dto.g.dart';

/// AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto
///
/// Properties:
/// * [total] 
/// * [list] 
@BuiltValue()
abstract class AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto implements Built<AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto, AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDtoBuilder> {
  @BuiltValueField(wireName: r'total')
  int? get total;

  @BuiltValueField(wireName: r'list')
  BuiltList<AiAdminServicesMemoryDtosMemoryRecordDto>? get list;

  AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto._();

  factory AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto([void updates(AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDtoBuilder b)]) = _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto> get serializer => _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDtoSerializer();
}

class _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDtoSerializer implements PrimitiveSerializer<AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto, _$AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto];

  @override
  final String wireName = r'AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto object, {
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
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesMemoryDtosMemoryRecordDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDtoBuilder result,
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
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesMemoryDtosMemoryRecordDto)]),
          ) as BuiltList<AiAdminServicesMemoryDtosMemoryRecordDto>?;
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
  AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDtoBuilder();
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

