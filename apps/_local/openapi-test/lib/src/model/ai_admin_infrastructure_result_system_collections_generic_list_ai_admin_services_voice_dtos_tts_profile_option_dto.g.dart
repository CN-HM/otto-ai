// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_result_system_collections_generic_list_ai_admin_services_voice_dtos_tts_profile_option_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto
    extends AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto {
  @override
  final int? code;
  @override
  final String? msg;
  @override
  final BuiltList<AiAdminServicesVoiceDtosTtsProfileOptionDto>? data;

  factory _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto(
          [void Function(
                  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto._(
      {this.code, this.msg, this.data})
      : super._();
  @override
  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto
      rebuild(
              void Function(
                      AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder
      toBuilder() =>
          AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto &&
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
            r'AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto')
          ..add('code', code)
          ..add('msg', msg)
          ..add('data', data))
        .toString();
  }
}

class AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder
    implements
        Builder<
            AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto,
            AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder> {
  _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto?
      _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _msg;
  String? get msg => _$this._msg;
  set msg(String? msg) => _$this._msg = msg;

  ListBuilder<AiAdminServicesVoiceDtosTtsProfileOptionDto>? _data;
  ListBuilder<AiAdminServicesVoiceDtosTtsProfileOptionDto> get data =>
      _$this._data ??=
          ListBuilder<AiAdminServicesVoiceDtosTtsProfileOptionDto>();
  set data(ListBuilder<AiAdminServicesVoiceDtosTtsProfileOptionDto>? data) =>
      _$this._data = data;

  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder() {
    AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto
        ._defaults(this);
  }

  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder
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
      AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto
          other) {
    _$v = other
        as _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto
      build() => _build();

  _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto
      _build() {
    _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto
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
            r'AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto',
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
