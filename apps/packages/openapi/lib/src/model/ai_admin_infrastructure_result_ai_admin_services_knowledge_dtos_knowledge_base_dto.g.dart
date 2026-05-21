// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_knowledge_dtos_knowledge_base_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto
    extends AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesKnowledgeDtosKnowledgeBaseDto? data;

  factory _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto rebuild(
          void Function(
                  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto &&
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
            r'AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto,
            AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto?
      _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder? _data;
  AiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder get data =>
      _$this._data ??= AiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder();
  set data(AiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder
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
      AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto
      build() => _build();

  _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto
      _build() {
    _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto
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
            r'AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto',
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
