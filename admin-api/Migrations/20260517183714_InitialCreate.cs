using System;
using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace AiAdmin.Migrations
{
    /// <inheritdoc />
    public partial class InitialCreate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterDatabase()
                .Annotation("Npgsql:PostgresExtension:vector", ",,");

            migrationBuilder.CreateTable(
                name: "AbpAuditLogExcelFiles",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    TenantId = table.Column<Guid>(type: "uuid", nullable: true),
                    FileName = table.Column<string>(type: "character varying(256)", maxLength: 256, nullable: true),
                    CreationTime = table.Column<DateTime>(type: "timestamp without time zone", nullable: false),
                    CreatorId = table.Column<Guid>(type: "uuid", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AbpAuditLogExcelFiles", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AbpAuditLogs",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    ApplicationName = table.Column<string>(type: "character varying(96)", maxLength: 96, nullable: true),
                    UserId = table.Column<Guid>(type: "uuid", nullable: true),
                    UserName = table.Column<string>(type: "character varying(256)", maxLength: 256, nullable: true),
                    TenantId = table.Column<Guid>(type: "uuid", nullable: true),
                    TenantName = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: true),
                    ImpersonatorUserId = table.Column<Guid>(type: "uuid", nullable: true),
                    ImpersonatorUserName = table.Column<string>(type: "character varying(256)", maxLength: 256, nullable: true),
                    ImpersonatorTenantId = table.Column<Guid>(type: "uuid", nullable: true),
                    ImpersonatorTenantName = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: true),
                    ExecutionTime = table.Column<DateTime>(type: "timestamp without time zone", nullable: false),
                    ExecutionDuration = table.Column<int>(type: "integer", nullable: false),
                    ClientIpAddress = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: true),
                    ClientName = table.Column<string>(type: "character varying(128)", maxLength: 128, nullable: true),
                    ClientId = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: true),
                    CorrelationId = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: true),
                    BrowserInfo = table.Column<string>(type: "character varying(512)", maxLength: 512, nullable: true),
                    HttpMethod = table.Column<string>(type: "character varying(16)", maxLength: 16, nullable: true),
                    Url = table.Column<string>(type: "character varying(256)", maxLength: 256, nullable: true),
                    Exceptions = table.Column<string>(type: "text", nullable: true),
                    Comments = table.Column<string>(type: "character varying(256)", maxLength: 256, nullable: true),
                    HttpStatusCode = table.Column<int>(type: "integer", nullable: true),
                    ExtraProperties = table.Column<string>(type: "text", nullable: false),
                    ConcurrencyStamp = table.Column<string>(type: "character varying(40)", maxLength: 40, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AbpAuditLogs", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AbpBackgroundJobs",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    ApplicationName = table.Column<string>(type: "character varying(96)", maxLength: 96, nullable: true),
                    JobName = table.Column<string>(type: "character varying(128)", maxLength: 128, nullable: false),
                    JobArgs = table.Column<string>(type: "character varying(1048576)", maxLength: 1048576, nullable: false),
                    TryCount = table.Column<short>(type: "smallint", nullable: false, defaultValue: (short)0),
                    CreationTime = table.Column<DateTime>(type: "timestamp without time zone", nullable: false),
                    NextTryTime = table.Column<DateTime>(type: "timestamp without time zone", nullable: false),
                    LastTryTime = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    IsAbandoned = table.Column<bool>(type: "boolean", nullable: false, defaultValue: false),
                    Priority = table.Column<byte>(type: "smallint", nullable: false, defaultValue: (byte)15),
                    ExtraProperties = table.Column<string>(type: "text", nullable: false),
                    ConcurrencyStamp = table.Column<string>(type: "character varying(40)", maxLength: 40, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AbpBackgroundJobs", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AbpSettingDefinitions",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    Name = table.Column<string>(type: "character varying(128)", maxLength: 128, nullable: false),
                    DisplayName = table.Column<string>(type: "character varying(256)", maxLength: 256, nullable: false),
                    Description = table.Column<string>(type: "character varying(512)", maxLength: 512, nullable: true),
                    DefaultValue = table.Column<string>(type: "character varying(2048)", maxLength: 2048, nullable: true),
                    IsVisibleToClients = table.Column<bool>(type: "boolean", nullable: false),
                    Providers = table.Column<string>(type: "character varying(1024)", maxLength: 1024, nullable: true),
                    IsInherited = table.Column<bool>(type: "boolean", nullable: false),
                    IsEncrypted = table.Column<bool>(type: "boolean", nullable: false),
                    ExtraProperties = table.Column<string>(type: "text", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AbpSettingDefinitions", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AbpSettings",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    Name = table.Column<string>(type: "character varying(128)", maxLength: 128, nullable: false),
                    Value = table.Column<string>(type: "character varying(2048)", maxLength: 2048, nullable: false),
                    ProviderName = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: true),
                    ProviderKey = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AbpSettings", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "ai_action_rule",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    agent_role_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    action_type = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    name = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: false),
                    instruction = table.Column<string>(type: "text", nullable: true),
                    is_enabled = table.Column<bool>(type: "boolean", nullable: false),
                    config_json = table.Column<string>(type: "jsonb", nullable: true),
                    creator = table.Column<long>(type: "bigint", nullable: true),
                    created_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: false),
                    updater = table.Column<long>(type: "bigint", nullable: true),
                    updated_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_action_rule", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_agent",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    user_id = table.Column<long>(type: "bigint", nullable: true),
                    agent_code = table.Column<string>(type: "character varying(36)", maxLength: 36, nullable: true),
                    agent_name = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: true),
                    tts_voice_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    tts_language = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: true),
                    tts_volume = table.Column<double>(type: "double precision", nullable: true),
                    tts_rate = table.Column<double>(type: "double precision", nullable: true),
                    tts_pitch = table.Column<double>(type: "double precision", nullable: true),
                    chat_history_conf = table.Column<int>(type: "integer", nullable: true),
                    system_prompt = table.Column<string>(type: "text", nullable: true),
                    memory_library_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    memory_entity_scope = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: true),
                    memory_top_k = table.Column<int>(type: "integer", nullable: true),
                    memory_min_score = table.Column<double>(type: "double precision", nullable: true),
                    memory_intent_recall = table.Column<bool>(type: "boolean", nullable: true),
                    memory_query_rewrite = table.Column<bool>(type: "boolean", nullable: true),
                    memory_rerank = table.Column<bool>(type: "boolean", nullable: true),
                    lang_code = table.Column<string>(type: "character varying(10)", maxLength: 10, nullable: true),
                    language = table.Column<string>(type: "character varying(10)", maxLength: 10, nullable: true),
                    sort = table.Column<int>(type: "integer", nullable: false),
                    creator = table.Column<long>(type: "bigint", nullable: true),
                    created_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    updater = table.Column<long>(type: "bigint", nullable: true),
                    updated_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_agent", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_agent_context_provider",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    agent_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    url = table.Column<string>(type: "character varying(500)", maxLength: 500, nullable: true),
                    headers = table.Column<string>(type: "jsonb", nullable: true),
                    create_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_agent_context_provider", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_agent_plugin_mapping",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    agent_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    plugin_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    param_info = table.Column<string>(type: "jsonb", nullable: false),
                    provider_code = table.Column<string>(type: "character varying(50)", maxLength: 50, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_agent_plugin_mapping", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_agent_role",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    code = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: false),
                    name = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: false),
                    display_name = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: true),
                    description = table.Column<string>(type: "text", nullable: true),
                    status = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    is_system = table.Column<bool>(type: "boolean", nullable: false),
                    icon = table.Column<string>(type: "character varying(255)", maxLength: 255, nullable: true),
                    cover_image = table.Column<string>(type: "text", nullable: true),
                    theme_token = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: true),
                    pipeline_template_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    asr_profile_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    vad_profile_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    llm_profile_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    tts_profile_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    tts_voice_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    tts_language = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: true),
                    tts_volume = table.Column<double>(type: "double precision", nullable: true),
                    tts_rate = table.Column<double>(type: "double precision", nullable: true),
                    tts_pitch = table.Column<double>(type: "double precision", nullable: true),
                    chat_history_conf = table.Column<int>(type: "integer", nullable: true),
                    system_prompt = table.Column<string>(type: "text", nullable: true),
                    knowledge_no_hit_fallback_text = table.Column<string>(type: "text", nullable: true),
                    memory_library_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    memory_entity_scope = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: true),
                    memory_top_k = table.Column<int>(type: "integer", nullable: true),
                    memory_min_score = table.Column<double>(type: "double precision", nullable: true),
                    memory_intent_recall = table.Column<bool>(type: "boolean", nullable: true),
                    memory_query_rewrite = table.Column<bool>(type: "boolean", nullable: true),
                    memory_rerank = table.Column<bool>(type: "boolean", nullable: true),
                    lang_code = table.Column<string>(type: "character varying(10)", maxLength: 10, nullable: true),
                    language = table.Column<string>(type: "character varying(10)", maxLength: 10, nullable: true),
                    current_release_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    current_version = table.Column<string>(type: "character varying(40)", maxLength: 40, nullable: true),
                    published_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    sort = table.Column<int>(type: "integer", nullable: false),
                    creator = table.Column<long>(type: "bigint", nullable: true),
                    created_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    updater = table.Column<long>(type: "bigint", nullable: true),
                    updated_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_agent_role", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_agent_role_context_provider",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    agent_role_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    url = table.Column<string>(type: "character varying(500)", maxLength: 500, nullable: true),
                    headers = table.Column<string>(type: "jsonb", nullable: true),
                    create_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_agent_role_context_provider", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_agent_role_knowledge_binding",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    agent_role_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    dataset_id = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: false),
                    sort = table.Column<int>(type: "integer", nullable: false),
                    enabled = table.Column<bool>(type: "boolean", nullable: false),
                    top_k = table.Column<int>(type: "integer", nullable: true),
                    min_score = table.Column<double>(type: "double precision", nullable: true),
                    rerank_enabled = table.Column<bool>(type: "boolean", nullable: true),
                    max_chunks = table.Column<int>(type: "integer", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_agent_role_knowledge_binding", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_agent_role_plugin_mapping",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    agent_role_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    plugin_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    param_info = table.Column<string>(type: "jsonb", nullable: false),
                    provider_code = table.Column<string>(type: "character varying(50)", maxLength: 50, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_agent_role_plugin_mapping", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_agent_role_release",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    role_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    version = table.Column<string>(type: "character varying(40)", maxLength: 40, nullable: false),
                    status = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    snapshot_json = table.Column<string>(type: "jsonb", nullable: false),
                    remark = table.Column<string>(type: "character varying(255)", maxLength: 255, nullable: true),
                    published_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    creator = table.Column<long>(type: "bigint", nullable: true),
                    created_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    updater = table.Column<long>(type: "bigint", nullable: true),
                    updated_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_agent_role_release", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_billing_plan",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    code = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: false),
                    name = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: false),
                    plan_type = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    included_tokens = table.Column<long>(type: "bigint", nullable: false),
                    bonus_tokens = table.Column<long>(type: "bigint", nullable: false),
                    cycle_months = table.Column<int>(type: "integer", nullable: false),
                    is_default = table.Column<bool>(type: "boolean", nullable: false),
                    is_enabled = table.Column<bool>(type: "boolean", nullable: false),
                    sort = table.Column<int>(type: "integer", nullable: false),
                    remark = table.Column<string>(type: "text", nullable: true),
                    creator = table.Column<long>(type: "bigint", nullable: true),
                    create_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    updater = table.Column<long>(type: "bigint", nullable: true),
                    update_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_billing_plan", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_billing_plan_price",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    plan_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    region_code = table.Column<string>(type: "character varying(10)", maxLength: 10, nullable: false),
                    currency_code = table.Column<string>(type: "character varying(10)", maxLength: 10, nullable: false),
                    amount = table.Column<decimal>(type: "numeric(18,2)", precision: 18, scale: 2, nullable: false),
                    provider_code = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    payment_channels_json = table.Column<string>(type: "text", nullable: true),
                    is_enabled = table.Column<bool>(type: "boolean", nullable: false),
                    creator = table.Column<long>(type: "bigint", nullable: true),
                    create_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    updater = table.Column<long>(type: "bigint", nullable: true),
                    update_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_billing_plan_price", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_device",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    user_id = table.Column<long>(type: "bigint", nullable: true),
                    mac_address = table.Column<string>(type: "character varying(50)", maxLength: 50, nullable: true),
                    credential_id = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: true),
                    credential_secret = table.Column<string>(type: "character varying(128)", maxLength: 128, nullable: true),
                    credential_issued_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    last_connected_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    auto_update = table.Column<short>(type: "smallint", nullable: false),
                    board = table.Column<string>(type: "character varying(50)", maxLength: 50, nullable: true),
                    alias = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: true),
                    agent_role_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    agent_role_release_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    app_version = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: true),
                    sort = table.Column<int>(type: "integer", nullable: false),
                    creator = table.Column<long>(type: "bigint", nullable: true),
                    create_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    updater = table.Column<long>(type: "bigint", nullable: true),
                    update_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    is_online = table.Column<bool>(type: "boolean", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_device", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_mcp_tool",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    code = table.Column<string>(type: "character varying(50)", maxLength: 50, nullable: false),
                    name = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: false),
                    description = table.Column<string>(type: "character varying(500)", maxLength: 500, nullable: true),
                    category = table.Column<string>(type: "character varying(50)", maxLength: 50, nullable: true),
                    is_system = table.Column<bool>(type: "boolean", nullable: false),
                    param_schema = table.Column<string>(type: "jsonb", nullable: true),
                    status = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    sort = table.Column<int>(type: "integer", nullable: false),
                    created_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: false),
                    updated_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    creator = table.Column<long>(type: "bigint", nullable: false),
                    updater = table.Column<long>(type: "bigint", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_mcp_tool", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_memory_extraction_run",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    library_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    agent_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    device_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    user_id = table.Column<long>(type: "bigint", nullable: true),
                    entity_scope = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    entity_id = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: false),
                    session_id = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: true),
                    user_text = table.Column<string>(type: "text", nullable: true),
                    assistant_text = table.Column<string>(type: "text", nullable: true),
                    conversation_hash = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: true),
                    status = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    started_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: false),
                    finished_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    error_message = table.Column<string>(type: "text", nullable: true),
                    matched_rule_count = table.Column<int>(type: "integer", nullable: false),
                    candidate_count = table.Column<int>(type: "integer", nullable: false),
                    saved_count = table.Column<int>(type: "integer", nullable: false),
                    updated_count = table.Column<int>(type: "integer", nullable: false),
                    skipped_count = table.Column<int>(type: "integer", nullable: false),
                    rejected_count = table.Column<int>(type: "integer", nullable: false),
                    created_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_memory_extraction_run", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_memory_library",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    user_id = table.Column<long>(type: "bigint", nullable: true),
                    agent_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    code = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: false),
                    name = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: false),
                    description = table.Column<string>(type: "text", nullable: true),
                    status = table.Column<short>(type: "smallint", nullable: false),
                    is_default = table.Column<bool>(type: "boolean", nullable: false),
                    entity_scope = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    memory_model_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    retrieval_config = table.Column<string>(type: "jsonb", nullable: true),
                    write_config = table.Column<string>(type: "jsonb", nullable: true),
                    sort = table.Column<int>(type: "integer", nullable: false),
                    creator = table.Column<long>(type: "bigint", nullable: true),
                    created_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    updater = table.Column<long>(type: "bigint", nullable: true),
                    updated_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_memory_library", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_memory_record",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    library_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    agent_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    device_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    user_id = table.Column<long>(type: "bigint", nullable: true),
                    entity_id = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: false),
                    session_id = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: true),
                    rule_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    rule_code = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: true),
                    entity_scope = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    record_type = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    title = table.Column<string>(type: "character varying(200)", maxLength: 200, nullable: true),
                    content = table.Column<string>(type: "text", nullable: false),
                    summary = table.Column<string>(type: "text", nullable: true),
                    keywords = table.Column<string>(type: "jsonb", nullable: true),
                    payload_json = table.Column<string>(type: "jsonb", nullable: true),
                    canonical_key = table.Column<string>(type: "character varying(300)", maxLength: 300, nullable: true),
                    content_hash = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: true),
                    embedding_model_id = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: true),
                    embedding_dimension = table.Column<int>(type: "integer", nullable: false),
                    embedding_json = table.Column<string>(type: "jsonb", nullable: true),
                    importance = table.Column<int>(type: "integer", nullable: false),
                    confidence = table.Column<double>(type: "double precision", nullable: false),
                    is_pinned = table.Column<bool>(type: "boolean", nullable: false),
                    status = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    source = table.Column<string>(type: "character varying(50)", maxLength: 50, nullable: true),
                    source_chat_history_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    source_turn_id = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: true),
                    source_run_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    merged_from_record_ids = table.Column<string>(type: "jsonb", nullable: true),
                    superseded_by_record_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    revision = table.Column<int>(type: "integer", nullable: false),
                    expires_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    last_accessed_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    creator = table.Column<long>(type: "bigint", nullable: true),
                    created_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    updater = table.Column<long>(type: "bigint", nullable: true),
                    updated_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_memory_record", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_memory_record_revision",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    record_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    library_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    rule_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    entity_id = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: false),
                    before_json = table.Column<string>(type: "jsonb", nullable: true),
                    after_json = table.Column<string>(type: "jsonb", nullable: true),
                    change_type = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    change_reason = table.Column<string>(type: "text", nullable: true),
                    source_run_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    created_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_memory_record_revision", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_memory_rule",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    library_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    rule_code = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: false),
                    rule_type = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    rule_name = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: false),
                    instruction = table.Column<string>(type: "text", nullable: true),
                    ttl_days = table.Column<int>(type: "integer", nullable: true),
                    is_enabled = table.Column<bool>(type: "boolean", nullable: false),
                    creator = table.Column<long>(type: "bigint", nullable: true),
                    created_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    updater = table.Column<long>(type: "bigint", nullable: true),
                    updated_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_memory_rule", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_memory_rule_execution_log",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    run_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    library_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    rule_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    rule_code = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: true),
                    match_result = table.Column<bool>(type: "boolean", nullable: false),
                    match_confidence = table.Column<double>(type: "double precision", nullable: false),
                    match_reason = table.Column<string>(type: "text", nullable: true),
                    llm_request_json = table.Column<string>(type: "jsonb", nullable: true),
                    llm_response_json = table.Column<string>(type: "jsonb", nullable: true),
                    candidate_json = table.Column<string>(type: "jsonb", nullable: true),
                    validated_candidate_json = table.Column<string>(type: "jsonb", nullable: true),
                    saved_record_ids = table.Column<string>(type: "jsonb", nullable: true),
                    updated_record_ids = table.Column<string>(type: "jsonb", nullable: true),
                    skipped_reasons = table.Column<string>(type: "jsonb", nullable: true),
                    status = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    error_message = table.Column<string>(type: "text", nullable: true),
                    created_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_memory_rule_execution_log", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_memory_search_log",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    library_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    agent_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    device_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    user_id = table.Column<long>(type: "bigint", nullable: true),
                    entity_id = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: true),
                    session_id = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: true),
                    query = table.Column<string>(type: "text", nullable: true),
                    record_type = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: true),
                    max_results = table.Column<int>(type: "integer", nullable: false),
                    hit_count = table.Column<int>(type: "integer", nullable: false),
                    result_json = table.Column<string>(type: "jsonb", nullable: true),
                    created_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_memory_search_log", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_order",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    order_no = table.Column<string>(type: "character varying(40)", maxLength: 40, nullable: false),
                    user_id = table.Column<long>(type: "bigint", nullable: false),
                    plan_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    order_type = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    region_code = table.Column<string>(type: "character varying(10)", maxLength: 10, nullable: false),
                    currency_code = table.Column<string>(type: "character varying(10)", maxLength: 10, nullable: false),
                    amount = table.Column<decimal>(type: "numeric(18,2)", precision: 18, scale: 2, nullable: false),
                    status = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    provider_code = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    external_trade_no = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: true),
                    paid_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    activated_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    cancelled_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    creator = table.Column<long>(type: "bigint", nullable: true),
                    create_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    updater = table.Column<long>(type: "bigint", nullable: true),
                    update_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_order", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_ota",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    firmware_name = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: true),
                    type = table.Column<string>(type: "character varying(50)", maxLength: 50, nullable: true),
                    version = table.Column<string>(type: "character varying(50)", maxLength: 50, nullable: true),
                    size = table.Column<long>(type: "bigint", nullable: true),
                    remark = table.Column<string>(type: "character varying(500)", maxLength: 500, nullable: true),
                    firmware_path = table.Column<string>(type: "character varying(255)", maxLength: 255, nullable: true),
                    sort = table.Column<int>(type: "integer", nullable: false),
                    creator = table.Column<long>(type: "bigint", nullable: true),
                    create_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    updater = table.Column<long>(type: "bigint", nullable: true),
                    update_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_ota", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_payment_transaction",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    order_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    provider_code = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    transaction_no = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: true),
                    callback_payload = table.Column<string>(type: "text", nullable: true),
                    callback_status = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    signature_verified = table.Column<bool>(type: "boolean", nullable: false),
                    paid_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    create_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    update_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_payment_transaction", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_pipeline_template",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    code = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: false),
                    name = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: false),
                    description = table.Column<string>(type: "text", nullable: true),
                    status = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    is_system = table.Column<bool>(type: "boolean", nullable: false),
                    is_default = table.Column<bool>(type: "boolean", nullable: false),
                    graph_json = table.Column<string>(type: "jsonb", nullable: false),
                    sort = table.Column<int>(type: "integer", nullable: false),
                    creator = table.Column<long>(type: "bigint", nullable: true),
                    created_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    updater = table.Column<long>(type: "bigint", nullable: true),
                    updated_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_pipeline_template", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_provider_integration",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    code = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: false),
                    name = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: false),
                    description = table.Column<string>(type: "text", nullable: true),
                    provider_code = table.Column<string>(type: "character varying(50)", maxLength: 50, nullable: false),
                    provider_type = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    supports_asr = table.Column<bool>(type: "boolean", nullable: false),
                    supports_tts = table.Column<bool>(type: "boolean", nullable: false),
                    supports_llm = table.Column<bool>(type: "boolean", nullable: false),
                    supports_mem = table.Column<bool>(type: "boolean", nullable: false),
                    status = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    is_enabled = table.Column<bool>(type: "boolean", nullable: false),
                    is_default = table.Column<bool>(type: "boolean", nullable: false),
                    api_key = table.Column<string>(type: "character varying(500)", maxLength: 500, nullable: true),
                    secret_key = table.Column<string>(type: "character varying(500)", maxLength: 500, nullable: true),
                    app_id = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: true),
                    access_token = table.Column<string>(type: "character varying(500)", maxLength: 500, nullable: true),
                    organization = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: true),
                    voice_catalog_access_key = table.Column<string>(type: "character varying(200)", maxLength: 200, nullable: true),
                    voice_catalog_secret = table.Column<string>(type: "character varying(500)", maxLength: 500, nullable: true),
                    voice_catalog_app_id = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: true),
                    voice_catalog_endpoint = table.Column<string>(type: "character varying(500)", maxLength: 500, nullable: true),
                    sort = table.Column<int>(type: "integer", nullable: false),
                    creator = table.Column<long>(type: "bigint", nullable: true),
                    created_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    updater = table.Column<long>(type: "bigint", nullable: true),
                    updated_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_provider_integration", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_rag_dataset",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    dataset_id = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: false),
                    name = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: false),
                    description = table.Column<string>(type: "text", nullable: true),
                    status = table.Column<short>(type: "smallint", nullable: false),
                    avatar = table.Column<string>(type: "text", nullable: true),
                    permission = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    chunk_method = table.Column<string>(type: "character varying(50)", maxLength: 50, nullable: true),
                    parser_config = table.Column<string>(type: "text", nullable: true),
                    chunk_count = table.Column<long>(type: "bigint", nullable: false),
                    document_count = table.Column<long>(type: "bigint", nullable: false),
                    token_num = table.Column<long>(type: "bigint", nullable: false),
                    creator = table.Column<long>(type: "bigint", nullable: true),
                    created_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    updater = table.Column<long>(type: "bigint", nullable: true),
                    updated_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_rag_dataset", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_rag_knowledge_chunk",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    dataset_id = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: false),
                    document_id = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: false),
                    chunk_index = table.Column<int>(type: "integer", nullable: false),
                    title = table.Column<string>(type: "character varying(255)", maxLength: 255, nullable: true),
                    content = table.Column<string>(type: "text", nullable: false),
                    content_hash = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: false),
                    token_count = table.Column<int>(type: "integer", nullable: false),
                    metadata_json = table.Column<string>(type: "jsonb", nullable: true),
                    embedding_model_id = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: true),
                    embedding_dimension = table.Column<int>(type: "integer", nullable: false),
                    embedding_json = table.Column<string>(type: "jsonb", nullable: true),
                    status = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    error_message = table.Column<string>(type: "text", nullable: true),
                    creator = table.Column<long>(type: "bigint", nullable: true),
                    created_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    updater = table.Column<long>(type: "bigint", nullable: true),
                    updated_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    embedding = table.Column<string>(type: "vector", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_rag_knowledge_chunk", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_rag_knowledge_document",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: false),
                    dataset_id = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: false),
                    document_id = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: true),
                    name = table.Column<string>(type: "character varying(255)", maxLength: 255, nullable: false),
                    status = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: true),
                    chunk_count = table.Column<long>(type: "bigint", nullable: false),
                    token_num = table.Column<long>(type: "bigint", nullable: false),
                    size = table.Column<long>(type: "bigint", nullable: false),
                    file_type = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: true),
                    file_path = table.Column<string>(type: "text", nullable: true),
                    source_content = table.Column<string>(type: "text", nullable: true),
                    progress = table.Column<double>(type: "double precision", nullable: true),
                    chunk_method = table.Column<string>(type: "character varying(50)", maxLength: 50, nullable: true),
                    parser_config = table.Column<string>(type: "text", nullable: true),
                    error_message = table.Column<string>(type: "text", nullable: true),
                    creator = table.Column<long>(type: "bigint", nullable: true),
                    created_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    updater = table.Column<long>(type: "bigint", nullable: true),
                    updated_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_rag_knowledge_document", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_runtime_signal",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    signal_type = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    signal_code = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: true),
                    severity = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    status = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    user_id = table.Column<long>(type: "bigint", nullable: true),
                    device_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    agent_role_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    session_id = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: true),
                    source_run_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    source_text = table.Column<string>(type: "text", nullable: true),
                    payload_json = table.Column<string>(type: "jsonb", nullable: true),
                    scheduled_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    processed_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    dedupe_key = table.Column<string>(type: "character varying(128)", maxLength: 128, nullable: true),
                    retry_count = table.Column<int>(type: "integer", nullable: false),
                    error_message = table.Column<string>(type: "text", nullable: true),
                    created_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: false),
                    updated_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_runtime_signal", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_subscription_period",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    subscription_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    user_id = table.Column<long>(type: "bigint", nullable: false),
                    period_key = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    period_start_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: false),
                    period_end_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: false),
                    plan_tokens = table.Column<long>(type: "bigint", nullable: false),
                    purchased_tokens = table.Column<long>(type: "bigint", nullable: false),
                    gifted_tokens = table.Column<long>(type: "bigint", nullable: false),
                    consumed_tokens = table.Column<long>(type: "bigint", nullable: false),
                    remaining_tokens = table.Column<long>(type: "bigint", nullable: false),
                    exhausted_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    low_balance_warned_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    create_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    update_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_subscription_period", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_token_ledger",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    user_id = table.Column<long>(type: "bigint", nullable: false),
                    period_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    change_type = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    delta_tokens = table.Column<long>(type: "bigint", nullable: false),
                    balance_after = table.Column<long>(type: "bigint", nullable: false),
                    usage_record_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    order_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    operator_id = table.Column<long>(type: "bigint", nullable: true),
                    remark = table.Column<string>(type: "text", nullable: true),
                    create_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_token_ledger", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_tts_voice",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    tts_profile_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    name = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: true),
                    tts_voice = table.Column<string>(type: "character varying(50)", maxLength: 50, nullable: true),
                    languages = table.Column<string>(type: "character varying(50)", maxLength: 50, nullable: true),
                    voice_demo = table.Column<string>(type: "character varying(500)", maxLength: 500, nullable: true),
                    remark = table.Column<string>(type: "character varying(255)", maxLength: 255, nullable: true),
                    sort = table.Column<int>(type: "integer", nullable: false),
                    creator = table.Column<long>(type: "bigint", nullable: true),
                    create_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    updater = table.Column<long>(type: "bigint", nullable: true),
                    update_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_tts_voice", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_usage_conversion_rule",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    service_type = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    provider_code = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: true),
                    model_type = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: true),
                    unit_type = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    tokens_per_unit = table.Column<decimal>(type: "numeric(18,6)", precision: 18, scale: 6, nullable: false),
                    is_enabled = table.Column<bool>(type: "boolean", nullable: false),
                    remark = table.Column<string>(type: "text", nullable: true),
                    create_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    update_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_usage_conversion_rule", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_usage_record",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    user_id = table.Column<long>(type: "bigint", nullable: false),
                    agent_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    device_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    session_id = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: true),
                    service_type = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    provider_code = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: true),
                    model_config_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    unit_type = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    raw_units = table.Column<decimal>(type: "numeric(18,6)", precision: 18, scale: 6, nullable: false),
                    normalized_tokens = table.Column<long>(type: "bigint", nullable: false),
                    raw_usage_json = table.Column<string>(type: "text", nullable: true),
                    idempotency_key = table.Column<string>(type: "character varying(128)", maxLength: 128, nullable: false),
                    charge_status = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    happened_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: false),
                    create_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_usage_record", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_user_subscription",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    user_id = table.Column<long>(type: "bigint", nullable: false),
                    plan_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    status = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    start_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: false),
                    end_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: false),
                    next_renew_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    auto_renew = table.Column<bool>(type: "boolean", nullable: false),
                    source = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    last_order_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    creator = table.Column<long>(type: "bigint", nullable: true),
                    create_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    updater = table.Column<long>(type: "bigint", nullable: true),
                    update_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_user_subscription", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "ai_vad_profile",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: false),
                    name = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: false),
                    description = table.Column<string>(type: "text", nullable: true),
                    status = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    is_enabled = table.Column<bool>(type: "boolean", nullable: false),
                    is_default = table.Column<bool>(type: "boolean", nullable: false),
                    model_dir = table.Column<string>(type: "character varying(500)", maxLength: 500, nullable: true),
                    threshold = table.Column<double>(type: "double precision", nullable: true),
                    min_silence_duration_ms = table.Column<int>(type: "integer", nullable: true),
                    speech_pad_ms = table.Column<int>(type: "integer", nullable: true),
                    sort = table.Column<int>(type: "integer", nullable: false),
                    creator = table.Column<long>(type: "bigint", nullable: true),
                    created_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    updater = table.Column<long>(type: "bigint", nullable: true),
                    updated_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_vad_profile", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "sys_menu",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    parent_id = table.Column<long>(type: "bigint", nullable: true),
                    name = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: false),
                    code = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: false),
                    type = table.Column<short>(type: "smallint", nullable: false),
                    sort = table.Column<int>(type: "integer", nullable: false),
                    status = table.Column<short>(type: "smallint", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_sys_menu", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "sys_role",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    name = table.Column<string>(type: "character varying(50)", maxLength: 50, nullable: false),
                    code = table.Column<string>(type: "character varying(50)", maxLength: 50, nullable: false),
                    remark = table.Column<string>(type: "character varying(200)", maxLength: 200, nullable: true),
                    status = table.Column<short>(type: "smallint", nullable: false),
                    sort = table.Column<int>(type: "integer", nullable: false),
                    creator = table.Column<long>(type: "bigint", nullable: true),
                    create_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    updater = table.Column<long>(type: "bigint", nullable: true),
                    update_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_sys_role", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "sys_role_menu",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    role_id = table.Column<long>(type: "bigint", nullable: false),
                    menu_id = table.Column<long>(type: "bigint", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_sys_role_menu", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "sys_user",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    username = table.Column<string>(type: "character varying(50)", maxLength: 50, nullable: false),
                    password = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: true),
                    super_admin = table.Column<short>(type: "smallint", nullable: false),
                    status = table.Column<short>(type: "smallint", nullable: false),
                    creator = table.Column<long>(type: "bigint", nullable: true),
                    create_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    updater = table.Column<long>(type: "bigint", nullable: true),
                    update_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    mobile = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: true),
                    email = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_sys_user", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "sys_user_role",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    user_id = table.Column<long>(type: "bigint", nullable: false),
                    role_id = table.Column<long>(type: "bigint", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_sys_user_role", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "sys_user_token",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    user_id = table.Column<long>(type: "bigint", nullable: false),
                    token = table.Column<string>(type: "character varying(2000)", maxLength: 2000, nullable: false),
                    expire_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    update_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    create_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_sys_user_token", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "system_settings",
                columns: table => new
                {
                    id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    server_listen_ip = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: false),
                    server_public_host = table.Column<string>(type: "character varying(255)", maxLength: 255, nullable: false),
                    server_port = table.Column<int>(type: "integer", nullable: false),
                    server_http_port = table.Column<int>(type: "integer", nullable: false),
                    server_vision_port = table.Column<int>(type: "integer", nullable: false),
                    server_secret = table.Column<string>(type: "character varying(256)", maxLength: 256, nullable: false),
                    allow_user_register = table.Column<bool>(type: "boolean", nullable: false),
                    frontend_url = table.Column<string>(type: "character varying(500)", maxLength: 500, nullable: false),
                    log_format = table.Column<string>(type: "text", nullable: false),
                    log_format_file = table.Column<string>(type: "text", nullable: false),
                    log_level = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    log_dir = table.Column<string>(type: "character varying(255)", maxLength: 255, nullable: false),
                    log_file = table.Column<string>(type: "character varying(255)", maxLength: 255, nullable: false),
                    data_dir = table.Column<string>(type: "character varying(255)", maxLength: 255, nullable: false),
                    delete_audio = table.Column<bool>(type: "boolean", nullable: false),
                    close_connection_no_voice_time = table.Column<int>(type: "integer", nullable: false),
                    tts_timeout = table.Column<int>(type: "integer", nullable: false),
                    enable_wakeup_words_response_cache = table.Column<bool>(type: "boolean", nullable: false),
                    enable_greeting = table.Column<bool>(type: "boolean", nullable: false),
                    enable_stop_tts_notify = table.Column<bool>(type: "boolean", nullable: false),
                    stop_tts_notify_voice = table.Column<string>(type: "character varying(500)", maxLength: 500, nullable: false),
                    exit_commands = table.Column<string>(type: "text", nullable: false),
                    iot_protocol_config = table.Column<string>(type: "jsonb", nullable: false),
                    wakeup_words = table.Column<string>(type: "text", nullable: false),
                    device_max_output_size = table.Column<int>(type: "integer", nullable: true),
                    voiceprint_url = table.Column<string>(type: "character varying(500)", maxLength: 500, nullable: false),
                    voiceprint_similarity_threshold = table.Column<double>(type: "double precision", nullable: true),
                    billing_default_plan_code = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: false),
                    billing_reset_timezone = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: false),
                    billing_low_balance_ratio = table.Column<decimal>(type: "numeric(18,6)", precision: 18, scale: 6, nullable: false),
                    billing_exhaustion_remind_cooldown_hours = table.Column<int>(type: "integer", nullable: false),
                    creator = table.Column<long>(type: "bigint", nullable: true),
                    create_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    updater = table.Column<long>(type: "bigint", nullable: true),
                    update_date = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_system_settings", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "AbpAuditLogActions",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    TenantId = table.Column<Guid>(type: "uuid", nullable: true),
                    AuditLogId = table.Column<Guid>(type: "uuid", nullable: false),
                    ServiceName = table.Column<string>(type: "character varying(256)", maxLength: 256, nullable: true),
                    MethodName = table.Column<string>(type: "character varying(128)", maxLength: 128, nullable: true),
                    Parameters = table.Column<string>(type: "character varying(2000)", maxLength: 2000, nullable: true),
                    ExecutionTime = table.Column<DateTime>(type: "timestamp without time zone", nullable: false),
                    ExecutionDuration = table.Column<int>(type: "integer", nullable: false),
                    ExtraProperties = table.Column<string>(type: "text", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AbpAuditLogActions", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AbpAuditLogActions_AbpAuditLogs_AuditLogId",
                        column: x => x.AuditLogId,
                        principalTable: "AbpAuditLogs",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AbpEntityChanges",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    AuditLogId = table.Column<Guid>(type: "uuid", nullable: false),
                    TenantId = table.Column<Guid>(type: "uuid", nullable: true),
                    ChangeTime = table.Column<DateTime>(type: "timestamp without time zone", nullable: false),
                    ChangeType = table.Column<byte>(type: "smallint", nullable: false),
                    EntityTenantId = table.Column<Guid>(type: "uuid", nullable: true),
                    EntityId = table.Column<string>(type: "character varying(128)", maxLength: 128, nullable: true),
                    EntityTypeFullName = table.Column<string>(type: "character varying(128)", maxLength: 128, nullable: false),
                    ExtraProperties = table.Column<string>(type: "text", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AbpEntityChanges", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AbpEntityChanges_AbpAuditLogs_AuditLogId",
                        column: x => x.AuditLogId,
                        principalTable: "AbpAuditLogs",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ai_asr_profile",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    name = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: false),
                    description = table.Column<string>(type: "text", nullable: true),
                    status = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    is_enabled = table.Column<bool>(type: "boolean", nullable: false),
                    is_default = table.Column<bool>(type: "boolean", nullable: false),
                    invocation_mode = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    ws_url = table.Column<string>(type: "character varying(500)", maxLength: 500, nullable: true),
                    resource_id = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: true),
                    integration_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    audio_format = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: true),
                    codec = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: true),
                    sample_rate = table.Column<int>(type: "integer", nullable: true),
                    bits = table.Column<int>(type: "integer", nullable: true),
                    channels = table.Column<int>(type: "integer", nullable: true),
                    chunk_duration_ms = table.Column<int>(type: "integer", nullable: true),
                    chunk_size_bytes = table.Column<int>(type: "integer", nullable: true),
                    language = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: true),
                    context = table.Column<string>(type: "text", nullable: true),
                    enable_nonstream = table.Column<bool>(type: "boolean", nullable: true),
                    config_json = table.Column<string>(type: "jsonb", nullable: true),
                    sort = table.Column<int>(type: "integer", nullable: false),
                    creator = table.Column<long>(type: "bigint", nullable: true),
                    created_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    updater = table.Column<long>(type: "bigint", nullable: true),
                    updated_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_asr_profile", x => x.id);
                    table.ForeignKey(
                        name: "FK_ai_asr_profile_ai_provider_integration_integration_id",
                        column: x => x.integration_id,
                        principalTable: "ai_provider_integration",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "ai_embedding_profile",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    name = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: false),
                    description = table.Column<string>(type: "text", nullable: true),
                    status = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    is_enabled = table.Column<bool>(type: "boolean", nullable: false),
                    is_default = table.Column<bool>(type: "boolean", nullable: false),
                    endpoint = table.Column<string>(type: "character varying(500)", maxLength: 500, nullable: true),
                    integration_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    model = table.Column<string>(type: "character varying(200)", maxLength: 200, nullable: true),
                    dimension = table.Column<int>(type: "integer", nullable: true),
                    config_json = table.Column<string>(type: "jsonb", nullable: true),
                    sort = table.Column<int>(type: "integer", nullable: false),
                    creator = table.Column<long>(type: "bigint", nullable: true),
                    created_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    updater = table.Column<long>(type: "bigint", nullable: true),
                    updated_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_embedding_profile", x => x.id);
                    table.ForeignKey(
                        name: "FK_ai_embedding_profile_ai_provider_integration_integration_id",
                        column: x => x.integration_id,
                        principalTable: "ai_provider_integration",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "ai_llm_profile",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    name = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: false),
                    description = table.Column<string>(type: "text", nullable: true),
                    status = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    is_enabled = table.Column<bool>(type: "boolean", nullable: false),
                    is_default = table.Column<bool>(type: "boolean", nullable: false),
                    invocation_mode = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    base_url = table.Column<string>(type: "character varying(500)", maxLength: 500, nullable: true),
                    integration_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    model = table.Column<string>(type: "character varying(200)", maxLength: 200, nullable: true),
                    temperature = table.Column<double>(type: "double precision", nullable: true),
                    max_tokens = table.Column<int>(type: "integer", nullable: true),
                    top_p = table.Column<double>(type: "double precision", nullable: true),
                    sort = table.Column<int>(type: "integer", nullable: false),
                    creator = table.Column<long>(type: "bigint", nullable: true),
                    created_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    updater = table.Column<long>(type: "bigint", nullable: true),
                    updated_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_llm_profile", x => x.id);
                    table.ForeignKey(
                        name: "FK_ai_llm_profile_ai_provider_integration_integration_id",
                        column: x => x.integration_id,
                        principalTable: "ai_provider_integration",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "ai_tts_profile",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    name = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: false),
                    description = table.Column<string>(type: "text", nullable: true),
                    status = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    is_enabled = table.Column<bool>(type: "boolean", nullable: false),
                    is_default = table.Column<bool>(type: "boolean", nullable: false),
                    invocation_mode = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    ws_url = table.Column<string>(type: "character varying(500)", maxLength: 500, nullable: true),
                    resource_id = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: true),
                    integration_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    encoding = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: true),
                    sample_rate = table.Column<int>(type: "integer", nullable: true),
                    speech_rate = table.Column<int>(type: "integer", nullable: true),
                    loudness_rate = table.Column<int>(type: "integer", nullable: true),
                    model = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: true),
                    config_json = table.Column<string>(type: "jsonb", nullable: true),
                    sort = table.Column<int>(type: "integer", nullable: false),
                    creator = table.Column<long>(type: "bigint", nullable: true),
                    created_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    updater = table.Column<long>(type: "bigint", nullable: true),
                    updated_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_tts_profile", x => x.id);
                    table.ForeignKey(
                        name: "FK_ai_tts_profile_ai_provider_integration_integration_id",
                        column: x => x.integration_id,
                        principalTable: "ai_provider_integration",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "AbpEntityPropertyChanges",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    TenantId = table.Column<Guid>(type: "uuid", nullable: true),
                    EntityChangeId = table.Column<Guid>(type: "uuid", nullable: false),
                    NewValue = table.Column<string>(type: "character varying(512)", maxLength: 512, nullable: true),
                    OriginalValue = table.Column<string>(type: "character varying(512)", maxLength: 512, nullable: true),
                    PropertyName = table.Column<string>(type: "character varying(128)", maxLength: 128, nullable: false),
                    PropertyTypeFullName = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AbpEntityPropertyChanges", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AbpEntityPropertyChanges_AbpEntityChanges_EntityChangeId",
                        column: x => x.EntityChangeId,
                        principalTable: "AbpEntityChanges",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_AbpAuditLogActions_AuditLogId",
                table: "AbpAuditLogActions",
                column: "AuditLogId");

            migrationBuilder.CreateIndex(
                name: "IX_AbpAuditLogActions_TenantId_ServiceName_MethodName_Executio~",
                table: "AbpAuditLogActions",
                columns: new[] { "TenantId", "ServiceName", "MethodName", "ExecutionTime" });

            migrationBuilder.CreateIndex(
                name: "IX_AbpAuditLogs_TenantId_ExecutionTime",
                table: "AbpAuditLogs",
                columns: new[] { "TenantId", "ExecutionTime" });

            migrationBuilder.CreateIndex(
                name: "IX_AbpAuditLogs_TenantId_UserId_ExecutionTime",
                table: "AbpAuditLogs",
                columns: new[] { "TenantId", "UserId", "ExecutionTime" });

            migrationBuilder.CreateIndex(
                name: "IX_AbpBackgroundJobs_IsAbandoned_NextTryTime",
                table: "AbpBackgroundJobs",
                columns: new[] { "IsAbandoned", "NextTryTime" });

            migrationBuilder.CreateIndex(
                name: "IX_AbpEntityChanges_AuditLogId",
                table: "AbpEntityChanges",
                column: "AuditLogId");

            migrationBuilder.CreateIndex(
                name: "IX_AbpEntityChanges_TenantId_EntityTypeFullName_EntityId",
                table: "AbpEntityChanges",
                columns: new[] { "TenantId", "EntityTypeFullName", "EntityId" });

            migrationBuilder.CreateIndex(
                name: "IX_AbpEntityPropertyChanges_EntityChangeId",
                table: "AbpEntityPropertyChanges",
                column: "EntityChangeId");

            migrationBuilder.CreateIndex(
                name: "IX_AbpSettingDefinitions_Name",
                table: "AbpSettingDefinitions",
                column: "Name",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_AbpSettings_Name_ProviderName_ProviderKey",
                table: "AbpSettings",
                columns: new[] { "Name", "ProviderName", "ProviderKey" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_ai_action_rule_agent_role_id_action_type_is_enabled",
                table: "ai_action_rule",
                columns: new[] { "agent_role_id", "action_type", "is_enabled" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_action_rule_agent_role_id_name",
                table: "ai_action_rule",
                columns: new[] { "agent_role_id", "name" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_ai_agent_role_asr_profile_id",
                table: "ai_agent_role",
                column: "asr_profile_id");

            migrationBuilder.CreateIndex(
                name: "IX_ai_agent_role_code",
                table: "ai_agent_role",
                column: "code",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_ai_agent_role_llm_profile_id",
                table: "ai_agent_role",
                column: "llm_profile_id");

            migrationBuilder.CreateIndex(
                name: "IX_ai_agent_role_pipeline_template_id",
                table: "ai_agent_role",
                column: "pipeline_template_id");

            migrationBuilder.CreateIndex(
                name: "IX_ai_agent_role_status_sort",
                table: "ai_agent_role",
                columns: new[] { "status", "sort" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_agent_role_tts_profile_id",
                table: "ai_agent_role",
                column: "tts_profile_id");

            migrationBuilder.CreateIndex(
                name: "IX_ai_agent_role_context_provider_agent_role_id_create_date",
                table: "ai_agent_role_context_provider",
                columns: new[] { "agent_role_id", "create_date" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_agent_role_knowledge_binding_agent_role_id_dataset_id",
                table: "ai_agent_role_knowledge_binding",
                columns: new[] { "agent_role_id", "dataset_id" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_ai_agent_role_knowledge_binding_agent_role_id_sort",
                table: "ai_agent_role_knowledge_binding",
                columns: new[] { "agent_role_id", "sort" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_agent_role_plugin_mapping_agent_role_id_plugin_id_provid~",
                table: "ai_agent_role_plugin_mapping",
                columns: new[] { "agent_role_id", "plugin_id", "provider_code" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_agent_role_release_role_id_status_published_at",
                table: "ai_agent_role_release",
                columns: new[] { "role_id", "status", "published_at" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_agent_role_release_role_id_version",
                table: "ai_agent_role_release",
                columns: new[] { "role_id", "version" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_ai_asr_profile_integration_id",
                table: "ai_asr_profile",
                column: "integration_id");

            migrationBuilder.CreateIndex(
                name: "IX_ai_asr_profile_status_sort",
                table: "ai_asr_profile",
                columns: new[] { "status", "sort" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_billing_plan_code",
                table: "ai_billing_plan",
                column: "code",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_ai_billing_plan_price_plan_id_region_code_currency_code_pro~",
                table: "ai_billing_plan_price",
                columns: new[] { "plan_id", "region_code", "currency_code", "provider_code" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_ai_device_credential_id",
                table: "ai_device",
                column: "credential_id",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_ai_embedding_profile_integration_id",
                table: "ai_embedding_profile",
                column: "integration_id");

            migrationBuilder.CreateIndex(
                name: "IX_ai_embedding_profile_status_sort",
                table: "ai_embedding_profile",
                columns: new[] { "status", "sort" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_llm_profile_integration_id",
                table: "ai_llm_profile",
                column: "integration_id");

            migrationBuilder.CreateIndex(
                name: "IX_ai_llm_profile_status_sort",
                table: "ai_llm_profile",
                columns: new[] { "status", "sort" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_mcp_tool_category",
                table: "ai_mcp_tool",
                column: "category");

            migrationBuilder.CreateIndex(
                name: "IX_ai_mcp_tool_code",
                table: "ai_mcp_tool",
                column: "code",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_ai_mcp_tool_is_system",
                table: "ai_mcp_tool",
                column: "is_system");

            migrationBuilder.CreateIndex(
                name: "IX_ai_mcp_tool_status_sort",
                table: "ai_mcp_tool",
                columns: new[] { "status", "sort" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_memory_extraction_run_entity_id_created_at",
                table: "ai_memory_extraction_run",
                columns: new[] { "entity_id", "created_at" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_memory_extraction_run_library_id_created_at",
                table: "ai_memory_extraction_run",
                columns: new[] { "library_id", "created_at" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_memory_extraction_run_status_created_at",
                table: "ai_memory_extraction_run",
                columns: new[] { "status", "created_at" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_memory_library_agent_id_status",
                table: "ai_memory_library",
                columns: new[] { "agent_id", "status" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_memory_library_user_id_agent_id",
                table: "ai_memory_library",
                columns: new[] { "user_id", "agent_id" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_memory_library_user_id_code",
                table: "ai_memory_library",
                columns: new[] { "user_id", "code" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_ai_memory_record_agent_id_user_id_created_at",
                table: "ai_memory_record",
                columns: new[] { "agent_id", "user_id", "created_at" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_memory_record_library_id_entity_id_rule_id_canonical_key",
                table: "ai_memory_record",
                columns: new[] { "library_id", "entity_id", "rule_id", "canonical_key" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_memory_record_library_id_entity_id_rule_id_content_hash",
                table: "ai_memory_record",
                columns: new[] { "library_id", "entity_id", "rule_id", "content_hash" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_memory_record_library_id_entity_id_updated_at",
                table: "ai_memory_record",
                columns: new[] { "library_id", "entity_id", "updated_at" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_memory_record_library_id_record_type_expires_at",
                table: "ai_memory_record",
                columns: new[] { "library_id", "record_type", "expires_at" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_memory_record_library_id_session_id",
                table: "ai_memory_record",
                columns: new[] { "library_id", "session_id" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_memory_record_source_run_id",
                table: "ai_memory_record",
                column: "source_run_id");

            migrationBuilder.CreateIndex(
                name: "IX_ai_memory_record_revision_record_id_created_at",
                table: "ai_memory_record_revision",
                columns: new[] { "record_id", "created_at" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_memory_record_revision_source_run_id",
                table: "ai_memory_record_revision",
                column: "source_run_id");

            migrationBuilder.CreateIndex(
                name: "IX_ai_memory_rule_library_id_rule_code",
                table: "ai_memory_rule",
                columns: new[] { "library_id", "rule_code" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_ai_memory_rule_library_id_rule_name",
                table: "ai_memory_rule",
                columns: new[] { "library_id", "rule_name" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_ai_memory_rule_library_id_rule_type_is_enabled",
                table: "ai_memory_rule",
                columns: new[] { "library_id", "rule_type", "is_enabled" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_memory_rule_execution_log_library_id_created_at",
                table: "ai_memory_rule_execution_log",
                columns: new[] { "library_id", "created_at" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_memory_rule_execution_log_run_id_rule_id",
                table: "ai_memory_rule_execution_log",
                columns: new[] { "run_id", "rule_id" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_memory_search_log_entity_id_created_at",
                table: "ai_memory_search_log",
                columns: new[] { "entity_id", "created_at" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_memory_search_log_library_id_created_at",
                table: "ai_memory_search_log",
                columns: new[] { "library_id", "created_at" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_order_order_no",
                table: "ai_order",
                column: "order_no",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_ai_order_user_id_status",
                table: "ai_order",
                columns: new[] { "user_id", "status" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_payment_transaction_order_id_transaction_no",
                table: "ai_payment_transaction",
                columns: new[] { "order_id", "transaction_no" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_payment_transaction_provider_code_transaction_no",
                table: "ai_payment_transaction",
                columns: new[] { "provider_code", "transaction_no" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_pipeline_template_code",
                table: "ai_pipeline_template",
                column: "code",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_ai_pipeline_template_status_sort",
                table: "ai_pipeline_template",
                columns: new[] { "status", "sort" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_provider_integration_code",
                table: "ai_provider_integration",
                column: "code",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_ai_provider_integration_provider_code_status_sort",
                table: "ai_provider_integration",
                columns: new[] { "provider_code", "status", "sort" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_provider_integration_provider_type_status_sort",
                table: "ai_provider_integration",
                columns: new[] { "provider_type", "status", "sort" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_provider_integration_supports_asr_status_sort",
                table: "ai_provider_integration",
                columns: new[] { "supports_asr", "status", "sort" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_provider_integration_supports_llm_status_sort",
                table: "ai_provider_integration",
                columns: new[] { "supports_llm", "status", "sort" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_provider_integration_supports_mem_status_sort",
                table: "ai_provider_integration",
                columns: new[] { "supports_mem", "status", "sort" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_provider_integration_supports_tts_status_sort",
                table: "ai_provider_integration",
                columns: new[] { "supports_tts", "status", "sort" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_rag_knowledge_chunk_dataset_id_content_hash",
                table: "ai_rag_knowledge_chunk",
                columns: new[] { "dataset_id", "content_hash" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_rag_knowledge_chunk_dataset_id_document_id_chunk_index",
                table: "ai_rag_knowledge_chunk",
                columns: new[] { "dataset_id", "document_id", "chunk_index" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_ai_runtime_signal_dedupe_key",
                table: "ai_runtime_signal",
                column: "dedupe_key");

            migrationBuilder.CreateIndex(
                name: "IX_ai_runtime_signal_device_id_created_at",
                table: "ai_runtime_signal",
                columns: new[] { "device_id", "created_at" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_runtime_signal_signal_type_status_created_at",
                table: "ai_runtime_signal",
                columns: new[] { "signal_type", "status", "created_at" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_runtime_signal_source_run_id",
                table: "ai_runtime_signal",
                column: "source_run_id");

            migrationBuilder.CreateIndex(
                name: "IX_ai_runtime_signal_status_scheduled_at",
                table: "ai_runtime_signal",
                columns: new[] { "status", "scheduled_at" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_runtime_signal_user_id_created_at",
                table: "ai_runtime_signal",
                columns: new[] { "user_id", "created_at" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_subscription_period_subscription_id_period_key",
                table: "ai_subscription_period",
                columns: new[] { "subscription_id", "period_key" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_ai_subscription_period_user_id_period_key",
                table: "ai_subscription_period",
                columns: new[] { "user_id", "period_key" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_token_ledger_user_id_create_date",
                table: "ai_token_ledger",
                columns: new[] { "user_id", "create_date" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_tts_profile_integration_id",
                table: "ai_tts_profile",
                column: "integration_id");

            migrationBuilder.CreateIndex(
                name: "IX_ai_tts_profile_status_sort",
                table: "ai_tts_profile",
                columns: new[] { "status", "sort" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_usage_conversion_rule_service_type_provider_code_unit_ty~",
                table: "ai_usage_conversion_rule",
                columns: new[] { "service_type", "provider_code", "unit_type" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_ai_usage_record_idempotency_key",
                table: "ai_usage_record",
                column: "idempotency_key",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_ai_usage_record_user_id_happened_at",
                table: "ai_usage_record",
                columns: new[] { "user_id", "happened_at" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_user_subscription_user_id_status",
                table: "ai_user_subscription",
                columns: new[] { "user_id", "status" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_vad_profile_status_sort",
                table: "ai_vad_profile",
                columns: new[] { "status", "sort" });

            migrationBuilder.CreateIndex(
                name: "IX_sys_menu_code",
                table: "sys_menu",
                column: "code",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_sys_role_code",
                table: "sys_role",
                column: "code",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_sys_role_menu_role_id_menu_id",
                table: "sys_role_menu",
                columns: new[] { "role_id", "menu_id" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_sys_user_role_user_id_role_id",
                table: "sys_user_role",
                columns: new[] { "user_id", "role_id" },
                unique: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AbpAuditLogActions");

            migrationBuilder.DropTable(
                name: "AbpAuditLogExcelFiles");

            migrationBuilder.DropTable(
                name: "AbpBackgroundJobs");

            migrationBuilder.DropTable(
                name: "AbpEntityPropertyChanges");

            migrationBuilder.DropTable(
                name: "AbpSettingDefinitions");

            migrationBuilder.DropTable(
                name: "AbpSettings");

            migrationBuilder.DropTable(
                name: "ai_action_rule");

            migrationBuilder.DropTable(
                name: "ai_agent");

            migrationBuilder.DropTable(
                name: "ai_agent_context_provider");

            migrationBuilder.DropTable(
                name: "ai_agent_plugin_mapping");

            migrationBuilder.DropTable(
                name: "ai_agent_role");

            migrationBuilder.DropTable(
                name: "ai_agent_role_context_provider");

            migrationBuilder.DropTable(
                name: "ai_agent_role_knowledge_binding");

            migrationBuilder.DropTable(
                name: "ai_agent_role_plugin_mapping");

            migrationBuilder.DropTable(
                name: "ai_agent_role_release");

            migrationBuilder.DropTable(
                name: "ai_asr_profile");

            migrationBuilder.DropTable(
                name: "ai_billing_plan");

            migrationBuilder.DropTable(
                name: "ai_billing_plan_price");

            migrationBuilder.DropTable(
                name: "ai_device");

            migrationBuilder.DropTable(
                name: "ai_embedding_profile");

            migrationBuilder.DropTable(
                name: "ai_llm_profile");

            migrationBuilder.DropTable(
                name: "ai_mcp_tool");

            migrationBuilder.DropTable(
                name: "ai_memory_extraction_run");

            migrationBuilder.DropTable(
                name: "ai_memory_library");

            migrationBuilder.DropTable(
                name: "ai_memory_record");

            migrationBuilder.DropTable(
                name: "ai_memory_record_revision");

            migrationBuilder.DropTable(
                name: "ai_memory_rule");

            migrationBuilder.DropTable(
                name: "ai_memory_rule_execution_log");

            migrationBuilder.DropTable(
                name: "ai_memory_search_log");

            migrationBuilder.DropTable(
                name: "ai_order");

            migrationBuilder.DropTable(
                name: "ai_ota");

            migrationBuilder.DropTable(
                name: "ai_payment_transaction");

            migrationBuilder.DropTable(
                name: "ai_pipeline_template");

            migrationBuilder.DropTable(
                name: "ai_rag_dataset");

            migrationBuilder.DropTable(
                name: "ai_rag_knowledge_chunk");

            migrationBuilder.DropTable(
                name: "ai_rag_knowledge_document");

            migrationBuilder.DropTable(
                name: "ai_runtime_signal");

            migrationBuilder.DropTable(
                name: "ai_subscription_period");

            migrationBuilder.DropTable(
                name: "ai_token_ledger");

            migrationBuilder.DropTable(
                name: "ai_tts_profile");

            migrationBuilder.DropTable(
                name: "ai_tts_voice");

            migrationBuilder.DropTable(
                name: "ai_usage_conversion_rule");

            migrationBuilder.DropTable(
                name: "ai_usage_record");

            migrationBuilder.DropTable(
                name: "ai_user_subscription");

            migrationBuilder.DropTable(
                name: "ai_vad_profile");

            migrationBuilder.DropTable(
                name: "sys_menu");

            migrationBuilder.DropTable(
                name: "sys_role");

            migrationBuilder.DropTable(
                name: "sys_role_menu");

            migrationBuilder.DropTable(
                name: "sys_user");

            migrationBuilder.DropTable(
                name: "sys_user_role");

            migrationBuilder.DropTable(
                name: "sys_user_token");

            migrationBuilder.DropTable(
                name: "system_settings");

            migrationBuilder.DropTable(
                name: "AbpEntityChanges");

            migrationBuilder.DropTable(
                name: "ai_provider_integration");

            migrationBuilder.DropTable(
                name: "AbpAuditLogs");
        }
    }
}
