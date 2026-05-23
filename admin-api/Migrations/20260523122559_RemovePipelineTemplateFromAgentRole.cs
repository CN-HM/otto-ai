using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AiAdmin.Migrations
{
    /// <inheritdoc />
    public partial class RemovePipelineTemplateFromAgentRole : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ai_pipeline_template");

            migrationBuilder.DropIndex(
                name: "IX_ai_agent_role_pipeline_template_id",
                table: "ai_agent_role");

            migrationBuilder.DropColumn(
                name: "pipeline_template_id",
                table: "ai_agent_role");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "pipeline_template_id",
                table: "ai_agent_role",
                type: "character varying(32)",
                maxLength: 32,
                nullable: true);

            migrationBuilder.CreateTable(
                name: "ai_pipeline_template",
                columns: table => new
                {
                    id = table.Column<string>(type: "character varying(32)", maxLength: 32, nullable: false),
                    code = table.Column<string>(type: "character varying(64)", maxLength: 64, nullable: false),
                    created_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    creator = table.Column<long>(type: "bigint", nullable: true),
                    description = table.Column<string>(type: "text", nullable: true),
                    graph_json = table.Column<string>(type: "jsonb", nullable: false),
                    is_default = table.Column<bool>(type: "boolean", nullable: false),
                    is_system = table.Column<bool>(type: "boolean", nullable: false),
                    name = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: false),
                    sort = table.Column<int>(type: "integer", nullable: false),
                    status = table.Column<string>(type: "character varying(20)", maxLength: 20, nullable: false),
                    updated_at = table.Column<DateTime>(type: "timestamp without time zone", nullable: true),
                    updater = table.Column<long>(type: "bigint", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ai_pipeline_template", x => x.id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_ai_agent_role_pipeline_template_id",
                table: "ai_agent_role",
                column: "pipeline_template_id");

            migrationBuilder.CreateIndex(
                name: "IX_ai_pipeline_template_code",
                table: "ai_pipeline_template",
                column: "code",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_ai_pipeline_template_status_sort",
                table: "ai_pipeline_template",
                columns: new[] { "status", "sort" });
        }
    }
}
