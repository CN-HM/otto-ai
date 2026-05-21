using System.Text.Json;
using System.Text.Json.Serialization;

namespace AiAdmin.Services.Billing;

[JsonConverter(typeof(BillingSubscriptionStatusJsonConverter))]
public enum BillingSubscriptionStatus
{
    Active,
    Expired,
    Paused
}

[JsonConverter(typeof(BillingChargeStatusJsonConverter))]
public enum BillingChargeStatus
{
    Charged,
    Partial,
    Exhausted
}

[JsonConverter(typeof(BillingOrderStatusJsonConverter))]
public enum BillingOrderStatus
{
    Created,
    Pending,
    Paid,
    Activated,
    Cancelled,
    Failed
}

public static class BillingSubscriptionStatuses
{
    public const string Active = "active";
    public const string Expired = "expired";
    public const string Paused = "paused";

    public static BillingSubscriptionStatus? TryParse(string? value)
    {
        return value?.Trim().ToLowerInvariant() switch
        {
            Active => BillingSubscriptionStatus.Active,
            Expired => BillingSubscriptionStatus.Expired,
            Paused => BillingSubscriptionStatus.Paused,
            _ => null
        };
    }

    public static BillingSubscriptionStatus Parse(string? value)
    {
        return TryParse(value) ?? BillingSubscriptionStatus.Active;
    }

    public static string ToStorageValue(BillingSubscriptionStatus status)
    {
        return status switch
        {
            BillingSubscriptionStatus.Expired => Expired,
            BillingSubscriptionStatus.Paused => Paused,
            _ => Active
        };
    }
}

public static class BillingChargeStatuses
{
    public const string Charged = "charged";
    public const string Partial = "partial";
    public const string Exhausted = "exhausted";

    public static BillingChargeStatus? TryParse(string? value)
    {
        return value?.Trim().ToLowerInvariant() switch
        {
            Charged => BillingChargeStatus.Charged,
            Partial => BillingChargeStatus.Partial,
            Exhausted => BillingChargeStatus.Exhausted,
            _ => null
        };
    }

    public static BillingChargeStatus Parse(string? value)
    {
        return TryParse(value) ?? BillingChargeStatus.Charged;
    }

    public static string ToStorageValue(BillingChargeStatus status)
    {
        return status switch
        {
            BillingChargeStatus.Partial => Partial,
            BillingChargeStatus.Exhausted => Exhausted,
            _ => Charged
        };
    }
}

public static class BillingOrderStatuses
{
    public const string Created = "created";
    public const string Pending = "pending";
    public const string Paid = "paid";
    public const string Activated = "activated";
    public const string Cancelled = "cancelled";
    public const string Failed = "failed";

    public static BillingOrderStatus? TryParse(string? value)
    {
        return value?.Trim().ToLowerInvariant() switch
        {
            Created => BillingOrderStatus.Created,
            Pending => BillingOrderStatus.Pending,
            Paid => BillingOrderStatus.Paid,
            Activated => BillingOrderStatus.Activated,
            Cancelled => BillingOrderStatus.Cancelled,
            Failed => BillingOrderStatus.Failed,
            _ => null
        };
    }

    public static BillingOrderStatus Parse(string? value)
    {
        return TryParse(value) ?? BillingOrderStatus.Created;
    }

    public static string ToStorageValue(BillingOrderStatus status)
    {
        return status switch
        {
            BillingOrderStatus.Pending => Pending,
            BillingOrderStatus.Paid => Paid,
            BillingOrderStatus.Activated => Activated,
            BillingOrderStatus.Cancelled => Cancelled,
            BillingOrderStatus.Failed => Failed,
            _ => Created
        };
    }

    public static bool CanPay(BillingOrderStatus status)
    {
        return status is BillingOrderStatus.Created or BillingOrderStatus.Pending;
    }
}

public sealed class BillingSubscriptionStatusJsonConverter : JsonConverter<BillingSubscriptionStatus>
{
    public override BillingSubscriptionStatus Read(ref Utf8JsonReader reader, Type typeToConvert, JsonSerializerOptions options)
    {
        if (reader.TokenType != JsonTokenType.String)
        {
            throw new JsonException("Billing subscription status must be a string.");
        }

        return BillingSubscriptionStatuses.Parse(reader.GetString());
    }

    public override void Write(Utf8JsonWriter writer, BillingSubscriptionStatus value, JsonSerializerOptions options)
    {
        writer.WriteStringValue(BillingSubscriptionStatuses.ToStorageValue(value));
    }
}

public sealed class BillingChargeStatusJsonConverter : JsonConverter<BillingChargeStatus>
{
    public override BillingChargeStatus Read(ref Utf8JsonReader reader, Type typeToConvert, JsonSerializerOptions options)
    {
        if (reader.TokenType != JsonTokenType.String)
        {
            throw new JsonException("Billing charge status must be a string.");
        }

        return BillingChargeStatuses.Parse(reader.GetString());
    }

    public override void Write(Utf8JsonWriter writer, BillingChargeStatus value, JsonSerializerOptions options)
    {
        writer.WriteStringValue(BillingChargeStatuses.ToStorageValue(value));
    }
}

public sealed class BillingOrderStatusJsonConverter : JsonConverter<BillingOrderStatus>
{
    public override BillingOrderStatus Read(ref Utf8JsonReader reader, Type typeToConvert, JsonSerializerOptions options)
    {
        if (reader.TokenType != JsonTokenType.String)
        {
            throw new JsonException("Billing order status must be a string.");
        }

        return BillingOrderStatuses.Parse(reader.GetString());
    }

    public override void Write(Utf8JsonWriter writer, BillingOrderStatus value, JsonSerializerOptions options)
    {
        writer.WriteStringValue(BillingOrderStatuses.ToStorageValue(value));
    }
}
