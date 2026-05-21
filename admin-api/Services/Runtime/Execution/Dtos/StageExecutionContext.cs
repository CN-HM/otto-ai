using AiAdmin.Services.Runtime.Orchestration.Dtos;

namespace AiAdmin.Services.Runtime.Execution.Dtos;

public class StageExecutionContext
{
    public required ModelInvocationProfileDto InvocationProfile { get; init; }
    public required ModelExecutionConfigDto ModelConfig { get; init; }
}
