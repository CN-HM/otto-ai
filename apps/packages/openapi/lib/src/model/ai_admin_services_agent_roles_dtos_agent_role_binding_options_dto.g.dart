// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_agent_roles_dtos_agent_role_binding_options_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto
    extends AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto {
  @override
  final BuiltList<AiAdminServicesAgentRolesDtosOptionItemDto>?
      pipelineTemplates;
  @override
  final BuiltList<AiAdminServicesAgentRolesDtosOptionItemDto>? asrProfiles;
  @override
  final BuiltList<AiAdminServicesAgentRolesDtosOptionItemDto>? vadProfiles;
  @override
  final BuiltList<AiAdminServicesAgentRolesDtosOptionItemDto>? llmProfiles;
  @override
  final BuiltList<AiAdminServicesAgentRolesDtosOptionItemDto>? ttsProfiles;

  factory _$AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto(
          [void Function(
                  AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoBuilder)?
              updates]) =>
      (AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto._(
      {this.pipelineTemplates,
      this.asrProfiles,
      this.vadProfiles,
      this.llmProfiles,
      this.ttsProfiles})
      : super._();
  @override
  AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto rebuild(
          void Function(
                  AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoBuilder toBuilder() =>
      AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto &&
        pipelineTemplates == other.pipelineTemplates &&
        asrProfiles == other.asrProfiles &&
        vadProfiles == other.vadProfiles &&
        llmProfiles == other.llmProfiles &&
        ttsProfiles == other.ttsProfiles;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, pipelineTemplates.hashCode);
    _$hash = $jc(_$hash, asrProfiles.hashCode);
    _$hash = $jc(_$hash, vadProfiles.hashCode);
    _$hash = $jc(_$hash, llmProfiles.hashCode);
    _$hash = $jc(_$hash, ttsProfiles.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto')
          ..add('pipelineTemplates', pipelineTemplates)
          ..add('asrProfiles', asrProfiles)
          ..add('vadProfiles', vadProfiles)
          ..add('llmProfiles', llmProfiles)
          ..add('ttsProfiles', ttsProfiles))
        .toString();
  }
}

class AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoBuilder
    implements
        Builder<AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto,
            AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoBuilder> {
  _$AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto? _$v;

  ListBuilder<AiAdminServicesAgentRolesDtosOptionItemDto>? _pipelineTemplates;
  ListBuilder<AiAdminServicesAgentRolesDtosOptionItemDto>
      get pipelineTemplates => _$this._pipelineTemplates ??=
          ListBuilder<AiAdminServicesAgentRolesDtosOptionItemDto>();
  set pipelineTemplates(
          ListBuilder<AiAdminServicesAgentRolesDtosOptionItemDto>?
              pipelineTemplates) =>
      _$this._pipelineTemplates = pipelineTemplates;

  ListBuilder<AiAdminServicesAgentRolesDtosOptionItemDto>? _asrProfiles;
  ListBuilder<AiAdminServicesAgentRolesDtosOptionItemDto> get asrProfiles =>
      _$this._asrProfiles ??=
          ListBuilder<AiAdminServicesAgentRolesDtosOptionItemDto>();
  set asrProfiles(
          ListBuilder<AiAdminServicesAgentRolesDtosOptionItemDto>?
              asrProfiles) =>
      _$this._asrProfiles = asrProfiles;

  ListBuilder<AiAdminServicesAgentRolesDtosOptionItemDto>? _vadProfiles;
  ListBuilder<AiAdminServicesAgentRolesDtosOptionItemDto> get vadProfiles =>
      _$this._vadProfiles ??=
          ListBuilder<AiAdminServicesAgentRolesDtosOptionItemDto>();
  set vadProfiles(
          ListBuilder<AiAdminServicesAgentRolesDtosOptionItemDto>?
              vadProfiles) =>
      _$this._vadProfiles = vadProfiles;

  ListBuilder<AiAdminServicesAgentRolesDtosOptionItemDto>? _llmProfiles;
  ListBuilder<AiAdminServicesAgentRolesDtosOptionItemDto> get llmProfiles =>
      _$this._llmProfiles ??=
          ListBuilder<AiAdminServicesAgentRolesDtosOptionItemDto>();
  set llmProfiles(
          ListBuilder<AiAdminServicesAgentRolesDtosOptionItemDto>?
              llmProfiles) =>
      _$this._llmProfiles = llmProfiles;

  ListBuilder<AiAdminServicesAgentRolesDtosOptionItemDto>? _ttsProfiles;
  ListBuilder<AiAdminServicesAgentRolesDtosOptionItemDto> get ttsProfiles =>
      _$this._ttsProfiles ??=
          ListBuilder<AiAdminServicesAgentRolesDtosOptionItemDto>();
  set ttsProfiles(
          ListBuilder<AiAdminServicesAgentRolesDtosOptionItemDto>?
              ttsProfiles) =>
      _$this._ttsProfiles = ttsProfiles;

  AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoBuilder() {
    AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto._defaults(this);
  }

  AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pipelineTemplates = $v.pipelineTemplates?.toBuilder();
      _asrProfiles = $v.asrProfiles?.toBuilder();
      _vadProfiles = $v.vadProfiles?.toBuilder();
      _llmProfiles = $v.llmProfiles?.toBuilder();
      _ttsProfiles = $v.ttsProfiles?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto other) {
    _$v = other as _$AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto build() => _build();

  _$AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto _build() {
    _$AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto._(
            pipelineTemplates: _pipelineTemplates?.build(),
            asrProfiles: _asrProfiles?.build(),
            vadProfiles: _vadProfiles?.build(),
            llmProfiles: _llmProfiles?.build(),
            ttsProfiles: _ttsProfiles?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pipelineTemplates';
        _pipelineTemplates?.build();
        _$failedField = 'asrProfiles';
        _asrProfiles?.build();
        _$failedField = 'vadProfiles';
        _vadProfiles?.build();
        _$failedField = 'llmProfiles';
        _llmProfiles?.build();
        _$failedField = 'ttsProfiles';
        _ttsProfiles?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto',
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
