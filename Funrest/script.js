document.addEventListener("DOMContentLoaded", function () {
    const slider = document.querySelector(".home-bewertungen-slider");
    const bewertungen = document.querySelectorAll(".home-bewertungen-item");
    let index = 0;

    function slide() {
        // Entferne "visible" von allen Bewertungen
        bewertungen.forEach(b => b.classList.remove("visible"));

        // Setze "visible" für die aktuelle Bewertung
        bewertungen[index].classList.add("visible");

        // Bewege den Slider nach oben
        slider.style.transform = `translateY(-${index * 105}px)`;

        // Nächste Bewertung vorbereiten
        index = (index + 1) % bewertungen.length;
    }

    // Erste Bewertung sofort aktiv setzen
    slide();

    // Alle 3 Sekunden wechseln
    setInterval(slide, 3000);
});
