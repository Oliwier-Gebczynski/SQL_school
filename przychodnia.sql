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
    SELECT pacjenci.pacjent_imie, pacjenci.pacjent_nazwisko, wizyty.data_wizyty 
    from wizyty inner join pacjenci on wizyty.pacjent = pacjenci.id_pacjenta;

# 2. Wyświetl imiona i nazwiska pacjentow oraz daty wizyt pacjentow z Knurowa.
    SELECT Distinct pacjenci.pacjent_imie, pacjenci.pacjent_nazwisko, wizyty.data_wizyty 
    from wizyty inner join pacjenci on wizyty.pacjent = pacjenci.id_pacjenta 
    WHERE miasto = "Knurow";

# 3. Wyświetl imiona i nazwiska lekarzy przyjmujących w maju dowolnego roku.
    SELECT Distinct lekarz_imie, lekarz_nazwisko 
    from lekarze inner join wizyty on wizyty.lekarz = lekarze.id 
    where wizyty.data_wizyty like '%-05-%';

# 4. Wyświetl imiona i nazwiska pacjentów przyjmowanych przez chirurgow.
    SELECT Distinct pacjenci.pacjent_imie, pacjenci.pacjent_nazwisko, lekarze.specjalizacja
    from wizyty 
    inner join lekarze on wizyty.lekarz = lekarze.id_leakrza 
    inner join pacjenci on wizyty.pacjent = pacjenci.id_pacjenta 
    where lekarze.specjalizacja = 'Chirurg' 

# 5. Wyświetl (unikalne) imiona i nazwiska pacjentów przyjmowanych przez chirurgow, mieszkajacych w Opolu.  
    SELECT Distinct pacjenci.pacjent_imie, pacjenci.pacjent_nazwisko, lekarze.specjalizacja, pacjenci.miasto
    from wizyty 
    inner join lekarze on wizyty.lekarz = lekarze.id_leakrza 
    inner join pacjenci on wizyty.pacjent = pacjenci.id_pacjenta 
    where lekarze.specjalizacja = 'Chirurg' and pacjenci.miasto = "Opole"