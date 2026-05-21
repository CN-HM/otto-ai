// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_knowledge_dtos_list_vo_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDto
    extends AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesKnowledgeDtosListVoDto? data;

  factory _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDto rebuild(
          void Function(
                  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDto &&
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
            r'AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDto,
            AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDto? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesKnowledgeDtosListVoDtoBuilder? _data;
  AiAdminServicesKnowledgeDtosListVoDtoBuilder get data =>
      _$this._data ??= AiAdminServicesKnowledgeDtosListVoDtoBuilder();
  set data(AiAdminServicesKnowledgeDtosListVoDtoBuilder? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDtoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDto._defaults(
        this);
  }

  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDtoBuilder
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
      AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDto other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDto build() =>
      _build();

  _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDto _build() {
    _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDto._(
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
            r'AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDto',
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
