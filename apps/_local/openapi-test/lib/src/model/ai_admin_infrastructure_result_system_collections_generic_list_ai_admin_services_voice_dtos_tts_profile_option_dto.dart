//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ai_admin_services_voice_dtos_tts_profile_option_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_infrastructure_result_system_collections_generic_list_ai_admin_services_voice_dtos_tts_profile_option_dto.g.dart';

/// AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto
///
/// Properties:
/// * [code] 
/// * [msg] 
/// * [data] 
@BuiltValue()
abstract class AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto implements Built<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto, AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder> {
  @BuiltValueField(wireName: r'code')
  int? get code;

  @BuiltValueField(wireName: r'msg')
  String? get msg;

  @BuiltValueField(wireName: r'data')
  BuiltList<AiAdminServicesVoiceDtosTtsProfileOptionDto>? get data;

  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto._();

  factory AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto([void updates(AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder b)]) = _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto> get serializer => _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDtoSerializer();
}

class _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDtoSerializer implements PrimitiveSerializer<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto> {
  @override
  final Iterable<Type> types = const [AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto, _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto];

  @override
  final String wireName = r'AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.code != null) {
      yield r'code';
      yield serializers.serialize(
        object.code,
        specifiedType: const FullType(int),
      );
    }
    if (object.msg != null) {
      yield r'msg';
      yield serializers.serialize(
        object.msg,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesVoiceDtosTtsProfileOptionDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.code = valueDes;
          break;
        case r'msg':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.msg = valueDes;
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesVoiceDtosTtsProfileOptionDto)]),
          ) as BuiltList<AiAdminServicesVoiceDtosTtsProfileOptionDto>?;
          if (valueDes == null) continue;
          result.data.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder();
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

