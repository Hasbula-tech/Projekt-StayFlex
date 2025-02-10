using System.ComponentModel.DataAnnotations;

namespace StayFlex2.Model
{
    public class Buchung
    {
        [Key]
        public int BuchungID { get; set; }
        public int GastID { get; set; }
        public Gast Gast { get; set; }

        public int ZimmerID { get; set; }
        public Zimmer Zimmer { get; set; }

        public DateTime Buchungsdatum { get; set; }
        public DateTime CheckIn { get; set; }
        public DateTime CheckOut { get; set; }
        public double Kosten { get; set; }

        public Rechnung Rechnung { get; set; }
    }
}
