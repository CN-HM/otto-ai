//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/ai_admin_services_agent_roles_dtos_option_item_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_agent_roles_dtos_agent_role_binding_options_dto.g.dart';

/// AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto
///
/// Properties:
/// * [pipelineTemplates] 
/// * [asrProfiles] 
/// * [vadProfiles] 
/// * [llmProfiles] 
/// * [ttsProfiles] 
@BuiltValue()
abstract class AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto implements Built<AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto, AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoBuilder> {
  @BuiltValueField(wireName: r'pipelineTemplates')
  BuiltList<AiAdminServicesAgentRolesDtosOptionItemDto>? get pipelineTemplates;

  @BuiltValueField(wireName: r'asrProfiles')
  BuiltList<AiAdminServicesAgentRolesDtosOptionItemDto>? get asrProfiles;

  @BuiltValueField(wireName: r'vadProfiles')
  BuiltList<AiAdminServicesAgentRolesDtosOptionItemDto>? get vadProfiles;

  @BuiltValueField(wireName: r'llmProfiles')
  BuiltList<AiAdminServicesAgentRolesDtosOptionItemDto>? get llmProfiles;

  @BuiltValueField(wireName: r'ttsProfiles')
  BuiltList<AiAdminServicesAgentRolesDtosOptionItemDto>? get ttsProfiles;

  AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto._();

  factory AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto([void updates(AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoBuilder b)]) = _$AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto> get serializer => _$AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoSerializer();
}

class _$AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoSerializer implements PrimitiveSerializer<AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto, _$AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto];

  @override
  final String wireName = r'AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.pipelineTemplates != null) {
      yield r'pipelineTemplates';
      yield serializers.serialize(
        object.pipelineTemplates,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAgentRolesDtosOptionItemDto)]),
      );
    }
    if (object.asrProfiles != null) {
      yield r'asrProfiles';
      yield serializers.serialize(
        object.asrProfiles,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAgentRolesDtosOptionItemDto)]),
      );
    }
    if (object.vadProfiles != null) {
      yield r'vadProfiles';
      yield serializers.serialize(
        object.vadProfiles,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAgentRolesDtosOptionItemDto)]),
      );
    }
    if (object.llmProfiles != null) {
      yield r'llmProfiles';
      yield serializers.serialize(
        object.llmProfiles,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAgentRolesDtosOptionItemDto)]),
      );
    }
    if (object.ttsProfiles != null) {
      yield r'ttsProfiles';
      yield serializers.serialize(
        object.ttsProfiles,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAgentRolesDtosOptionItemDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'pipelineTemplates':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAgentRolesDtosOptionItemDto)]),
          ) as BuiltList<AiAdminServicesAgentRolesDtosOptionItemDto>?;
          if (valueDes == null) continue;
          result.pipelineTemplates.replace(valueDes);
          break;
        case r'asrProfiles':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAgentRolesDtosOptionItemDto)]),
          ) as BuiltList<AiAdminServicesAgentRolesDtosOptionItemDto>?;
          if (valueDes == null) continue;
          result.asrProfiles.replace(valueDes);
          break;
        case r'vadProfiles':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAgentRolesDtosOptionItemDto)]),
          ) as BuiltList<AiAdminServicesAgentRolesDtosOptionItemDto>?;
          if (valueDes == null) continue;
          result.vadProfiles.replace(valueDes);
          break;
        case r'llmProfiles':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAgentRolesDtosOptionItemDto)]),
          ) as BuiltList<AiAdminServicesAgentRolesDtosOptionItemDto>?;
          if (valueDes == null) continue;
          result.llmProfiles.replace(valueDes);
          break;
        case r'ttsProfiles':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAgentRolesDtosOptionItemDto)]),
          ) as BuiltList<AiAdminServicesAgentRolesDtosOptionItemDto>?;
          if (valueDes == null) continue;
          result.ttsProfiles.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoBuilder();
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

