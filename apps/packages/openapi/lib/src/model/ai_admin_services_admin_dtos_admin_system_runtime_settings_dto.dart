//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_admin_dtos_admin_system_runtime_settings_dto.g.dart';

/// AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto
///
/// Properties:
/// * [deleteAudio] 
/// * [closeConnectionNoVoiceTime] 
/// * [ttsTimeout] 
/// * [enableWakeupWordsResponseCache] 
/// * [enableGreeting] 
/// * [enableStopTtsNotify] 
/// * [stopTtsNotifyVoice] 
/// * [exitCommands] 
/// * [iotProtocolConfig] 
/// * [wakeupWords] 
/// * [deviceMaxOutputSize] 
/// * [voiceprintUrl] 
/// * [voiceprintSimilarityThreshold] 
@BuiltValue()
abstract class AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto implements Built<AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto, AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDtoBuilder> {
  @BuiltValueField(wireName: r'deleteAudio')
  bool? get deleteAudio;

  @BuiltValueField(wireName: r'closeConnectionNoVoiceTime')
  int? get closeConnectionNoVoiceTime;

  @BuiltValueField(wireName: r'ttsTimeout')
  int? get ttsTimeout;

  @BuiltValueField(wireName: r'enableWakeupWordsResponseCache')
  bool? get enableWakeupWordsResponseCache;

  @BuiltValueField(wireName: r'enableGreeting')
  bool? get enableGreeting;

  @BuiltValueField(wireName: r'enableStopTtsNotify')
  bool? get enableStopTtsNotify;

  @BuiltValueField(wireName: r'stopTtsNotifyVoice')
  String? get stopTtsNotifyVoice;

  @BuiltValueField(wireName: r'exitCommands')
  String? get exitCommands;

  @BuiltValueField(wireName: r'AI')
  String? get iotProtocolConfig;

  @BuiltValueField(wireName: r'wakeupWords')
  String? get wakeupWords;

  @BuiltValueField(wireName: r'deviceMaxOutputSize')
  int? get deviceMaxOutputSize;

  @BuiltValueField(wireName: r'voiceprintUrl')
  String? get voiceprintUrl;

  @BuiltValueField(wireName: r'voiceprintSimilarityThreshold')
  double? get voiceprintSimilarityThreshold;

  AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto._();

  factory AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto([void updates(AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDtoBuilder b)]) = _$AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto> get serializer => _$AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDtoSerializer();
}

class _$AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDtoSerializer implements PrimitiveSerializer<AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto, _$AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto];

  @override
  final String wireName = r'AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.deleteAudio != null) {
      yield r'deleteAudio';
      yield serializers.serialize(
        object.deleteAudio,
        specifiedType: const FullType(bool),
      );
    }
    if (object.closeConnectionNoVoiceTime != null) {
      yield r'closeConnectionNoVoiceTime';
      yield serializers.serialize(
        object.closeConnectionNoVoiceTime,
        specifiedType: const FullType(int),
      );
    }
    if (object.ttsTimeout != null) {
      yield r'ttsTimeout';
      yield serializers.serialize(
        object.ttsTimeout,
        specifiedType: const FullType(int),
      );
    }
    if (object.enableWakeupWordsResponseCache != null) {
      yield r'enableWakeupWordsResponseCache';
      yield serializers.serialize(
        object.enableWakeupWordsResponseCache,
        specifiedType: const FullType(bool),
      );
    }
    if (object.enableGreeting != null) {
      yield r'enableGreeting';
      yield serializers.serialize(
        object.enableGreeting,
        specifiedType: const FullType(bool),
      );
    }
    if (object.enableStopTtsNotify != null) {
      yield r'enableStopTtsNotify';
      yield serializers.serialize(
        object.enableStopTtsNotify,
        specifiedType: const FullType(bool),
      );
    }
    if (object.stopTtsNotifyVoice != null) {
      yield r'stopTtsNotifyVoice';
      yield serializers.serialize(
        object.stopTtsNotifyVoice,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.exitCommands != null) {
      yield r'exitCommands';
      yield serializers.serialize(
        object.exitCommands,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.iotProtocolConfig != null) {
      yield r'iot_protocol_config';
      yield serializers.serialize(
        object.iotProtocolConfig,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.wakeupWords != null) {
      yield r'wakeupWords';
      yield serializers.serialize(
        object.wakeupWords,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.deviceMaxOutputSize != null) {
      yield r'deviceMaxOutputSize';
      yield serializers.serialize(
        object.deviceMaxOutputSize,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.voiceprintUrl != null) {
      yield r'voiceprintUrl';
      yield serializers.serialize(
        object.voiceprintUrl,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.voiceprintSimilarityThreshold != null) {
      yield r'voiceprintSimilarityThreshold';
      yield serializers.serialize(
        object.voiceprintSimilarityThreshold,
        specifiedType: const FullType.nullable(double),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'deleteAudio':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.deleteAudio = valueDes;
          break;
        case r'closeConnectionNoVoiceTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.closeConnectionNoVoiceTime = valueDes;
          break;
        case r'ttsTimeout':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.ttsTimeout = valueDes;
          break;
        case r'enableWakeupWordsResponseCache':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.enableWakeupWordsResponseCache = valueDes;
          break;
        case r'enableGreeting':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.enableGreeting = valueDes;
          break;
        case r'enableStopTtsNotify':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.enableStopTtsNotify = valueDes;
          break;
        case r'stopTtsNotifyVoice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.stopTtsNotifyVoice = valueDes;
          break;
        case r'exitCommands':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.exitCommands = valueDes;
          break;
        case r'iot_protocol_config':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.iotProtocolConfig = valueDes;
          break;
        case r'wakeupWords':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.wakeupWords = valueDes;
          break;
        case r'deviceMaxOutputSize':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.deviceMaxOutputSize = valueDes;
          break;
        case r'voiceprintUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.voiceprintUrl = valueDes;
          break;
        case r'voiceprintSimilarityThreshold':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.voiceprintSimilarityThreshold = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDtoBuilder();
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

