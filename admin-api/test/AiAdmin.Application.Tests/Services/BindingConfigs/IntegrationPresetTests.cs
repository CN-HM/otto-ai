using AiAdmin.Data;
using AiAdmin.Services.BindingConfigs;
using AiAdmin.TestBase;
using Microsoft.Data.Sqlite;
using Microsoft.EntityFrameworkCore;
using Shouldly;
using Xunit;

namespace AiAdmin.Application.Tests.Services.BindingConfigs;

public class IntegrationPresetTests : AiAdminIntegratedTest
{
    private readonly BindingConfigService _service;

    public IntegrationPresetTests()
    {
        _service = GetRequiredService<BindingConfigService>();
        SeedIntegrationPresets();
    }

    private void SeedIntegrationPresets()
    {
        var db = GetRequiredService<AiAdminDbContext>();
        var conn = db.Database.GetDbConnection();
        if (conn.State != System.Data.ConnectionState.Open)
            conn.Open();

        using var cmd = conn.CreateCommand();
        cmd.CommandText = """
            INSERT OR IGNORE INTO ai_provider_integration (id, code, name, description, provider_type, provider_code, status, is_enabled, is_default, supports_asr, supports_tts, supports_llm, supports_mem, sort, created_at, updated_at)
            VALUES
            ('INTEGRATION_ArkDefault', 'ArkDefault', '火山方舟', '火山引擎豆包大模型平台，支持 ASR / LLM / TTS / Embedding 全栈能力。', 'ark', 'ark', 'active', 1, 1, 1, 1, 1, 1, 1, datetime('now'), datetime('now')),
            ('INTEGRATION_DoubaoSpeechDefault', 'DoubaoSpeechDefault', '豆包语音', '火山引擎豆包语音平台，专注于 ASR 语音识别与 TTS 语音合成。', 'doubao_speech', 'doubao_speech', 'active', 1, 0, 1, 1, 0, 0, 2, datetime('now'), datetime('now')),
            ('INTEGRATION_DashScopeDefault', 'DashScopeDefault', '阿里百炼', '阿里云 DashScope 百炼平台，支持 LLM / TTS / Embedding 能力。', 'dashscope', 'dashscope', 'active', 1, 0, 0, 1, 1, 1, 3, datetime('now'), datetime('now'));
            """;
        cmd.ExecuteNonQuery();
    }

    [Fact]
    public async Task Should_Return_Three_Presets()
    {
        var presets = await _service.GetIntegrationPresetsAsync();

        presets.Count.ShouldBe(3);
        presets.Select(p => p.PresetKey).ShouldContain("ark");
        presets.Select(p => p.PresetKey).ShouldContain("doubao_speech");
        presets.Select(p => p.PresetKey).ShouldContain("dashscope");
    }

    [Fact]
    public async Task Should_Return_Correct_Auth_Fields_Per_Preset()
    {
        var presets = await _service.GetIntegrationPresetsAsync();

        var ark = presets.First(p => p.PresetKey == "ark");
        ark.AuthFields.ShouldBe(["apiKey"]);

        var doubao = presets.First(p => p.PresetKey == "doubao_speech");
        doubao.AuthFields.ShouldBe(["appId", "accessToken", "secretKey"]);

        var dashscope = presets.First(p => p.PresetKey == "dashscope");
        dashscope.AuthFields.ShouldBe(["apiKey"]);
    }

    [Fact]
    public async Task Should_Have_NonEmpty_Names_And_Descriptions()
    {
        var presets = await _service.GetIntegrationPresetsAsync();

        foreach (var preset in presets)
        {
            preset.Name.ShouldNotBeNullOrWhiteSpace();
            preset.Description.ShouldNotBeNullOrWhiteSpace();
        }
    }

    [Fact]
    public async Task Should_Return_Correct_Provider_Scopes()
    {
        var presets = await _service.GetIntegrationPresetsAsync();

        var ark = presets.First(p => p.PresetKey == "ark");
        ark.SupportsAsr.ShouldBeTrue();
        ark.SupportsTts.ShouldBeTrue();
        ark.SupportsLlm.ShouldBeTrue();
        ark.SupportsMem.ShouldBeTrue();

        var doubao = presets.First(p => p.PresetKey == "doubao_speech");
        doubao.SupportsAsr.ShouldBeTrue();
        doubao.SupportsTts.ShouldBeTrue();

        var dashscope = presets.First(p => p.PresetKey == "dashscope");
        dashscope.SupportsTts.ShouldBeTrue();
        dashscope.SupportsLlm.ShouldBeTrue();
        dashscope.SupportsMem.ShouldBeTrue();
    }

    [Fact]
    public async Task Should_Have_Unique_PresetKeys()
    {
        var presets = await _service.GetIntegrationPresetsAsync();

        var keys = presets.Select(p => p.PresetKey).ToList();
        keys.Count.ShouldBe(keys.Distinct().Count());
    }

    [Fact]
    public async Task Should_Preserve_ApiKey_On_Reseed()
    {
        var db = GetRequiredService<AiAdminDbContext>();
        var conn = db.Database.GetDbConnection();
        if (conn.State != System.Data.ConnectionState.Open)
            conn.Open();

        // Set credentials
        using (var updateCmd = conn.CreateCommand())
        {
            updateCmd.CommandText = "UPDATE ai_provider_integration SET api_key = 'user_key', secret_key = 'user_secret' WHERE id = 'INTEGRATION_ArkDefault'";
            updateCmd.ExecuteNonQuery();
        }

        // Verify they persist
        using var readCmd = conn.CreateCommand();
        readCmd.CommandText = "SELECT api_key, secret_key FROM ai_provider_integration WHERE id = 'INTEGRATION_ArkDefault'";
        using var reader = readCmd.ExecuteReader();
        reader.Read();
        reader.GetString(0).ShouldBe("user_key");
        reader.GetString(1).ShouldBe("user_secret");
    }
}
