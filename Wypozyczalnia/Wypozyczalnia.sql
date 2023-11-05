CREATE TABLE Klienci(
    `KlientID` int not null,
    `Imie` varchar(20),
    `Nazwisko` varchar(20),
    `Pesel` varchar(11),
    `DataUr` year,
    `NumerTel` varchar(9),
    primary key(KlientID));

Create TABLE Samochody(
    `SamochodID` int not null,
    `Marka` varchar(20),
    `Model` varchar(20),
    `RokProd` year,
    primary key (SamochodID));

CREATE TABLE SamochodWypozyczenie(
    `SamochodWypozyczenie` int not null,
    `WypozyczenieID` int,
    `SamochodID` int,
    primary key(SamochodWypozyczenie),
    foreign key(WypozyczenieID) REFERENCES Wypozyczenie(WypozyczenieID),
    foreign key(SamochodID) REFERENCES Samochody(SamochodID));

CREATE TABLE Lokalizacje(
    `LokalizacjaID` int not null,
    `Miasto` varchar(20),
    `Adres` varchar(20),
    `KodPocztowy` varchar(6),
    `Panstwo` varchar(20),
    primary key(LokalizacjaID));

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

CREATE TABLE TypPlatnosci(
    `TypPlatnosciID` int not null,
    `NazwaTypuPlatnosci` varchar(20),
    primary key(TypPlatnosciID));

CREATE TABLE Oddzialy(
    `OddzialID` int not null,
    `LokalizacjaID` int,
    `PracownikID` int,
    `NazwaOddzialu` varchar(20),
    `NumerTelOddzialu` varchar(9),
    primary key(OddzialID),
    foreign key (LokalizacjaID) REFERENCES Lokalizacje(LokalizacjaID),
    foreign key (PracownikID) REFERENCES Pracownicy(PracownikID));

CREATE TABLE Pracownicy(
    `PracownikID` int not null,
    `Imie` varchar(20),
    `Nazwisko` varchar(20),
    `Stanowisko` varchar(20),
    `NumerTel` varchar(9),
    primary key(PracownikID));

CREATE TABLE Platnosci(
    `PlatnoscID` int not null,
    `TypPlatnosciID` int,
    `Kwota` double,
    `Data` date,
    primary key(PlatnoscID),
    foreign key(TypPlatnosciID) REFERENCES TypPlatnosci(TypPlatnosciID));

INSERT INTO klienci VALUES (1,'Jan', 'Kowalski', '04221321232', 2004, '509333789');
INSERT INTO klienci VALUES (2,'Paweł', 'Ruta', '98295321232', 1998, '509762584');
INSERT INTO klienci VALUES (3,'Dominik', 'Szymański', '99221231232', 1999, '509338619');
INSERT INTO klienci VALUES (4,'Łukasz', 'Szczęsny', '80221323212', 1980, '509333721');
INSERT INTO klienci VALUES (5,'Zuzanna', 'Nowakowska', '88221332132', 1988, '509336549');
INSERT INTO klienci VALUES (6,'Wiktoria', 'Świderska', '89221321232', 1989, '509487789');
INSERT INTO klienci VALUES (7,'Julia', 'Lewandowska', '00221123222', 2000, '599333789');
INSERT INTO klienci VALUES (8,'Hanna', 'Filip', '03221321231', 2003, '541333389');
INSERT INTO klienci VALUES (9,'Paulina', 'Ptak', '83021321231', 1983, '512313178');
INSERT INTO klienci VALUES (10,'Wojtek', 'Kozłowski', '94021312312', 1994, '509123321');


INSERT INTO pracownicy VALUES (1, 'Zuzanna', 'Kozłowska', 'Sprzedawca', '664875234');
INSERT INTO pracownicy VALUES (1, 'Zuzanna', 'Kozłowska', 'Sprzedawca', '664875234');
INSERT INTO pracownicy VALUES (1, 'Zuzanna', 'Kozłowska', 'Sprzedawca', '664875234');
INSERT INTO pracownicy VALUES (1, 'Zuzanna', 'Kozłowska', 'Sprzedawca', '664875234');
INSERT INTO pracownicy VALUES (1, 'Zuzanna', 'Kozłowska', 'Sprzedawca', '664875234');
INSERT INTO pracownicy VALUES (1, 'Zuzanna', 'Kozłowska', 'Sprzedawca', '664875234');
INSERT INTO pracownicy VALUES (1, 'Zuzanna', 'Kozłowska', 'Sprzedawca', '664875234');
INSERT INTO pracownicy VALUES (1, 'Zuzanna', 'Kozłowska', 'Sprzedawca', '664875234');
INSERT INTO pracownicy VALUES (1, 'Zuzanna', 'Kozłowska', 'Sprzedawca', '664875234');
INSERT INTO pracownicy VALUES (1, 'Zuzanna', 'Kozłowska', 'Sprzedawca', '664875234');
INSERT INTO pracownicy VALUES (1, 'Zuzanna', 'Kozłowska', 'Sprzedawca', '664875234');


INSERT INTO samochody VALUES (1, 'Audi', 'A4', 2014);
INSERT INTO samochody VALUES (1, 'Audi', 'A4', 2014);
INSERT INTO samochody VALUES (1, 'Audi', 'A4', 2014);
INSERT INTO samochody VALUES (1, 'Audi', 'A4', 2014);
INSERT INTO samochody VALUES (1, 'Audi', 'A4', 2014);
INSERT INTO samochody VALUES (1, 'Audi', 'A4', 2014);
INSERT INTO samochody VALUES (1, 'Audi', 'A4', 2014);
INSERT INTO samochody VALUES (1, 'Audi', 'A4', 2014);
INSERT INTO samochody VALUES (1, 'Audi', 'A4', 2014);
INSERT INTO samochody VALUES (1, 'Audi', 'A4', 2014);
INSERT INTO samochody VALUES (1, 'Audi', 'A4', 2014);


INSERT INTO typplatnosci VALUES (1,'Kartą');
INSERT INTO typplatnosci VALUES (1,'Gotówką');

INSERT INTO lokalizacje VALUES ();

INSERT INTO oddzialy VALUES ();

INSERT INTO wypozyczenie VALUES ();

INSERT INTO platnosci VALUES ();

INSERT INTO samochodwypozyczenie VALUES ();
