using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Features;

namespace AiAdmin.TestBase;

/// <summary>
/// Minimal IApplicationBuilder implementation for integration tests
/// that skip the ASP.NET Core pipeline. All Use() calls are no-ops.
/// </summary>
public class TestApplicationBuilder : IApplicationBuilder
{
    public IServiceProvider ApplicationServices { get; set; } = null!;

    public IFeatureCollection ServerFeatures { get; } = new FeatureCollection();

    public IDictionary<string, object?> Properties { get; } = new Dictionary<string, object?>();

    public RequestDelegate Build()
    {
        return _ => Task.CompletedTask;
    }

    public IApplicationBuilder New()
    {
        return new TestApplicationBuilder
        {
            ApplicationServices = ApplicationServices
        };
    }

    public IApplicationBuilder Use(Func<RequestDelegate, RequestDelegate> middleware)
    {
        return this;
    }
}
