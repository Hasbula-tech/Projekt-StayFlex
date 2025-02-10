using System.ComponentModel.DataAnnotations;

namespace StayFlex.Model
{
    public class Zimmer
    {
        [Key]
        public int ZimmerID { get; set; }
        public string Kategorie { get; set; }
        public double Preis { get; set; }
        public string Typ { get; set; } // Einzelzimmer/Doppelzimmer
        public bool Verfuegbarkeit { get; set; }

        public int HotelID { get; set; }
        public Hotel Hotel { get; set; }
    }
}
