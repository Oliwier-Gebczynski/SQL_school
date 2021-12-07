--1. Wyświetl datę wypożyczenia, imię i nazwisko klienta oraz markę i model samochodu.

SELECT wypozyczenia.data_wyp, klienci.imie, klienci.nazwisko, samochody.marka, samochody.model 
FROM wypozyczenia JOIN klienci on klienci.id_klienta = wypozyczenia.id_klienta 
JOIN samochody on samochody.id_samochodu = wypozyczenia.id_samochodu;

--2. Wyświetl imię i nazwisko dwóch pierwszych pracowników z listy.

SELECT pracownicy.imie_p, pracownicy.nazwisko_p FROM pracownicy WHERE pracownicy.id_pracownika < 3;

--3. Wyświetl imiona i nazwiska trzech pracowników z najniższą pensją.
SELECT pracownicy.imie_p, pracownicy.nazwisko_p FROM pracownicy ORDER BY pracownicy.pensja LIMIT 3 

--4. Dla każdego klienta wyświetl imię i nazwisko oraz łączną ilość wypożyczeń.

SELECT klienci.imie, klienci.nazwisko, COUNT(wypozyczenia.id_wypozyczenia) FROM klienci 
JOIN wypozyczenia on wypozyczenia.id_klienta = klienci.id_klienta 
GROUP BY klienci.id_klienta;

--5. Wyświetl imię i nazwisko pracownika z najwyższą pensją.

SELECT pracownicy.imie_p, pracownicy.nazwisko_p FROM pracownicy ORDER BY pensja DESC LIMIT 1 