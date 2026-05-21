//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_voice_dtos_timbre_data_dto.g.dart';

/// AiAdminServicesVoiceDtosTimbreDataDto
///
/// Properties:
/// * [languages] 
/// * [name] 
/// * [remark] 
/// * [referenceAudio] 
/// * [referenceText] 
/// * [sort] 
/// * [ttsProfileId] 
/// * [ttsVoice] 
/// * [voiceDemo] 
@BuiltValue()
abstract class AiAdminServicesVoiceDtosTimbreDataDto implements Built<AiAdminServicesVoiceDtosTimbreDataDto, AiAdminServicesVoiceDtosTimbreDataDtoBuilder> {
  @BuiltValueField(wireName: r'languages')
  String? get languages;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'remark')
  String? get remark;

  @BuiltValueField(wireName: r'referenceAudio')
  String? get referenceAudio;

  @BuiltValueField(wireName: r'referenceText')
  String? get referenceText;

  @BuiltValueField(wireName: r'sort')
  int? get sort;

  @BuiltValueField(wireName: r'ttsProfileId')
  String? get ttsProfileId;

  @BuiltValueField(wireName: r'ttsVoice')
  String? get ttsVoice;

  @BuiltValueField(wireName: r'voiceDemo')
  String? get voiceDemo;

  AiAdminServicesVoiceDtosTimbreDataDto._();

  factory AiAdminServicesVoiceDtosTimbreDataDto([void updates(AiAdminServicesVoiceDtosTimbreDataDtoBuilder b)]) = _$AiAdminServicesVoiceDtosTimbreDataDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesVoiceDtosTimbreDataDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesVoiceDtosTimbreDataDto> get serializer => _$AiAdminServicesVoiceDtosTimbreDataDtoSerializer();
}

class _$AiAdminServicesVoiceDtosTimbreDataDtoSerializer implements PrimitiveSerializer<AiAdminServicesVoiceDtosTimbreDataDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesVoiceDtosTimbreDataDto, _$AiAdminServicesVoiceDtosTimbreDataDto];

  @override
  final String wireName = r'AiAdminServicesVoiceDtosTimbreDataDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesVoiceDtosTimbreDataDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.languages != null) {
      yield r'languages';
      yield serializers.serialize(
        object.languages,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.remark != null) {
      yield r'remark';
      yield serializers.serialize(
        object.remark,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.referenceAudio != null) {
      yield r'referenceAudio';
      yield serializers.serialize(
        object.referenceAudio,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.referenceText != null) {
      yield r'referenceText';
      yield serializers.serialize(
        object.referenceText,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.sort != null) {
      yield r'sort';
      yield serializers.serialize(
        object.sort,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.ttsProfileId != null) {
      yield r'ttsProfileId';
      yield serializers.serialize(
        object.ttsProfileId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.ttsVoice != null) {
      yield r'ttsVoice';
      yield serializers.serialize(
        object.ttsVoice,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.voiceDemo != null) {
      yield r'voiceDemo';
      yield serializers.serialize(
        object.voiceDemo,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesVoiceDtosTimbreDataDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesVoiceDtosTimbreDataDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'languages':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.languages = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'remark':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.remark = valueDes;
          break;
        case r'referenceAudio':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.referenceAudio = valueDes;
          break;
        case r'referenceText':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.referenceText = valueDes;
          break;
        case r'sort':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.sort = valueDes;
          break;
        case r'ttsProfileId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.ttsProfileId = valueDes;
          break;
        case r'ttsVoice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.ttsVoice = valueDes;
          break;
        case r'voiceDemo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.voiceDemo = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesVoiceDtosTimbreDataDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesVoiceDtosTimbreDataDtoBuilder();
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

