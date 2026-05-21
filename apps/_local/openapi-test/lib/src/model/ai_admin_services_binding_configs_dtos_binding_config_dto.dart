//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_binding_configs_dtos_binding_config_dto.g.dart';

/// AiAdminServicesBindingConfigsDtosBindingConfigDto
///
/// Properties:
/// * [id] 
/// * [code] 
/// * [name] 
/// * [description] 
/// * [status] 
/// * [providerCode] 
/// * [providerType] 
/// * [integrationId] 
/// * [isEnabled] 
/// * [isDefault] 
/// * [supportsAsr] 
/// * [supportsTts] 
/// * [supportsLlm] 
/// * [supportsMem] 
/// * [isSystem] 
/// * [invocationMode] 
/// * [sort] 
/// * [primaryEndpoint] 
/// * [primaryModel] 
/// * [dimension] 
/// * [apiKey] 
/// * [secretKey] 
/// * [appId] 
/// * [accessToken] 
/// * [organization] 
/// * [catalogAccessKey] 
/// * [catalogSecretKey] 
/// * [catalogAppId] 
/// * [graphJson] 
/// * [configJson] 
/// * [temperature] 
/// * [maxTokens] 
/// * [topP] 
/// * [encoding] 
/// * [sampleRate] 
/// * [speechRate] 
/// * [loudnessRate] 
/// * [resourceId] 
/// * [audioFormat] 
/// * [codec] 
/// * [bits] 
/// * [channels] 
/// * [chunkDurationMs] 
/// * [chunkSizeBytes] 
/// * [language] 
/// * [context] 
/// * [enableNonstream] 
/// * [createdAt] 
/// * [updatedAt] 
@BuiltValue()
abstract class AiAdminServicesBindingConfigsDtosBindingConfigDto implements Built<AiAdminServicesBindingConfigsDtosBindingConfigDto, AiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'code')
  String? get code;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'status')
  String? get status;

  @BuiltValueField(wireName: r'providerCode')
  String? get providerCode;

  @BuiltValueField(wireName: r'providerType')
  String? get providerType;

  @BuiltValueField(wireName: r'integrationId')
  String? get integrationId;

  @BuiltValueField(wireName: r'isEnabled')
  bool? get isEnabled;

  @BuiltValueField(wireName: r'isDefault')
  bool? get isDefault;

  @BuiltValueField(wireName: r'supportsAsr')
  bool? get supportsAsr;

  @BuiltValueField(wireName: r'supportsTts')
  bool? get supportsTts;

  @BuiltValueField(wireName: r'supportsLlm')
  bool? get supportsLlm;

  @BuiltValueField(wireName: r'supportsMem')
  bool? get supportsMem;

  @BuiltValueField(wireName: r'isSystem')
  bool? get isSystem;

  @BuiltValueField(wireName: r'invocationMode')
  String? get invocationMode;

  @BuiltValueField(wireName: r'sort')
  int? get sort;

  @BuiltValueField(wireName: r'primaryEndpoint')
  String? get primaryEndpoint;

  @BuiltValueField(wireName: r'primaryModel')
  String? get primaryModel;

  @BuiltValueField(wireName: r'dimension')
  int? get dimension;

  @BuiltValueField(wireName: r'apiKey')
  String? get apiKey;

  @BuiltValueField(wireName: r'secretKey')
  String? get secretKey;

  @BuiltValueField(wireName: r'appId')
  String? get appId;

  @BuiltValueField(wireName: r'accessToken')
  String? get accessToken;

  @BuiltValueField(wireName: r'organization')
  String? get organization;

  @BuiltValueField(wireName: r'catalogAccessKey')
  String? get catalogAccessKey;

  @BuiltValueField(wireName: r'catalogSecretKey')
  String? get catalogSecretKey;

  @BuiltValueField(wireName: r'catalogAppId')
  String? get catalogAppId;

  @BuiltValueField(wireName: r'graphJson')
  String? get graphJson;

  @BuiltValueField(wireName: r'configJson')
  String? get configJson;

  @BuiltValueField(wireName: r'temperature')
  double? get temperature;

  @BuiltValueField(wireName: r'maxTokens')
  int? get maxTokens;

  @BuiltValueField(wireName: r'topP')
  double? get topP;

  @BuiltValueField(wireName: r'encoding')
  String? get encoding;

  @BuiltValueField(wireName: r'sampleRate')
  int? get sampleRate;

  @BuiltValueField(wireName: r'speechRate')
  int? get speechRate;

  @BuiltValueField(wireName: r'loudnessRate')
  int? get loudnessRate;

  @BuiltValueField(wireName: r'resourceId')
  String? get resourceId;

  @BuiltValueField(wireName: r'audioFormat')
  String? get audioFormat;

  @BuiltValueField(wireName: r'codec')
  String? get codec;

  @BuiltValueField(wireName: r'bits')
  int? get bits;

  @BuiltValueField(wireName: r'channels')
  int? get channels;

  @BuiltValueField(wireName: r'chunkDurationMs')
  int? get chunkDurationMs;

  @BuiltValueField(wireName: r'chunkSizeBytes')
  int? get chunkSizeBytes;

  @BuiltValueField(wireName: r'language')
  String? get language;

  @BuiltValueField(wireName: r'context')
  String? get context;

  @BuiltValueField(wireName: r'enableNonstream')
  bool? get enableNonstream;

  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  DateTime? get updatedAt;

  AiAdminServicesBindingConfigsDtosBindingConfigDto._();

  factory AiAdminServicesBindingConfigsDtosBindingConfigDto([void updates(AiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder b)]) = _$AiAdminServicesBindingConfigsDtosBindingConfigDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesBindingConfigsDtosBindingConfigDto> get serializer => _$AiAdminServicesBindingConfigsDtosBindingConfigDtoSerializer();
}

