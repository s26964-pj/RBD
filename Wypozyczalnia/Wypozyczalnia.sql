CREATE TABLE Klienci(
    `KlientID` int not null,
    `Imie` varchar(20),
    `Nazwisko` varchar(20),
    `Pesel` varchar(11),
    `DataUr` date,
    `NumerTel` varchar(9) CHECK (LENGTH(`NumerTel`) = 9),
    primary key(KlientID));

CREATE TABLE Pracownicy(
    `PracownikID` int not null,
    `Imie` varchar(20),
    `Nazwisko` varchar(20),
    `Stanowisko` varchar(40),
    `NumerTel` varchar(9),
    primary key(PracownikID));

Create TABLE Samochody(
    `SamochodID` int not null,
    `Marka` varchar(20),
    `Model` varchar(20),
    `RokProd` year,
    `Silnik` enum('Benzyna', 'Diesel'),
    primary key (SamochodID));

CREATE TABLE Lokalizacje(
    `LokalizacjaID` int not null,
    `Miasto` varchar(20),
    `Adres` varchar(20),
    `KodPocztowy` varchar(6),
    `Panstwo` varchar(20),
    primary key(LokalizacjaID));

CREATE TABLE Platnosci(
    `PlatnoscID` int not null,
    `Kwota` double,
    `Data` date,
    `TypPlatnosci` enum('Kartą', 'Gotówka'),
    primary key(PlatnoscID));

CREATE TABLE Oddzialy(
    `OddzialID` int not null,
    `LokalizacjaID` int,
    `PracownikID` int,
    `NazwaOddzialu` varchar(20),
    `NumerTelOddzialu` varchar(9),
    primary key(OddzialID),
    foreign key (LokalizacjaID) REFERENCES Lokalizacje(LokalizacjaID),
    foreign key (PracownikID) REFERENCES Pracownicy(PracownikID));

CREATE TABLE Wypozyczenie(
    `WypozyczenieID` int not null,
    `KlientID` int,
    `PlatnoscID` int,
    `OddzialID` int,
    `DaataOd` date,
    `DataDo` date,
    primary key(WypozyczenieID),
    foreign key(PlatnoscID) REFERENCES Platnosci(PlatnoscID),
    foreign key(OddzialID) REFERENCES Oddzialy(OddzialID),
    foreign key(KlientID) REFERENCES Klienci(KlientID));

CREATE TABLE SamochodWypozyczenie(
    `SamochodWypozyczenie` int not null,
    `WypozyczenieID` int,
    `SamochodID` int,
    primary key(SamochodWypozyczenie),
    foreign key(WypozyczenieID) REFERENCES Wypozyczenie(WypozyczenieID),
    foreign key(SamochodID) REFERENCES Samochody(SamochodID));

INSERT INTO Klienci (`KlientID`, `Imie`, `Nazwisko`, `Pesel`, `DataUr`, `NumerTel`)
VALUES
(1, 'Jan', 'Kowalski', '12345678901', '1990-05-15', '123456789'),
(2, 'Anna', 'Nowak', '23456789012', '1985-08-21', '987654321'),
(3, 'Piotr', 'Duda', '34567890123', '1978-03-10', '555444333'),
(4, 'Karolina', 'Mazur', '45678901234', '1992-11-25', '111222333'),
(5, 'Marcin', 'Nowacki', '56789012345', '1983-07-05', '999888777'),
(6, 'Katarzyna', 'Kaczor', '67890123456', '1995-01-30', '777666555'),
(7, 'Robert', 'Wójcik', '78901234567', '1987-09-17', '333222111'),
(8, 'Agnieszka', 'Michalak', '89012345678', '1980-12-03', '444555666'),
(9, 'Mateusz', 'Mazurek', '90123456789', '1991-06-20', '666777888'),
(10, 'Weronika', 'Makowska', '01234567890', '1994-04-12', '222333444');

INSERT INTO Samochody (`SamochodID`, `Marka`, `Model`, `RokProd`, `Silnik`)
VALUES
(1, 'Volkswagen', 'Golf', 2015, 'Diesel'),
(2, 'Ford', 'Focus', 2018, 'Benzyna'),
(3, 'Toyota', 'Corolla', 2020, 'Benzyna'),
(4, 'Opel', 'Astra', 2017, 'Diesel'),
(5, 'Renault', 'Clio', 2016, 'Benzyna'),
(6, 'BMW', '3 Series', 2019, 'Diesel'),
(7, 'Audi', 'A4', 2018, 'Diesel'),
(8, 'Mercedes-Benz', 'C-Class', 2021, 'Benzyna'),
(9, 'Hyundai', 'i30', 2022, 'Benzyna'),
(10, 'Skoda', 'Octavia', 2020, 'Diesel');

