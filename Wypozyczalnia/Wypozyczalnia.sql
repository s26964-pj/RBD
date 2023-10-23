CREATE TABLE Klienci(
    `KlientID` int not null,
    `Imie` varchar(20),
    `Nazwisko` varchar(20),
    `Pesel` varchar(11),
    `DataUr` date(year),
    `NumerTel` varchar(9),
    primary key(KlientID));

Create TABLE Samochody(
    `SamochodID` int not null,
    `Marka` varchar(20),
    `Model` varchar(20),
    `RokProd` year,
    `Silnik` ENUM('BENZYNA','DIESEL')
    primary key (SamochodID));

DROP TABLE wypozyczalnia.klienci;