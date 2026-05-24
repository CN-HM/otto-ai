using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AiAdmin.Migrations
{
    /// <inheritdoc />
    public partial class AddWakeupJobIdToRuntimeSignal : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "wakeup_job_id",
                table: "ai_runtime_signal",
                type: "character varying(256)",
                maxLength: 256,
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "wakeup_job_id",
                table: "ai_runtime_signal");
        }
    }
}
