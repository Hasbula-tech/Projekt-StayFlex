document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector("form");

    form.addEventListener("submit", function (event) {
        event.preventDefault();

        const formData = new FormData(form);

        fetch("buchung_verarbeiten.php", {
            method: "POST",
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                generateRechnungPDF(data);
            } else {
                alert("Fehler: " + data.message);
            }
        });
    });
});

function generateRechnungPDF(data) {
    const { jsPDF } = window.jspdf;
    const doc = new jsPDF();

    // Füge Logo hinzu (falls vorhanden)
    const logo = new Image();
    logo.src = "logo.jpeg";  // Logo-Datei speichern!
    logo.onload = function () {
        doc.addImage(logo, "JPEG", 15, 10, 30, 30); // X, Y, Breite, Höhe
        generateContent(doc, data, doc);
    };

    logo.onerror = function () {
        console.warn("⚠️ Logo konnte nicht geladen werden, Generierung ohne Logo.");
        generateContent(doc, data, doc);
    };
}

function generateContent(doc, data) {
    const kosten = parseFloat(data.kosten); // 🛠️ Falls kosten als String kommt, in Float umwandeln

    console.log(data);
    // 🎨 Header mit Hotelinformationen
    doc.setFont("helvetica", "bold");
    doc.setFontSize(22);
    doc.text("Rechnung - FUNREST Hotel", 80, 25);

    doc.setFont("helvetica", "normal");
    doc.setFontSize(12);
    doc.text("FUNREST Hotel", 15, 50);
    doc.text("Hauptstraße 123", 15, 58);
    doc.text("12345 Musterstadt", 15, 66);
    doc.text("E-Mail: info@funrest-hotel.com", 15, 74);
    doc.text("Telefon: +49 123 456789", 15, 82);

    // 🎯 Dynamische Rechnungsnummer & Kundennummer
    const rechnungsnummer = Math.floor(Math.random() * 900000) + 100000; // Zufallsnummer 6-stellig
    const kundennummer = Math.floor(Math.random() * 9000) + 1000; // Zufallsnummer 4-stellig

    // 📌 **Sichere Positionierung, damit nichts überlappt**
    doc.setFontSize(14);
    doc.text(`Rechnungsnummer: #${rechnungsnummer}`, 140, 50);
    doc.text(`Rechnungsdatum: ${new Date().toLocaleDateString()}`, 140, 60);
    doc.text(`Kundennummer: ${kundennummer}`, 140, 70);

    // 🏨 Kundendetails
    doc.setFont("helvetica", "bold");
    doc.text("Rechnung an:", 15, 100);
    doc.setFont("helvetica", "normal");
    doc.text(`${data.name}`, 15, 108);
    doc.text(`${data.zimmer}`, 15, 116);
    doc.text(`E-Mail: ${data.email}`, 15, 124);

    // 📋 Tabelle mit Buchungsdetails
    doc.autoTable({
        startY: 140,
        head: [["Buchungszeitraum", "Anreise", "Abreise", "Kosten (€)"]],
        body: [[data.buchungszeitraum, data.anreise, data.abreise, `${kosten.toFixed(2)} €`]],
        theme: "grid",
        styles: { fontSize: 12, cellPadding: 3 },
        headStyles: { fillColor: [44, 62, 80], textColor: 255 },
        alternateRowStyles: { fillColor: [240, 240, 240] }
    });

    // 🏆 **Saubere Summen-Darstellung**
    doc.setFont("helvetica", "bold");
    doc.text(`Gesamtbetrag: ${kosten.toFixed(2)} €`, 140, doc.lastAutoTable.finalY + 10);

    // ❤️ Fußzeile
    doc.setFont("helvetica", "italic");
    doc.setFontSize(10);
    doc.text("Vielen Dank für Ihre Buchung bei FUNREST Hotel!", 15, doc.lastAutoTable.finalY + 30);
    doc.text("Bitte bewahren Sie diese Rechnung für Ihre Unterlagen auf.", 15, doc.lastAutoTable.finalY + 38);

    // 📄 Automatischen Download starten
    doc.save(`Rechnung_${data.name}_${new Date().toLocaleDateString()}.pdf`);
}

