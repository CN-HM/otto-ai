//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_voice_dtos_tts_voice_sync_result_dto.g.dart';

/// AiAdminServicesVoiceDtosTtsVoiceSyncResultDto
///
/// Properties:
/// * [providerCode] 
/// * [ttsProfileId] 
/// * [remoteCount] 
/// * [createdCount] 
/// * [updatedCount] 
/// * [skippedCount] 
/// * [message] 
@BuiltValue()
abstract class AiAdminServicesVoiceDtosTtsVoiceSyncResultDto implements Built<AiAdminServicesVoiceDtosTtsVoiceSyncResultDto, AiAdminServicesVoiceDtosTtsVoiceSyncResultDtoBuilder> {
  @BuiltValueField(wireName: r'providerCode')
  String? get providerCode;

  @BuiltValueField(wireName: r'ttsProfileId')
  String? get ttsProfileId;

  @BuiltValueField(wireName: r'remoteCount')
  int? get remoteCount;

  @BuiltValueField(wireName: r'createdCount')
  int? get createdCount;

  @BuiltValueField(wireName: r'updatedCount')
  int? get updatedCount;

  @BuiltValueField(wireName: r'skippedCount')
  int? get skippedCount;

  @BuiltValueField(wireName: r'message')
  String? get message;

  AiAdminServicesVoiceDtosTtsVoiceSyncResultDto._();

  factory AiAdminServicesVoiceDtosTtsVoiceSyncResultDto([void updates(AiAdminServicesVoiceDtosTtsVoiceSyncResultDtoBuilder b)]) = _$AiAdminServicesVoiceDtosTtsVoiceSyncResultDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesVoiceDtosTtsVoiceSyncResultDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesVoiceDtosTtsVoiceSyncResultDto> get serializer => _$AiAdminServicesVoiceDtosTtsVoiceSyncResultDtoSerializer();
}

class _$AiAdminServicesVoiceDtosTtsVoiceSyncResultDtoSerializer implements PrimitiveSerializer<AiAdminServicesVoiceDtosTtsVoiceSyncResultDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesVoiceDtosTtsVoiceSyncResultDto, _$AiAdminServicesVoiceDtosTtsVoiceSyncResultDto];

  @override
  final String wireName = r'AiAdminServicesVoiceDtosTtsVoiceSyncResultDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesVoiceDtosTtsVoiceSyncResultDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.providerCode != null) {
      yield r'providerCode';
      yield serializers.serialize(
        object.providerCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.ttsProfileId != null) {
      yield r'ttsProfileId';
      yield serializers.serialize(
        object.ttsProfileId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.remoteCount != null) {
      yield r'remoteCount';
      yield serializers.serialize(
        object.remoteCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.createdCount != null) {
      yield r'createdCount';
      yield serializers.serialize(
        object.createdCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.updatedCount != null) {
      yield r'updatedCount';
      yield serializers.serialize(
        object.updatedCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.skippedCount != null) {
      yield r'skippedCount';
      yield serializers.serialize(
        object.skippedCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.message != null) {
      yield r'message';
      yield serializers.serialize(
        object.message,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesVoiceDtosTtsVoiceSyncResultDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesVoiceDtosTtsVoiceSyncResultDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'providerCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.providerCode = valueDes;
          break;
        case r'ttsProfileId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.ttsProfileId = valueDes;
          break;
        case r'remoteCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.remoteCount = valueDes;
          break;
        case r'createdCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.createdCount = valueDes;
          break;
        case r'updatedCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.updatedCount = valueDes;
          break;
        case r'skippedCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.skippedCount = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.message = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesVoiceDtosTtsVoiceSyncResultDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesVoiceDtosTtsVoiceSyncResultDtoBuilder();
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

