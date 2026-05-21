using System.Security.Claims;
using AiAdmin.Services.Auth;
using Microsoft.Extensions.Configuration;
using NSubstitute;
using Shouldly;
using Volo.Abp.Guids;
using Xunit;

namespace AiAdmin.Domain.Tests.Services.Auth;

public class JwtTokenServiceTests
{
    private readonly JwtTokenService _jwtService;
    private readonly IConfiguration _config;
    private readonly IGuidGenerator _guidGenerator;

    public JwtTokenServiceTests()
    {
        _config = CreateTestConfiguration();
        _guidGenerator = Substitute.For<IGuidGenerator>();
        _guidGenerator.Create().Returns(Guid.NewGuid());

        _jwtService = new JwtTokenService(_config, _guidGenerator);
    }

    [Fact]
    public void Should_Generate_Valid_Token()
    {
        var (token, expire) = _jwtService.GenerateToken(1, "admin", true);

        token.ShouldNotBeNullOrEmpty();
        expire.ShouldBeGreaterThan(DateTime.UtcNow);
    }

    [Fact]
    public void Should_Validate_Valid_Token()
    {
        var (token, _) = _jwtService.GenerateToken(1, "admin", true);

        var principal = _jwtService.ValidateToken(token);

        principal.ShouldNotBeNull();
        principal!.FindFirst(ClaimTypes.NameIdentifier)!.Value.ShouldBe("1");
        principal.FindFirst("name")!.Value.ShouldBe("admin");
        principal.FindFirst("superAdmin")!.Value.ShouldBe("1");
    }

    [Fact]
    public void Should_Return_Null_For_Invalid_Token()
    {
        var principal = _jwtService.ValidateToken("invalid-token");

        principal.ShouldBeNull();
    }

    [Fact]
    public void Should_Return_Null_For_Expired_Token()
    {
        var expiredConfig = CreateTestConfiguration(expireMinutes: -10);
        var expiredService = new JwtTokenService(expiredConfig, _guidGenerator);
        var (token, _) = expiredService.GenerateToken(1, "user", false);

        var principal = expiredService.ValidateToken(token);
        principal.ShouldBeNull();
    }

    [Fact]
    public void Should_Set_SuperAdmin_Claim_Correctly()
    {
        var (token1, _) = _jwtService.GenerateToken(1, "admin", true);
        var principal1 = _jwtService.ValidateToken(token1);
        principal1!.FindFirst("superAdmin")!.Value.ShouldBe("1");

        var (token0, _) = _jwtService.GenerateToken(2, "user", false);
        var principal0 = _jwtService.ValidateToken(token0);
        principal0!.FindFirst("superAdmin")!.Value.ShouldBe("0");
    }

    [Fact]
    public void Should_Include_User_Id_As_Sub_Claim()
    {
        var (token, _) = _jwtService.GenerateToken(42, "test", false);

        var principal = _jwtService.ValidateToken(token);

        principal!.FindFirst(ClaimTypes.NameIdentifier)!.Value.ShouldBe("42");
    }

    private static IConfiguration CreateTestConfiguration(int expireMinutes = 10080)
    {
        var configData = new Dictionary<string, string?>
        {
            ["Jwt:Issuer"] = "TestIssuer",
            ["Jwt:Audience"] = "TestAudience",
            ["Jwt:SecretKey"] = "test-secret-key-that-is-long-enough-for-hmac-sha256-algorithm-min-32-chars",
            ["Jwt:ExpireMinutes"] = expireMinutes.ToString()
        };
        return new ConfigurationBuilder().AddInMemoryCollection(configData).Build();
    }
}
