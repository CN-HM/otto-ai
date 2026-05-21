//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/ai_admin_services_agent_roles_dtos_agent_role_context_provider_dto.dart';
import 'package:openapi/src/model/ai_admin_services_agent_roles_dtos_agent_role_plugin_mapping_dto.dart';
import 'package:openapi/src/model/ai_admin_services_agent_roles_dtos_agent_role_knowledge_binding_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_agent_roles_dtos_agent_role_upsert_dto.g.dart';

/// AiAdminServicesAgentRolesDtosAgentRoleUpsertDto
///
/// Properties:
/// * [code] 
/// * [name] 
/// * [displayName] 
/// * [description] 
/// * [status] 
/// * [icon] 
/// * [coverImage] 
/// * [themeToken] 
/// * [pipelineTemplateId] 
/// * [asrProfileId] 
/// * [vadProfileId] 
/// * [llmProfileId] 
/// * [ttsProfileId] 
/// * [ttsVoiceId] 
/// * [ttsLanguage] 
/// * [ttsVolume] 
/// * [ttsRate] 
/// * [ttsPitch] 
/// * [chatHistoryConf] 
/// * [systemPrompt] 
/// * [knowledgeNoHitFallbackText] 
/// * [memoryEnabled] 
/// * [memoryModelId] 
/// * [memoryEntityScope] 
/// * [memoryTopK] 
/// * [memoryMinScore] 
/// * [memoryIntentRecall] 
/// * [memoryQueryRewrite] 
/// * [memoryRerank] 
/// * [langCode] 
/// * [language] 
/// * [sort] 
/// * [pluginMappings] 
/// * [contextProviders] 
/// * [knowledgeBindings] 
@BuiltValue()
abstract class AiAdminServicesAgentRolesDtosAgentRoleUpsertDto implements Built<AiAdminServicesAgentRolesDtosAgentRoleUpsertDto, AiAdminServicesAgentRolesDtosAgentRoleUpsertDtoBuilder> {
  @BuiltValueField(wireName: r'code')
  String? get code;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'displayName')
  String? get displayName;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'status')
  String? get status;

  @BuiltValueField(wireName: r'icon')
  String? get icon;

  @BuiltValueField(wireName: r'coverImage')
  String? get coverImage;

  @BuiltValueField(wireName: r'themeToken')
  String? get themeToken;

  @BuiltValueField(wireName: r'pipelineTemplateId')
  String? get pipelineTemplateId;

  @BuiltValueField(wireName: r'asrProfileId')
  String? get asrProfileId;

  @BuiltValueField(wireName: r'vadProfileId')
  String? get vadProfileId;

  @BuiltValueField(wireName: r'llmProfileId')
  String? get llmProfileId;

  @BuiltValueField(wireName: r'ttsProfileId')
  String? get ttsProfileId;

  @BuiltValueField(wireName: r'ttsVoiceId')
  String? get ttsVoiceId;

  @BuiltValueField(wireName: r'ttsLanguage')
  String? get ttsLanguage;

  @BuiltValueField(wireName: r'ttsVolume')
  double? get ttsVolume;

  @BuiltValueField(wireName: r'ttsRate')
  double? get ttsRate;

  @BuiltValueField(wireName: r'ttsPitch')
  double? get ttsPitch;

  @BuiltValueField(wireName: r'chatHistoryConf')
  int? get chatHistoryConf;

  @BuiltValueField(wireName: r'systemPrompt')
  String? get systemPrompt;

  @BuiltValueField(wireName: r'knowledgeNoHitFallbackText')
  String? get knowledgeNoHitFallbackText;

  @BuiltValueField(wireName: r'memoryEnabled')
  bool? get memoryEnabled;

  @BuiltValueField(wireName: r'memoryModelId')
  String? get memoryModelId;

  @BuiltValueField(wireName: r'memoryEntityScope')
  String? get memoryEntityScope;

  @BuiltValueField(wireName: r'memoryTopK')
  int? get memoryTopK;

  @BuiltValueField(wireName: r'memoryMinScore')
  double? get memoryMinScore;

  @BuiltValueField(wireName: r'memoryIntentRecall')
  bool? get memoryIntentRecall;

  @BuiltValueField(wireName: r'memoryQueryRewrite')
  bool? get memoryQueryRewrite;

  @BuiltValueField(wireName: r'memoryRerank')
  bool? get memoryRerank;

  @BuiltValueField(wireName: r'langCode')
  String? get langCode;

  @BuiltValueField(wireName: r'language')
  String? get language;

  @BuiltValueField(wireName: r'sort')
  int? get sort;

  @BuiltValueField(wireName: r'pluginMappings')
  BuiltList<AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto>? get pluginMappings;

  @BuiltValueField(wireName: r'contextProviders')
  BuiltList<AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto>? get contextProviders;

  @BuiltValueField(wireName: r'knowledgeBindings')
  BuiltList<AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto>? get knowledgeBindings;

  AiAdminServicesAgentRolesDtosAgentRoleUpsertDto._();

  factory AiAdminServicesAgentRolesDtosAgentRoleUpsertDto([void updates(AiAdminServicesAgentRolesDtosAgentRoleUpsertDtoBuilder b)]) = _$AiAdminServicesAgentRolesDtosAgentRoleUpsertDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesAgentRolesDtosAgentRoleUpsertDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesAgentRolesDtosAgentRoleUpsertDto> get serializer => _$AiAdminServicesAgentRolesDtosAgentRoleUpsertDtoSerializer();
}

