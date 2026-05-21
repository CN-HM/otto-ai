using AiAdmin.Infrastructure;
using Shouldly;
using Xunit;

namespace AiAdmin.Domain.Tests.Infrastructure;

public class ResultTests
{
    [Fact]
    public void Should_Create_Ok_Result()
    {
        var result = Result<string>.Ok("hello");

        result.Code.ShouldBe(0);
        result.Msg.ShouldBe("success");
        result.Data.ShouldBe("hello");
    }

    [Fact]
    public void Should_Create_Ok_Result_With_Null_Data()
    {
        var result = Result<object>.Ok();

        result.Code.ShouldBe(0);
        result.Data.ShouldBeNull();
    }

    [Fact]
    public void Should_Create_Error_Result()
    {
        var result = Result<string>.Error("something went wrong", 400);

        result.Code.ShouldBe(400);
        result.Msg.ShouldBe("something went wrong");
        result.Data.ShouldBeNull();
    }
}
