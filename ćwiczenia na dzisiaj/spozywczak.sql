drop database if exists spozywczak;

create database spozywczak;

use spozywczak;

create table produkty (id int auto_increment primary key, 
                       nazwa varchar (20), 
		               dostawca varchar(20), 
                       ilosc int, 
                       cena_sz float);


insert into produkty (nazwa, dostawca, ilosc, cena_sz) values ('maslo', 'mlekol', 23, 2.30),
															  ('mleko', 'mlekol', 31, 2.50),
															  ('cukier', 'cukpol', 15, 3.50),
															  ('woda', 'wodpol', 65, 2.30),
															  ('baton', 'cukpol', 41, 2.30),
															  ('chleb', 'chlebpol', 7, 2.30),
															  ('mleko', 'mleczarniopol', 14, 2.45),
															  ('chrupki', 'chruppol', 12, 1.30),
															  ('chipsy', 'chippol', 75, 2.90),
															  ('musztarda', 'przetworpol', 24, 1.30),
															  ('majonez', 'przetworpol', 11, 5.30),
															  ('majonez', 'cukpol', 21, 6.30),
															  ('musztarda', 'przetworpol', 35, 2.30),
															  ('sok owocowy', 'wodpol', 21, 3.35),
															  ('chleb', 'piekarniopol', 43, 6.05),
															  ('herbatniki', 'piekarniopol', 33, 7.55),
															  ('cukierki', 'cukpol', 123, 1.05),
															  ('maslo', 'chippol', 23, 9.05),
															  ('herbata', 'herbapol', 3, 7.05),
															  ('mleko', 'chippol', 21, 2.05),
															  ('rogale', 'chippol', 34, 2.55),
															  ('oliwki', 'przetworpol', 3, 9.05);

select * from produkty;
