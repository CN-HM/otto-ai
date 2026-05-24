using AiAdmin.Entities;
using AiAdmin.Services.AgentRoles.Dtos;
using AiAdmin.Services.SystemPrompt;
using AiAdmin.Services.SystemPrompt.Dtos;
using AiAdmin.Services.SystemPrompt.Variables;
using Microsoft.Extensions.Logging;
using NSubstitute;
using Shouldly;
using Xunit;

namespace AiAdmin.Application.Tests.Services.SystemPrompt;

public class SystemPromptTemplateRendererTests
{
    private static SystemPromptTemplateRenderer CreateRenderer(ILogger<SystemPromptTemplateRenderer>? logger = null)
    {
        logger ??= Substitute.For<ILogger<SystemPromptTemplateRenderer>>();
        var providers = new ISystemPromptVariableProvider[]
        {
            new TimeVariableProvider(),
            new DeviceVariableProvider(),
            new AgentVariableProvider(),
            new UserVariableProvider(),
            new SessionVariableProvider()
        };
        return new SystemPromptTemplateRenderer(providers, logger);
    }

    [Fact]
    public async Task Should_Return_Empty_For_Null_Template()
    {
        var renderer = CreateRenderer();
        var result = await renderer.RenderAsync(null, new VariableResolveContext());
        result.ShouldBe(string.Empty);
    }

    [Fact]
    public async Task Should_Return_Empty_For_Empty_Template()
    {
        var renderer = CreateRenderer();
        var result = await renderer.RenderAsync("", new VariableResolveContext());
        result.ShouldBe(string.Empty);
    }

    [Fact]
    public async Task Should_Return_Same_Text_When_No_Variables()
    {
        var renderer = CreateRenderer();
        var result = await renderer.RenderAsync("你是一个智能助手。", new VariableResolveContext());
        result.ShouldBe("你是一个智能助手。");
    }

    [Fact]
    public async Task Should_Replace_Time_Variable()
    {
        var renderer = CreateRenderer();
        var result = await renderer.RenderAsync("当前时间：{{current_datetime}}。", new VariableResolveContext());
        result.ShouldNotContain("{{current_datetime}}");
        result.ShouldContain("当前时间：");
        result.ShouldContain("年");
        result.ShouldContain("月");
        result.ShouldContain("日");
    }

    [Fact]
    public async Task Should_Preserve_Unknown_Variable()
    {
        var renderer = CreateRenderer();
        var result = await renderer.RenderAsync("变量：{{unknown_var}}。", new VariableResolveContext());
        result.ShouldContain("{{unknown_var}}");
    }

    [Fact]
    public async Task Should_Replace_Multiple_Variables()
    {
        var renderer = CreateRenderer();
        var result = await renderer.RenderAsync(
            "你是{{agent_name}}，运行在{{device_name}}上。",
            new VariableResolveContext
            {
                AgentRole = new AgentRoleRuntimeDescriptorDto
                {
                    Id = "role1",
                    DisplayName = "小智",
                    Code = "test_role"
                },
                Device = new AiDevice
                {
                    Id = "dev1",
                    Alias = "客厅助手"
                }
            });

        result.ShouldContain("小智");
        result.ShouldContain("客厅助手");
        result.ShouldNotContain("{{agent_name}}");
        result.ShouldNotContain("{{device_name}}");
    }

    [Fact]
    public async Task Should_Handle_Empty_Context()
    {
        var renderer = CreateRenderer();
        var result = await renderer.RenderAsync(
            "设备：{{device_name}}，用户：{{user_name}}。",
            new VariableResolveContext());

        // Device and User are null — providers return null, so variables persist
        result.ShouldBe("设备：{{device_name}}，用户：{{user_name}}。");
    }

    [Fact]
    public async Task Should_Replace_SessionId()
    {
        var renderer = CreateRenderer();
        var result = await renderer.RenderAsync(
            "会话：{{session_id}}。",
            new VariableResolveContext { SessionId = "SESS_test123" });

        result.ShouldContain("SESS_test123");
        result.ShouldNotContain("{{session_id}}");
    }

    [Fact]
    public async Task Should_Return_Available_Variables()
    {
        var renderer = CreateRenderer();
        var variables = renderer.GetAvailableVariables();

        variables.ShouldNotBeNull();
        variables.Count.ShouldBeGreaterThan(10);
        variables.ShouldContain(v => v.Name == "current_datetime");
        variables.ShouldContain(v => v.Name == "device_name");
        variables.ShouldContain(v => v.Name == "agent_name");
        variables.ShouldContain(v => v.Name == "user_name");
        variables.ShouldContain(v => v.Name == "session_id");
    }
}
