using AiAdmin.Data;
using AiAdmin.Infrastructure;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AiAdmin.Controllers;

/// <summary>
/// Webhook控制器
/// 接收外部服务（如Python服务）的设备状态回调
/// </summary>
[Route("webhook")]
public class WebhookController(AiAdminDbContext db) : AiAdminBaseController
{
    [HttpPost("device-status")]
    [ServiceAuth]
    public async Task<IActionResult> DeviceStatus([FromBody] DeviceStatusRequest req)
    {
        var device = await db.AiDevices
            .FirstOrDefaultAsync(d => d.MacAddress == req.MacAddress);

        if (device == null)
            return Ok(new { code = 0, msg = "device not found, ignored" });

        device.IsOnline = req.IsOnline;
        if (req.IsOnline)
            device.LastConnectedAt = DateTime.UtcNow;

        await db.SaveChangesAsync();
        return Ok(new { code = 0 });
    }
}
