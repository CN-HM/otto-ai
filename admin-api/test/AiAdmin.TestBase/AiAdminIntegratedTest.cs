using Volo.Abp;
using Volo.Abp.Testing;

namespace AiAdmin.TestBase;

public abstract class AiAdminIntegratedTest : AbpIntegratedTest<AiAdminTestBaseModule>
{
    protected AiAdminTestDataBuilder DataBuilder => GetRequiredService<AiAdminTestDataBuilder>();

    protected override void SetAbpApplicationCreationOptions(AbpApplicationCreationOptions options)
    {
        options.UseAutofac();
    }

    public override void Dispose()
    {
        base.Dispose();
        // Force cleanup of any pending finalizers to prevent cross-test
        // SQLite connection state pollution with in-memory databases.
        GC.Collect();
        GC.WaitForPendingFinalizers();
    }
}
