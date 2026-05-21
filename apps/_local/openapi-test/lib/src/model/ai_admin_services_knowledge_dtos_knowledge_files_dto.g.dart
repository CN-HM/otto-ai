// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_knowledge_dtos_knowledge_files_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesKnowledgeDtosKnowledgeFilesDto
    extends AiAdminServicesKnowledgeDtosKnowledgeFilesDto {
  @override
  final String? id;
  @override
  final String? documentId;
  @override
  final String? datasetId;
  @override
  final String? name;
  @override
  final String? fileType;
  @override
  final int? fileSize;
  @override
  final String? filePath;
  @override
  final double? progress;
  @override
  final String? sourceType;
  @override
  final String? chunkMethod;
  @override
  final JsonObject? parserConfig;
  @override
  final String? status;
  @override
  final String? run;
  @override
  final int? creator;
  @override
  final String? createdAt;
  @override
  final int? updater;
  @override
  final String? updatedAt;
  @override
  final int? chunkCount;
  @override
  final int? tokenCount;
  @override
  final String? error;

  factory _$AiAdminServicesKnowledgeDtosKnowledgeFilesDto(
          [void Function(AiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder)?
              updates]) =>
      (AiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesKnowledgeDtosKnowledgeFilesDto._(
      {this.id,
      this.documentId,
      this.datasetId,
      this.name,
      this.fileType,
      this.fileSize,
      this.filePath,
      this.progress,
      this.sourceType,
      this.chunkMethod,
      this.parserConfig,
      this.status,
      this.run,
      this.creator,
      this.createdAt,
      this.updater,
      this.updatedAt,
      this.chunkCount,
      this.tokenCount,
      this.error})
      : super._();
  @override
  AiAdminServicesKnowledgeDtosKnowledgeFilesDto rebuild(
          void Function(AiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder toBuilder() =>
      AiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesKnowledgeDtosKnowledgeFilesDto &&
        id == other.id &&
        documentId == other.documentId &&
        datasetId == other.datasetId &&
        name == other.name &&
        fileType == other.fileType &&
        fileSize == other.fileSize &&
        filePath == other.filePath &&
        progress == other.progress &&
        sourceType == other.sourceType &&
        chunkMethod == other.chunkMethod &&
        parserConfig == other.parserConfig &&
        status == other.status &&
        run == other.run &&
        creator == other.creator &&
        createdAt == other.createdAt &&
        updater == other.updater &&
        updatedAt == other.updatedAt &&
        chunkCount == other.chunkCount &&
        tokenCount == other.tokenCount &&
        error == other.error;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, documentId.hashCode);
    _$hash = $jc(_$hash, datasetId.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, fileType.hashCode);
    _$hash = $jc(_$hash, fileSize.hashCode);
    _$hash = $jc(_$hash, filePath.hashCode);
    _$hash = $jc(_$hash, progress.hashCode);
    _$hash = $jc(_$hash, sourceType.hashCode);
    _$hash = $jc(_$hash, chunkMethod.hashCode);
    _$hash = $jc(_$hash, parserConfig.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, run.hashCode);
    _$hash = $jc(_$hash, creator.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updater.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, chunkCount.hashCode);
    _$hash = $jc(_$hash, tokenCount.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesKnowledgeDtosKnowledgeFilesDto')
          ..add('id', id)
          ..add('documentId', documentId)
          ..add('datasetId', datasetId)
          ..add('name', name)
          ..add('fileType', fileType)
          ..add('fileSize', fileSize)
          ..add('filePath', filePath)
          ..add('progress', progress)
          ..add('sourceType', sourceType)
          ..add('chunkMethod', chunkMethod)
          ..add('parserConfig', parserConfig)
          ..add('status', status)
          ..add('run', run)
          ..add('creator', creator)
          ..add('createdAt', createdAt)
          ..add('updater', updater)
          ..add('updatedAt', updatedAt)
          ..add('chunkCount', chunkCount)
          ..add('tokenCount', tokenCount)
          ..add('error', error))
        .toString();
  }
}

class AiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder
    implements
        Builder<AiAdminServicesKnowledgeDtosKnowledgeFilesDto,
            AiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder> {
  _$AiAdminServicesKnowledgeDtosKnowledgeFilesDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _documentId;
  String? get documentId => _$this._documentId;
  set documentId(String? documentId) => _$this._documentId = documentId;

  String? _datasetId;
  String? get datasetId => _$this._datasetId;
  set datasetId(String? datasetId) => _$this._datasetId = datasetId;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _fileType;
  String? get fileType => _$this._fileType;
  set fileType(String? fileType) => _$this._fileType = fileType;

  int? _fileSize;
  int? get fileSize => _$this._fileSize;
  set fileSize(int? fileSize) => _$this._fileSize = fileSize;

  String? _filePath;
  String? get filePath => _$this._filePath;
  set filePath(String? filePath) => _$this._filePath = filePath;

  double? _progress;
  double? get progress => _$this._progress;
  set progress(double? progress) => _$this._progress = progress;

  String? _sourceType;
  String? get sourceType => _$this._sourceType;
  set sourceType(String? sourceType) => _$this._sourceType = sourceType;

  String? _chunkMethod;
  String? get chunkMethod => _$this._chunkMethod;
  set chunkMethod(String? chunkMethod) => _$this._chunkMethod = chunkMethod;

  JsonObject? _parserConfig;
  JsonObject? get parserConfig => _$this._parserConfig;
  set parserConfig(JsonObject? parserConfig) =>
      _$this._parserConfig = parserConfig;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _run;
  String? get run => _$this._run;
  set run(String? run) => _$this._run = run;

  int? _creator;
  int? get creator => _$this._creator;
  set creator(int? creator) => _$this._creator = creator;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  int? _updater;
  int? get updater => _$this._updater;
  set updater(int? updater) => _$this._updater = updater;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  int? _chunkCount;
  int? get chunkCount => _$this._chunkCount;
  set chunkCount(int? chunkCount) => _$this._chunkCount = chunkCount;

  int? _tokenCount;
  int? get tokenCount => _$this._tokenCount;
  set tokenCount(int? tokenCount) => _$this._tokenCount = tokenCount;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  AiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder() {
    AiAdminServicesKnowledgeDtosKnowledgeFilesDto._defaults(this);
  }

  AiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _documentId = $v.documentId;
      _datasetId = $v.datasetId;
      _name = $v.name;
      _fileType = $v.fileType;
      _fileSize = $v.fileSize;
      _filePath = $v.filePath;
      _progress = $v.progress;
      _sourceType = $v.sourceType;
      _chunkMethod = $v.chunkMethod;
      _parserConfig = $v.parserConfig;
      _status = $v.status;
      _run = $v.run;
      _creator = $v.creator;
      _createdAt = $v.createdAt;
      _updater = $v.updater;
      _updatedAt = $v.updatedAt;
      _chunkCount = $v.chunkCount;
      _tokenCount = $v.tokenCount;
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesKnowledgeDtosKnowledgeFilesDto other) {
    _$v = other as _$AiAdminServicesKnowledgeDtosKnowledgeFilesDto;
  }

  @override
  void update(
      void Function(AiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesKnowledgeDtosKnowledgeFilesDto build() => _build();

  _$AiAdminServicesKnowledgeDtosKnowledgeFilesDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesKnowledgeDtosKnowledgeFilesDto._(
          id: id,
          documentId: documentId,
          datasetId: datasetId,
          name: name,
          fileType: fileType,
          fileSize: fileSize,
          filePath: filePath,
          progress: progress,
          sourceType: sourceType,
          chunkMethod: chunkMethod,
          parserConfig: parserConfig,
          status: status,
          run: run,
          creator: creator,
          createdAt: createdAt,
          updater: updater,
          updatedAt: updatedAt,
          chunkCount: chunkCount,
          tokenCount: tokenCount,
          error: error,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
