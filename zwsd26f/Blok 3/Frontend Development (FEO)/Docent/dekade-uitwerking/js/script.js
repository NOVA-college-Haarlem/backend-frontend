// Dark mode
const darkKnop = document.querySelector("#dark-toggle");

darkKnop.addEventListener("click", function () {
    document.body.classList.toggle("dark");
});

// Bestellen (zilver: één handler via array + forEach)
const bestelKnoppen = document.querySelectorAll(".bestel");
const prijzen = [6.75, 8.50, 5.25];
const totaalTekst = document.querySelector("#totaal");
let totaal = 0;

bestelKnoppen.forEach(function (knop, index) {
    knop.addEventListener("click", function () {
        totaal = totaal + prijzen[index];
        totaalTekst.textContent = "Totaal: € " + totaal.toFixed(2);
    });
});

// Leegmaken (zilver)
const leegKnop = document.querySelector("#leegmaken");

leegKnop.addEventListener("click", function () {
    totaal = 0;
    totaalTekst.textContent = "Totaal: € 0";
});

// Alleen vega (goud)
const vegaKnop = document.querySelector("#vega-filter");
const kaarten = document.querySelectorAll(".kaart");

vegaKnop.addEventListener("click", function () {
    kaarten.forEach(function (kaart) {
        if (kaart.classList.contains("vega") === false) {
            kaart.classList.toggle("verborgen");
        }
    });
});

// Dagmenu (goud)
const dagmenu = ["Tomatensoep met basilicum", "Broodje kip-pesto", "Appeltaart met slagroom"];
const lijst = document.querySelector("#dagmenu-lijst");

dagmenu.forEach(function (gerecht) {
    lijst.innerHTML += "<li>" + gerecht + "</li>";
});

// Reserveren
const formulier = document.querySelector("#reserveer-formulier");
const feedback = document.querySelector("#feedback");

formulier.addEventListener("submit", function (event) {
    event.preventDefault();

    const naam = document.querySelector("#naam").value;
    const personen = document.querySelector("#personen").value;

    if (naam === "") {
        feedback.textContent = "Vul je naam in.";
    } else if (personen > 8) {
        feedback.textContent = "Groepen groter dan 8 personen: bel ons even.";
    } else {
        feedback.textContent = "Bedankt " + naam + ", je tafel voor " + personen + " is gereserveerd!";
    }
});
