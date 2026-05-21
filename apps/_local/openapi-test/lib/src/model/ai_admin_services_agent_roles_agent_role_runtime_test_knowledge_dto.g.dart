// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_agent_roles_agent_role_runtime_test_knowledge_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto
    extends AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto {
  @override
  final bool? hasBindings;
  @override
  final bool? hasHits;
  @override
  final String? fallbackReplyText;
  @override
  final String? injectedSystemPrompt;
  @override
  final BuiltList<AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto>?
      hits;

  factory _$AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto(
          [void Function(
                  AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDtoBuilder)?
              updates]) =>
      (AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto._(
      {this.hasBindings,
      this.hasHits,
      this.fallbackReplyText,
      this.injectedSystemPrompt,
      this.hits})
      : super._();
  @override
  AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto rebuild(
          void Function(
                  AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDtoBuilder
      toBuilder() =>
          AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto &&
        hasBindings == other.hasBindings &&
        hasHits == other.hasHits &&
        fallbackReplyText == other.fallbackReplyText &&
        injectedSystemPrompt == other.injectedSystemPrompt &&
        hits == other.hits;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, hasBindings.hashCode);
    _$hash = $jc(_$hash, hasHits.hashCode);
    _$hash = $jc(_$hash, fallbackReplyText.hashCode);
    _$hash = $jc(_$hash, injectedSystemPrompt.hashCode);
    _$hash = $jc(_$hash, hits.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto')
          ..add('hasBindings', hasBindings)
          ..add('hasHits', hasHits)
          ..add('fallbackReplyText', fallbackReplyText)
          ..add('injectedSystemPrompt', injectedSystemPrompt)
          ..add('hits', hits))
        .toString();
  }
}

class AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDtoBuilder
    implements
        Builder<AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto,
            AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDtoBuilder> {
  _$AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto? _$v;

  bool? _hasBindings;
  bool? get hasBindings => _$this._hasBindings;
  set hasBindings(bool? hasBindings) => _$this._hasBindings = hasBindings;

  bool? _hasHits;
  bool? get hasHits => _$this._hasHits;
  set hasHits(bool? hasHits) => _$this._hasHits = hasHits;

  String? _fallbackReplyText;
  String? get fallbackReplyText => _$this._fallbackReplyText;
  set fallbackReplyText(String? fallbackReplyText) =>
      _$this._fallbackReplyText = fallbackReplyText;

  String? _injectedSystemPrompt;
  String? get injectedSystemPrompt => _$this._injectedSystemPrompt;
  set injectedSystemPrompt(String? injectedSystemPrompt) =>
      _$this._injectedSystemPrompt = injectedSystemPrompt;

  ListBuilder<AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto>?
      _hits;
  ListBuilder<AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto>
      get hits => _$this._hits ??= ListBuilder<
          AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto>();
  set hits(
          ListBuilder<
                  AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeHitDto>?
              hits) =>
      _$this._hits = hits;

  AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDtoBuilder() {
    AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto._defaults(this);
  }

  AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _hasBindings = $v.hasBindings;
      _hasHits = $v.hasHits;
      _fallbackReplyText = $v.fallbackReplyText;
      _injectedSystemPrompt = $v.injectedSystemPrompt;
      _hits = $v.hits?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto other) {
    _$v = other as _$AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto build() => _build();

  _$AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto _build() {
    _$AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto._(
            hasBindings: hasBindings,
            hasHits: hasHits,
            fallbackReplyText: fallbackReplyText,
            injectedSystemPrompt: injectedSystemPrompt,
            hits: _hits?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'hits';
        _hits?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto',
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
