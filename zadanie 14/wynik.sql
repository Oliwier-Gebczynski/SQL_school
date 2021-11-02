--Zapytanie 1: wybierające jedynie pola nazwa i cena z tabeli Uslugi
SELECT nazwa, cena FROM uslugi;

--Zapytanie 2: wybierające jedynie pola imie, rodzaj, nastepna_wizyta, telefon z tabeli Zwierzeta dla tych rekordów, dla których następna_wizyta jest różna od 0
SELECT imie, rodzaj, nastepna_wizyta, telefon FROM zwierzeta WHERE nastepna_wizyta NOT 0;

--Zapytanie 3: korzystające z relacji i wybierające jedynie pola rodzaj z tabeli Zwierzeta oraz odpowiadające im pola nazwa z tabeli Uslugi
SELECT zwierzeta.rodzaj, uslugi.nazwa, uslugi.cena FROM zwierzeta INNER JOIN uslugi on zwierzeta.usluga_id= uslugi.id;

--Zapytanie 4: zwracające minimalną cenę spośród wszystkich usług zapisanych w tabeli Uslugi
SELECT min(uslugi.cena) as cena FROM uslugi;

-- SKONCZONE ZADANIE 