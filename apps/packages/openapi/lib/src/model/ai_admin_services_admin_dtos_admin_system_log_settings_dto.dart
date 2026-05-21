//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_admin_dtos_admin_system_log_settings_dto.g.dart';

/// AiAdminServicesAdminDtosAdminSystemLogSettingsDto
///
/// Properties:
/// * [logFormat] 
/// * [logFormatFile] 
/// * [logLevel] 
/// * [logDir] 
/// * [logFile] 
/// * [dataDir] 
@BuiltValue()
abstract class AiAdminServicesAdminDtosAdminSystemLogSettingsDto implements Built<AiAdminServicesAdminDtosAdminSystemLogSettingsDto, AiAdminServicesAdminDtosAdminSystemLogSettingsDtoBuilder> {
  @BuiltValueField(wireName: r'logFormat')
  String? get logFormat;

  @BuiltValueField(wireName: r'logFormatFile')
  String? get logFormatFile;

  @BuiltValueField(wireName: r'logLevel')
  String? get logLevel;

  @BuiltValueField(wireName: r'logDir')
  String? get logDir;

  @BuiltValueField(wireName: r'logFile')
  String? get logFile;

  @BuiltValueField(wireName: r'dataDir')
  String? get dataDir;

  AiAdminServicesAdminDtosAdminSystemLogSettingsDto._();

  factory AiAdminServicesAdminDtosAdminSystemLogSettingsDto([void updates(AiAdminServicesAdminDtosAdminSystemLogSettingsDtoBuilder b)]) = _$AiAdminServicesAdminDtosAdminSystemLogSettingsDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesAdminDtosAdminSystemLogSettingsDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesAdminDtosAdminSystemLogSettingsDto> get serializer => _$AiAdminServicesAdminDtosAdminSystemLogSettingsDtoSerializer();
}

class _$AiAdminServicesAdminDtosAdminSystemLogSettingsDtoSerializer implements PrimitiveSerializer<AiAdminServicesAdminDtosAdminSystemLogSettingsDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesAdminDtosAdminSystemLogSettingsDto, _$AiAdminServicesAdminDtosAdminSystemLogSettingsDto];

  @override
  final String wireName = r'AiAdminServicesAdminDtosAdminSystemLogSettingsDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesAdminDtosAdminSystemLogSettingsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.logFormat != null) {
      yield r'logFormat';
      yield serializers.serialize(
        object.logFormat,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.logFormatFile != null) {
      yield r'logFormatFile';
      yield serializers.serialize(
        object.logFormatFile,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.logLevel != null) {
      yield r'logLevel';
      yield serializers.serialize(
        object.logLevel,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.logDir != null) {
      yield r'logDir';
      yield serializers.serialize(
        object.logDir,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.logFile != null) {
      yield r'logFile';
      yield serializers.serialize(
        object.logFile,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.dataDir != null) {
      yield r'dataDir';
      yield serializers.serialize(
        object.dataDir,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesAdminDtosAdminSystemLogSettingsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesAdminDtosAdminSystemLogSettingsDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'logFormat':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.logFormat = valueDes;
          break;
        case r'logFormatFile':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.logFormatFile = valueDes;
          break;
        case r'logLevel':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.logLevel = valueDes;
          break;
        case r'logDir':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.logDir = valueDes;
          break;
        case r'logFile':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.logFile = valueDes;
          break;
        case r'dataDir':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.dataDir = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesAdminDtosAdminSystemLogSettingsDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesAdminDtosAdminSystemLogSettingsDtoBuilder();
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

