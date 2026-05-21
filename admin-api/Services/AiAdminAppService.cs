using Volo.Abp.Application.Services;
using AiAdmin.Localization;

namespace AiAdmin.Services;

/// <summary>
/// 应用服务基类，所有应用服务应继承此类
/// 提供本地化资源的标准配置
/// </summary>
public abstract class AiAdminAppService : ApplicationService
{
    /// <summary>创建应用服务实例，设置本地化资源</summary>
    protected AiAdminAppService()
    {
        LocalizationResource = typeof(AiAdminResource);
    }
}