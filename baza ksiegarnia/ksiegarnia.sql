-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Czas wygenerowania: 04 Lut 2015, 13:07
-- Wersja serwera: 5.5.32
-- Wersja PHP: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Baza danych: `ksiegarnia`
--
CREATE DATABASE IF NOT EXISTS `ksiegarnia` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ksiegarnia`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE IF NOT EXISTS `klienci` (
  `idklienta` int(11) NOT NULL AUTO_INCREMENT,
  `imie` text COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` text COLLATE utf8_polish_ci NOT NULL,
  `miejscowosc` text COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`idklienta`),
  KEY `id` (`idklienta`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=11 ;

--
-- Zrzut danych tabeli `klienci`
--

INSERT INTO `klienci` (`idklienta`, `imie`, `nazwisko`, `miejscowosc`) VALUES
(1, 'Łukasz', 'Lewandowski', 'Poznań'),
(2, 'Jan', 'Nowak', 'Katowice'),
(3, 'Maciej', 'Wójcik', 'Bydgoszcz'),
(4, 'Agnieszka', 'Jankowska', 'Lublin'),
(5, 'Tomasz', 'Mazur', 'Jelenia Góra'),
(6, 'Michał', 'Zieliński', 'Kraków'),
(7, 'Artur', 'Rutkowski', 'Kielce'),
(8, 'Mateusz', 'Skorupa', 'Gdańsk'),
(9, 'Jerzy', 'Rutkowski', 'Rybnik'),
(10, 'Anna', 'Karenina', 'Pułtusk');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazki`
--

CREATE TABLE IF NOT EXISTS `ksiazki` (
  `idksiazki` int(11) NOT NULL AUTO_INCREMENT,
  `imieautora` text COLLATE utf8_polish_ci NOT NULL,
  `nazwiskoautora` text COLLATE utf8_polish_ci NOT NULL,
  `tytul` text COLLATE utf8_polish_ci NOT NULL,
  `cena` float NOT NULL,
  PRIMARY KEY (`idksiazki`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=6 ;

--
-- Zrzut danych tabeli `ksiazki`
--

INSERT INTO `ksiazki` (`idksiazki`, `imieautora`, `nazwiskoautora`, `tytul`, `cena`) VALUES
(1, 'Jan', 'Michalak', 'Zaawansowane programowanie w PHP', 47.29),
(2, 'Andrzej', 'Krawczyk', 'Windows 8 PL. Zaawansowana administracja systemem', 49.99),
(3, 'Paweł', 'Jakubowski', 'HTML5. Tworzenie witryn', 53.65),
(4, 'Tomasz', 'Kowalski', 'Urządzenia techniki komputerowej', 34.15),
(5, 'Łukasz', 'Pasternak', 'PHP. Tworzenie nowoczesnych stron WWW', 29.99);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE IF NOT EXISTS `zamowienia` (
  `idzamowienia` int(11) NOT NULL AUTO_INCREMENT,
  `idklienta` int(11) NOT NULL,
  `idksiazki` int(11) NOT NULL,
  `data` date NOT NULL,
  `status` text COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`idzamowienia`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=11 ;

--
-- Zrzut danych tabeli `zamowienia`
--

INSERT INTO `zamowienia` (`idzamowienia`, `idklienta`, `idksiazki`, `data`, `status`) VALUES
(1, 2, 4, '2014-10-08', 'oczekiwanie'),
(2, 7, 1, '2014-09-05', 'wyslano'),
(3, 9, 1, '2014-10-11', 'wyslano'),
(4, 2, 2, '2014-10-15', 'oczekiwanie'),
(5, 2, 5, '2014-08-12', 'oczekiwanie'),
(6, 3, 2, '2014-10-20', 'wyslano'),
(7, 4, 3, '2014-08-14', 'wyslano'),
(8, 8, 1, '2014-08-19', 'wyslano'),
(9, 3, 5, '2014-11-19', 'wyslano'),
(10, 9, 2, '2014-12-28', 'oczekiwanie');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


/*Zadanie 1 - Wyswietl wszystkie informacje o ksizkach, ulozone alfabetycznie wg nazwiska autora*/
SELECT tytul, imieautora, nazwiskoautora, cena FROM ksiazki ORDER BY nazwiskoautora;

/*Zadanie 2 - Wyswietl wszystkie informacje o wyslanych zamowieniach*/
SELECT idzamowienia, idklienta, idksiazki, data, status FROM zamowienia WHERE status="wyslano";

/*Zadanie 3 - Wyawietl wszystkie informacje o klientach z nazwiskiem Skorupa*/
SELECT idklienta, imie, nazwisko, miejscowosc FROM klienci WHERE nazwisko="Skorupa";

/*Zadanie 4 - Wyswietl wszystkie informacje o ksiazkach, zawierajacych wyrazenie "PHP" w tytule*/
SELECT idksiazki, tytul, imieautora, nazwiskoautora, cena FROM ksiazki WHERE tytul LIKE'%PHP%'

/*Zadanie 5 -  Wyswietl wszystkie informacje o zamowieniach ulozone od ostatnio dokonanego*/
SELECT DIST * FROM zamowienia ORDER BY data DESC;

/*Zadanie 6 - Wyswietl informacje o zamowieniach: imie i nazwisko klienta zamawiajacego, id zamowienia, date zamowienia*/
SELECT klienci.imie, klienci.nazwisko, zamowienia.idzamowienia, zamowienia.data FROM zamowienia INNER JOIN klienci ON klienci.idklienta = zamowienia.idklienta;

/*Zadanie 7 - Jak w punkcie 6, w nazwach tabel zastosuje aliase (dowolne)*/

SELECT osoby.imie, osoby.nazwisko, zlecenie.idzamowienia, zlecenie.data FROM zamowienia as zlecenie INNER JOIN klienci as osoby ON osoby.idklienta = zlecenie.idklienta;