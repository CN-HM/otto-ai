using Volo.Abp.Modularity;

namespace AiAdmin.Application.Tests;

[DependsOn(typeof(TestBase.AiAdminTestBaseModule))]
public class AiAdminApplicationTestModule : AbpModule
{
}
