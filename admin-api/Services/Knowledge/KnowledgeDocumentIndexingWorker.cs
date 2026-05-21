using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace AiAdmin.Services.Knowledge;

public class KnowledgeDocumentIndexingWorker : BackgroundService
{
    private readonly IServiceScopeFactory _scopeFactory;
    private readonly ILogger<KnowledgeDocumentIndexingWorker> _logger;

    public KnowledgeDocumentIndexingWorker(IServiceScopeFactory scopeFactory, ILogger<KnowledgeDocumentIndexingWorker> logger)
    {
        _scopeFactory = scopeFactory;
        _logger = logger;
    }

    protected override async Task ExecuteAsync(CancellationToken stoppingToken)
    {
        while (!stoppingToken.IsCancellationRequested)
        {
            try
            {
                using var scope = _scopeFactory.CreateScope();
                var service = scope.ServiceProvider.GetRequiredService<KnowledgeBaseService>();
                var processed = await service.ProcessPendingDocumentsAsync(5, stoppingToken);
                await Task.Delay(processed > 0 ? TimeSpan.FromSeconds(2) : TimeSpan.FromSeconds(10), stoppingToken);
            }
            catch (OperationCanceledException) when (stoppingToken.IsCancellationRequested)
            {
                break;
            }
            catch (Exception ex)
            {
                _logger.LogWarning(ex, "Knowledge document indexing worker failed, will retry in 10s");
                await Task.Delay(TimeSpan.FromSeconds(10), stoppingToken);
            }
        }
    }
}
