using System;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace StayFlex.Migrations
{
    /// <inheritdoc />
    public partial class FixPrimaryKey : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterDatabase()
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Gaeste",
                columns: table => new
                {
                    GastID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    Name = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Adresse = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Geschlecht = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Geburtsdatum = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    Stammgast = table.Column<bool>(type: "tinyint(1)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Gaeste", x => x.GastID);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Hotels",
                columns: table => new
                {
                    HotelID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    Name = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Adresse = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Stadt = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Sterne = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Hotels", x => x.HotelID);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Bewertungen",
                columns: table => new
                {
                    BewertungsID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    GastID = table.Column<int>(type: "int", nullable: false),
                    HotelID = table.Column<int>(type: "int", nullable: false),
                    Text = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    SterneBewertung = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Bewertungen", x => x.BewertungsID);
                    table.ForeignKey(
                        name: "FK_Bewertungen_Gaeste_GastID",
                        column: x => x.GastID,
                        principalTable: "Gaeste",
                        principalColumn: "GastID",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Bewertungen_Hotels_HotelID",
                        column: x => x.HotelID,
                        principalTable: "Hotels",
                        principalColumn: "HotelID",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Zimmer",
                columns: table => new
                {
                    ZimmerID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    Kategorie = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Preis = table.Column<double>(type: "double", nullable: false),
                    Typ = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Verfuegbarkeit = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    HotelID = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Zimmer", x => x.ZimmerID);
                    table.ForeignKey(
                        name: "FK_Zimmer_Hotels_HotelID",
                        column: x => x.HotelID,
                        principalTable: "Hotels",
                        principalColumn: "HotelID",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Buchungen",
                columns: table => new
                {
                    BuchungID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    GastID = table.Column<int>(type: "int", nullable: false),
                    ZimmerID = table.Column<int>(type: "int", nullable: false),
                    Buchungsdatum = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    CheckIn = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    CheckOut = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    Kosten = table.Column<double>(type: "double", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Buchungen", x => x.BuchungID);
                    table.ForeignKey(
                        name: "FK_Buchungen_Gaeste_GastID",
                        column: x => x.GastID,
                        principalTable: "Gaeste",
                        principalColumn: "GastID",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Buchungen_Zimmer_ZimmerID",
                        column: x => x.ZimmerID,
                        principalTable: "Zimmer",
                        principalColumn: "ZimmerID",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Rechnungen",
                columns: table => new
                {
                    RechnungsID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    BuchungID = table.Column<int>(type: "int", nullable: false),
                    Betrag = table.Column<double>(type: "double", nullable: false),
                    Erstellungsdatum = table.Column<DateTime>(type: "datetime(6)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Rechnungen", x => x.RechnungsID);
                    table.ForeignKey(
                        name: "FK_Rechnungen_Buchungen_BuchungID",
                        column: x => x.BuchungID,
                        principalTable: "Buchungen",
                        principalColumn: "BuchungID",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateIndex(
                name: "IX_Bewertungen_GastID",
                table: "Bewertungen",
                column: "GastID");

            migrationBuilder.CreateIndex(
                name: "IX_Bewertungen_HotelID",
                table: "Bewertungen",
                column: "HotelID");

            migrationBuilder.CreateIndex(
                name: "IX_Buchungen_GastID",
                table: "Buchungen",
                column: "GastID");

            migrationBuilder.CreateIndex(
                name: "IX_Buchungen_ZimmerID",
                table: "Buchungen",
                column: "ZimmerID");

            migrationBuilder.CreateIndex(
                name: "IX_Rechnungen_BuchungID",
                table: "Rechnungen",
                column: "BuchungID",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Zimmer_HotelID",
                table: "Zimmer",
                column: "HotelID");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Bewertungen");

            migrationBuilder.DropTable(
                name: "Rechnungen");

            migrationBuilder.DropTable(
                name: "Buchungen");

            migrationBuilder.DropTable(
                name: "Gaeste");

            migrationBuilder.DropTable(
                name: "Zimmer");

            migrationBuilder.DropTable(
                name: "Hotels");
        }
    }
}
