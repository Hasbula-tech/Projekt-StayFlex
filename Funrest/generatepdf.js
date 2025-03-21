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
    if (data.success) {
        generateRechnungPDF(data);
    
        // 🟢 Kalender neu aktualisieren nach erfolgreicher Buchung
        if (typeof ladeBelegteTage === "function") {
            ladeBelegteTage();
        }
    }
    
});

function generateRechnungPDF(data) {
    const { jsPDF } = window.jspdf;
    const doc = new jsPDF();

    // 🏨 **Logo laden & Rechnung generieren**
    const logo = new Image();
    logo.src = "logo.jpeg"; // Stelle sicher, dass logo.jpeg existiert!
    logo.onload = function () {
        doc.addImage(logo, "JPEG", 15, 10, 30, 30);
        generateContent(doc, data);
    };

    logo.onerror = function () {
        console.warn("⚠️ Logo konnte nicht geladen werden. Generierung ohne Logo.");
        generateContent(doc, data);
    };
}

function generateContent(doc, data) {
    const kosten = parseFloat(data.kosten);
    const tage = Math.max(1, Math.floor((new Date(data.abreise) - new Date(data.anreise)) / (1000 * 60 * 60 * 24)));

    console.log(data);

    // 🎨 **Header mit Hotelinformationen**
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

    doc.setFontSize(14);
    doc.text(`Rechnungsnummer: #${data.rechnungsnummer}`, 140, 50);
    doc.text(`Rechnungsdatum: ${new Date().toLocaleDateString()}`, 140, 60);
    doc.text(`Kundennummer: ${data.kundennummer}`, 140, 70);

    // 👤 **Kundendetails**
    doc.setFont("helvetica", "bold");
    doc.text("Rechnung an:", 15, 100);
    doc.setFont("helvetica", "normal");
    doc.text(`${data.name}`, 15, 108);
    doc.text(`${data.adresse || "Keine Adresse angegeben"}`, 15, 116);
    doc.text(`${data.email || "Keine E-Mail angegeben"}`, 15, 124);

    // 📋 **Tabelle mit Buchungsdetails**
    doc.autoTable({
        startY: 140,
        head: [["Zimmerkategorie", "Anreise", "Abreise", "Tage", "Kosten (€)"]],
        body: [
            [
                `${data.zimmer}`, 
                data.anreise, 
                data.abreise, 
                `${tage} Nächte`, 
                `${kosten.toFixed(2)} €`
            ]
        ],
        theme: "grid",
        styles: { fontSize: 12, cellPadding: 3 },
        headStyles: { fillColor: [44, 62, 80], textColor: 255 },
        alternateRowStyles: { fillColor: [240, 240, 240] }
    });

    // 🏆 **Gesamtbetrag fett & groß hervorheben**
    doc.setFont("helvetica", "bold");
    doc.text(`Gesamtbetrag: ${kosten.toFixed(2)} €`, 140, doc.lastAutoTable.finalY + 10);

    // ❤️ **Fußzeile**
    doc.setFont("helvetica", "italic");
    doc.setFontSize(10);
    doc.text("Bitte überweisen Sie an folgende IBAN mit K-Nr. und R-Nr als Verwendungszweck: DE95 4092 7565 9306 7786 61", 15, doc.lastAutoTable.finalY + 30);
    doc.text("Vielen Dank für Ihre Buchung bei FUNREST Hotel!", 15, doc.lastAutoTable.finalY + 38);
    doc.text("Bitte bewahren Sie diese Rechnung für Ihre Unterlagen auf.", 15, doc.lastAutoTable.finalY + 46);

    // 📄 Automatischen Download starten
    doc.save(`Rechnung_${data.name}_${new Date().toLocaleDateString()}.pdf`);
}
