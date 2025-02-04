namespace StayFlex2.Model
{
    public class Rechnung
    {
        public int RechnungsID { get; set; }
        public int BuchungID { get; set; }
        public Buchung Buchung { get; set; }

        public double Betrag { get; set; }
        public DateTime Erstellungsdatum { get; set; }
    }
}
