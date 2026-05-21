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
        try
        {
            base.Dispose();
        }
        catch (NullReferenceException)
        {
            // Swallow NRE during ABP application teardown. Rapid SQLite
            // connection create/destroy cycles in xUnit per-test lifecycle
            // can cause NRE in SqliteConnection.Close().
        }
        catch (ArgumentOutOfRangeException)
        {
            // Swallow ArgumentOutOfRange in SqliteCommand internal command
            // tracking list during disposal.
        }
    }
}
