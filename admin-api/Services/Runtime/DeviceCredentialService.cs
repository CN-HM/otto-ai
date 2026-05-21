using System.Security.Cryptography;
using System.Text;
using System.Text.Json;
using AiAdmin.Data;
using AiAdmin.Entities;
using AiAdmin.Services.Device.Dtos;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Caching.Distributed;
using Volo.Abp.DependencyInjection;
using Volo.Abp.Guids;

namespace AiAdmin.Services.Runtime;

public class DeviceCredentialService : ITransientDependency
{
    public const string ProvisioningServiceUuid = "0000FFE0-0000-1000-8000-00805F9B34FB";
    public const string ProvisioningCredentialCharacteristicUuid = "0000FFE2-0000-1000-8000-00805F9B34FB";
    public const string HttpContextItemKey = "AuthenticatedDeviceCredential";
    private static readonly TimeSpan HttpAuthClockSkew = TimeSpan.FromMinutes(5);
    private readonly AiAdminDbContext _db;
    private readonly IDistributedCache _cache;
    private readonly IGuidGenerator _guidGenerator;

    public DeviceCredentialService(AiAdminDbContext db, IDistributedCache cache, IGuidGenerator guidGenerator)
    {
        _db = db;
        _cache = cache;
        _guidGenerator = guidGenerator;
    }

    public static string NormalizeDeviceId(string? value)
    {
        if (string.IsNullOrWhiteSpace(value))
        {
            return string.Empty;
        }

        var raw = value.Trim().ToUpperInvariant();
        var compact = raw
            .Replace(":", string.Empty, StringComparison.Ordinal)
            .Replace("-", string.Empty, StringComparison.Ordinal)
            .Replace("_", string.Empty, StringComparison.Ordinal);

        if (compact.Length == 12 && compact.All(Uri.IsHexDigit))
        {
            return string.Join(":", Enumerable.Range(0, 6).Select(index => compact.Substring(index * 2, 2)));
        }

        return raw;
    }

    public async Task<DeviceProvisioningCredentialMaterial> IssueProvisioningCredentialAsync(
        DeviceProvisioningIssueDto dto,
        long currentUserId,
        bool isSuperAdmin,
        CancellationToken cancellationToken = default)
    {
        var normalizedDeviceId = NormalizeDeviceId(dto.MacAddress);
        if (string.IsNullOrWhiteSpace(normalizedDeviceId))
        {
            throw new InvalidOperationException("macAddress不能为空");
        }

        var now = DateTime.UtcNow;
        var targetAgentRoleId = NormalizeOptionalText(dto.AgentRoleId);
        var targetAgentRoleReleaseId = NormalizeOptionalText(dto.AgentRoleReleaseId);
        if (string.IsNullOrWhiteSpace(targetAgentRoleId))
        {
            throw new InvalidOperationException("必须指定智能体角色");
        }

        var roleExists = await _db.AiAgentRoles.AsNoTracking()
            .AnyAsync(x => x.Id == targetAgentRoleId, cancellationToken);
        if (!roleExists)
            throw new InvalidOperationException("Error:AgentRoleNotFound");

        if (!string.IsNullOrWhiteSpace(targetAgentRoleReleaseId))
        {
            var releaseExists = await _db.AiAgentRoleReleases.AsNoTracking()
                .AnyAsync(x => x.Id == targetAgentRoleReleaseId && x.RoleId == targetAgentRoleId, cancellationToken);
            if (!releaseExists)
                throw new InvalidOperationException("智能体角色发布版本不存在");
        }

        var device = await _db.AiDevices.FirstOrDefaultAsync(x => x.MacAddress == normalizedDeviceId, cancellationToken);
        if (device != null)
        {
            if (device.UserId != null && device.UserId != currentUserId && !isSuperAdmin)
            {
                throw new InvalidOperationException("设备已被其他用户绑定");
            }
        }
        else
        {
            device = new AiDevice
            {
                Id = _guidGenerator.Create().ToString("N"),
                MacAddress = normalizedDeviceId,
                AutoUpdate = 1,
                Sort = 0,
                Creator = currentUserId,
                CreateDate = now,
            };
            _db.AiDevices.Add(device);
        }

        device.UserId = currentUserId;
        device.AgentRoleId = targetAgentRoleId;
        device.AgentRoleReleaseId = targetAgentRoleReleaseId;
        if (!string.IsNullOrWhiteSpace(dto.Alias))
        {
            device.Alias = dto.Alias.Trim();
        }

        if (!string.IsNullOrWhiteSpace(dto.Board))
        {
            device.Board = dto.Board.Trim();
        }

        if (!string.IsNullOrWhiteSpace(dto.AppVersion))
        {
            device.AppVersion = dto.AppVersion.Trim();
        }

        if (dto.RotateCredential || string.IsNullOrWhiteSpace(device.CredentialId) || string.IsNullOrWhiteSpace(device.CredentialSecret))
        {
            device.CredentialId = Convert.ToHexString(RandomNumberGenerator.GetBytes(12)).ToLowerInvariant();
            device.CredentialSecret = Convert.ToBase64String(RandomNumberGenerator.GetBytes(32))
                .TrimEnd('=')
                .Replace('+', '-')
                .Replace('/', '_');
            device.CredentialIssuedAt = now;
        }

        device.Updater = currentUserId;
        device.UpdateDate = now;
        await _db.SaveChangesAsync(cancellationToken);

        return new DeviceProvisioningCredentialMaterial(
            device,
            device.CredentialId ?? string.Empty,
            device.CredentialSecret ?? string.Empty);
    }