class _$AiAdminServicesAgentRolesDtosAgentRoleUpsertDtoSerializer implements PrimitiveSerializer<AiAdminServicesAgentRolesDtosAgentRoleUpsertDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesAgentRolesDtosAgentRoleUpsertDto, _$AiAdminServicesAgentRolesDtosAgentRoleUpsertDto];

  @override
  final String wireName = r'AiAdminServicesAgentRolesDtosAgentRoleUpsertDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesAgentRolesDtosAgentRoleUpsertDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.code != null) {
      yield r'code';
      yield serializers.serialize(
        object.code,
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
    if (object.displayName != null) {
      yield r'displayName';
      yield serializers.serialize(
        object.displayName,
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
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.icon != null) {
      yield r'icon';
      yield serializers.serialize(
        object.icon,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.coverImage != null) {
      yield r'coverImage';
      yield serializers.serialize(
        object.coverImage,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.themeToken != null) {
      yield r'themeToken';
      yield serializers.serialize(
        object.themeToken,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.pipelineTemplateId != null) {
      yield r'pipelineTemplateId';
      yield serializers.serialize(
        object.pipelineTemplateId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.asrProfileId != null) {
      yield r'asrProfileId';
      yield serializers.serialize(
        object.asrProfileId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.vadProfileId != null) {
      yield r'vadProfileId';
      yield serializers.serialize(
        object.vadProfileId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.llmProfileId != null) {
      yield r'llmProfileId';
      yield serializers.serialize(
        object.llmProfileId,
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
    if (object.ttsVoiceId != null) {
      yield r'ttsVoiceId';
      yield serializers.serialize(
        object.ttsVoiceId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.ttsLanguage != null) {
      yield r'ttsLanguage';
      yield serializers.serialize(
        object.ttsLanguage,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.ttsVolume != null) {
      yield r'ttsVolume';
      yield serializers.serialize(
        object.ttsVolume,
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.ttsRate != null) {
      yield r'ttsRate';
      yield serializers.serialize(
        object.ttsRate,
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.ttsPitch != null) {
      yield r'ttsPitch';
      yield serializers.serialize(
        object.ttsPitch,
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.chatHistoryConf != null) {
      yield r'chatHistoryConf';
      yield serializers.serialize(
        object.chatHistoryConf,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.systemPrompt != null) {
      yield r'systemPrompt';
      yield serializers.serialize(
        object.systemPrompt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.knowledgeNoHitFallbackText != null) {
      yield r'knowledgeNoHitFallbackText';
      yield serializers.serialize(
        object.knowledgeNoHitFallbackText,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.memoryEnabled != null) {
      yield r'memoryEnabled';
      yield serializers.serialize(
        object.memoryEnabled,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.memoryModelId != null) {
      yield r'memoryModelId';
      yield serializers.serialize(
        object.memoryModelId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.memoryEntityScope != null) {
      yield r'memoryEntityScope';
      yield serializers.serialize(
        object.memoryEntityScope,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.memoryTopK != null) {
      yield r'memoryTopK';
      yield serializers.serialize(
        object.memoryTopK,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.memoryMinScore != null) {
      yield r'memoryMinScore';
      yield serializers.serialize(
        object.memoryMinScore,
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.memoryIntentRecall != null) {
      yield r'memoryIntentRecall';
      yield serializers.serialize(
        object.memoryIntentRecall,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.memoryQueryRewrite != null) {
      yield r'memoryQueryRewrite';
      yield serializers.serialize(
        object.memoryQueryRewrite,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.memoryRerank != null) {
      yield r'memoryRerank';
      yield serializers.serialize(
        object.memoryRerank,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.langCode != null) {
      yield r'langCode';
      yield serializers.serialize(
        object.langCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.language != null) {
      yield r'language';
      yield serializers.serialize(
        object.language,
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
    if (object.pluginMappings != null) {
      yield r'pluginMappings';
      yield serializers.serialize(
        object.pluginMappings,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto)]),
      );
    }
    if (object.contextProviders != null) {
      yield r'contextProviders';
      yield serializers.serialize(
        object.contextProviders,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto)]),
      );
    }
    if (object.knowledgeBindings != null) {
      yield r'knowledgeBindings';
      yield serializers.serialize(
        object.knowledgeBindings,
        specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesAgentRolesDtosAgentRoleUpsertDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesAgentRolesDtosAgentRoleUpsertDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.code = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'displayName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.displayName = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.status = valueDes;
          break;
        case r'icon':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.icon = valueDes;
          break;
        case r'coverImage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.coverImage = valueDes;
          break;
        case r'themeToken':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.themeToken = valueDes;
          break;
        case r'pipelineTemplateId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.pipelineTemplateId = valueDes;
          break;
        case r'asrProfileId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.asrProfileId = valueDes;
          break;
        case r'vadProfileId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.vadProfileId = valueDes;
          break;
        case r'llmProfileId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.llmProfileId = valueDes;
          break;
        case r'ttsProfileId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.ttsProfileId = valueDes;
          break;
        case r'ttsVoiceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.ttsVoiceId = valueDes;
          break;
        case r'ttsLanguage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.ttsLanguage = valueDes;
          break;
        case r'ttsVolume':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.ttsVolume = valueDes;
          break;
        case r'ttsRate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.ttsRate = valueDes;
          break;
        case r'ttsPitch':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.ttsPitch = valueDes;
          break;
        case r'chatHistoryConf':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.chatHistoryConf = valueDes;
          break;
        case r'systemPrompt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.systemPrompt = valueDes;
          break;
        case r'knowledgeNoHitFallbackText':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.knowledgeNoHitFallbackText = valueDes;
          break;
        case r'memoryEnabled':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.memoryEnabled = valueDes;
          break;
        case r'memoryModelId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.memoryModelId = valueDes;
          break;
        case r'memoryEntityScope':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.memoryEntityScope = valueDes;
          break;
        case r'memoryTopK':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.memoryTopK = valueDes;
          break;
        case r'memoryMinScore':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.memoryMinScore = valueDes;
          break;
        case r'memoryIntentRecall':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.memoryIntentRecall = valueDes;
          break;
        case r'memoryQueryRewrite':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.memoryQueryRewrite = valueDes;
          break;
        case r'memoryRerank':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.memoryRerank = valueDes;
          break;
        case r'langCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.langCode = valueDes;
          break;
        case r'language':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.language = valueDes;
          break;
        case r'sort':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.sort = valueDes;
          break;
        case r'pluginMappings':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto)]),
          ) as BuiltList<AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto>?;
          if (valueDes == null) continue;
          result.pluginMappings.replace(valueDes);
          break;
        case r'contextProviders':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto)]),
          ) as BuiltList<AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto>?;
          if (valueDes == null) continue;
          result.contextProviders.replace(valueDes);
          break;
        case r'knowledgeBindings':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto)]),
          ) as BuiltList<AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto>?;
          if (valueDes == null) continue;
          result.knowledgeBindings.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesAgentRolesDtosAgentRoleUpsertDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesAgentRolesDtosAgentRoleUpsertDtoBuilder();
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

