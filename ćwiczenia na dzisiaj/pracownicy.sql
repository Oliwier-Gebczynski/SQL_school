drop database if exists pracownicy;

create database pracownicy;

use pracownicy;

create table dzial (iddzial int auto_increment primary key, 
		    nazwadzial varchar(45));

create table pracownik (idpracownik int auto_increment primary key, 
			imiepracownik varchar(45), 
			nazwiskopracownik varchar(45),
			wiek int,
                        dzial int);

insert into dzial (nazwadzial) values ('sprzedaz'),
									  ('montaz'),
									  ('zakupy'),
									  ('serwis'),
									  ('administracja');

insert into pracownik (imiepracownik, nazwiskopracownik, wiek, dzial) values ('damian', 'stelmach', 34, 1),
																			 ('adam', 'stanis³awski', 46, 2),
																			 ('marian', 'antoniuk', 64, 4),
																			 ('antoni', 'walaszczyk', 24, 5),
																			 ('mateusz', 'morawiecki', 15, 2),
																			 ('kryspin', 'duda', 68, 2),
																			 ('wojciech', 'morawski', 31, 1),
																			 ('adam', 'kacpijski', 32, 3),
																			 ('stanis³aw', 'norwid', 37, 3),
																			 ('dwid', 'pasternak', 39, 5),
																			 ('daniel', 'cebula', 41, 1),
																			 ('antoni', 'sobecki', 43, 2),
																			 ('wojciech', 'wronski', 55, 3),
																			 ('damian', 'aleksandrowski', 77, 5),
																			 ('adrian', 'mañkowski', 34, 3),
																			 ('matylda', 'wa³ek', 38, 2),
																			 ('marta', 'pêdzel', 18, 2),
																			 ('ula', 'steloszuk', 38, 2),
																			 ('iwona', 'machnik', 31, 3),
																			 ('damian', 'adrian', 34, 1);
																			 
																			 
																			
