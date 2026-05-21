//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_voice_dtos_timbre_details_vo.g.dart';

/// AiAdminServicesVoiceDtosTimbreDetailsVo
///
/// Properties:
/// * [id] 
/// * [languages] 
/// * [name] 
/// * [remark] 
/// * [referenceAudio] 
/// * [referenceText] 
/// * [sort] 
/// * [providerCode] 
/// * [providerName] 
/// * [ttsProfileId] 
/// * [ttsVoice] 
/// * [voiceDemo] 
@BuiltValue()
abstract class AiAdminServicesVoiceDtosTimbreDetailsVo implements Built<AiAdminServicesVoiceDtosTimbreDetailsVo, AiAdminServicesVoiceDtosTimbreDetailsVoBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

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

  @BuiltValueField(wireName: r'providerCode')
  String? get providerCode;

  @BuiltValueField(wireName: r'providerName')
  String? get providerName;

  @BuiltValueField(wireName: r'ttsProfileId')
  String? get ttsProfileId;

  @BuiltValueField(wireName: r'ttsVoice')
  String? get ttsVoice;

  @BuiltValueField(wireName: r'voiceDemo')
  String? get voiceDemo;

  AiAdminServicesVoiceDtosTimbreDetailsVo._();

  factory AiAdminServicesVoiceDtosTimbreDetailsVo([void updates(AiAdminServicesVoiceDtosTimbreDetailsVoBuilder b)]) = _$AiAdminServicesVoiceDtosTimbreDetailsVo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesVoiceDtosTimbreDetailsVoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesVoiceDtosTimbreDetailsVo> get serializer => _$AiAdminServicesVoiceDtosTimbreDetailsVoSerializer();
}

class _$AiAdminServicesVoiceDtosTimbreDetailsVoSerializer implements PrimitiveSerializer<AiAdminServicesVoiceDtosTimbreDetailsVo> {
  @override
  final Iterable<Type> types = const [AiAdminServicesVoiceDtosTimbreDetailsVo, _$AiAdminServicesVoiceDtosTimbreDetailsVo];

  @override
  final String wireName = r'AiAdminServicesVoiceDtosTimbreDetailsVo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesVoiceDtosTimbreDetailsVo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType.nullable(String),
      );
    }
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
    if (object.providerCode != null) {
      yield r'providerCode';
      yield serializers.serialize(
        object.providerCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.providerName != null) {
      yield r'providerName';
      yield serializers.serialize(
        object.providerName,
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
    AiAdminServicesVoiceDtosTimbreDetailsVo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesVoiceDtosTimbreDetailsVoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.id = valueDes;
          break;
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
        case r'providerCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.providerCode = valueDes;
          break;
        case r'providerName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.providerName = valueDes;
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
  AiAdminServicesVoiceDtosTimbreDetailsVo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesVoiceDtosTimbreDetailsVoBuilder();
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

