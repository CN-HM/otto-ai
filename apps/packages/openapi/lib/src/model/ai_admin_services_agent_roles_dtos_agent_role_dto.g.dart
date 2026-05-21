// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_agent_roles_dtos_agent_role_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAgentRolesDtosAgentRoleDto
    extends AiAdminServicesAgentRolesDtosAgentRoleDto {
  @override
  final String? id;
  @override
  final String? code;
  @override
  final String? name;
  @override
  final String? displayName;
  @override
  final String? description;
  @override
  final String? status;
  @override
  final bool? isSystem;
  @override
  final String? icon;
  @override
  final String? coverImage;
  @override
  final String? themeToken;
  @override
  final String? pipelineTemplateId;
  @override
  final String? asrProfileId;
  @override
  final String? vadProfileId;
  @override
  final String? llmProfileId;
  @override
  final String? ttsProfileId;
  @override
  final String? ttsVoiceId;
  @override
  final String? ttsLanguage;
  @override
  final double? ttsVolume;
  @override
  final double? ttsRate;
  @override
  final double? ttsPitch;
  @override
  final int? chatHistoryConf;
  @override
  final String? systemPrompt;
  @override
  final String? knowledgeNoHitFallbackText;
  @override
  final bool? memoryEnabled;
  @override
  final String? memoryLibraryId;
  @override
  final String? memoryModelId;
  @override
  final String? memoryEntityScope;
  @override
  final int? memoryTopK;
  @override
  final double? memoryMinScore;
  @override
  final bool? memoryIntentRecall;
  @override
  final bool? memoryQueryRewrite;
  @override
  final bool? memoryRerank;
  @override
  final String? langCode;
  @override
  final String? language;
  @override
  final String? currentReleaseId;
  @override
  final String? currentVersion;
  @override
  final String? publishedAt;
  @override
  final int? sort;
  @override
  final int? creator;
  @override
  final String? createdAt;
  @override
  final int? updater;
  @override
  final String? updatedAt;
  @override
  final BuiltList<AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto>?
      pluginMappings;
  @override
  final BuiltList<AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto>?
      contextProviders;
  @override
  final BuiltList<AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto>?
      knowledgeBindings;

  factory _$AiAdminServicesAgentRolesDtosAgentRoleDto(
          [void Function(AiAdminServicesAgentRolesDtosAgentRoleDtoBuilder)?
              updates]) =>
      (AiAdminServicesAgentRolesDtosAgentRoleDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesAgentRolesDtosAgentRoleDto._(
      {this.id,
      this.code,
      this.name,
      this.displayName,
      this.description,
      this.status,
      this.isSystem,
      this.icon,
      this.coverImage,
      this.themeToken,
      this.pipelineTemplateId,
      this.asrProfileId,
      this.vadProfileId,
      this.llmProfileId,
      this.ttsProfileId,
      this.ttsVoiceId,
      this.ttsLanguage,
      this.ttsVolume,
      this.ttsRate,
      this.ttsPitch,
      this.chatHistoryConf,
      this.systemPrompt,
      this.knowledgeNoHitFallbackText,
      this.memoryEnabled,
      this.memoryLibraryId,
      this.memoryModelId,
      this.memoryEntityScope,
      this.memoryTopK,
      this.memoryMinScore,
      this.memoryIntentRecall,
      this.memoryQueryRewrite,
      this.memoryRerank,
      this.langCode,
      this.language,
      this.currentReleaseId,
      this.currentVersion,
      this.publishedAt,
      this.sort,
      this.creator,
      this.createdAt,
      this.updater,
      this.updatedAt,
      this.pluginMappings,
      this.contextProviders,
      this.knowledgeBindings})
      : super._();
  @override
  AiAdminServicesAgentRolesDtosAgentRoleDto rebuild(
          void Function(AiAdminServicesAgentRolesDtosAgentRoleDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAgentRolesDtosAgentRoleDtoBuilder toBuilder() =>
      AiAdminServicesAgentRolesDtosAgentRoleDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAgentRolesDtosAgentRoleDto &&
        id == other.id &&
        code == other.code &&
        name == other.name &&
        displayName == other.displayName &&
        description == other.description &&
        status == other.status &&
        isSystem == other.isSystem &&
        icon == other.icon &&
        coverImage == other.coverImage &&
        themeToken == other.themeToken &&
        pipelineTemplateId == other.pipelineTemplateId &&
        asrProfileId == other.asrProfileId &&
        vadProfileId == other.vadProfileId &&
        llmProfileId == other.llmProfileId &&
        ttsProfileId == other.ttsProfileId &&
        ttsVoiceId == other.ttsVoiceId &&
        ttsLanguage == other.ttsLanguage &&
        ttsVolume == other.ttsVolume &&
        ttsRate == other.ttsRate &&
        ttsPitch == other.ttsPitch &&
        chatHistoryConf == other.chatHistoryConf &&
        systemPrompt == other.systemPrompt &&
        knowledgeNoHitFallbackText == other.knowledgeNoHitFallbackText &&
        memoryEnabled == other.memoryEnabled &&
        memoryLibraryId == other.memoryLibraryId &&
        memoryModelId == other.memoryModelId &&
        memoryEntityScope == other.memoryEntityScope &&
        memoryTopK == other.memoryTopK &&
        memoryMinScore == other.memoryMinScore &&
        memoryIntentRecall == other.memoryIntentRecall &&
        memoryQueryRewrite == other.memoryQueryRewrite &&
        memoryRerank == other.memoryRerank &&
        langCode == other.langCode &&
        language == other.language &&
        currentReleaseId == other.currentReleaseId &&
        currentVersion == other.currentVersion &&
        publishedAt == other.publishedAt &&
        sort == other.sort &&
        creator == other.creator &&
        createdAt == other.createdAt &&
        updater == other.updater &&
        updatedAt == other.updatedAt &&
        pluginMappings == other.pluginMappings &&
        contextProviders == other.contextProviders &&
        knowledgeBindings == other.knowledgeBindings;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, isSystem.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, coverImage.hashCode);
    _$hash = $jc(_$hash, themeToken.hashCode);
    _$hash = $jc(_$hash, pipelineTemplateId.hashCode);
    _$hash = $jc(_$hash, asrProfileId.hashCode);
    _$hash = $jc(_$hash, vadProfileId.hashCode);
    _$hash = $jc(_$hash, llmProfileId.hashCode);
    _$hash = $jc(_$hash, ttsProfileId.hashCode);
    _$hash = $jc(_$hash, ttsVoiceId.hashCode);
    _$hash = $jc(_$hash, ttsLanguage.hashCode);
    _$hash = $jc(_$hash, ttsVolume.hashCode);
    _$hash = $jc(_$hash, ttsRate.hashCode);
    _$hash = $jc(_$hash, ttsPitch.hashCode);
    _$hash = $jc(_$hash, chatHistoryConf.hashCode);
    _$hash = $jc(_$hash, systemPrompt.hashCode);
    _$hash = $jc(_$hash, knowledgeNoHitFallbackText.hashCode);
    _$hash = $jc(_$hash, memoryEnabled.hashCode);
    _$hash = $jc(_$hash, memoryLibraryId.hashCode);
    _$hash = $jc(_$hash, memoryModelId.hashCode);
    _$hash = $jc(_$hash, memoryEntityScope.hashCode);
    _$hash = $jc(_$hash, memoryTopK.hashCode);
    _$hash = $jc(_$hash, memoryMinScore.hashCode);
    _$hash = $jc(_$hash, memoryIntentRecall.hashCode);
    _$hash = $jc(_$hash, memoryQueryRewrite.hashCode);
    _$hash = $jc(_$hash, memoryRerank.hashCode);
    _$hash = $jc(_$hash, langCode.hashCode);
    _$hash = $jc(_$hash, language.hashCode);
    _$hash = $jc(_$hash, currentReleaseId.hashCode);
    _$hash = $jc(_$hash, currentVersion.hashCode);
    _$hash = $jc(_$hash, publishedAt.hashCode);
    _$hash = $jc(_$hash, sort.hashCode);
    _$hash = $jc(_$hash, creator.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updater.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, pluginMappings.hashCode);
    _$hash = $jc(_$hash, contextProviders.hashCode);
    _$hash = $jc(_$hash, knowledgeBindings.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesAgentRolesDtosAgentRoleDto')
          ..add('id', id)
          ..add('code', code)
          ..add('name', name)
          ..add('displayName', displayName)
          ..add('description', description)
          ..add('status', status)
          ..add('isSystem', isSystem)
          ..add('icon', icon)
          ..add('coverImage', coverImage)
          ..add('themeToken', themeToken)
          ..add('pipelineTemplateId', pipelineTemplateId)
          ..add('asrProfileId', asrProfileId)
          ..add('vadProfileId', vadProfileId)
          ..add('llmProfileId', llmProfileId)
          ..add('ttsProfileId', ttsProfileId)
          ..add('ttsVoiceId', ttsVoiceId)
          ..add('ttsLanguage', ttsLanguage)
          ..add('ttsVolume', ttsVolume)
          ..add('ttsRate', ttsRate)
          ..add('ttsPitch', ttsPitch)
          ..add('chatHistoryConf', chatHistoryConf)
          ..add('systemPrompt', systemPrompt)
          ..add('knowledgeNoHitFallbackText', knowledgeNoHitFallbackText)
          ..add('memoryEnabled', memoryEnabled)
          ..add('memoryLibraryId', memoryLibraryId)
          ..add('memoryModelId', memoryModelId)
          ..add('memoryEntityScope', memoryEntityScope)
          ..add('memoryTopK', memoryTopK)
          ..add('memoryMinScore', memoryMinScore)
          ..add('memoryIntentRecall', memoryIntentRecall)
          ..add('memoryQueryRewrite', memoryQueryRewrite)
          ..add('memoryRerank', memoryRerank)
          ..add('langCode', langCode)
          ..add('language', language)
          ..add('currentReleaseId', currentReleaseId)
          ..add('currentVersion', currentVersion)
          ..add('publishedAt', publishedAt)
          ..add('sort', sort)
          ..add('creator', creator)
          ..add('createdAt', createdAt)
          ..add('updater', updater)
          ..add('updatedAt', updatedAt)
          ..add('pluginMappings', pluginMappings)
          ..add('contextProviders', contextProviders)
          ..add('knowledgeBindings', knowledgeBindings))
        .toString();
  }
}

class AiAdminServicesAgentRolesDtosAgentRoleDtoBuilder
    implements
        Builder<AiAdminServicesAgentRolesDtosAgentRoleDto,
            AiAdminServicesAgentRolesDtosAgentRoleDtoBuilder> {
  _$AiAdminServicesAgentRolesDtosAgentRoleDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  bool? _isSystem;
  bool? get isSystem => _$this._isSystem;
  set isSystem(bool? isSystem) => _$this._isSystem = isSystem;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  String? _coverImage;
  String? get coverImage => _$this._coverImage;
  set coverImage(String? coverImage) => _$this._coverImage = coverImage;

  String? _themeToken;
  String? get themeToken => _$this._themeToken;
  set themeToken(String? themeToken) => _$this._themeToken = themeToken;

  String? _pipelineTemplateId;
  String? get pipelineTemplateId => _$this._pipelineTemplateId;
  set pipelineTemplateId(String? pipelineTemplateId) =>
      _$this._pipelineTemplateId = pipelineTemplateId;

  String? _asrProfileId;
  String? get asrProfileId => _$this._asrProfileId;
  set asrProfileId(String? asrProfileId) => _$this._asrProfileId = asrProfileId;

  String? _vadProfileId;
  String? get vadProfileId => _$this._vadProfileId;
  set vadProfileId(String? vadProfileId) => _$this._vadProfileId = vadProfileId;

  String? _llmProfileId;
  String? get llmProfileId => _$this._llmProfileId;
  set llmProfileId(String? llmProfileId) => _$this._llmProfileId = llmProfileId;

  String? _ttsProfileId;
  String? get ttsProfileId => _$this._ttsProfileId;
  set ttsProfileId(String? ttsProfileId) => _$this._ttsProfileId = ttsProfileId;

  String? _ttsVoiceId;
  String? get ttsVoiceId => _$this._ttsVoiceId;
  set ttsVoiceId(String? ttsVoiceId) => _$this._ttsVoiceId = ttsVoiceId;

  String? _ttsLanguage;
  String? get ttsLanguage => _$this._ttsLanguage;
  set ttsLanguage(String? ttsLanguage) => _$this._ttsLanguage = ttsLanguage;

  double? _ttsVolume;
  double? get ttsVolume => _$this._ttsVolume;
  set ttsVolume(double? ttsVolume) => _$this._ttsVolume = ttsVolume;

  double? _ttsRate;
  double? get ttsRate => _$this._ttsRate;
  set ttsRate(double? ttsRate) => _$this._ttsRate = ttsRate;

  double? _ttsPitch;
  double? get ttsPitch => _$this._ttsPitch;
  set ttsPitch(double? ttsPitch) => _$this._ttsPitch = ttsPitch;

  int? _chatHistoryConf;
  int? get chatHistoryConf => _$this._chatHistoryConf;
  set chatHistoryConf(int? chatHistoryConf) =>
      _$this._chatHistoryConf = chatHistoryConf;

  String? _systemPrompt;
  String? get systemPrompt => _$this._systemPrompt;
  set systemPrompt(String? systemPrompt) => _$this._systemPrompt = systemPrompt;

  String? _knowledgeNoHitFallbackText;
  String? get knowledgeNoHitFallbackText => _$this._knowledgeNoHitFallbackText;
  set knowledgeNoHitFallbackText(String? knowledgeNoHitFallbackText) =>
      _$this._knowledgeNoHitFallbackText = knowledgeNoHitFallbackText;

  bool? _memoryEnabled;
  bool? get memoryEnabled => _$this._memoryEnabled;
  set memoryEnabled(bool? memoryEnabled) =>
      _$this._memoryEnabled = memoryEnabled;

  String? _memoryLibraryId;
  String? get memoryLibraryId => _$this._memoryLibraryId;
  set memoryLibraryId(String? memoryLibraryId) =>
      _$this._memoryLibraryId = memoryLibraryId;

  String? _memoryModelId;
  String? get memoryModelId => _$this._memoryModelId;
  set memoryModelId(String? memoryModelId) =>
      _$this._memoryModelId = memoryModelId;

  String? _memoryEntityScope;
  String? get memoryEntityScope => _$this._memoryEntityScope;
  set memoryEntityScope(String? memoryEntityScope) =>
      _$this._memoryEntityScope = memoryEntityScope;

  int? _memoryTopK;
  int? get memoryTopK => _$this._memoryTopK;
  set memoryTopK(int? memoryTopK) => _$this._memoryTopK = memoryTopK;

  double? _memoryMinScore;
  double? get memoryMinScore => _$this._memoryMinScore;
  set memoryMinScore(double? memoryMinScore) =>
      _$this._memoryMinScore = memoryMinScore;

  bool? _memoryIntentRecall;
  bool? get memoryIntentRecall => _$this._memoryIntentRecall;
  set memoryIntentRecall(bool? memoryIntentRecall) =>
      _$this._memoryIntentRecall = memoryIntentRecall;

  bool? _memoryQueryRewrite;
  bool? get memoryQueryRewrite => _$this._memoryQueryRewrite;
  set memoryQueryRewrite(bool? memoryQueryRewrite) =>
      _$this._memoryQueryRewrite = memoryQueryRewrite;

  bool? _memoryRerank;
  bool? get memoryRerank => _$this._memoryRerank;
  set memoryRerank(bool? memoryRerank) => _$this._memoryRerank = memoryRerank;

  String? _langCode;
  String? get langCode => _$this._langCode;
  set langCode(String? langCode) => _$this._langCode = langCode;

  String? _language;
  String? get language => _$this._language;
  set language(String? language) => _$this._language = language;

  String? _currentReleaseId;
  String? get currentReleaseId => _$this._currentReleaseId;
  set currentReleaseId(String? currentReleaseId) =>
      _$this._currentReleaseId = currentReleaseId;

  String? _currentVersion;
  String? get currentVersion => _$this._currentVersion;
  set currentVersion(String? currentVersion) =>
      _$this._currentVersion = currentVersion;

  String? _publishedAt;
  String? get publishedAt => _$this._publishedAt;
  set publishedAt(String? publishedAt) => _$this._publishedAt = publishedAt;

  int? _sort;
  int? get sort => _$this._sort;
  set sort(int? sort) => _$this._sort = sort;

  int? _creator;
  int? get creator => _$this._creator;
  set creator(int? creator) => _$this._creator = creator;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  int? _updater;
  int? get updater => _$this._updater;
  set updater(int? updater) => _$this._updater = updater;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  ListBuilder<AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto>?
      _pluginMappings;
  ListBuilder<AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto>
      get pluginMappings => _$this._pluginMappings ??=
          ListBuilder<AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto>();
  set pluginMappings(
          ListBuilder<AiAdminServicesAgentRolesDtosAgentRolePluginMappingDto>?
              pluginMappings) =>
      _$this._pluginMappings = pluginMappings;

  ListBuilder<AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto>?
      _contextProviders;
  ListBuilder<AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto>
      get contextProviders => _$this._contextProviders ??= ListBuilder<
          AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto>();
  set contextProviders(
          ListBuilder<AiAdminServicesAgentRolesDtosAgentRoleContextProviderDto>?
              contextProviders) =>
      _$this._contextProviders = contextProviders;

  ListBuilder<AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto>?
      _knowledgeBindings;
  ListBuilder<AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto>
      get knowledgeBindings => _$this._knowledgeBindings ??= ListBuilder<
          AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto>();
  set knowledgeBindings(
          ListBuilder<
                  AiAdminServicesAgentRolesDtosAgentRoleKnowledgeBindingDto>?
              knowledgeBindings) =>
      _$this._knowledgeBindings = knowledgeBindings;

  AiAdminServicesAgentRolesDtosAgentRoleDtoBuilder() {
    AiAdminServicesAgentRolesDtosAgentRoleDto._defaults(this);
  }

  AiAdminServicesAgentRolesDtosAgentRoleDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _code = $v.code;
      _name = $v.name;
      _displayName = $v.displayName;
      _description = $v.description;
      _status = $v.status;
      _isSystem = $v.isSystem;
      _icon = $v.icon;
      _coverImage = $v.coverImage;
      _themeToken = $v.themeToken;
      _pipelineTemplateId = $v.pipelineTemplateId;
      _asrProfileId = $v.asrProfileId;
      _vadProfileId = $v.vadProfileId;
      _llmProfileId = $v.llmProfileId;
      _ttsProfileId = $v.ttsProfileId;
      _ttsVoiceId = $v.ttsVoiceId;
      _ttsLanguage = $v.ttsLanguage;
      _ttsVolume = $v.ttsVolume;
      _ttsRate = $v.ttsRate;
      _ttsPitch = $v.ttsPitch;
      _chatHistoryConf = $v.chatHistoryConf;
      _systemPrompt = $v.systemPrompt;
      _knowledgeNoHitFallbackText = $v.knowledgeNoHitFallbackText;
      _memoryEnabled = $v.memoryEnabled;
      _memoryLibraryId = $v.memoryLibraryId;
      _memoryModelId = $v.memoryModelId;
      _memoryEntityScope = $v.memoryEntityScope;
      _memoryTopK = $v.memoryTopK;
      _memoryMinScore = $v.memoryMinScore;
      _memoryIntentRecall = $v.memoryIntentRecall;
      _memoryQueryRewrite = $v.memoryQueryRewrite;
      _memoryRerank = $v.memoryRerank;
      _langCode = $v.langCode;
      _language = $v.language;
      _currentReleaseId = $v.currentReleaseId;
      _currentVersion = $v.currentVersion;
      _publishedAt = $v.publishedAt;
      _sort = $v.sort;
      _creator = $v.creator;
      _createdAt = $v.createdAt;
      _updater = $v.updater;
      _updatedAt = $v.updatedAt;
      _pluginMappings = $v.pluginMappings?.toBuilder();
      _contextProviders = $v.contextProviders?.toBuilder();
      _knowledgeBindings = $v.knowledgeBindings?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAgentRolesDtosAgentRoleDto other) {
    _$v = other as _$AiAdminServicesAgentRolesDtosAgentRoleDto;
  }

  @override
  void update(
      void Function(AiAdminServicesAgentRolesDtosAgentRoleDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAgentRolesDtosAgentRoleDto build() => _build();

  _$AiAdminServicesAgentRolesDtosAgentRoleDto _build() {
    _$AiAdminServicesAgentRolesDtosAgentRoleDto _$result;
    try {
      _$result = _$v ??
          _$AiAdminServicesAgentRolesDtosAgentRoleDto._(
            id: id,
            code: code,
            name: name,
            displayName: displayName,
            description: description,
            status: status,
            isSystem: isSystem,
            icon: icon,
            coverImage: coverImage,
            themeToken: themeToken,
            pipelineTemplateId: pipelineTemplateId,
            asrProfileId: asrProfileId,
            vadProfileId: vadProfileId,
            llmProfileId: llmProfileId,
            ttsProfileId: ttsProfileId,
            ttsVoiceId: ttsVoiceId,
            ttsLanguage: ttsLanguage,
            ttsVolume: ttsVolume,
            ttsRate: ttsRate,
            ttsPitch: ttsPitch,
            chatHistoryConf: chatHistoryConf,
            systemPrompt: systemPrompt,
            knowledgeNoHitFallbackText: knowledgeNoHitFallbackText,
            memoryEnabled: memoryEnabled,
            memoryLibraryId: memoryLibraryId,
            memoryModelId: memoryModelId,
            memoryEntityScope: memoryEntityScope,
            memoryTopK: memoryTopK,
            memoryMinScore: memoryMinScore,
            memoryIntentRecall: memoryIntentRecall,
            memoryQueryRewrite: memoryQueryRewrite,
            memoryRerank: memoryRerank,
            langCode: langCode,
            language: language,
            currentReleaseId: currentReleaseId,
            currentVersion: currentVersion,
            publishedAt: publishedAt,
            sort: sort,
            creator: creator,
            createdAt: createdAt,
            updater: updater,
            updatedAt: updatedAt,
            pluginMappings: _pluginMappings?.build(),
            contextProviders: _contextProviders?.build(),
            knowledgeBindings: _knowledgeBindings?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pluginMappings';
        _pluginMappings?.build();
        _$failedField = 'contextProviders';
        _contextProviders?.build();
        _$failedField = 'knowledgeBindings';
        _knowledgeBindings?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminServicesAgentRolesDtosAgentRoleDto',
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
