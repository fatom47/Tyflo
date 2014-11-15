-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Sob 15. lis 2014, 22:20
-- Verze serveru: 5.6.16
-- Verze PHP: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databáze: `tfk`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `adresa_bydliste`
--

CREATE TABLE IF NOT EXISTS `adresa_bydliste` (
  `Město` varchar(35) COLLATE utf8_czech_ci NOT NULL,
  `Ulice` varchar(35) COLLATE utf8_czech_ci NOT NULL,
  `Cislo` int(11) NOT NULL,
  `PSC` int(11) NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=3 ;

--
-- Vypisuji data pro tabulku `adresa_bydliste`
--

INSERT INTO `adresa_bydliste` (`Město`, `Ulice`, `Cislo`, `PSC`, `ID`) VALUES
('České Budějovice', 'Na Omáčce', 10, 37007, 1),
('Hluboká nad Vltavou', 'Na Příkopech', 22, 45678, 2);

-- --------------------------------------------------------

--
-- Struktura tabulky `intervence`
--

CREATE TABLE IF NOT EXISTS `intervence` (
  `Uzivatel` int(11) NOT NULL,
  `Pracovnik` varchar(10) COLLATE utf8_czech_ci NOT NULL,
  `Sluzba` int(11) NOT NULL,
  `Datum` date NOT NULL,
  `Od` time NOT NULL,
  `Do` time NOT NULL,
  `Misto` varchar(120) COLLATE utf8_czech_ci NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=3 ;

--
-- Vypisuji data pro tabulku `intervence`
--

INSERT INTO `intervence` (`Uzivatel`, `Pracovnik`, `Sluzba`, `Datum`, `Od`, `Do`, `Misto`, `ID`) VALUES
(1111, 'OkuMir', 3, '2014-03-05', '09:05:00', '10:45:00', 'U klienta doma', 1),
(256, 'AdaJan', 1, '2014-03-03', '10:45:00', '12:00:00', 'Tyflokabinet', 2);

-- --------------------------------------------------------

--
-- Struktura tabulky `pracovnici`
--

CREATE TABLE IF NOT EXISTS `pracovnici` (
  `Titul` varchar(10) COLLATE utf8_czech_ci DEFAULT NULL,
  `Jmeno` varchar(50) COLLATE utf8_czech_ci NOT NULL,
  `Prijmeni` varchar(50) COLLATE utf8_czech_ci NOT NULL,
  `Zkratka` varchar(10) COLLATE utf8_czech_ci NOT NULL,
  PRIMARY KEY (`Zkratka`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `pracovnici`
--

INSERT INTO `pracovnici` (`Titul`, `Jmeno`, `Prijmeni`, `Zkratka`) VALUES
('Ing.', 'Jan', 'Adámek', 'AdaJan'),
('Bc.', 'Josef', 'Mareš', 'MarJos'),
(NULL, 'Miroslava', 'Okurková', 'OkuMir');

-- --------------------------------------------------------

--
-- Struktura tabulky `restringovana_participace`
--

CREATE TABLE IF NOT EXISTS `restringovana_participace` (
  `Zkratka` varchar(3) COLLATE utf8_czech_ci NOT NULL,
  `Nazev` varchar(80) COLLATE utf8_czech_ci NOT NULL,
  PRIMARY KEY (`Zkratka`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci COMMENT='Číselník postižení a kontaktovaných osob';

--
-- Vypisuji data pro tabulku `restringovana_participace`
--

INSERT INTO `restringovana_participace` (`Zkratka`, `Nazev`) VALUES
('A', 'Zdravotní znevýhodnění'),
('J', 'Jiné znevýhodnění'),
('K', 'Kombinované znevýhodnění'),
('O', 'Ostatní osoby'),
('R', 'Rodič/zákonný zástupce'),
('S', 'Senior'),
('Z', 'Zrakové znevýhodnění');

-- --------------------------------------------------------

--
-- Struktura tabulky `sluzby`
--

CREATE TABLE IF NOT EXISTS `sluzby` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Sluzba` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `Zkratka` varchar(10) COLLATE utf8_czech_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci COMMENT='Služby' AUTO_INCREMENT=6 ;

--
-- Vypisuji data pro tabulku `sluzby`
--

INSERT INTO `sluzby` (`ID`, `Sluzba`, `Zkratka`) VALUES
(1, 'Sociální poradentství', 'SP'),
(2, 'Sociální rehabilitace', 'SR'),
(3, 'Průvodcovská a předčitatelská služba', 'PPS'),
(4, 'Telefonická konzultace', 'TK'),
(5, 'Doučování', 'AJ');

-- --------------------------------------------------------

--
-- Struktura tabulky `uzivatele`
--

CREATE TABLE IF NOT EXISTS `uzivatele` (
  `Cislo_slozky` int(11) NOT NULL AUTO_INCREMENT,
  `KP` varchar(10) COLLATE utf8_czech_ci NOT NULL,
  `RP` varchar(3) COLLATE utf8_czech_ci NOT NULL,
  `Titul` varchar(35) COLLATE utf8_czech_ci DEFAULT NULL,
  `Jmeno` varchar(35) COLLATE utf8_czech_ci NOT NULL,
  `Prijmeni` varchar(35) COLLATE utf8_czech_ci NOT NULL,
  `Bydliste` int(11) NOT NULL,
  `Datum_narozeni` date NOT NULL,
  `Datum_zavedeni` date NOT NULL,
  `Poznamka` text COLLATE utf8_czech_ci,
  PRIMARY KEY (`Cislo_slozky`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1112 ;

--
-- Vypisuji data pro tabulku `uzivatele`
--

INSERT INTO `uzivatele` (`Cislo_slozky`, `KP`, `RP`, `Titul`, `Jmeno`, `Prijmeni`, `Bydliste`, `Datum_narozeni`, `Datum_zavedeni`, `Poznamka`) VALUES
(256, 'AdaJan', 'S', 'Dis.', 'Anna', 'Vlasatá', 2, '1979-08-30', '2014-01-18', NULL),
(1111, 'MarJos', 'O', NULL, 'Ota', 'Postižený', 1, '1968-09-17', '2012-02-16', 'bláh bláh');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
