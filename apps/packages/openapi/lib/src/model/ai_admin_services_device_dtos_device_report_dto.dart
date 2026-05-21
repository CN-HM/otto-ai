//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_device_dtos_device_board_info_dto.dart';
import 'package:openapi/src/model/ai_admin_services_device_dtos_device_application_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_device_dtos_device_report_dto.g.dart';

/// AiAdminServicesDeviceDtosDeviceReportDto
///
/// Properties:
/// * [version] 
/// * [uuid] 
/// * [application] 
/// * [board] 
/// * [macAddress] 
/// * [chipModelName] 
@BuiltValue()
abstract class AiAdminServicesDeviceDtosDeviceReportDto implements Built<AiAdminServicesDeviceDtosDeviceReportDto, AiAdminServicesDeviceDtosDeviceReportDtoBuilder> {
  @BuiltValueField(wireName: r'version')
  int? get version;

  @BuiltValueField(wireName: r'uuid')
  String? get uuid;

  @BuiltValueField(wireName: r'application')
  AiAdminServicesDeviceDtosDeviceApplicationDto? get application;

  @BuiltValueField(wireName: r'board')
  AiAdminServicesDeviceDtosDeviceBoardInfoDto? get board;

  @BuiltValueField(wireName: r'mac_address')
  String? get macAddress;

  @BuiltValueField(wireName: r'chip_model_name')
  String? get chipModelName;

  AiAdminServicesDeviceDtosDeviceReportDto._();

  factory AiAdminServicesDeviceDtosDeviceReportDto([void updates(AiAdminServicesDeviceDtosDeviceReportDtoBuilder b)]) = _$AiAdminServicesDeviceDtosDeviceReportDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesDeviceDtosDeviceReportDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesDeviceDtosDeviceReportDto> get serializer => _$AiAdminServicesDeviceDtosDeviceReportDtoSerializer();
}

class _$AiAdminServicesDeviceDtosDeviceReportDtoSerializer implements PrimitiveSerializer<AiAdminServicesDeviceDtosDeviceReportDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesDeviceDtosDeviceReportDto, _$AiAdminServicesDeviceDtosDeviceReportDto];

  @override
  final String wireName = r'AiAdminServicesDeviceDtosDeviceReportDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesDeviceDtosDeviceReportDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.version != null) {
      yield r'version';
      yield serializers.serialize(
        object.version,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.uuid != null) {
      yield r'uuid';
      yield serializers.serialize(
        object.uuid,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.application != null) {
      yield r'application';
      yield serializers.serialize(
        object.application,
        specifiedType: const FullType(AiAdminServicesDeviceDtosDeviceApplicationDto),
      );
    }
    if (object.board != null) {
      yield r'board';
      yield serializers.serialize(
        object.board,
        specifiedType: const FullType(AiAdminServicesDeviceDtosDeviceBoardInfoDto),
      );
    }
    if (object.macAddress != null) {
      yield r'mac_address';
      yield serializers.serialize(
        object.macAddress,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.chipModelName != null) {
      yield r'chip_model_name';
      yield serializers.serialize(
        object.chipModelName,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesDeviceDtosDeviceReportDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesDeviceDtosDeviceReportDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.version = valueDes;
          break;
        case r'uuid':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.uuid = valueDes;
          break;
        case r'application':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesDeviceDtosDeviceApplicationDto),
          ) as AiAdminServicesDeviceDtosDeviceApplicationDto;
          result.application.replace(valueDes);
          break;
        case r'board':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AiAdminServicesDeviceDtosDeviceBoardInfoDto),
          ) as AiAdminServicesDeviceDtosDeviceBoardInfoDto;
          result.board.replace(valueDes);
          break;
        case r'mac_address':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.macAddress = valueDes;
          break;
        case r'chip_model_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.chipModelName = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesDeviceDtosDeviceReportDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesDeviceDtosDeviceReportDtoBuilder();
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

