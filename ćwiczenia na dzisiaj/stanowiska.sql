

drop database if exists stanowiska;

create database stanowiska;

use stanowiska;

create table stanowiska
(
id_stanowisko int auto_increment primary key,
stanowisko varchar(10)
);

create table  pracownicy
(id int auto_increment PRIMARY KEY,
imie varchar(20),
nazwisko varchar(20),
stanowisko int, 
pensja int,
foreign key (stanowisko) references stanowiska(id_stanowisko)
on update no action
on delete no action
);

insert into stanowiska (stanowisko) values ('kierownik'),
										   ('sprzedawca'),
										   ('magazynier'),
										   ('serwisant'),
										   ('menedżer');

insert into pracownicy (imie, nazwisko, stanowisko, pensja) values ('Jakub','Kowalski',1,'1100'),
																   ('Adam','Słodowy',2,'2200'),
																   ('Monika','Brodka',3,'3500'),
																   ('Jan','Kowala',4,'4500'),
																   ('Andrzej','Rak',5,'4400'),
																   ('Anna','Kowalska',1,'3600'),
																   ('Antoni','Mech',2,'2220'),
																   ('Albert','Konieczny',3,'3360'),
																   ('Adrianna','Wolińska',4,'6540'),
																   ('Monika','Stefanowska',5,'5300'),
																   ('Iwona','Wolna',1,'2400'),
																   ('Gerwazy','Morski',2,'2670'),
																   ('Dawid','Strzeszowski',3,'3040'),
																   ('Damian','Wony',4,'4500'),
																   ('Marian','Marianowski',5,'5600');

