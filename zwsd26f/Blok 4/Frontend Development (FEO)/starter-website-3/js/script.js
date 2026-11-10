// Klik op "Schrijf je in" bij een workshop: kies die workshop in het formulier

document.querySelectorAll(".card a")[0].addEventListener("click", function () {
    document.querySelector("#workshop").value = "1";
    document.querySelector("#gekozen").textContent = "Je hebt gekozen: " + "Verse pasta maken" + " op " + "zaterdag 5 december" + ".";
});

document.querySelectorAll(".card a")[1].addEventListener("click", function () {
    document.querySelector("#workshop").value = "2";
    document.querySelector("#gekozen").textContent = "Je hebt gekozen: " + "Sushi voor beginners" + " op " + "zaterdag 12 december" + ".";
});

document.querySelectorAll(".card a")[2].addEventListener("click", function () {
    document.querySelector("#workshop").value = "3";
    document.querySelector("#gekozen").textContent = "Je hebt gekozen: " + "Brood bakken" + " op " + "zaterdag 19 december" + ".";
});

document.querySelectorAll(".card a")[3].addEventListener("click", function () {
    document.querySelector("#workshop").value = "4";
    document.querySelector("#gekozen").textContent = "Je hebt gekozen: " + "Vegetarisch kerstdiner" + " op " + "zondag 20 december" + ".";
});

document.querySelectorAll(".card a")[4].addEventListener("click", function () {
    document.querySelector("#workshop").value = "5";
    document.querySelector("#gekozen").textContent = "Je hebt gekozen: " + "Thaise curry's" + " op " + "zaterdag 9 januari" + ".";
});

document.querySelectorAll(".card a")[5].addEventListener("click", function () {
    document.querySelector("#workshop").value = "6";
    document.querySelector("#gekozen").textContent = "Je hebt gekozen: " + "Taarten en gebak" + " op " + "zaterdag 16 januari" + ".";
});

// Zet de prijs in het verborgen veld zodra er een workshop gekozen is

document.querySelector("#workshop").addEventListener("change", function () {
    let keuze = document.querySelector("#workshop").value;

    if (keuze == "1") {
        document.querySelector("#prijs").value = 45;
    } else if (keuze == "2") {
        document.querySelector("#prijs").value = 55;
    } else if (keuze == "3") {
        document.querySelector("#prijs").value = 39.5;
    } else if (keuze == "4") {
        document.querySelector("#prijs").value = 65;
    } else if (keuze == "5") {
        document.querySelector("#prijs").value = 49;
    } else if (keuze == "6") {
        document.querySelector("#prijs").value = 42.5;
    }
});
