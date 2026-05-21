using AiAdmin.Data;
using AiAdmin.Entities;
using Microsoft.EntityFrameworkCore;
using Volo.Abp.DependencyInjection;

namespace AiAdmin.Services.Runtime;

/// <summary>
/// 设备运行时服务，管理设备在线状态的数据库操作
/// 提供MAC地址查询、在线/离线状态更新功能
/// </summary>
public class DeviceRuntimeService : ITransientDependency
{
    /// <summary>数据库上下文</summary>
    private readonly AiAdminDbContext _db;

    /// <summary>创建设备运行时服务实例</summary>
    public DeviceRuntimeService(AiAdminDbContext db)
    {
        _db = db;
    }

    /// <summary>
    /// 根据MAC地址查找设备
    /// </summary>
    /// <param name="macAddress">MAC地址</param>
    /// <returns>设备实体，不存在返回null</returns>
    public Task<AiDevice?> FindByMacAddressAsync(string macAddress, CancellationToken cancellationToken = default)
    {
        return _db.AiDevices.FirstOrDefaultAsync(x => x.MacAddress == macAddress, cancellationToken);
    }

    /// <summary>
    /// 设置设备为在线状态
    /// 更新IsOnline标志和最后连接时间
    /// </summary>
    /// <param name="macAddress">MAC地址</param>
    /// <returns>true表示成功，false表示设备不存在</returns>
    public async Task<bool> SetDeviceOnlineAsync(string macAddress, CancellationToken cancellationToken = default)
    {
        var device = await _db.AiDevices.FirstOrDefaultAsync(x => x.MacAddress == macAddress, cancellationToken);
        if (device == null)
        {
            return false;
        }

        device.IsOnline = true;
        device.LastConnectedAt = DateTime.UtcNow;
        await _db.SaveChangesAsync(cancellationToken);
        return true;
    }

    /// <summary>
    /// 设置设备为离线状态
    /// 更新IsOnline标志为false
    /// </summary>
    /// <param name="macAddress">MAC地址</param>
    /// <returns>true表示成功，false表示设备不存在</returns>
    public async Task<bool> SetDeviceOfflineAsync(string macAddress, CancellationToken cancellationToken = default)
    {
        var device = await _db.AiDevices.FirstOrDefaultAsync(x => x.MacAddress == macAddress, cancellationToken);
        if (device == null)
        {
            return false;
        }

        device.IsOnline = false;
        await _db.SaveChangesAsync(cancellationToken);
        return true;
    }
}
