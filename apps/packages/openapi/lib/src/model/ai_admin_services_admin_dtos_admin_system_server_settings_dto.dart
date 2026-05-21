//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_admin_dtos_admin_system_server_settings_dto.g.dart';

/// AiAdminServicesAdminDtosAdminSystemServerSettingsDto
///
/// Properties:
/// * [listenIp] 
/// * [publicHost] 
/// * [port] 
/// * [httpPort] 
/// * [visionPort] 
/// * [secret] 
/// * [allowUserRegister] 
/// * [frontendUrl] 
@BuiltValue()
abstract class AiAdminServicesAdminDtosAdminSystemServerSettingsDto implements Built<AiAdminServicesAdminDtosAdminSystemServerSettingsDto, AiAdminServicesAdminDtosAdminSystemServerSettingsDtoBuilder> {
  @BuiltValueField(wireName: r'listenIp')
  String? get listenIp;

  @BuiltValueField(wireName: r'publicHost')
  String? get publicHost;

  @BuiltValueField(wireName: r'port')
  int? get port;

  @BuiltValueField(wireName: r'httpPort')
  int? get httpPort;

  @BuiltValueField(wireName: r'visionPort')
  int? get visionPort;

  @BuiltValueField(wireName: r'secret')
  String? get secret;

  @BuiltValueField(wireName: r'allowUserRegister')
  bool? get allowUserRegister;

  @BuiltValueField(wireName: r'frontendUrl')
  String? get frontendUrl;

  AiAdminServicesAdminDtosAdminSystemServerSettingsDto._();

  factory AiAdminServicesAdminDtosAdminSystemServerSettingsDto([void updates(AiAdminServicesAdminDtosAdminSystemServerSettingsDtoBuilder b)]) = _$AiAdminServicesAdminDtosAdminSystemServerSettingsDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesAdminDtosAdminSystemServerSettingsDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesAdminDtosAdminSystemServerSettingsDto> get serializer => _$AiAdminServicesAdminDtosAdminSystemServerSettingsDtoSerializer();
}

class _$AiAdminServicesAdminDtosAdminSystemServerSettingsDtoSerializer implements PrimitiveSerializer<AiAdminServicesAdminDtosAdminSystemServerSettingsDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesAdminDtosAdminSystemServerSettingsDto, _$AiAdminServicesAdminDtosAdminSystemServerSettingsDto];

  @override
  final String wireName = r'AiAdminServicesAdminDtosAdminSystemServerSettingsDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesAdminDtosAdminSystemServerSettingsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.listenIp != null) {
      yield r'listenIp';
      yield serializers.serialize(
        object.listenIp,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.publicHost != null) {
      yield r'publicHost';
      yield serializers.serialize(
        object.publicHost,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.port != null) {
      yield r'port';
      yield serializers.serialize(
        object.port,
        specifiedType: const FullType(int),
      );
    }
    if (object.httpPort != null) {
      yield r'httpPort';
      yield serializers.serialize(
        object.httpPort,
        specifiedType: const FullType(int),
      );
    }
    if (object.visionPort != null) {
      yield r'visionPort';
      yield serializers.serialize(
        object.visionPort,
        specifiedType: const FullType(int),
      );
    }
    if (object.secret != null) {
      yield r'secret';
      yield serializers.serialize(
        object.secret,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.allowUserRegister != null) {
      yield r'allowUserRegister';
      yield serializers.serialize(
        object.allowUserRegister,
        specifiedType: const FullType(bool),
      );
    }
    if (object.frontendUrl != null) {
      yield r'frontendUrl';
      yield serializers.serialize(
        object.frontendUrl,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesAdminDtosAdminSystemServerSettingsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesAdminDtosAdminSystemServerSettingsDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'listenIp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.listenIp = valueDes;
          break;
        case r'publicHost':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.publicHost = valueDes;
          break;
        case r'port':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.port = valueDes;
          break;
        case r'httpPort':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.httpPort = valueDes;
          break;
        case r'visionPort':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.visionPort = valueDes;
          break;
        case r'secret':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.secret = valueDes;
          break;
        case r'allowUserRegister':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.allowUserRegister = valueDes;
          break;
        case r'frontendUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.frontendUrl = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesAdminDtosAdminSystemServerSettingsDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesAdminDtosAdminSystemServerSettingsDtoBuilder();
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

