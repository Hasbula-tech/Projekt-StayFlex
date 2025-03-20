document.addEventListener("DOMContentLoaded", function () {
    const anreiseInput = document.getElementById("anreise");
    const abreiseInput = document.getElementById("abreise");
    const zimmerKategorie = document.getElementById("zimmerTyp");
    const zimmerAnzahl = document.getElementById("zimmerAnzahl");

    let belegteTageSet = new Set();
    let anreisePicker, abreisePicker;

    // 🛠️ Funktion, um belegte Tage zu holen
    function ladeBelegteTage() {
        const kategorie = zimmerKategorie.value;
        const typ = zimmerAnzahl.value;

        fetch(`get_belegte_tage.php?kategorie=${kategorie}&typ=${typ}`)
            .then(response => response.json())
            .then(belegteTage => {
                console.log("✅ Neue belegte Tage für:", kategorie, typ, belegteTage);
                belegteTageSet = new Set(belegteTage);
                aktualisiereKalender();
            })
            .catch(error => console.error("🚨 Fehler beim Laden der belegten Tage:", error));
    }

    // 🛠️ Funktion, um Kalender zu aktualisieren
    function aktualisiereKalender() {
        let minAnreise = "today";

        // Finde das nächste buchbare Datum
        for (let i = 0; i < 60; i++) { // Max. 60 Tage in die Zukunft prüfen
            let checkDate = new Date();
            checkDate.setDate(checkDate.getDate() + i);
            let formattedDate = checkDate.toISOString().split("T")[0];

            if (!belegteTageSet.has(formattedDate)) {
                minAnreise = formattedDate;
                break;
            }
        }

        // Flatpickr für Anreise aktualisieren
        if (anreisePicker) anreisePicker.destroy();
        anreisePicker = flatpickr(anreiseInput, {
            dateFormat: "Y-m-d",
            minDate: minAnreise,
            locale: "de",
            disable: [...belegteTageSet],
            onChange: function (selectedDates) {
                if (selectedDates.length > 0) {
                    let anreiseDatum = selectedDates[0].toISOString().split("T")[0];

                    // Setze Abreisedatum auf den nächsten freien Tag nach Anreise
                    abreisePicker.set("minDate", anreiseDatum);
                }
            },
            onDayCreate: function (dObj, dStr, fp, dayElem) {
                const formattedDate = dayElem.dateObj.toISOString().split("T")[0];

                if (belegteTageSet.has(formattedDate)) {
                    dayElem.classList.add("unavailable-day");
                } else {
                    dayElem.classList.add("available-day");
                }
            }
        });

        // Flatpickr für Abreise aktualisieren
        if (abreisePicker) abreisePicker.destroy();
        abreisePicker = flatpickr(abreiseInput, {
            dateFormat: "Y-m-d",
            minDate: minAnreise,
            locale: "de",
            disable: [...belegteTageSet],
            onDayCreate: function (dObj, dStr, fp, dayElem) {
                const formattedDate = dayElem.dateObj.toISOString().split("T")[0];

                if (belegteTageSet.has(formattedDate)) {
                    dayElem.classList.add("unavailable-day");
                } else {
                    dayElem.classList.add("available-day");
                }
            }
        });
    }

    // **Event Listener für Änderungen an Kategorie oder Zimmeranzahl**
    zimmerKategorie.addEventListener("change", ladeBelegteTage);
    zimmerAnzahl.addEventListener("change", ladeBelegteTage);

    // **Erstes Laden der belegten Tage**
    ladeBelegteTage();
});
