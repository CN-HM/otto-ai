namespace AiAdmin.Services.BindingConfigs.Dtos;

public class BindingConfigKindMetaDto
{
    public string Kind { get; set; } = string.Empty;
    public string Label { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public bool SupportsCode { get; set; }
    public bool SupportsIntegrationId { get; set; }
    public bool SupportsProviderCode { get; set; }
    public bool SupportsProviderType { get; set; }
    public bool SupportsProviderScopes { get; set; }
    public bool SupportsIsEnabled { get; set; }
    public bool SupportsIsSystem { get; set; }
    public bool SupportsInvocationMode { get; set; }
    public bool SupportsPrimaryEndpoint { get; set; }
    public bool SupportsPrimaryModel { get; set; }
    public bool SupportsDimension { get; set; }
    public bool SupportsApiKey { get; set; }
    public bool SupportsSecretKey { get; set; }
    public bool SupportsAppId { get; set; }
    public bool SupportsAccessToken { get; set; }
    public bool SupportsOrganization { get; set; }
    public bool SupportsCatalogAccessKey { get; set; }
    public bool SupportsCatalogSecretKey { get; set; }
    public bool SupportsCatalogAppId { get; set; }
    public bool SupportsGraphJson { get; set; }
    public bool SupportsConfigJson { get; set; }
    public bool SupportsTemperature { get; set; }
    public bool SupportsMaxTokens { get; set; }
    public bool SupportsTopP { get; set; }
    public bool SupportsEncoding { get; set; }
    public bool SupportsSampleRate { get; set; }
    public bool SupportsSpeechRate { get; set; }
    public bool SupportsLoudnessRate { get; set; }
    public bool SupportsResourceId { get; set; }
    public bool SupportsAudioFormat { get; set; }
    public bool SupportsCodec { get; set; }
    public bool SupportsBits { get; set; }
    public bool SupportsChannels { get; set; }
    public bool SupportsChunkDurationMs { get; set; }
    public bool SupportsChunkSizeBytes { get; set; }
    public bool SupportsLanguage { get; set; }
    public bool SupportsContext { get; set; }
    public bool SupportsShowUtterances { get; set; }
    public bool SupportsResultType { get; set; }
    public bool SupportsVadHead { get; set; }
    public bool SupportsVadTail { get; set; }
    public bool SupportsEndWindowSize { get; set; }
    public bool SupportsForceToSpeechTime { get; set; }
    public bool SupportsSensitiveWordsFilter { get; set; }
}
