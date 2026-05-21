// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_knowledge_dtos_batch_id_req_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesKnowledgeDtosBatchIdReqDto
    extends AiAdminServicesKnowledgeDtosBatchIdReqDto {
  @override
  final BuiltList<String>? ids;

  factory _$AiAdminServicesKnowledgeDtosBatchIdReqDto(
          [void Function(AiAdminServicesKnowledgeDtosBatchIdReqDtoBuilder)?
              updates]) =>
      (AiAdminServicesKnowledgeDtosBatchIdReqDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesKnowledgeDtosBatchIdReqDto._({this.ids}) : super._();
  @override
  AiAdminServicesKnowledgeDtosBatchIdReqDto rebuild(
          void Function(AiAdminServicesKnowledgeDtosBatchIdReqDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesKnowledgeDtosBatchIdReqDtoBuilder toBuilder() =>
      AiAdminServicesKnowledgeDtosBatchIdReqDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesKnowledgeDtosBatchIdReqDto &&
        ids == other.ids;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ids.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesKnowledgeDtosBatchIdReqDto')
          ..add('ids', ids))
        .toString();
  }
}

class AiAdminServicesKnowledgeDtosBatchIdReqDtoBuilder
    implements
        Builder<AiAdminServicesKnowledgeDtosBatchIdReqDto,
            AiAdminServicesKnowledgeDtosBatchIdReqDtoBuilder> {
  _$AiAdminServicesKnowledgeDtosBatchIdReqDto? _$v;

  ListBuilder<String>? _ids;
  ListBuilder<String> get ids => _$this._ids ??= ListBuilder<String>();
  set ids(ListBuilder<String>? ids) => _$this._ids = ids;

  AiAdminServicesKnowledgeDtosBatchIdReqDtoBuilder() {
    AiAdminServicesKnowledgeDtosBatchIdReqDto._defaults(this);
  }

  AiAdminServicesKnowledgeDtosBatchIdReqDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ids = $v.ids?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesKnowledgeDtosBatchIdReqDto other) {
    _$v = other as _$AiAdminServicesKnowledgeDtosBatchIdReqDto;
  }

  @override
  void update(
      void Function(AiAdminServicesKnowledgeDtosBatchIdReqDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesKnowledgeDtosBatchIdReqDto build() => _build();

  _$AiAdminServicesKnowledgeDtosBatchIdReqDto _build() {
    _$AiAdminServicesKnowledgeDtosBatchIdReqDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesKnowledgeDtosBatchIdReqDto._(
            ids: _ids?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ids';
        _ids?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesKnowledgeDtosBatchIdReqDto',
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