    public string BuildProvisioningEnvelopeJson(
        DeviceProvisioningRuntimeContext runtime,
        DeviceProvisioningCredentialMaterial material)
    {
        var envelope = new Dictionary<string, object?>
        {
            ["type"] = "device_credentials",
            ["version"] = 1,
            ["deviceId"] = material.Device.MacAddress,
            ["credentialId"] = material.CredentialId,
            ["credentialSecret"] = material.CredentialSecret,
            ["apiBaseUrl"] = runtime.ApiBaseUrl,
            ["mqttHost"] = runtime.MqttHost,
            ["mqttPort"] = runtime.MqttPort,
            ["mqttGroupId"] = runtime.MqttGroupId,
            ["provisioningServiceUuid"] = ProvisioningServiceUuid,
            ["provisioningCharacteristicUuid"] = ProvisioningCredentialCharacteristicUuid,
        };

        return JsonSerializer.Serialize(envelope);
    }

    public async Task<DeviceCredentialHttpAuthResult> AuthenticateHttpRequestAsync(
        HttpRequest request,
        CancellationToken cancellationToken = default)
    {
        var credentialId = request.Headers["Device-Credential-Id"].ToString().Trim();
        var deviceId = NormalizeDeviceId(request.Headers["Device-Id"].ToString());
        var timestamp = request.Headers["Device-Timestamp"].ToString().Trim();
        var nonce = request.Headers["Device-Nonce"].ToString().Trim();
        var signature = request.Headers["Device-Signature"].ToString().Trim();
        if (string.IsNullOrWhiteSpace(credentialId)
            || string.IsNullOrWhiteSpace(deviceId)
            || string.IsNullOrWhiteSpace(timestamp)
            || string.IsNullOrWhiteSpace(nonce)
            || string.IsNullOrWhiteSpace(signature))
        {
            return new DeviceCredentialHttpAuthResult(false, null, "缺少设备认证头");
        }

        if (!long.TryParse(timestamp, out var unixSeconds))
        {
            return new DeviceCredentialHttpAuthResult(false, null, "设备时间戳无效");
        }

        var signedAt = DateTimeOffset.FromUnixTimeSeconds(unixSeconds);
        if (DateTimeOffset.UtcNow - signedAt > HttpAuthClockSkew || signedAt - DateTimeOffset.UtcNow > HttpAuthClockSkew)
        {
            return new DeviceCredentialHttpAuthResult(false, null, "设备签名已过期");
        }

        var device = await FindByCredentialIdAsync(credentialId, cancellationToken);
        if (device == null || string.IsNullOrWhiteSpace(device.CredentialSecret))
        {
            return new DeviceCredentialHttpAuthResult(false, null, "设备凭证不存在");
        }

        var normalizedStoredDeviceId = NormalizeDeviceId(device.MacAddress);
        if (!string.Equals(normalizedStoredDeviceId, deviceId, StringComparison.Ordinal))
        {
            return new DeviceCredentialHttpAuthResult(false, null, "设备标识与凭证不匹配");
        }

        var replayCacheKey = BuildReplayCacheKey(credentialId, timestamp, nonce);
        if (await _cache.GetStringAsync(replayCacheKey, cancellationToken) != null)
        {
            return new DeviceCredentialHttpAuthResult(false, null, "设备签名已重放");
        }

        var bodyHash = await ComputeBodyHashAsync(request, cancellationToken);
        var signedPath = $"{request.PathBase}{request.Path}";
        var content = BuildHttpSignatureContent(request.Method, signedPath, deviceId, credentialId, timestamp, nonce, bodyHash);
        var expectedSignature = ComputeBase64Hmac(device.CredentialSecret, content);
        if (!FixedTimeEquals(expectedSignature, signature))
        {
            return new DeviceCredentialHttpAuthResult(false, null, "设备签名无效");
        }

        await _cache.SetStringAsync(
            replayCacheKey,
            "1",
            new DistributedCacheEntryOptions
            {
                AbsoluteExpirationRelativeToNow = HttpAuthClockSkew,
            },
            cancellationToken);

        return new DeviceCredentialHttpAuthResult(
            true,
            new DeviceCredentialContext(device.Id, normalizedStoredDeviceId, credentialId),
            null);
    }

