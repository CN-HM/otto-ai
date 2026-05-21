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
}
