using Microsoft.EntityFrameworkCore;
using StayFlex2.Model;

public class HotelDbContext : DbContext
{
    public DbSet<Gast> Gaeste { get; set; }
    public DbSet<Zimmer> Zimmer { get; set; }
    public DbSet<Buchung> Buchungen { get; set; }
    public DbSet<Rechnung> Rechnungen { get; set; }
    public DbSet<Bewertung> Bewertungen { get; set; }
    public DbSet<Hotel> Hotels { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder options)
    {
        options.UseMySql("Server=127.0.0.1;Database=hotelmanagement;User=kumpel;Password=admin;",
            new MySqlServerVersion(new Version(8, 0, 32)));
    }
}