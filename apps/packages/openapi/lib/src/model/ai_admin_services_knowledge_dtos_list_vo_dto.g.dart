// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_knowledge_dtos_list_vo_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesKnowledgeDtosListVoDto
    extends AiAdminServicesKnowledgeDtosListVoDto {
  @override
  final BuiltList<JsonObject?>? chunks;
  @override
  final int? total;

  factory _$AiAdminServicesKnowledgeDtosListVoDto(
          [void Function(AiAdminServicesKnowledgeDtosListVoDtoBuilder)?
              updates]) =>
      (AiAdminServicesKnowledgeDtosListVoDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesKnowledgeDtosListVoDto._({this.chunks, this.total})
      : super._();
  @override
  AiAdminServicesKnowledgeDtosListVoDto rebuild(
          void Function(AiAdminServicesKnowledgeDtosListVoDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesKnowledgeDtosListVoDtoBuilder toBuilder() =>
      AiAdminServicesKnowledgeDtosListVoDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesKnowledgeDtosListVoDto &&
        chunks == other.chunks &&
        total == other.total;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, chunks.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesKnowledgeDtosListVoDto')
          ..add('chunks', chunks)
          ..add('total', total))
        .toString();
  }
}

class AiAdminServicesKnowledgeDtosListVoDtoBuilder
    implements
        Builder<AiAdminServicesKnowledgeDtosListVoDto,
            AiAdminServicesKnowledgeDtosListVoDtoBuilder> {
  _$AiAdminServicesKnowledgeDtosListVoDto? _$v;

  ListBuilder<JsonObject?>? _chunks;
  ListBuilder<JsonObject?> get chunks =>
      _$this._chunks ??= ListBuilder<JsonObject?>();
  set chunks(ListBuilder<JsonObject?>? chunks) => _$this._chunks = chunks;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  AiAdminServicesKnowledgeDtosListVoDtoBuilder() {
    AiAdminServicesKnowledgeDtosListVoDto._defaults(this);
  }

  AiAdminServicesKnowledgeDtosListVoDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _chunks = $v.chunks?.toBuilder();
      _total = $v.total;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesKnowledgeDtosListVoDto other) {
    _$v = other as _$AiAdminServicesKnowledgeDtosListVoDto;
  }

  @override
  void update(
      void Function(AiAdminServicesKnowledgeDtosListVoDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesKnowledgeDtosListVoDto build() => _build();

  _$AiAdminServicesKnowledgeDtosListVoDto _build() {
    _$AiAdminServicesKnowledgeDtosListVoDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesKnowledgeDtosListVoDto._(
            chunks: _chunks?.build(),
            total: total,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'chunks';
        _chunks?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesKnowledgeDtosListVoDto',
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
