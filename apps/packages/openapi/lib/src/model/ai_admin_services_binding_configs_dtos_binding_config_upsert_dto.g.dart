// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_binding_configs_dtos_binding_config_upsert_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesBindingConfigsDtosBindingConfigUpsertDto
    extends AiAdminServicesBindingConfigsDtosBindingConfigUpsertDto {
  @override
  final String? code;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? status;
  @override
  final String? providerCode;
  @override
  final String? providerType;
  @override
  final String? integrationId;
  @override
  final bool? isEnabled;
  @override
  final bool? isDefault;
  @override
  final bool? supportsAsr;
  @override
  final bool? supportsTts;
  @override
  final bool? supportsLlm;
  @override
  final bool? supportsMem;
  @override
  final bool? isSystem;
  @override
  final String? invocationMode;
  @override
  final int? sort;
  @override
  final String? primaryEndpoint;
  @override
  final String? primaryModel;
  @override
  final int? dimension;
  @override
  final String? apiKey;
  @override
  final String? secretKey;
  @override
  final String? appId;
  @override
  final String? accessToken;
  @override
  final String? organization;
  @override
  final String? catalogAccessKey;
  @override
  final String? catalogSecretKey;
  @override
  final String? catalogAppId;
  @override
  final String? graphJson;
  @override
  final String? configJson;
  @override
  final double? temperature;
  @override
  final int? maxTokens;
  @override
  final double? topP;
  @override
  final String? encoding;
  @override
  final int? sampleRate;
  @override
  final int? speechRate;
  @override
  final int? loudnessRate;
  @override
  final String? resourceId;
  @override
  final String? audioFormat;
  @override
  final String? codec;
  @override
  final int? bits;
  @override
  final int? channels;
  @override
  final int? chunkDurationMs;
  @override
  final int? chunkSizeBytes;
  @override
  final String? language;
  @override
  final String? context;
  @override
  final bool? enableNonstream;

  factory _$AiAdminServicesBindingConfigsDtosBindingConfigUpsertDto(
          [void Function(
                  AiAdminServicesBindingConfigsDtosBindingConfigUpsertDtoBuilder)?
              updates]) =>
      (AiAdminServicesBindingConfigsDtosBindingConfigUpsertDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesBindingConfigsDtosBindingConfigUpsertDto._(
      {this.code,
      this.name,
      this.description,
      this.status,
      this.providerCode,
      this.providerType,
      this.integrationId,
      this.isEnabled,
      this.isDefault,
      this.supportsAsr,
      this.supportsTts,
      this.supportsLlm,
      this.supportsMem,
      this.isSystem,
      this.invocationMode,
      this.sort,
      this.primaryEndpoint,
      this.primaryModel,
      this.dimension,
      this.apiKey,
      this.secretKey,
      this.appId,
      this.accessToken,
      this.organization,
      this.catalogAccessKey,
      this.catalogSecretKey,
      this.catalogAppId,
      this.graphJson,
      this.configJson,
      this.temperature,
      this.maxTokens,
      this.topP,
      this.encoding,
      this.sampleRate,
      this.speechRate,
      this.loudnessRate,
      this.resourceId,
      this.audioFormat,
      this.codec,
      this.bits,
      this.channels,
      this.chunkDurationMs,
      this.chunkSizeBytes,
      this.language,
      this.context,
      this.enableNonstream})
      : super._();
  @override
  AiAdminServicesBindingConfigsDtosBindingConfigUpsertDto rebuild(
          void Function(
                  AiAdminServicesBindingConfigsDtosBindingConfigUpsertDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesBindingConfigsDtosBindingConfigUpsertDtoBuilder toBuilder() =>
      AiAdminServicesBindingConfigsDtosBindingConfigUpsertDtoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesBindingConfigsDtosBindingConfigUpsertDto &&
        code == other.code &&
        name == other.name &&
        description == other.description &&
        status == other.status &&
        providerCode == other.providerCode &&
        providerType == other.providerType &&
        integrationId == other.integrationId &&
        isEnabled == other.isEnabled &&
        isDefault == other.isDefault &&
        supportsAsr == other.supportsAsr &&
        supportsTts == other.supportsTts &&
        supportsLlm == other.supportsLlm &&
        supportsMem == other.supportsMem &&
        isSystem == other.isSystem &&
        invocationMode == other.invocationMode &&
        sort == other.sort &&
        primaryEndpoint == other.primaryEndpoint &&
        primaryModel == other.primaryModel &&
        dimension == other.dimension &&
        apiKey == other.apiKey &&
        secretKey == other.secretKey &&
        appId == other.appId &&
        accessToken == other.accessToken &&
        organization == other.organization &&
        catalogAccessKey == other.catalogAccessKey &&
        catalogSecretKey == other.catalogSecretKey &&
        catalogAppId == other.catalogAppId &&
        graphJson == other.graphJson &&
        configJson == other.configJson &&
        temperature == other.temperature &&
        maxTokens == other.maxTokens &&
        topP == other.topP &&
        encoding == other.encoding &&
        sampleRate == other.sampleRate &&
        speechRate == other.speechRate &&
        loudnessRate == other.loudnessRate &&
        resourceId == other.resourceId &&
        audioFormat == other.audioFormat &&
        codec == other.codec &&
        bits == other.bits &&
        channels == other.channels &&
        chunkDurationMs == other.chunkDurationMs &&
        chunkSizeBytes == other.chunkSizeBytes &&
        language == other.language &&
        context == other.context &&
        enableNonstream == other.enableNonstream;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, providerCode.hashCode);
    _$hash = $jc(_$hash, providerType.hashCode);
    _$hash = $jc(_$hash, integrationId.hashCode);
    _$hash = $jc(_$hash, isEnabled.hashCode);
    _$hash = $jc(_$hash, isDefault.hashCode);
    _$hash = $jc(_$hash, supportsAsr.hashCode);
    _$hash = $jc(_$hash, supportsTts.hashCode);
    _$hash = $jc(_$hash, supportsLlm.hashCode);
    _$hash = $jc(_$hash, supportsMem.hashCode);
    _$hash = $jc(_$hash, isSystem.hashCode);
    _$hash = $jc(_$hash, invocationMode.hashCode);
    _$hash = $jc(_$hash, sort.hashCode);
    _$hash = $jc(_$hash, primaryEndpoint.hashCode);
    _$hash = $jc(_$hash, primaryModel.hashCode);
    _$hash = $jc(_$hash, dimension.hashCode);
    _$hash = $jc(_$hash, apiKey.hashCode);
    _$hash = $jc(_$hash, secretKey.hashCode);
    _$hash = $jc(_$hash, appId.hashCode);
    _$hash = $jc(_$hash, accessToken.hashCode);
    _$hash = $jc(_$hash, organization.hashCode);
    _$hash = $jc(_$hash, catalogAccessKey.hashCode);
    _$hash = $jc(_$hash, catalogSecretKey.hashCode);
    _$hash = $jc(_$hash, catalogAppId.hashCode);
    _$hash = $jc(_$hash, graphJson.hashCode);
    _$hash = $jc(_$hash, configJson.hashCode);
    _$hash = $jc(_$hash, temperature.hashCode);
    _$hash = $jc(_$hash, maxTokens.hashCode);
    _$hash = $jc(_$hash, topP.hashCode);
    _$hash = $jc(_$hash, encoding.hashCode);
    _$hash = $jc(_$hash, sampleRate.hashCode);
    _$hash = $jc(_$hash, speechRate.hashCode);
    _$hash = $jc(_$hash, loudnessRate.hashCode);
    _$hash = $jc(_$hash, resourceId.hashCode);
    _$hash = $jc(_$hash, audioFormat.hashCode);
    _$hash = $jc(_$hash, codec.hashCode);
    _$hash = $jc(_$hash, bits.hashCode);
    _$hash = $jc(_$hash, channels.hashCode);
    _$hash = $jc(_$hash, chunkDurationMs.hashCode);
    _$hash = $jc(_$hash, chunkSizeBytes.hashCode);
    _$hash = $jc(_$hash, language.hashCode);
    _$hash = $jc(_$hash, context.hashCode);
    _$hash = $jc(_$hash, enableNonstream.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesBindingConfigsDtosBindingConfigUpsertDto')
          ..add('code', code)
          ..add('name', name)
          ..add('description', description)
          ..add('status', status)
          ..add('providerCode', providerCode)
          ..add('providerType', providerType)
          ..add('integrationId', integrationId)
          ..add('isEnabled', isEnabled)
          ..add('isDefault', isDefault)
          ..add('supportsAsr', supportsAsr)
          ..add('supportsTts', supportsTts)
          ..add('supportsLlm', supportsLlm)
          ..add('supportsMem', supportsMem)
          ..add('isSystem', isSystem)
          ..add('invocationMode', invocationMode)
          ..add('sort', sort)
          ..add('primaryEndpoint', primaryEndpoint)
          ..add('primaryModel', primaryModel)
          ..add('dimension', dimension)
          ..add('apiKey', apiKey)
          ..add('secretKey', secretKey)
          ..add('appId', appId)
          ..add('accessToken', accessToken)
          ..add('organization', organization)
          ..add('catalogAccessKey', catalogAccessKey)
          ..add('catalogSecretKey', catalogSecretKey)
          ..add('catalogAppId', catalogAppId)
          ..add('graphJson', graphJson)
          ..add('configJson', configJson)
          ..add('temperature', temperature)
          ..add('maxTokens', maxTokens)
          ..add('topP', topP)
          ..add('encoding', encoding)
          ..add('sampleRate', sampleRate)
          ..add('speechRate', speechRate)
          ..add('loudnessRate', loudnessRate)
          ..add('resourceId', resourceId)
          ..add('audioFormat', audioFormat)
          ..add('codec', codec)
          ..add('bits', bits)
          ..add('channels', channels)
          ..add('chunkDurationMs', chunkDurationMs)
          ..add('chunkSizeBytes', chunkSizeBytes)
          ..add('language', language)
          ..add('context', context)
          ..add('enableNonstream', enableNonstream))
        .toString();
  }
}

class AiAdminServicesBindingConfigsDtosBindingConfigUpsertDtoBuilder
    implements
        Builder<AiAdminServicesBindingConfigsDtosBindingConfigUpsertDto,
            AiAdminServicesBindingConfigsDtosBindingConfigUpsertDtoBuilder> {
  _$AiAdminServicesBindingConfigsDtosBindingConfigUpsertDto? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _providerCode;
  String? get providerCode => _$this._providerCode;
  set providerCode(String? providerCode) => _$this._providerCode = providerCode;

  String? _providerType;
  String? get providerType => _$this._providerType;
  set providerType(String? providerType) => _$this._providerType = providerType;

  String? _integrationId;
  String? get integrationId => _$this._integrationId;
  set integrationId(String? integrationId) =>
      _$this._integrationId = integrationId;

  bool? _isEnabled;
  bool? get isEnabled => _$this._isEnabled;
  set isEnabled(bool? isEnabled) => _$this._isEnabled = isEnabled;

  bool? _isDefault;
  bool? get isDefault => _$this._isDefault;
  set isDefault(bool? isDefault) => _$this._isDefault = isDefault;

  bool? _supportsAsr;
  bool? get supportsAsr => _$this._supportsAsr;
  set supportsAsr(bool? supportsAsr) => _$this._supportsAsr = supportsAsr;

  bool? _supportsTts;
  bool? get supportsTts => _$this._supportsTts;
  set supportsTts(bool? supportsTts) => _$this._supportsTts = supportsTts;

  bool? _supportsLlm;
  bool? get supportsLlm => _$this._supportsLlm;
  set supportsLlm(bool? supportsLlm) => _$this._supportsLlm = supportsLlm;

  bool? _supportsMem;
  bool? get supportsMem => _$this._supportsMem;
  set supportsMem(bool? supportsMem) => _$this._supportsMem = supportsMem;

  bool? _isSystem;
  bool? get isSystem => _$this._isSystem;
  set isSystem(bool? isSystem) => _$this._isSystem = isSystem;

  String? _invocationMode;
  String? get invocationMode => _$this._invocationMode;
  set invocationMode(String? invocationMode) =>
      _$this._invocationMode = invocationMode;

  int? _sort;
  int? get sort => _$this._sort;
  set sort(int? sort) => _$this._sort = sort;

  String? _primaryEndpoint;
  String? get primaryEndpoint => _$this._primaryEndpoint;
  set primaryEndpoint(String? primaryEndpoint) =>
      _$this._primaryEndpoint = primaryEndpoint;

  String? _primaryModel;
  String? get primaryModel => _$this._primaryModel;
  set primaryModel(String? primaryModel) => _$this._primaryModel = primaryModel;

  int? _dimension;
  int? get dimension => _$this._dimension;
  set dimension(int? dimension) => _$this._dimension = dimension;

  String? _apiKey;
  String? get apiKey => _$this._apiKey;
  set apiKey(String? apiKey) => _$this._apiKey = apiKey;

  String? _secretKey;
  String? get secretKey => _$this._secretKey;
  set secretKey(String? secretKey) => _$this._secretKey = secretKey;

  String? _appId;
  String? get appId => _$this._appId;
  set appId(String? appId) => _$this._appId = appId;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  String? _organization;
  String? get organization => _$this._organization;
  set organization(String? organization) => _$this._organization = organization;

  String? _catalogAccessKey;
  String? get catalogAccessKey => _$this._catalogAccessKey;
  set catalogAccessKey(String? catalogAccessKey) =>
      _$this._catalogAccessKey = catalogAccessKey;

  String? _catalogSecretKey;
  String? get catalogSecretKey => _$this._catalogSecretKey;
  set catalogSecretKey(String? catalogSecretKey) =>
      _$this._catalogSecretKey = catalogSecretKey;

  String? _catalogAppId;
  String? get catalogAppId => _$this._catalogAppId;
  set catalogAppId(String? catalogAppId) => _$this._catalogAppId = catalogAppId;

  String? _graphJson;
  String? get graphJson => _$this._graphJson;
  set graphJson(String? graphJson) => _$this._graphJson = graphJson;

  String? _configJson;
  String? get configJson => _$this._configJson;
  set configJson(String? configJson) => _$this._configJson = configJson;

  double? _temperature;
  double? get temperature => _$this._temperature;
  set temperature(double? temperature) => _$this._temperature = temperature;

  int? _maxTokens;
  int? get maxTokens => _$this._maxTokens;
  set maxTokens(int? maxTokens) => _$this._maxTokens = maxTokens;

  double? _topP;
  double? get topP => _$this._topP;
  set topP(double? topP) => _$this._topP = topP;

  String? _encoding;
  String? get encoding => _$this._encoding;
  set encoding(String? encoding) => _$this._encoding = encoding;

  int? _sampleRate;
  int? get sampleRate => _$this._sampleRate;
  set sampleRate(int? sampleRate) => _$this._sampleRate = sampleRate;

  int? _speechRate;
  int? get speechRate => _$this._speechRate;
  set speechRate(int? speechRate) => _$this._speechRate = speechRate;

  int? _loudnessRate;
  int? get loudnessRate => _$this._loudnessRate;
  set loudnessRate(int? loudnessRate) => _$this._loudnessRate = loudnessRate;

  String? _resourceId;
  String? get resourceId => _$this._resourceId;
  set resourceId(String? resourceId) => _$this._resourceId = resourceId;

  String? _audioFormat;
  String? get audioFormat => _$this._audioFormat;
  set audioFormat(String? audioFormat) => _$this._audioFormat = audioFormat;

  String? _codec;
  String? get codec => _$this._codec;
  set codec(String? codec) => _$this._codec = codec;

  int? _bits;
  int? get bits => _$this._bits;
  set bits(int? bits) => _$this._bits = bits;

  int? _channels;
  int? get channels => _$this._channels;
  set channels(int? channels) => _$this._channels = channels;

  int? _chunkDurationMs;
  int? get chunkDurationMs => _$this._chunkDurationMs;
  set chunkDurationMs(int? chunkDurationMs) =>
      _$this._chunkDurationMs = chunkDurationMs;

  int? _chunkSizeBytes;
  int? get chunkSizeBytes => _$this._chunkSizeBytes;
  set chunkSizeBytes(int? chunkSizeBytes) =>
      _$this._chunkSizeBytes = chunkSizeBytes;

  String? _language;
  String? get language => _$this._language;
  set language(String? language) => _$this._language = language;

  String? _context;
  String? get context => _$this._context;
  set context(String? context) => _$this._context = context;

  bool? _enableNonstream;
  bool? get enableNonstream => _$this._enableNonstream;
  set enableNonstream(bool? enableNonstream) =>
      _$this._enableNonstream = enableNonstream;

  AiAdminServicesBindingConfigsDtosBindingConfigUpsertDtoBuilder() {
    AiAdminServicesBindingConfigsDtosBindingConfigUpsertDto._defaults(this);
  }

  AiAdminServicesBindingConfigsDtosBindingConfigUpsertDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _name = $v.name;
      _description = $v.description;
      _status = $v.status;
      _providerCode = $v.providerCode;
      _providerType = $v.providerType;
      _integrationId = $v.integrationId;
      _isEnabled = $v.isEnabled;
      _isDefault = $v.isDefault;
      _supportsAsr = $v.supportsAsr;
      _supportsTts = $v.supportsTts;
      _supportsLlm = $v.supportsLlm;
      _supportsMem = $v.supportsMem;
      _isSystem = $v.isSystem;
      _invocationMode = $v.invocationMode;
      _sort = $v.sort;
      _primaryEndpoint = $v.primaryEndpoint;
      _primaryModel = $v.primaryModel;
      _dimension = $v.dimension;
      _apiKey = $v.apiKey;
      _secretKey = $v.secretKey;
      _appId = $v.appId;
      _accessToken = $v.accessToken;
      _organization = $v.organization;
      _catalogAccessKey = $v.catalogAccessKey;
      _catalogSecretKey = $v.catalogSecretKey;
      _catalogAppId = $v.catalogAppId;
      _graphJson = $v.graphJson;
      _configJson = $v.configJson;
      _temperature = $v.temperature;
      _maxTokens = $v.maxTokens;
      _topP = $v.topP;
      _encoding = $v.encoding;
      _sampleRate = $v.sampleRate;
      _speechRate = $v.speechRate;
      _loudnessRate = $v.loudnessRate;
      _resourceId = $v.resourceId;
      _audioFormat = $v.audioFormat;
      _codec = $v.codec;
      _bits = $v.bits;
      _channels = $v.channels;
      _chunkDurationMs = $v.chunkDurationMs;
      _chunkSizeBytes = $v.chunkSizeBytes;
      _language = $v.language;
      _context = $v.context;
      _enableNonstream = $v.enableNonstream;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesBindingConfigsDtosBindingConfigUpsertDto other) {
    _$v = other as _$AiAdminServicesBindingConfigsDtosBindingConfigUpsertDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesBindingConfigsDtosBindingConfigUpsertDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesBindingConfigsDtosBindingConfigUpsertDto build() => _build();

  _$AiAdminServicesBindingConfigsDtosBindingConfigUpsertDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesBindingConfigsDtosBindingConfigUpsertDto._(
          code: code,
          name: name,
          description: description,
          status: status,
          providerCode: providerCode,
          providerType: providerType,
          integrationId: integrationId,
          isEnabled: isEnabled,
          isDefault: isDefault,
          supportsAsr: supportsAsr,
          supportsTts: supportsTts,
          supportsLlm: supportsLlm,
          supportsMem: supportsMem,
          isSystem: isSystem,
          invocationMode: invocationMode,
          sort: sort,
          primaryEndpoint: primaryEndpoint,
          primaryModel: primaryModel,
          dimension: dimension,
          apiKey: apiKey,
          secretKey: secretKey,
          appId: appId,
          accessToken: accessToken,
          organization: organization,
          catalogAccessKey: catalogAccessKey,
          catalogSecretKey: catalogSecretKey,
          catalogAppId: catalogAppId,
          graphJson: graphJson,
          configJson: configJson,
          temperature: temperature,
          maxTokens: maxTokens,
          topP: topP,
          encoding: encoding,
          sampleRate: sampleRate,
          speechRate: speechRate,
          loudnessRate: loudnessRate,
          resourceId: resourceId,
          audioFormat: audioFormat,
          codec: codec,
          bits: bits,
          channels: channels,
          chunkDurationMs: chunkDurationMs,
          chunkSizeBytes: chunkSizeBytes,
          language: language,
          context: context,
          enableNonstream: enableNonstream,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
