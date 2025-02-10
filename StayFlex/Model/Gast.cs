using System.ComponentModel.DataAnnotations;

namespace StayFlex2.Model
{
    public class Gast
    {
        [Key]
        public int GastID { get; set; }
        public string Name { get; set; }
        public string Adresse { get; set; }
        public string Geschlecht { get; set; }
        public DateTime Geburtsdatum { get; set; }
        public bool Stammgast { get; set; }

        public List<Buchung> Buchungen { get; set; } = new List<Buchung>();
    }
}
