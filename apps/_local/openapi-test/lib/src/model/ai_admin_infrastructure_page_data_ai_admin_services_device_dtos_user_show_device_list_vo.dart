//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/ai_admin_services_device_dtos_user_show_device_list_vo.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_page_data_ai_admin_services_device_dtos_user_show_device_list_vo.g.dart';

/// AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo
///
/// Properties:
/// * [total] 
/// * [list] 
@BuiltValue()
abstract class AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo implements Built<AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo, AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVoBuilder> {
  @BuiltValueField(wireName: r'total')
  int? get total;

  @BuiltValueField(wireName: r'list')
  BuiltList<AiAdminServicesDeviceDtosUserShowDeviceListVo>? get list;

  AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo._();

  factory AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo([void updates(AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVoBuilder b)]) = _$AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo> get serializer => _$AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVoSerializer();
}

class _$AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVoSerializer implements PrimitiveSerializer<AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo, _$AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo];

  @override
  final String wireName = r'AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo object, {
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
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesDeviceDtosUserShowDeviceListVo)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVoBuilder result,
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
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesDeviceDtosUserShowDeviceListVo)]),
          ) as BuiltList<AiAdminServicesDeviceDtosUserShowDeviceListVo>?;
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
  AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVoBuilder();
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

