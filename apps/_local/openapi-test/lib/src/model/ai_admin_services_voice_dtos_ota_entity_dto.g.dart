// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_voice_dtos_ota_entity_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesVoiceDtosOtaEntityDto
    extends AiAdminServicesVoiceDtosOtaEntityDto {
  @override
  final String? id;
  @override
  final String? firmwareName;
  @override
  final String? type;
  @override
  final String? version;
  @override
  final int? size;
  @override
  final String? remark;
  @override
  final String? firmwarePath;
  @override
  final int? sort;
  @override
  final int? creator;
  @override
  final String? createDate;
  @override
  final int? updater;
  @override
  final String? updateDate;

  factory _$AiAdminServicesVoiceDtosOtaEntityDto(
          [void Function(AiAdminServicesVoiceDtosOtaEntityDtoBuilder)?
              updates]) =>
      (AiAdminServicesVoiceDtosOtaEntityDtoBuilder()..update(updates))._build();

  _$AiAdminServicesVoiceDtosOtaEntityDto._(
      {this.id,
      this.firmwareName,
      this.type,
      this.version,
      this.size,
      this.remark,
      this.firmwarePath,
      this.sort,
      this.creator,
      this.createDate,
      this.updater,
      this.updateDate})
      : super._();
  @override
  AiAdminServicesVoiceDtosOtaEntityDto rebuild(
          void Function(AiAdminServicesVoiceDtosOtaEntityDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesVoiceDtosOtaEntityDtoBuilder toBuilder() =>
      AiAdminServicesVoiceDtosOtaEntityDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesVoiceDtosOtaEntityDto &&
        id == other.id &&
        firmwareName == other.firmwareName &&
        type == other.type &&
        version == other.version &&
        size == other.size &&
        remark == other.remark &&
        firmwarePath == other.firmwarePath &&
        sort == other.sort &&
        creator == other.creator &&
        createDate == other.createDate &&
        updater == other.updater &&
        updateDate == other.updateDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, firmwareName.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, size.hashCode);
    _$hash = $jc(_$hash, remark.hashCode);
    _$hash = $jc(_$hash, firmwarePath.hashCode);
    _$hash = $jc(_$hash, sort.hashCode);
    _$hash = $jc(_$hash, creator.hashCode);
    _$hash = $jc(_$hash, createDate.hashCode);
    _$hash = $jc(_$hash, updater.hashCode);
    _$hash = $jc(_$hash, updateDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AiAdminServicesVoiceDtosOtaEntityDto')
          ..add('id', id)
          ..add('firmwareName', firmwareName)
          ..add('type', type)
          ..add('version', version)
          ..add('size', size)
          ..add('remark', remark)
          ..add('firmwarePath', firmwarePath)
          ..add('sort', sort)
          ..add('creator', creator)
          ..add('createDate', createDate)
          ..add('updater', updater)
          ..add('updateDate', updateDate))
        .toString();
  }
}

class AiAdminServicesVoiceDtosOtaEntityDtoBuilder
    implements
        Builder<AiAdminServicesVoiceDtosOtaEntityDto,
            AiAdminServicesVoiceDtosOtaEntityDtoBuilder> {
  _$AiAdminServicesVoiceDtosOtaEntityDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _firmwareName;
  String? get firmwareName => _$this._firmwareName;
  set firmwareName(String? firmwareName) => _$this._firmwareName = firmwareName;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _version;
  String? get version => _$this._version;
  set version(String? version) => _$this._version = version;

  int? _size;
  int? get size => _$this._size;
  set size(int? size) => _$this._size = size;

  String? _remark;
  String? get remark => _$this._remark;
  set remark(String? remark) => _$this._remark = remark;

  String? _firmwarePath;
  String? get firmwarePath => _$this._firmwarePath;
  set firmwarePath(String? firmwarePath) => _$this._firmwarePath = firmwarePath;

  int? _sort;
  int? get sort => _$this._sort;
  set sort(int? sort) => _$this._sort = sort;

  int? _creator;
  int? get creator => _$this._creator;
  set creator(int? creator) => _$this._creator = creator;

  String? _createDate;
  String? get createDate => _$this._createDate;
  set createDate(String? createDate) => _$this._createDate = createDate;

  int? _updater;
  int? get updater => _$this._updater;
  set updater(int? updater) => _$this._updater = updater;

  String? _updateDate;
  String? get updateDate => _$this._updateDate;
  set updateDate(String? updateDate) => _$this._updateDate = updateDate;

  AiAdminServicesVoiceDtosOtaEntityDtoBuilder() {
    AiAdminServicesVoiceDtosOtaEntityDto._defaults(this);
  }

  AiAdminServicesVoiceDtosOtaEntityDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _firmwareName = $v.firmwareName;
      _type = $v.type;
      _version = $v.version;
      _size = $v.size;
      _remark = $v.remark;
      _firmwarePath = $v.firmwarePath;
      _sort = $v.sort;
      _creator = $v.creator;
      _createDate = $v.createDate;
      _updater = $v.updater;
      _updateDate = $v.updateDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesVoiceDtosOtaEntityDto other) {
    _$v = other as _$AiAdminServicesVoiceDtosOtaEntityDto;
  }

  @override
  void update(
      void Function(AiAdminServicesVoiceDtosOtaEntityDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesVoiceDtosOtaEntityDto build() => _build();

  _$AiAdminServicesVoiceDtosOtaEntityDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesVoiceDtosOtaEntityDto._(
          id: id,
          firmwareName: firmwareName,
          type: type,
          version: version,
          size: size,
          remark: remark,
          firmwarePath: firmwarePath,
          sort: sort,
          creator: creator,
          createDate: createDate,
          updater: updater,
          updateDate: updateDate,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