    public async Task<AiDevice?> FindByCredentialIdAsync(string credentialId, CancellationToken cancellationToken = default)
    {
        if (string.IsNullOrWhiteSpace(credentialId))
        {
            return null;
        }

        return await _db.AiDevices.FirstOrDefaultAsync(x => x.CredentialId == credentialId.Trim(), cancellationToken);
    }

    public async Task UpdateDeviceReportAsync(AiDevice device, DeviceReportDto? payload, CancellationToken cancellationToken = default)
    {
        var now = DateTime.UtcNow;
        var changed = false;
        if (device.LastConnectedAt != now)
        {
            device.LastConnectedAt = now;
            changed = true;
        }

        if (!string.IsNullOrWhiteSpace(payload?.Board?.Name) && !string.Equals(device.Board, payload.Board.Name, StringComparison.Ordinal))
        {
            device.Board = payload.Board.Name;
            changed = true;
        }

        if (!string.IsNullOrWhiteSpace(payload?.Application?.Version) && !string.Equals(device.AppVersion, payload.Application.Version, StringComparison.Ordinal))
        {
            device.AppVersion = payload.Application.Version;
            changed = true;
        }

        if (!changed)
        {
            return;
        }

        device.UpdateDate = now;
        await _db.SaveChangesAsync(cancellationToken);
    }

    public static string BuildHttpSignatureContent(
        string method,
        string path,
        string deviceId,
        string credentialId,
        string timestamp,
        string nonce,
        string bodyHash)
    {
        return string.Join("\n",
            method.ToUpperInvariant(),
            path,
            deviceId,
            credentialId,
            timestamp,
            nonce,
            bodyHash);
    }

    public static string ComputeBase64Hmac(string secret, string content)
    {
        var key = Encoding.UTF8.GetBytes(secret);
        var payload = Encoding.UTF8.GetBytes(content);
        return Convert.ToBase64String(HMACSHA256.HashData(key, payload));
    }

    private static bool FixedTimeEquals(string left, string right)
    {
        var leftBytes = Encoding.UTF8.GetBytes(left);
        var rightBytes = Encoding.UTF8.GetBytes(right);
        return leftBytes.Length == rightBytes.Length && CryptographicOperations.FixedTimeEquals(leftBytes, rightBytes);
    }

    private static string BuildReplayCacheKey(string credentialId, string timestamp, string nonce)
    {
        return $"device:credential:replay:{credentialId}:{timestamp}:{nonce}";
    }

    private static async Task<string> ComputeBodyHashAsync(HttpRequest request, CancellationToken cancellationToken)
    {
        request.EnableBuffering();
        request.Body.Position = 0;
        using var reader = new StreamReader(request.Body, Encoding.UTF8, detectEncodingFromByteOrderMarks: false, leaveOpen: true);
        var body = await reader.ReadToEndAsync(cancellationToken);
        request.Body.Position = 0;
        var hash = SHA256.HashData(Encoding.UTF8.GetBytes(body));
        return Convert.ToHexString(hash).ToLowerInvariant();
    }

    private static string? NormalizeOptionalText(string? value)
    {
        var normalized = value?.Trim();
        return string.IsNullOrWhiteSpace(normalized) ? null : normalized;
    }
}

public sealed record DeviceProvisioningCredentialMaterial(
    AiDevice Device,
    string CredentialId,
    string CredentialSecret);

public sealed record DeviceProvisioningRuntimeContext(
    string ApiBaseUrl,
    string MqttHost,
    int MqttPort,
    string MqttGroupId);

public sealed record DeviceCredentialContext(
    string DeviceEntityId,
    string DeviceId,
    string CredentialId);

public sealed record DeviceCredentialHttpAuthResult(
    bool Success,
    DeviceCredentialContext? Context,
    string? ErrorMessage);
