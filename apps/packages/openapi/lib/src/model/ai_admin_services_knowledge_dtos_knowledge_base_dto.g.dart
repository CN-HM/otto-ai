// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_knowledge_dtos_knowledge_base_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesKnowledgeDtosKnowledgeBaseDto
    extends AiAdminServicesKnowledgeDtosKnowledgeBaseDto {
  @override
  final String? id;
  @override
  final String? datasetId;
  @override
  final String? name;
  @override
  final String? avatar;
  @override
  final String? description;
  @override
  final String? permission;
  @override
  final String? chunkMethod;
  @override
  final String? parserConfig;
  @override
  final int? chunkCount;
  @override
  final int? tokenNum;
  @override
  final int? status;
  @override
  final int? creator;
  @override
  final String? createdAt;
  @override
  final int? updater;
  @override
  final String? updatedAt;
  @override
  final int? documentCount;

  factory _$AiAdminServicesKnowledgeDtosKnowledgeBaseDto(
          [void Function(AiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder)?
              updates]) =>
      (AiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesKnowledgeDtosKnowledgeBaseDto._(
      {this.id,
      this.datasetId,
      this.name,
      this.avatar,
      this.description,
      this.permission,
      this.chunkMethod,
      this.parserConfig,
      this.chunkCount,
      this.tokenNum,
      this.status,
      this.creator,
      this.createdAt,
      this.updater,
      this.updatedAt,
      this.documentCount})
      : super._();
  @override
  AiAdminServicesKnowledgeDtosKnowledgeBaseDto rebuild(
          void Function(AiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder toBuilder() =>
      AiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesKnowledgeDtosKnowledgeBaseDto &&
        id == other.id &&
        datasetId == other.datasetId &&
        name == other.name &&
        avatar == other.avatar &&
        description == other.description &&
        permission == other.permission &&
        chunkMethod == other.chunkMethod &&
        parserConfig == other.parserConfig &&
        chunkCount == other.chunkCount &&
        tokenNum == other.tokenNum &&
        status == other.status &&
        creator == other.creator &&
        createdAt == other.createdAt &&
        updater == other.updater &&
        updatedAt == other.updatedAt &&
        documentCount == other.documentCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, datasetId.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, avatar.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, permission.hashCode);
    _$hash = $jc(_$hash, chunkMethod.hashCode);
    _$hash = $jc(_$hash, parserConfig.hashCode);
    _$hash = $jc(_$hash, chunkCount.hashCode);
    _$hash = $jc(_$hash, tokenNum.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, creator.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updater.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, documentCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesKnowledgeDtosKnowledgeBaseDto')
          ..add('id', id)
          ..add('datasetId', datasetId)
          ..add('name', name)
          ..add('avatar', avatar)
          ..add('description', description)
          ..add('permission', permission)
          ..add('chunkMethod', chunkMethod)
          ..add('parserConfig', parserConfig)
          ..add('chunkCount', chunkCount)
          ..add('tokenNum', tokenNum)
          ..add('status', status)
          ..add('creator', creator)
          ..add('createdAt', createdAt)
          ..add('updater', updater)
          ..add('updatedAt', updatedAt)
          ..add('documentCount', documentCount))
        .toString();
  }
}

class AiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder
    implements
        Builder<AiAdminServicesKnowledgeDtosKnowledgeBaseDto,
            AiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder> {
  _$AiAdminServicesKnowledgeDtosKnowledgeBaseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _datasetId;
  String? get datasetId => _$this._datasetId;
  set datasetId(String? datasetId) => _$this._datasetId = datasetId;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _permission;
  String? get permission => _$this._permission;
  set permission(String? permission) => _$this._permission = permission;

  String? _chunkMethod;
  String? get chunkMethod => _$this._chunkMethod;
  set chunkMethod(String? chunkMethod) => _$this._chunkMethod = chunkMethod;

  String? _parserConfig;
  String? get parserConfig => _$this._parserConfig;
  set parserConfig(String? parserConfig) => _$this._parserConfig = parserConfig;

  int? _chunkCount;
  int? get chunkCount => _$this._chunkCount;
  set chunkCount(int? chunkCount) => _$this._chunkCount = chunkCount;

  int? _tokenNum;
  int? get tokenNum => _$this._tokenNum;
  set tokenNum(int? tokenNum) => _$this._tokenNum = tokenNum;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

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

  int? _documentCount;
  int? get documentCount => _$this._documentCount;
  set documentCount(int? documentCount) =>
      _$this._documentCount = documentCount;

  AiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder() {
    AiAdminServicesKnowledgeDtosKnowledgeBaseDto._defaults(this);
  }

  AiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _datasetId = $v.datasetId;
      _name = $v.name;
      _avatar = $v.avatar;
      _description = $v.description;
      _permission = $v.permission;
      _chunkMethod = $v.chunkMethod;
      _parserConfig = $v.parserConfig;
      _chunkCount = $v.chunkCount;
      _tokenNum = $v.tokenNum;
      _status = $v.status;
      _creator = $v.creator;
      _createdAt = $v.createdAt;
      _updater = $v.updater;
      _updatedAt = $v.updatedAt;
      _documentCount = $v.documentCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesKnowledgeDtosKnowledgeBaseDto other) {
    _$v = other as _$AiAdminServicesKnowledgeDtosKnowledgeBaseDto;
  }

  @override
  void update(
      void Function(AiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesKnowledgeDtosKnowledgeBaseDto build() => _build();

  _$AiAdminServicesKnowledgeDtosKnowledgeBaseDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesKnowledgeDtosKnowledgeBaseDto._(
          id: id,
          datasetId: datasetId,
          name: name,
          avatar: avatar,
          description: description,
          permission: permission,
          chunkMethod: chunkMethod,
          parserConfig: parserConfig,
          chunkCount: chunkCount,
          tokenNum: tokenNum,
          status: status,
          creator: creator,
          createdAt: createdAt,
          updater: updater,
          updatedAt: updatedAt,
          documentCount: documentCount,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
