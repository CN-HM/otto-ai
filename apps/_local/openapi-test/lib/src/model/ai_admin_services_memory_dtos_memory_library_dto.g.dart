// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_memory_dtos_memory_library_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesMemoryDtosMemoryLibraryDto
    extends AiAdminServicesMemoryDtosMemoryLibraryDto {
  @override
  final String? id;
  @override
  final int? userId;
  @override
  final String? agentId;
  @override
  final String? code;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final int? status;
  @override
  final int? isDefault;
  @override
  final String? entityScope;
  @override
  final String? memoryModelId;
  @override
  final AiAdminServicesMemoryDtosMemoryRetrievalConfigDto? retrievalConfig;
  @override
  final AiAdminServicesMemoryDtosMemoryWriteConfigDto? writeConfig;
  @override
  final int? sort;
  @override
  final int? creator;
  @override
  final String? createdAt;
  @override
  final int? updater;
  @override
  final String? updatedAt;

  factory _$AiAdminServicesMemoryDtosMemoryLibraryDto(
          [void Function(AiAdminServicesMemoryDtosMemoryLibraryDtoBuilder)?
              updates]) =>
      (AiAdminServicesMemoryDtosMemoryLibraryDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesMemoryDtosMemoryLibraryDto._(
      {this.id,
      this.userId,
      this.agentId,
      this.code,
      this.name,
      this.description,
      this.status,
      this.isDefault,
      this.entityScope,
      this.memoryModelId,
      this.retrievalConfig,
      this.writeConfig,
      this.sort,
      this.creator,
      this.createdAt,
      this.updater,
      this.updatedAt})
      : super._();
  @override
  AiAdminServicesMemoryDtosMemoryLibraryDto rebuild(
          void Function(AiAdminServicesMemoryDtosMemoryLibraryDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesMemoryDtosMemoryLibraryDtoBuilder toBuilder() =>
      AiAdminServicesMemoryDtosMemoryLibraryDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesMemoryDtosMemoryLibraryDto &&
        id == other.id &&
        userId == other.userId &&
        agentId == other.agentId &&
        code == other.code &&
        name == other.name &&
        description == other.description &&
        status == other.status &&
        isDefault == other.isDefault &&
        entityScope == other.entityScope &&
        memoryModelId == other.memoryModelId &&
        retrievalConfig == other.retrievalConfig &&
        writeConfig == other.writeConfig &&
        sort == other.sort &&
        creator == other.creator &&
        createdAt == other.createdAt &&
        updater == other.updater &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, agentId.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, isDefault.hashCode);
    _$hash = $jc(_$hash, entityScope.hashCode);
    _$hash = $jc(_$hash, memoryModelId.hashCode);
    _$hash = $jc(_$hash, retrievalConfig.hashCode);
    _$hash = $jc(_$hash, writeConfig.hashCode);
    _$hash = $jc(_$hash, sort.hashCode);
    _$hash = $jc(_$hash, creator.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updater.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesMemoryDtosMemoryLibraryDto')
          ..add('id', id)
          ..add('userId', userId)
          ..add('agentId', agentId)
          ..add('code', code)
          ..add('name', name)
          ..add('description', description)
          ..add('status', status)
          ..add('isDefault', isDefault)
          ..add('entityScope', entityScope)
          ..add('memoryModelId', memoryModelId)
          ..add('retrievalConfig', retrievalConfig)
          ..add('writeConfig', writeConfig)
          ..add('sort', sort)
          ..add('creator', creator)
          ..add('createdAt', createdAt)
          ..add('updater', updater)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class AiAdminServicesMemoryDtosMemoryLibraryDtoBuilder
    implements
        Builder<AiAdminServicesMemoryDtosMemoryLibraryDto,
            AiAdminServicesMemoryDtosMemoryLibraryDtoBuilder> {
  _$AiAdminServicesMemoryDtosMemoryLibraryDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  String? _agentId;
  String? get agentId => _$this._agentId;
  set agentId(String? agentId) => _$this._agentId = agentId;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  int? _isDefault;
  int? get isDefault => _$this._isDefault;
  set isDefault(int? isDefault) => _$this._isDefault = isDefault;

  String? _entityScope;
  String? get entityScope => _$this._entityScope;
  set entityScope(String? entityScope) => _$this._entityScope = entityScope;

  String? _memoryModelId;
  String? get memoryModelId => _$this._memoryModelId;
  set memoryModelId(String? memoryModelId) =>
      _$this._memoryModelId = memoryModelId;

  AiAdminServicesMemoryDtosMemoryRetrievalConfigDtoBuilder? _retrievalConfig;
  AiAdminServicesMemoryDtosMemoryRetrievalConfigDtoBuilder
      get retrievalConfig => _$this._retrievalConfig ??=
          AiAdminServicesMemoryDtosMemoryRetrievalConfigDtoBuilder();
  set retrievalConfig(
          AiAdminServicesMemoryDtosMemoryRetrievalConfigDtoBuilder?
              retrievalConfig) =>
      _$this._retrievalConfig = retrievalConfig;

  AiAdminServicesMemoryDtosMemoryWriteConfigDtoBuilder? _writeConfig;
  AiAdminServicesMemoryDtosMemoryWriteConfigDtoBuilder get writeConfig =>
      _$this._writeConfig ??=
          AiAdminServicesMemoryDtosMemoryWriteConfigDtoBuilder();
  set writeConfig(
          AiAdminServicesMemoryDtosMemoryWriteConfigDtoBuilder? writeConfig) =>
      _$this._writeConfig = writeConfig;

  int? _sort;
  int? get sort => _$this._sort;
  set sort(int? sort) => _$this._sort = sort;

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

  AiAdminServicesMemoryDtosMemoryLibraryDtoBuilder() {
    AiAdminServicesMemoryDtosMemoryLibraryDto._defaults(this);
  }

  AiAdminServicesMemoryDtosMemoryLibraryDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _userId = $v.userId;
      _agentId = $v.agentId;
      _code = $v.code;
      _name = $v.name;
      _description = $v.description;
      _status = $v.status;
      _isDefault = $v.isDefault;
      _entityScope = $v.entityScope;
      _memoryModelId = $v.memoryModelId;
      _retrievalConfig = $v.retrievalConfig?.toBuilder();
      _writeConfig = $v.writeConfig?.toBuilder();
      _sort = $v.sort;
      _creator = $v.creator;
      _createdAt = $v.createdAt;
      _updater = $v.updater;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesMemoryDtosMemoryLibraryDto other) {
    _$v = other as _$AiAdminServicesMemoryDtosMemoryLibraryDto;
  }

  @override
  void update(
      void Function(AiAdminServicesMemoryDtosMemoryLibraryDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesMemoryDtosMemoryLibraryDto build() => _build();

  _$AiAdminServicesMemoryDtosMemoryLibraryDto _build() {
    _$AiAdminServicesMemoryDtosMemoryLibraryDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesMemoryDtosMemoryLibraryDto._(
            id: id,
            userId: userId,
            agentId: agentId,
            code: code,
            name: name,
            description: description,
            status: status,
            isDefault: isDefault,
            entityScope: entityScope,
            memoryModelId: memoryModelId,
            retrievalConfig: _retrievalConfig?.build(),
            writeConfig: _writeConfig?.build(),
            sort: sort,
            creator: creator,
            createdAt: createdAt,
            updater: updater,
            updatedAt: updatedAt,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'retrievalConfig';
        _retrievalConfig?.build();
        _$failedField = 'writeConfig';
        _writeConfig?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesMemoryDtosMemoryLibraryDto',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
