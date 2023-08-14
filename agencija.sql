-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2023 at 11:43 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agencija`
--

-- --------------------------------------------------------

--
-- Table structure for table `agencija`
--

CREATE TABLE `agencija` (
  `idAgencija` int(30) NOT NULL,
  `naziv` varchar(45) NOT NULL,
  `radnoVreme` varchar(45) NOT NULL,
  `lokacija` varchar(45) NOT NULL,
  `kontakt` varchar(45) NOT NULL,
  `slika` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agencija`
--

INSERT INTO `agencija` (`idAgencija`, `naziv`, `radnoVreme`, `lokacija`, `kontakt`, `slika`) VALUES
(1, 'AUTO Song ZEMUN', '9 do 5', 'Ugrinovacka 31, Zemun', '2196744', 'img/agencija1.jpg'),
(4, 'AUTO SONG Novi Beograd', '9do5', 'Novi Beograd', '13213123', 'img/agencija2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `idKorisnik` int(30) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `ime` varchar(45) NOT NULL,
  `prezime` varchar(45) NOT NULL,
  `datum` varchar(45) NOT NULL,
  `pol` varchar(45) NOT NULL,
  `tip` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`idKorisnik`, `username`, `password`, `ime`, `prezime`, `datum`, `pol`, `tip`, `email`) VALUES
(2, 'ognjen', 'ognjen', 'ognjen', 'ognjen', '2022-12-08', 'musko', 'korisnik', 'ognjen@gmail.com'),
(3, 'admin', 'admin', 'admin', 'admin', '99/99/9999', 'musko', 'admin', 'admin@gmail.com'),
(4, 'menadzer', 'menadzer', 'menadzer', 'menadzer', '11/10/1998', 'musko', 'menadzer', 'menadzer@gmai.com');

-- --------------------------------------------------------

--
-- Table structure for table `rezervacija`
--

