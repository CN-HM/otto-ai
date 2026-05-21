//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_knowledge_dtos_knowledge_files_dto.g.dart';

/// AiAdminServicesKnowledgeDtosKnowledgeFilesDto
///
/// Properties:
/// * [id] 
/// * [documentId] 
/// * [datasetId] 
/// * [name] 
/// * [fileType] 
/// * [fileSize] 
/// * [filePath] 
/// * [progress] 
/// * [sourceType] 
/// * [chunkMethod] 
/// * [parserConfig] 
/// * [status] 
/// * [run] 
/// * [creator] 
/// * [createdAt] 
/// * [updater] 
/// * [updatedAt] 
/// * [chunkCount] 
/// * [tokenCount] 
/// * [error] 
@BuiltValue()
abstract class AiAdminServicesKnowledgeDtosKnowledgeFilesDto implements Built<AiAdminServicesKnowledgeDtosKnowledgeFilesDto, AiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'documentId')
  String? get documentId;

  @BuiltValueField(wireName: r'datasetId')
  String? get datasetId;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'fileType')
  String? get fileType;

  @BuiltValueField(wireName: r'fileSize')
  int? get fileSize;

  @BuiltValueField(wireName: r'filePath')
  String? get filePath;

  @BuiltValueField(wireName: r'progress')
  double? get progress;

  @BuiltValueField(wireName: r'sourceType')
  String? get sourceType;

  @BuiltValueField(wireName: r'chunkMethod')
  String? get chunkMethod;

  @BuiltValueField(wireName: r'parserConfig')
  JsonObject? get parserConfig;

  @BuiltValueField(wireName: r'status')
  String? get status;

  @BuiltValueField(wireName: r'run')
  String? get run;

  @BuiltValueField(wireName: r'creator')
  int? get creator;

  @BuiltValueField(wireName: r'createdAt')
  String? get createdAt;

  @BuiltValueField(wireName: r'updater')
  int? get updater;

  @BuiltValueField(wireName: r'updatedAt')
  String? get updatedAt;

  @BuiltValueField(wireName: r'chunkCount')
  int? get chunkCount;

  @BuiltValueField(wireName: r'tokenCount')
  int? get tokenCount;

  @BuiltValueField(wireName: r'error')
  String? get error;

  AiAdminServicesKnowledgeDtosKnowledgeFilesDto._();

  factory AiAdminServicesKnowledgeDtosKnowledgeFilesDto([void updates(AiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder b)]) = _$AiAdminServicesKnowledgeDtosKnowledgeFilesDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesKnowledgeDtosKnowledgeFilesDto> get serializer => _$AiAdminServicesKnowledgeDtosKnowledgeFilesDtoSerializer();
}

class _$AiAdminServicesKnowledgeDtosKnowledgeFilesDtoSerializer implements PrimitiveSerializer<AiAdminServicesKnowledgeDtosKnowledgeFilesDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesKnowledgeDtosKnowledgeFilesDto, _$AiAdminServicesKnowledgeDtosKnowledgeFilesDto];

  @override
  final String wireName = r'AiAdminServicesKnowledgeDtosKnowledgeFilesDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesKnowledgeDtosKnowledgeFilesDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.documentId != null) {
      yield r'documentId';
      yield serializers.serialize(
        object.documentId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.datasetId != null) {
      yield r'datasetId';
      yield serializers.serialize(
        object.datasetId,
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
    if (object.fileType != null) {
      yield r'fileType';
      yield serializers.serialize(
        object.fileType,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.fileSize != null) {
      yield r'fileSize';
      yield serializers.serialize(
        object.fileSize,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.filePath != null) {
      yield r'filePath';
      yield serializers.serialize(
        object.filePath,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.progress != null) {
      yield r'progress';
      yield serializers.serialize(
        object.progress,
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.sourceType != null) {
      yield r'sourceType';
      yield serializers.serialize(
        object.sourceType,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.chunkMethod != null) {
      yield r'chunkMethod';
      yield serializers.serialize(
        object.chunkMethod,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.parserConfig != null) {
      yield r'parserConfig';
      yield serializers.serialize(
        object.parserConfig,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.run != null) {
      yield r'run';
      yield serializers.serialize(
        object.run,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.creator != null) {
      yield r'creator';
      yield serializers.serialize(
        object.creator,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.createdAt != null) {
      yield r'createdAt';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.updater != null) {
      yield r'updater';
      yield serializers.serialize(
        object.updater,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.updatedAt != null) {
      yield r'updatedAt';
      yield serializers.serialize(
        object.updatedAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.chunkCount != null) {
      yield r'chunkCount';
      yield serializers.serialize(
        object.chunkCount,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.tokenCount != null) {
      yield r'tokenCount';
      yield serializers.serialize(
        object.tokenCount,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.error != null) {
      yield r'error';
      yield serializers.serialize(
        object.error,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesKnowledgeDtosKnowledgeFilesDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder result,
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
        case r'documentId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.documentId = valueDes;
          break;
        case r'datasetId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.datasetId = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'fileType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.fileType = valueDes;
          break;
        case r'fileSize':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.fileSize = valueDes;
          break;
        case r'filePath':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.filePath = valueDes;
          break;
        case r'progress':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.progress = valueDes;
          break;
        case r'sourceType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sourceType = valueDes;
          break;
        case r'chunkMethod':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.chunkMethod = valueDes;
          break;
        case r'parserConfig':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.parserConfig = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.status = valueDes;
          break;
        case r'run':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.run = valueDes;
          break;
        case r'creator':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.creator = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.createdAt = valueDes;
          break;
        case r'updater':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.updater = valueDes;
          break;
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.updatedAt = valueDes;
          break;
        case r'chunkCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.chunkCount = valueDes;
          break;
        case r'tokenCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.tokenCount = valueDes;
          break;
        case r'error':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.error = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesKnowledgeDtosKnowledgeFilesDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder();
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