INSERT INTO Lokalizacje (`LokalizacjaID`, `Miasto`, `Adres`, `KodPocztowy`, `Panstwo`)
VALUES
(1, 'Warszawa', 'ul. Wiejska 1', '00-001', 'Polska'),
(2, 'Kraków', 'ul. Rynek 2', '30-002', 'Polska'),
(3, 'Gdańsk', 'ul. Portowa 3', '80-003', 'Polska'),
(4, 'Wrocław', 'ul. Plac Solny 4', '50-004', 'Polska'),
(5, 'Poznań', 'ul. Stary Rynek 5', '60-005', 'Polska'),
(6, 'Łódź', 'ul. Piotrkowska 6', '90-006', 'Polska'),
(7, 'Katowice', 'ul. Mariacka 7', '40-007', 'Polska'),
(8, 'Szczecin', 'ul. Waly Chrobrego 8', '70-008', 'Polska'),
(9, 'Gdynia', 'ul. Kosciuszki 9', '81-009', 'Polska'),
(10, 'Bydgoszcz', 'ul. Dworcowa 10', '85-010', 'Polska');

INSERT INTO Pracownicy (`PracownikID`, `Imie`, `Nazwisko`, `Stanowisko`, `NumerTel`)
VALUES
(1, 'Mariusz', 'Nowak', 'Manager', '111222333'),
(2, 'Alicja', 'Kowalska', 'Recepcjonistka', '444555666'),
(3, 'Krzysztof', 'Duda', 'Konsultant ds. Wypożyczeń', '777888999'),
(4, 'Ewa', 'Mazurek', 'Księgowa', '555666777'),
(5, 'Adam', 'Michalak', 'Mechanik', '888999000'),
(6, 'Patryk', 'Kaczor', 'Konsultant ds. Samochodów', '222333444'),
(7, 'Martyna', 'Wójcik', 'Konsultant ds. Klientów', '999000111'),
(8, 'Paweł', 'Makowski', 'Informatyk', '333444555'),
(9, 'Karolina', 'Mazur', 'Konsultant ds. Płatności', '000111222'),
(10, 'Tomasz', 'Nowacki', 'Serwisant', '666777888');

INSERT INTO Platnosci (`PlatnoscID`, `Kwota`, `Data`, `TypPlatnosci`)
VALUES
(1, 100.50, '2023-11-08', 'Gotówka'),
(2, 75.20, '2023-11-09', 'Kartą'),
(3, 120.00, '2023-11-10', 'Gotówka'),
(4, 90.75, '2023-11-11', 'Kartą'),
(5, 110.30, '2023-11-12', 'Gotówka'),
(6, 65.90, '2023-11-13', 'Kartą'),
(7, 80.60, '2023-11-14', 'Gotówka'),
(8, 95.45, '2023-11-15', 'Kartą'),
(9, 105.70, '2023-11-16', 'Gotówka'),
(10, 70.20, '2023-11-17', 'Kartą');

INSERT INTO Oddzialy (`OddzialID`, `LokalizacjaID`, `PracownikID`, `NazwaOddzialu`, `NumerTelOddzialu`)
VALUES
(1, 1, 1, 'Oddzial Warszawa', '111111111'),
(2, 2, 2, 'Oddzial Krakow', '222222222'),
(3, 3, 3, 'Oddzial Poznan', '333333333'),
(4, 4, 4, 'Oddzial Wroclaw', '444444444'),
(5, 5, 5, 'Oddzial Gdansk', '555555555'),
(6, 6, 6, 'Oddzial Katowice', '666666666'),
(7, 7, 7, 'Oddzial Lodz', '777777777'),
(8, 8, 8, 'Oddzial Lublin', '888888888'),
(9, 9, 9, 'Oddzial Szczecin', '999999999'),
(10, 10, 10, 'Oddzial Rzeszow', '000000000');

INSERT INTO Wypozyczenie (`WypozyczenieID`, `KlientID`, `PlatnoscID`, `OddzialID`, `DaataOd`, `DataDo`)
VALUES
(1, 1, 1, 1, '2023-11-01', '2023-11-10'),
(2, 2, 2, 2, '2023-11-03', '2023-11-12'),
(3, 3, 3, 3, '2023-11-05', '2023-11-14'),
(4, 4, 4, 4, '2023-11-07', '2023-11-16'),
(5, 5, 5, 5, '2023-11-09', '2023-11-18'),
(6, 6, 6, 6, '2023-11-11', '2023-11-20'),
(7, 7, 7, 7, '2023-11-13', '2023-11-22'),
(8, 8, 8, 8, '2023-11-15', '2023-11-24'),
(9, 9, 9, 9, '2023-11-17', '2023-11-26'),
(10, 10, 10, 10, '2023-11-19', '2023-11-28');

INSERT INTO SamochodWypozyczenie (`SamochodWypozyczenie`, `WypozyczenieID`, `SamochodID`)
VALUES
(1, 1, 1),
(2, 2, 3),
(3, 3, 5),
(4, 4, 2),
(5, 5, 7),
(6, 6, 4),
(7, 7, 10),
(8, 8, 8),
(9, 9, 6),
(10, 10, 9),
(11, 1, 8),
(12, 2, 10),
(13, 3, 7),
(14, 4, 6),
(15, 5, 3),
(16, 6, 1),
(17, 7, 4),
(18, 8, 5),
(19, 9, 2),
(20, 10, 7);
