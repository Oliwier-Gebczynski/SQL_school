create database spozywczak_4i;

use spozywczak_4i;

create table produkty (
    id int auto_increment primary key, 
    nazwa varchar (20), 
	dostawca varchar(20), 
    ilosc int, 
    cena_sz float
);

insert into produkty values ('', 'maslo', 'mlekol', 23, 2.30);
insert into produkty values ('', 'mleko', 'mlekol', 31, 2.50);
insert into produkty values ('', 'cukier', 'cukpol', 15, 3.50);
insert into produkty values ('', 'woda', 'wodpol', 65, 2.30);
insert into produkty values ('', 'baton', 'cukpol', 41, 2.30);
insert into produkty values ('', 'chleb', 'chlebpol', 7, 2.30);
insert into produkty values ('', 'mleko', 'mleczarniopol', 14, 2.45);
insert into produkty values ('', 'chrupki', 'chruppol', 12, 1.30);
insert into produkty values ('', 'chipsy', 'chippol', 75, 2.90);
insert into produkty values ('', 'musztarda', 'przetworpol', 24, 1.30);
insert into produkty values ('', 'majonez', 'przetworpol', 11, 5.30);
insert into produkty values ('', 'majonez', 'cukpol', 21, 6.30);
insert into produkty values ('', 'musztarda', 'przetworpol', 35, 2.30);
insert into produkty values ('', 'sok owocowy', 'wodpol', 21, 3.35);
insert into produkty values ('', 'chleb', 'piekarniopol', 43, 6.05);
insert into produkty values ('', 'herbatniki', 'piekarniopol', 33, 7.55);
insert into produkty values ('', 'cukierki', 'cukpol', 123, 1.05);
insert into produkty values ('', 'maslo', 'chippol', 23, 9.05);
insert into produkty values ('', 'herbata', 'herbapol', 3, 7.05);
insert into produkty values ('', 'mleko', 'chippol', 21, 2.05);
insert into produkty values ('', 'rogale', 'chippol', 34, 2.55);
insert into produkty values ('', 'oliwki', 'przetworpol', 3, 9.05);

select * from produkty;
-- wyswietlenie ilosci rekordow
SELECT count(id) as "Liczba produktow" FROM produkty;


--wyswietlenie ilosci produktow dostarczanych przez dostawcow, ktorzy dostarczaja wiecej niz jeden produkt
SELECT produkty.dostawca, count(id) as "Liczba produktow" 
FROM produkty 
GROUP BY dostawca
--przez having mozna wskazac tych ktorzy dostarczaja wiecej niz jeden 
HAVING count(id)>1;


--sumowanie wartosci wszytkich produkt??w do dwoch miejsc po przecinku 
SELECT concat(round(sum(cena_sz*ilosc), 2), " z??") as "suma"
FROM produkty;


--sredia cena produktu dostarczana przez dostawce 
SELECT dostawca, concat(round(avg(cena_sz), 2)," z??") as "??rednia cena"
FROM produkty
GROUP BY dostawca;


--wysietlenie najtanszego produktu z nazwa 
SELECT nazwa,cena_sz as "Cena"
FROM produkty
WHERE cena_sz = (select min(cena_sz) FROM produkty);

--dla max
SELECT nazwa,cena_sz as "Cena"
FROM produkty
WHERE cena_sz = (select max(cena_sz) FROM produkty);

