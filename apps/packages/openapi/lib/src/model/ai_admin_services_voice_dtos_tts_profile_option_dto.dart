//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_voice_dtos_tts_profile_option_dto.g.dart';

/// AiAdminServicesVoiceDtosTtsProfileOptionDto
///
/// Properties:
/// * [label] 
/// * [value] 
/// * [description] 
/// * [profileName] 
/// * [integrationId] 
/// * [providerCode] 
/// * [providerName] 
@BuiltValue()
abstract class AiAdminServicesVoiceDtosTtsProfileOptionDto implements Built<AiAdminServicesVoiceDtosTtsProfileOptionDto, AiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder> {
  @BuiltValueField(wireName: r'label')
  String? get label;

  @BuiltValueField(wireName: r'value')
  String? get value;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'profileName')
  String? get profileName;

  @BuiltValueField(wireName: r'integrationId')
  String? get integrationId;

  @BuiltValueField(wireName: r'providerCode')
  String? get providerCode;

  @BuiltValueField(wireName: r'providerName')
  String? get providerName;

  AiAdminServicesVoiceDtosTtsProfileOptionDto._();

  factory AiAdminServicesVoiceDtosTtsProfileOptionDto([void updates(AiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder b)]) = _$AiAdminServicesVoiceDtosTtsProfileOptionDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesVoiceDtosTtsProfileOptionDto> get serializer => _$AiAdminServicesVoiceDtosTtsProfileOptionDtoSerializer();
}

class _$AiAdminServicesVoiceDtosTtsProfileOptionDtoSerializer implements PrimitiveSerializer<AiAdminServicesVoiceDtosTtsProfileOptionDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesVoiceDtosTtsProfileOptionDto, _$AiAdminServicesVoiceDtosTtsProfileOptionDto];

  @override
  final String wireName = r'AiAdminServicesVoiceDtosTtsProfileOptionDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesVoiceDtosTtsProfileOptionDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.label != null) {
      yield r'label';
      yield serializers.serialize(
        object.label,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.value != null) {
      yield r'value';
      yield serializers.serialize(
        object.value,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.profileName != null) {
      yield r'profileName';
      yield serializers.serialize(
        object.profileName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.integrationId != null) {
      yield r'integrationId';
      yield serializers.serialize(
        object.integrationId,
        specifiedType: const FullType.nullable(String),
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
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesVoiceDtosTtsProfileOptionDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'label':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.label = valueDes;
          break;
        case r'value':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.value = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'profileName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.profileName = valueDes;
          break;
        case r'integrationId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.integrationId = valueDes;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesVoiceDtosTtsProfileOptionDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder();
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

