using System.Security.Claims;
using AiAdmin.Infrastructure;
using Shouldly;
using Xunit;

namespace AiAdmin.Domain.Tests.Entities;

public class ClaimsPrincipalExtensionsTests
{
    [Fact]
    public void Should_Get_UserId_From_Sub_Claim()
    {
        var principal = new ClaimsPrincipal(new ClaimsIdentity([
            new Claim("sub", "42"),
            new Claim("name", "testuser")
        ], "test"));

        var userId = principal.GetUserId();

        userId.ShouldBe(42);
    }

    [Fact]
    public void Should_Get_UserId_From_NameIdentifier_Claim()
    {
        var principal = new ClaimsPrincipal(new ClaimsIdentity([
            new Claim(ClaimTypes.NameIdentifier, "99"),
            new Claim("name", "testuser")
        ], "test"));

        var userId = principal.GetUserId();

        userId.ShouldBe(99);
    }

    [Fact]
    public void Should_Return_Zero_When_No_UserId_Claim()
    {
        var principal = new ClaimsPrincipal(new ClaimsIdentity());

        var userId = principal.GetUserId();

        userId.ShouldBe(0);
    }

    [Fact]
    public void Should_Detect_SuperAdmin()
    {
        var superAdmin = new ClaimsPrincipal(new ClaimsIdentity([
            new Claim("superAdmin", "1")
        ], "test"));

        var normalUser = new ClaimsPrincipal(new ClaimsIdentity([
            new Claim("superAdmin", "0")
        ], "test"));

        superAdmin.IsSuperAdmin().ShouldBeTrue();
        normalUser.IsSuperAdmin().ShouldBeFalse();
    }

    [Fact]
    public void Should_Get_Username_From_Name_Claim()
    {
        var principal = new ClaimsPrincipal(new ClaimsIdentity([
            new Claim("name", "john_doe")
        ], "test"));

        var username = principal.GetUsername();

        username.ShouldBe("john_doe");
    }
}
