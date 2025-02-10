using System.ComponentModel.DataAnnotations;

namespace StayFlex2.Model
{
    public class Hotel
    {
        [Key]
        public int HotelID { get; set; }
        public string Name { get; set; }
        public string Adresse { get; set; }
        public string Stadt { get; set; }
        public int Sterne { get; set; }

        public List<Zimmer> Zimmer { get; set; } = new List<Zimmer>();
        public List<Bewertung> Bewertungen { get; set; } = new List<Bewertung>();
    }
}
