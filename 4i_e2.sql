DROP database if EXISTS dane_4i;
create DATABASE dane_4i;

use dane_4i;

create table hobby
(
	id_h int primary key auto_increment,
	nazwa varchar(20)
	);

create table osoby
(
	id_o int primary key auto_increment,
	imie varchar(20),
	nazwisko varchar(50),
	rok_urodzenia year,
	opis text,
	zdjecie varchar(100),
	id_h int,
	CONSTRAINT fk_hobby foreign key (id_h) REFERENCES hobby(id_h)
	on delete set null on UPDATE CASCADE
	);
	
	

INSERT INTO hobby VALUES ('',"rower");
INSERT INTO hobby VALUES ('',"skuter");
INSERT INTO hobby VALUES ('',"nozna");
INSERT INTO hobby VALUES ('',"siatkowka");
INSERT INTO hobby VALUES ('',"koszykowka");
INSERT INTO hobby VALUES ('',"komputer");
INSERT INTO hobby VALUES ('',"baseball");

INSERT INTO osoby VALUES('',"Szymon", "Pietras", 1999, "taki se", "brak", 2); 
INSERT INTO osoby VALUES('',"Michal", "Dzwon", 2004, "nie lubie hamow", "brak", 1);
INSERT INTO osoby VALUES('',"Monika", "Mazurek", 2006, "lubie placki", "brak", 4);
INSERT INTO osoby VALUES('',"Monika", "Broska", 2000, "kocham placki", "brak", 3);
INSERT INTO osoby VALUES('',"Monika", "Olejnik", 2010, "wole placki", "brak", 3);
INSERT INTO osoby VALUES('',"Monika", "Grodzka", 1954, "nie lubie plackow", "brak", 4);
INSERT INTO osoby VALUES('',"Monika", "Wolna", 2010, "oj nie chce", "brak", 1);
INSERT INTO osoby VALUES('',"Monika", "Szybka", 1999, "lepiej jak jest wiecej", "brak", 1);
INSERT INTO osoby VALUES('',"Monika", "Olej", 2000, "worek", "brak", 1);
INSERT INTO osoby VALUES('',"Monika", "Traczka", 1987, "klapki", "brak", 3);
INSERT INTO osoby VALUES('',"Monika", "Rakowiecka", 2011, "a jak nie to co", "brak", 2);
INSERT INTO osoby VALUES('',"Monika", "Morowa", 1953, "tak", "brak", 4);


SELECT id_o, imie, nazwisko FROM osoby where id_o BETWEEN 4 AND 12;
SELECT id_o, imie, nazwisko FROM osoby where id_o>=4 && id_o<=12;
SELECT 

/*Zapytanie 1: wybierające jedynie pola imie, nazwisko, opis, zdjecie z tabeli osoby, dla wszystkich 
osób, których hobby ma id jest jedną z wartości: 1, 2, 6 */
SELECT osoby.imie,osoby.nazwisko,osoby.opis,osoby.zdjecie 
from osoby where osoby.id_h = 1 OR osoby.id_h = 2 OR osoby.id_h = 6;

SELECT imie, nazwisko, opis, zdjecie from osoby where id_h in(1,2,6);
/*
‒ Zapytanie 2: wybierające jedynie pola id i nazwisko z tabeli osoby oraz odpowiadające im pole 
nazwa z tabeli hobby dla osób, które urodziły się po 2000 roku*/
SELECT osoby.id_o, osoby.nazwisko, hobby.nazwa FROM osoby, hobby
WHERE osoby.id_h = hobby.id_h AND rok_urodzenia > 2000;

SELECT osoby.id_o, osoby.nazwisko, hobby.nazwa FROM osoby
inner join hobby on osoby.id_h = hobby.id_h
WHERE rok_urodzenia > 2000;

/* 
‒ Zapytanie 3: wybierające jedynie pola id i zdjecie z tabeli osoby dla osób, które mają na imię 
Monika. Kwerenda wybiera pierwsze 5 wierszy, należy jawnie wskazać liczbę wierszy
*/
SELECT ROW_NUMBER() over(order by id_o)AS lp, id_o, zdjecie FROM osoby where imie = "Monika" limit 5;
/*
‒ Zapytanie 4: tworzące tabelę o nazwie wpisy z następującymi polami:
‒ id, klucz główny jawnie zapisany, typu całkowitego dodatniego, automatycznie 
inkrementowany, nie może przyjmować wartości pustych
‒ wpis typu tekstowego
‒ uzytkownik_id typu całkowitego dodatniego, nie może przyjmować wartości pustych.
*/