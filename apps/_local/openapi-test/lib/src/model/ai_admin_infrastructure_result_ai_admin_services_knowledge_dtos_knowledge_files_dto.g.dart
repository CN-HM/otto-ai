// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_knowledge_dtos_knowledge_files_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto
    extends AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesKnowledgeDtosKnowledgeFilesDto? data;

  factory _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto rebuild(
          void Function(
                  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto &&
        code == other.code &&
        msg == other.msg &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, msg.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto,
            AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto?
      _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder? _data;
  AiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder get data =>
      _$this._data ??= AiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder();
  set data(AiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _msg = $v.msg;
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto
      build() => _build();

  _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto
      _build() {
    _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto
              ._(
            code: code,
            msg: msg,
            data: _data?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto',
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
