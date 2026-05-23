using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AiAdmin.Migrations
{
    /// <inheritdoc />
    public partial class RemoveEnableNonstreamFromAsrProfile : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "enable_nonstream",
                table: "ai_asr_profile");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "enable_nonstream",
                table: "ai_asr_profile",
                type: "boolean",
                nullable: true);
        }
    }
}