CREATE TABLE `rezervacija` (
  `idRezervacije` int(10) NOT NULL,
  `username` varchar(45) NOT NULL,
  `ime` varchar(45) NOT NULL,
  `prezime` varchar(45) NOT NULL,
  `danTermina` varchar(30) NOT NULL,
  `vremeTermina` varchar(30) NOT NULL,
  `idTermina` int(10) NOT NULL,
  `idTehnicki` int(10) NOT NULL,
  `idKorisnik` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rezervacija`
--

INSERT INTO `rezervacija` (`idRezervacije`, `username`, `ime`, `prezime`, `danTermina`, `vremeTermina`, `idTermina`, `idTehnicki`, `idKorisnik`) VALUES
(7, 'menadzer', 'menadzer', 'menadzer', 'ponedeljak', '13:30', 3, 1, 4),
(8, 'admin', 'admin', 'admin', 'sreda', '9:30', 9, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `slep`
--

CREATE TABLE `slep` (
  `idSlep` int(30) NOT NULL,
  `nosivost` varchar(45) NOT NULL,
  `rezervisano` varchar(10) NOT NULL,
  `cena` int(10) NOT NULL,
  `kontakt` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `slep`
--

INSERT INTO `slep` (`idSlep`, `nosivost`, `rezervisano`, `cena`, `kontakt`) VALUES
(1, '1600kg', 'ne', 250, '219674412'),
(2, '1600kg', 'ne', 140, '12312312');

-- --------------------------------------------------------

--
-- Table structure for table `slepanje`
--

CREATE TABLE `slepanje` (
  `idSlepanje` int(30) NOT NULL,
  `idSlep` int(30) NOT NULL,
  `idKorisnik` int(30) NOT NULL,
  `imePrezime` varchar(45) NOT NULL,
  `vreme` varchar(60) NOT NULL,
  `kontakt` varchar(20) NOT NULL,
  `lokacija` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tehnicki`
--

CREATE TABLE `tehnicki` (
  `idTehnicki` int(10) NOT NULL,
  `naziv` varchar(45) NOT NULL,
  `lokacija` varchar(45) NOT NULL,
  `radnoVreme` varchar(45) NOT NULL,
  `kontakt` varchar(45) NOT NULL,
  `slika` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tehnicki`
--

INSERT INTO `tehnicki` (`idTehnicki`, `naziv`, `lokacija`, `radnoVreme`, `kontakt`, `slika`) VALUES
(1, 'AUTO Song Tehnicki ZEMUN', 'Ugrinovacka 31, Zemun', '9 do 5', '011/2196744', 'img/tehnicki.jpg'),
(7, 'AUTO SONG Novi Beograd', 'Novi Beograd', '9do5', '1231312312313', 'img/tehnicki1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `termin`
--

CREATE TABLE `termin` (
  `idTermina` int(10) NOT NULL,
  `rezervisano` varchar(10) NOT NULL,
  `idTehnicki` int(10) NOT NULL,
  `dan` varchar(30) NOT NULL,
  `vreme` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `termin`
--

INSERT INTO `termin` (`idTermina`, `rezervisano`, `idTehnicki`, `dan`, `vreme`) VALUES
(1, 'ne', 1, 'ponedeljak', '9:30'),
(2, 'ne', 1, 'ponedeljak', '11:30'),
(3, 'da', 1, 'ponedeljak', '13:30'),
(4, 'ne', 1, 'ponedeljak', '15:30'),
(5, 'ne', 1, 'utorak', '9:30'),
(6, 'ne', 1, 'utorak', '11:30'),
(7, 'ne', 1, 'utorak', '13:30'),
(8, 'ne', 1, 'utorak', '15:30'),
(9, 'da', 1, 'sreda', '9:30'),
(10, 'ne', 1, 'sreda', '11:30'),
(11, 'ne', 1, 'sreda', '13:30'),
(12, 'ne', 1, 'sreda', '15:30'),
(13, 'ne', 1, 'cetvrtak', '9:30'),
(14, 'ne', 1, 'cetvrtak', '11:30'),
(15, 'ne', 1, 'cetvrtak', '13:30'),
(16, 'ne', 1, 'cetvrtak', '15:30'),
(17, 'ne', 1, 'petak', '9:30'),
(18, 'ne', 1, 'petak', '11:30'),
(19, 'ne', 1, 'petak', '13:30'),
(20, 'ne', 1, 'petak', '15:30'),
(82, 'ne', 7, 'ponedeljak', '9:30'),
(83, 'ne', 7, 'ponedeljak', '11:30'),
(84, 'ne', 7, 'ponedeljak', '13:30'),
(85, 'ne', 7, 'ponedeljak', '15:30'),
(86, 'ne', 7, 'utorak', '9:30'),
(87, 'ne', 7, 'utorak', '11:30'),
(88, 'ne', 7, 'utorak', '13:30'),
(89, 'ne', 7, 'utorak', '15:30'),
(90, 'ne', 7, 'sreda', '9:30'),
(91, 'ne', 7, 'sreda', '11:30'),
(92, 'ne', 7, 'sreda', '13:30'),
(93, 'ne', 7, 'sreda', '15:30'),
(94, 'ne', 7, 'cetvrtak', '9:30'),
(95, 'ne', 7, 'cetvrtak', '11:30'),
(96, 'ne', 7, 'cetvrtak', '13:30'),
(97, 'ne', 7, 'cetvrtak', '15:30'),
(98, 'ne', 7, 'petak', '9:30'),
(99, 'ne', 7, 'petak', '11:30'),
(100, 'ne', 7, 'petak', '13:30'),
(101, 'ne', 7, 'petak', '15:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agencija`
--
ALTER TABLE `agencija`
  ADD PRIMARY KEY (`idAgencija`),
  ADD UNIQUE KEY `kontakt` (`kontakt`);

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`idKorisnik`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `rezervacija`
--
ALTER TABLE `rezervacija`
  ADD PRIMARY KEY (`idRezervacije`);

--
-- Indexes for table `slep`
--
ALTER TABLE `slep`
  ADD PRIMARY KEY (`idSlep`);

--
-- Indexes for table `slepanje`
--
ALTER TABLE `slepanje`
  ADD PRIMARY KEY (`idSlepanje`);

--
-- Indexes for table `tehnicki`
--
ALTER TABLE `tehnicki`
  ADD PRIMARY KEY (`idTehnicki`);

--
-- Indexes for table `termin`
--
ALTER TABLE `termin`
  ADD PRIMARY KEY (`idTermina`),
  ADD KEY `idTehnicki` (`idTehnicki`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agencija`
--
ALTER TABLE `agencija`
  MODIFY `idAgencija` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `idKorisnik` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rezervacija`
--
ALTER TABLE `rezervacija`
  MODIFY `idRezervacije` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `slep`
--
ALTER TABLE `slep`
  MODIFY `idSlep` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `slepanje`
--
ALTER TABLE `slepanje`
  MODIFY `idSlepanje` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tehnicki`
--
ALTER TABLE `tehnicki`
  MODIFY `idTehnicki` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `termin`
--
ALTER TABLE `termin`
  MODIFY `idTermina` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `termin`
--
ALTER TABLE `termin`
  ADD CONSTRAINT `tehnicki` FOREIGN KEY (`idTehnicki`) REFERENCES `tehnicki` (`idTehnicki`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
