// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_ai_admin_services_knowledge_dtos_result_vo_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDto
    extends AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final AiAdminServicesKnowledgeDtosResultVoDto? data;

  factory _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDto(
          [void Function(
                  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDto rebuild(
          void Function(
                  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDto &&
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
            r'AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDto,
            AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDtoBuilder> {
  _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDto? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  AiAdminServicesKnowledgeDtosResultVoDtoBuilder? _data;
  AiAdminServicesKnowledgeDtosResultVoDtoBuilder get data =>
      _$this._data ??= AiAdminServicesKnowledgeDtosResultVoDtoBuilder();
  set data(AiAdminServicesKnowledgeDtosResultVoDtoBuilder? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDtoBuilder() {
    AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDtoBuilder
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
      AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDto build() =>
      _build();

  _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDto
      _build() {
    _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDto
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
            r'AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDto',
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
