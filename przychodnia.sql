CREATE DATABASE przychodnia_gebczynski;
USE DATABASE przychodnia;

CREATE TABLE pacjenci(
    id_pacjenta int PRIMARY KEY auto_increment,
    pacjent_imie varchar(20),
    pacjent_nazwisko varchar(20),
    data_ur DATE,
    ulica varchar(20),
    numer int,
    miasto varchar(20)
)

CREATE TABLE lekarze(
    id_leakrza int PRIMARY KEY auto_increment,
    lekarz_imie varchar(20),
    lekarz_nazwisko varchar(20),
    specjalizacja TEXT,
)

CREATE TABLE wizyty(
    id_wizyty int PRIMARY KEY auto_increment,
    data_rejestracji DATE,
    data_wizyty DATE,
    pacjent int,
    lekarz int,
    constraint fk_pacjent foreign key (pacjent) references pacjenci(id_pacjenta),
    constraint fk_lekarz foreign key (lekarz) references lekarze(id_leakrza)
)

desc wizyty;

# 1. Wyświetl imiona i nazwiska pacjentow oraz daty wizyt.
# 2. Wyświetl imiona i nazwiska pacjentow oraz daty wizyt pacjentow z Knurowa.
# 3. Wyświetl imiona i nazwiska lekarzy przyjmujących w maju dowolnego roku.
# 4. Wyświetl imiona i nazwiska pacjentów przyjmowanych przez chirurgow.
# 5. Wyświetl (unikalne) imiona i nazwiska pacjentów przyjmowanych przez chirurgow, mieszkajacych w Opolu.  