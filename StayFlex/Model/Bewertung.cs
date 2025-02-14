﻿using System.ComponentModel.DataAnnotations;

namespace StayFlex.Model
{
    public class Bewertung
    {
        [Key]  // Primärschlüssel definieren
        public int BewertungsID { get; set; }
        public int GastID { get; set; }
        public Gast Gast { get; set; }

        public int HotelID { get; set; }
        public Hotel Hotel { get; set; }

        public string Text { get; set; }
        public int SterneBewertung { get; set; } // Bewertung von 1 bis 5 Sternen
    }
}