class _$AiAdminServicesBindingConfigsDtosBindingConfigDtoSerializer implements PrimitiveSerializer<AiAdminServicesBindingConfigsDtosBindingConfigDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesBindingConfigsDtosBindingConfigDto, _$AiAdminServicesBindingConfigsDtosBindingConfigDto];

  @override
  final String wireName = r'AiAdminServicesBindingConfigsDtosBindingConfigDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesBindingConfigsDtosBindingConfigDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType.nullable(String),
      );
    }
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
    if (object.providerCode != null) {
      yield r'providerCode';
      yield serializers.serialize(
        object.providerCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.providerType != null) {
      yield r'providerType';
      yield serializers.serialize(
        object.providerType,
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
    if (object.isEnabled != null) {
      yield r'isEnabled';
      yield serializers.serialize(
        object.isEnabled,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.isDefault != null) {
      yield r'isDefault';
      yield serializers.serialize(
        object.isDefault,
        specifiedType: const FullType(bool),
      );
    }
    if (object.supportsAsr != null) {
      yield r'supportsAsr';
      yield serializers.serialize(
        object.supportsAsr,
        specifiedType: const FullType(bool),
      );
    }
    if (object.supportsTts != null) {
      yield r'supportsTts';
      yield serializers.serialize(
        object.supportsTts,
        specifiedType: const FullType(bool),
      );
    }
    if (object.supportsLlm != null) {
      yield r'supportsLlm';
      yield serializers.serialize(
        object.supportsLlm,
        specifiedType: const FullType(bool),
      );
    }
    if (object.supportsMem != null) {
      yield r'supportsMem';
      yield serializers.serialize(
        object.supportsMem,
        specifiedType: const FullType(bool),
      );
    }
    if (object.isSystem != null) {
      yield r'isSystem';
      yield serializers.serialize(
        object.isSystem,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.invocationMode != null) {
      yield r'invocationMode';
      yield serializers.serialize(
        object.invocationMode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.sort != null) {
      yield r'sort';
      yield serializers.serialize(
        object.sort,
        specifiedType: const FullType(int),
      );
    }
    if (object.primaryEndpoint != null) {
      yield r'primaryEndpoint';
      yield serializers.serialize(
        object.primaryEndpoint,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.primaryModel != null) {
      yield r'primaryModel';
      yield serializers.serialize(
        object.primaryModel,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.dimension != null) {
      yield r'dimension';
      yield serializers.serialize(
        object.dimension,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.apiKey != null) {
      yield r'apiKey';
      yield serializers.serialize(
        object.apiKey,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.secretKey != null) {
      yield r'secretKey';
      yield serializers.serialize(
        object.secretKey,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.appId != null) {
      yield r'appId';
      yield serializers.serialize(
        object.appId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.accessToken != null) {
      yield r'accessToken';
      yield serializers.serialize(
        object.accessToken,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.organization != null) {
      yield r'organization';
      yield serializers.serialize(
        object.organization,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.catalogAccessKey != null) {
      yield r'catalogAccessKey';
      yield serializers.serialize(
        object.catalogAccessKey,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.catalogSecretKey != null) {
      yield r'catalogSecretKey';
      yield serializers.serialize(
        object.catalogSecretKey,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.catalogAppId != null) {
      yield r'catalogAppId';
      yield serializers.serialize(
        object.catalogAppId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.graphJson != null) {
      yield r'graphJson';
      yield serializers.serialize(
        object.graphJson,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.configJson != null) {
      yield r'configJson';
      yield serializers.serialize(
        object.configJson,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.temperature != null) {
      yield r'temperature';
      yield serializers.serialize(
        object.temperature,
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.maxTokens != null) {
      yield r'maxTokens';
      yield serializers.serialize(
        object.maxTokens,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.topP != null) {
      yield r'topP';
      yield serializers.serialize(
        object.topP,
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.encoding != null) {
      yield r'encoding';
      yield serializers.serialize(
        object.encoding,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.sampleRate != null) {
      yield r'sampleRate';
      yield serializers.serialize(
        object.sampleRate,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.speechRate != null) {
      yield r'speechRate';
      yield serializers.serialize(
        object.speechRate,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.loudnessRate != null) {
      yield r'loudnessRate';
      yield serializers.serialize(
        object.loudnessRate,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.resourceId != null) {
      yield r'resourceId';
      yield serializers.serialize(
        object.resourceId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.audioFormat != null) {
      yield r'audioFormat';
      yield serializers.serialize(
        object.audioFormat,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.codec != null) {
      yield r'codec';
      yield serializers.serialize(
        object.codec,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.bits != null) {
      yield r'bits';
      yield serializers.serialize(
        object.bits,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.channels != null) {
      yield r'channels';
      yield serializers.serialize(
        object.channels,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.chunkDurationMs != null) {
      yield r'chunkDurationMs';
      yield serializers.serialize(
        object.chunkDurationMs,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.chunkSizeBytes != null) {
      yield r'chunkSizeBytes';
      yield serializers.serialize(
        object.chunkSizeBytes,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.language != null) {
      yield r'language';
      yield serializers.serialize(
        object.language,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.context != null) {
      yield r'context';
      yield serializers.serialize(
        object.context,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.enableNonstream != null) {
      yield r'enableNonstream';
      yield serializers.serialize(
        object.enableNonstream,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.createdAt != null) {
      yield r'createdAt';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.updatedAt != null) {
      yield r'updatedAt';
      yield serializers.serialize(
        object.updatedAt,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesBindingConfigsDtosBindingConfigDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder result,
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
        case r'providerCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.providerCode = valueDes;
          break;
        case r'providerType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.providerType = valueDes;
          break;
        case r'integrationId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.integrationId = valueDes;
          break;
        case r'isEnabled':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.isEnabled = valueDes;
          break;
        case r'isDefault':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isDefault = valueDes;
          break;
        case r'supportsAsr':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.supportsAsr = valueDes;
          break;
        case r'supportsTts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.supportsTts = valueDes;
          break;
        case r'supportsLlm':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.supportsLlm = valueDes;
          break;
        case r'supportsMem':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.supportsMem = valueDes;
          break;
        case r'isSystem':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.isSystem = valueDes;
          break;
        case r'invocationMode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.invocationMode = valueDes;
          break;
        case r'sort':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.sort = valueDes;
          break;
        case r'primaryEndpoint':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.primaryEndpoint = valueDes;
          break;
        case r'primaryModel':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.primaryModel = valueDes;
          break;
        case r'dimension':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.dimension = valueDes;
          break;
        case r'apiKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.apiKey = valueDes;
          break;
        case r'secretKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.secretKey = valueDes;
          break;
        case r'appId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.appId = valueDes;
          break;
        case r'accessToken':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.accessToken = valueDes;
          break;
        case r'organization':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.organization = valueDes;
          break;
        case r'catalogAccessKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.catalogAccessKey = valueDes;
          break;
        case r'catalogSecretKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.catalogSecretKey = valueDes;
          break;
        case r'catalogAppId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.catalogAppId = valueDes;
          break;
        case r'graphJson':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.graphJson = valueDes;
          break;
        case r'configJson':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.configJson = valueDes;
          break;
        case r'temperature':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.temperature = valueDes;
          break;
        case r'maxTokens':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.maxTokens = valueDes;
          break;
        case r'topP':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.topP = valueDes;
          break;
        case r'encoding':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.encoding = valueDes;
          break;
        case r'sampleRate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.sampleRate = valueDes;
          break;
        case r'speechRate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.speechRate = valueDes;
          break;
        case r'loudnessRate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.loudnessRate = valueDes;
          break;
        case r'resourceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.resourceId = valueDes;
          break;
        case r'audioFormat':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.audioFormat = valueDes;
          break;
        case r'codec':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.codec = valueDes;
          break;
        case r'bits':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.bits = valueDes;
          break;
        case r'channels':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.channels = valueDes;
          break;
        case r'chunkDurationMs':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.chunkDurationMs = valueDes;
          break;
        case r'chunkSizeBytes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.chunkSizeBytes = valueDes;
          break;
        case r'language':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.language = valueDes;
          break;
        case r'context':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.context = valueDes;
          break;
        case r'enableNonstream':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.enableNonstream = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.createdAt = valueDes;
          break;
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.updatedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesBindingConfigsDtosBindingConfigDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesBindingConfigsDtosBindingConfigDtoBuilder();
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

