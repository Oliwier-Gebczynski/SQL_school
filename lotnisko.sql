create table samoloty
(
    id int primary key auto_increment,
    typ varchar(20),
    linie varchar(10)
)

create table przyloty 
(
    id int primary key auto_increment,
	samoloty_id int,
    nr_rejsu varchar(20),
    kierunek varchar(10),
    czas TIME,
    dzien DATE,
    status_lotu TEXT,
    foreign key (samoloty_id) REFERENCES samoloty(id)
);

create table odloty
(
	id int primary key auto_increment,
	samoloty_id int,
    nr_rejsu varchar(20),
    kierunek varchar(10),
    czas TIME,
    dzien DATE,
    status_lotu TEXT,
    foreign key (samoloty_id) REFERENCES samoloty(id)
	);

/*ZADANIE 1*/
SELECT id, nr_rejsu, czas, kierunek, status_lotu FROM odloty ORDER BY czas DESC

/*ZADANIE 2*/
SELECT min(czas) FROM odloty WHERE czas BETWEEN '10:10' AND '10:19' ;

/*ZADANIE 3*/
SELECT odloty.nr_rejsu, samoloty.linie FROM odloty INNER JOIN samoloty on samoloty.id = odloty.samoloty_id WHERE odloty.kierunek = 'Malta';

/*ZADANIE 4*/
UPDATE przyloty SET status_lotu = "planowy" WHERE nr_rejsu = "LH9829";

/*ZADANIE 5*/
SELECT samoloty.typ, samoloty.linie FROM samoloty LEFT JOIN przyloty ON samoloty.id = przyloty.id WHERE samoloty.id IS NULL;

/*ZADANIE 6*/
SELECT id, nr_rejsu, czas, kierunek, status_lotu FROM przyloty ORDER BY czas;

/*ZADANIE 7*/
SELECT COUNT(id) FROM przyloty WHERE czas BETWEEN '10:00' AND '10:59';

/*ZADANIE 8*/
SELECT przyloty.nr_rejsu, samoloty.typ FROM przyloty INNER JOIN samoloty ON przyloty.samoloty_id = samoloty.id WHERE przyloty.kierunek = "Warszawa";

/*ZADANIE 9*/
UPDATE odloty SET status_lotu = "opoznienie 20 min" WHERE nr_rejsu = "LX5673";


