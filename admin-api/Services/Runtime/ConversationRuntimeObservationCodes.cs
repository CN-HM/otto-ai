namespace AiAdmin.Services.Runtime;

public static class ConversationRuntimeObservationCodes
{
    public static class Stages
    {
        public const string Asr = "asr";
        public const string Rag = "rag";
        public const string Llm = "llm";
        public const string Tts = "tts";
    }

    public static class FallbackReasons
    {
        public const string CapabilityDowngrade = "capability_downgrade";
        public const string RuntimeModeOverride = "runtime_mode_override";
    }

    public static class FailureReasons
    {
        public const string InputEmpty = "input_empty";
        public const string OrchestrationFailed = "orchestration_failed";
        public const string StageProfileMissing = "stage_profile_missing";
        public const string ModelConfigMissing = "model_config_missing";
        public const string AdapterNotFound = "adapter_not_found";
        public const string ModelConfigResolveFailed = "model_config_resolve_failed";
        public const string ProviderExecutionFailed = "provider_execution_failed";
        public const string Cancelled = "cancelled";
        public const string Timeout = "timeout";
        public const string DeviceNotFound = "device_not_found";
        public const string AgentUnbound = "agent_unbound";
        public const string AgentNotFound = "agent_not_found";
        public const string EmptyTranscript = "empty_transcript";
        public const string EmptyReplyText = "empty_reply_text";
        public const string EmptyTtsAudio = "empty_tts_audio";
    }

    public static class TurnOutcomes
    {
        public const string Completed = "completed";
        public const string EmptyAudioInput = "empty_audio_input";
        public const string EmptyTranscript = "empty_transcript";
        public const string EmptyReplyText = "empty_reply_text";
        public const string EmptyTtsAudio = "empty_tts_audio";
        public const string DeviceNotFound = "device_not_found";
        public const string AgentUnbound = "agent_unbound";
        public const string AgentNotFound = "agent_not_found";
        public const string StageExecutionFailed = "stage_execution_failed";
        public const string TurnCancelled = "turn_cancelled";
        public const string TurnTimedOut = "turn_timed_out";
    }

    public static class ExceptionDataKeys
    {
        public const string StageTrace = "ConversationStageTrace";
    }
}
