using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AiAdmin.Migrations
{
    /// <inheritdoc />
    public partial class DropActionRuleTable : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ai_action_rule");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "ai_action_rule",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    action_type = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    agent_role_id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    config_json = table.Column<string>(type: "jsonb", nullable: true),
                    created_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: false),
                    creator = table.Column<long>(type: "bigint", nullable: true),
                    instruction = table.Column<string>(type: "text", nullable: true),
                    is_enabled = table.Column<bool>(type: "boolean", nullable: false),
                    name = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: false),
                    updated_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    updater = table.Column<long>(type: "bigint", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_action_rule", x => x.id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_ai_action_rule_agent_role_id_action_type_is_enabled",
                table: "ai_action_rule",
                columns: new[] { "agent_role_id", "action_type", "is_enabled" });

            migrationBuilder.CreateIndex(
                name: "IX_ai_action_rule_agent_role_id_name",
                table: "ai_action_rule",
                columns: new[] { "agent_role_id", "name" },
                unique: true);
        }
    }
}
