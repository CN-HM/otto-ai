using Microsoft.EntityFrameworkCore;
using AiAdmin.Entities;

namespace AiAdmin.Data;

public partial class AiAdminDataSeeder
{
    private async Task SeedBilling()
    {
        var now = DateTime.UtcNow;

        var plans = new List<AiBillingPlan>
        {
            new()
            {
                Id = "billing_plan_free_monthly",
                Code = "free_monthly",
                Name = "免费版",
                PlanType = "monthly",
                IncludedTokens = 300_000,
                BonusTokens = 0,
                CycleMonths = 1,
                IsDefault = true,
                IsEnabled = true,
                Sort = 0,
                Remark = "注册默认开通",
                CreateDate = now,
                UpdateDate = now
            },
            new()
            {
                Id = "billing_plan_basic_monthly",
                Code = "basic_monthly",
                Name = "基础版",
                PlanType = "monthly",
                IncludedTokens = 2_000_000,
                BonusTokens = 0,
                CycleMonths = 1,
                IsDefault = false,
                IsEnabled = true,
                Sort = 1,
                Remark = "基础套餐",
                CreateDate = now,
                UpdateDate = now
            },
            new()
            {
                Id = "billing_plan_pro_monthly",
                Code = "pro_monthly",
                Name = "专业版",
                PlanType = "monthly",
                IncludedTokens = 8_000_000,
                BonusTokens = 0,
                CycleMonths = 1,
                IsDefault = false,
                IsEnabled = true,
                Sort = 2,
                Remark = "专业套餐",
                CreateDate = now,
                UpdateDate = now
            },
            new()
            {
                Id = "billing_plan_ent_monthly",
                Code = "ent_monthly",
                Name = "企业版",
                PlanType = "monthly",
                IncludedTokens = 20_000_000,
                BonusTokens = 0,
                CycleMonths = 1,
                IsDefault = false,
                IsEnabled = true,
                Sort = 3,
                Remark = "企业套餐",
                CreateDate = now,
                UpdateDate = now
            },
            new()
            {
                Id = "billing_plan_topup_1m",
                Code = "topup_1m",
                Name = "加量包 100万",
                PlanType = "topup",
                IncludedTokens = 1_000_000,
                BonusTokens = 0,
                CycleMonths = 0,
                IsDefault = false,
                IsEnabled = true,
                Sort = 10,
                Remark = "一次性加量包",
                CreateDate = now,
                UpdateDate = now
            }
        };

        var existingPlanIds = await _db.AiBillingPlans.Select(x => x.Id).ToHashSetAsync();
        var missingPlans = plans.Where(x => !existingPlanIds.Contains(x.Id)).ToList();
        if (missingPlans.Count > 0)
        {
            _db.AiBillingPlans.AddRange(missingPlans);
            await _db.SaveChangesAsync();
        }

        var prices = new List<AiBillingPlanPrice>
        {
            new()
            {
                Id = "billing_price_free_mo_demo",
                PlanId = "billing_plan_free_monthly",
                RegionCode = "DEMO",
                CurrencyCode = "DEMO",
                Amount = 0m,
                ProviderCode = "demo",
                PaymentChannelsJson = "[]",
                IsEnabled = true,
                CreateDate = now,
                UpdateDate = now
            },
            new()
            {
                Id = "billing_price_basic_mo_demo",
                PlanId = "billing_plan_basic_monthly",
                RegionCode = "DEMO",
                CurrencyCode = "DEMO",
                Amount = 0m,
                ProviderCode = "demo",
                PaymentChannelsJson = "[]",
                IsEnabled = true,
                CreateDate = now,
                UpdateDate = now
            },
            new()
            {
                Id = "billing_price_pro_mo_demo",
                PlanId = "billing_plan_pro_monthly",
                RegionCode = "DEMO",
                CurrencyCode = "DEMO",
                Amount = 0m,
                ProviderCode = "demo",
                PaymentChannelsJson = "[]",
                IsEnabled = true,
                CreateDate = now,
                UpdateDate = now
            },
            new()
            {
                Id = "billing_price_ent_mo_demo",
                PlanId = "billing_plan_ent_monthly",
                RegionCode = "DEMO",
                CurrencyCode = "DEMO",
                Amount = 0m,
                ProviderCode = "demo",
                PaymentChannelsJson = "[]",
                IsEnabled = true,
                CreateDate = now,
                UpdateDate = now
            },
            new()
            {
                Id = "billing_price_topup_1m_demo",
                PlanId = "billing_plan_topup_1m",
                RegionCode = "DEMO",
                CurrencyCode = "DEMO",
                Amount = 0m,
                ProviderCode = "demo",
                PaymentChannelsJson = "[]",
                IsEnabled = true,
                CreateDate = now,
                UpdateDate = now
            }
        };

        var existingPriceIds = await _db.AiBillingPlanPrices.Select(x => x.Id).ToHashSetAsync();
        var missingPrices = prices.Where(x => !existingPriceIds.Contains(x.Id)).ToList();
        if (missingPrices.Count > 0)
        {
            _db.AiBillingPlanPrices.AddRange(missingPrices);
            await _db.SaveChangesAsync();
        }

        var rules = new List<AiUsageConversionRule>
        {
            new()
            {
                Id = "billing_rule_llm_tokens",
                ServiceType = "LLM",
                UnitType = "tokens",
                TokensPerUnit = 1m,
                IsEnabled = true,
                Remark = "LLM 原始 tokens 1:1",
                CreateDate = now,
                UpdateDate = now
            },
            new()
            {
                Id = "billing_rule_vllm_tokens",
                ServiceType = "VLLM",
                UnitType = "tokens",
                TokensPerUnit = 1m,
                IsEnabled = true,
                Remark = "VLLM 原始 tokens 1:1",
                CreateDate = now,
                UpdateDate = now
            },
            new()
            {
                Id = "billing_rule_asr_seconds",
                ServiceType = "ASR",
                UnitType = "seconds",
                TokensPerUnit = 25m,
                IsEnabled = true,
                Remark = "ASR 每秒折算 25 token",
                CreateDate = now,
                UpdateDate = now
            },
            new()
            {
                Id = "billing_rule_tts_chars",
                ServiceType = "TTS",
                UnitType = "chars",
                TokensPerUnit = 1m,
                IsEnabled = true,
                Remark = "TTS 每字折算 1 token",
                CreateDate = now,
                UpdateDate = now
            },
            new()
            {
                Id = "billing_rule_tts_seconds",
                ServiceType = "TTS",
                UnitType = "seconds",
                TokensPerUnit = 20m,
                IsEnabled = true,
                Remark = "TTS 每秒折算 20 token",
                CreateDate = now,
                UpdateDate = now
            },
            new()
            {
                Id = "billing_rule_other_requests",
                ServiceType = "OTHER",
                UnitType = "requests",
                TokensPerUnit = 100m,
                IsEnabled = true,
                Remark = "其他调用默认按请求计费",
                CreateDate = now,
                UpdateDate = now
            }
        };

        var existingRuleIds = await _db.AiUsageConversionRules.Select(x => x.Id).ToHashSetAsync();
        var missingRules = rules.Where(x => !existingRuleIds.Contains(x.Id)).ToList();
        if (missingRules.Count > 0)
        {
            _db.AiUsageConversionRules.AddRange(missingRules);
            await _db.SaveChangesAsync();
        }
    }
}
