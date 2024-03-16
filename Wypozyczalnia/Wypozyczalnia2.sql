-- Klienci

SELECT * FROM Klienci;

SELECT KlientID, Imie, Nazwisko, DataUr
FROM Klienci
ORDER BY Nazwisko ASC, Imie DESC;

SELECT Klienci.Imie, Klienci.Nazwisko, Wypozyczenie.DaataOd
FROM Klienci
INNER JOIN Wypozyczenie ON Klienci.KlientID = Wypozyczenie.KlientID
ORDER BY Wypozyczenie.DaataOd DESC;

UPDATE Klienci
SET NumerTel = '555000111'
WHERE Nazwisko = 'Wójcik';

UPDATE Klienci
SET Nazwisko = 'Nowacki'
WHERE DataUr < '1990-01-01';

DELETE FROM Klienci WHERE KlientID = 3;

DELETE FROM Klienci WHERE NumerTel LIKE '555%';

ALTER TABLE Klienci
ADD CONSTRAINT unique_pesel UNIQUE (Pesel);

SELECT Imie, Nazwisko, DataUr AS DataUrodzenia
FROM Klienci;

SELECT COUNT(*) FROM Klienci;

SELECT Imie, Nazwisko, MIN(DataUr) as NajmlodszyKlient
FROM Klienci;

-- Pracownicy

SELECT *
FROM Pracownicy
WHERE Stanowisko NOT IN ('Recepcjonistka', 'Księgowa');

SELECT Klienci.Imie, Klienci.Nazwisko
FROM Klienci
WHERE NOT EXISTS (
    SELECT 1
    FROM Wypozyczenie
    WHERE Wypozyczenie.KlientID = Klienci.KlientID
);
UPDATE Pracownicy
SET Stanowisko = 'Specjalista ds. Klientów'
WHERE PracownikID = 3;

UPDATE Pracownicy
SET NumerTel = '123456777'
WHERE NumerTel LIKE '%777';

DELETE FROM Pracownicy WHERE PracownikID = 2;

DELETE FROM Pracownicy WHERE Stanowisko = 'Recepcjonistka';

SELECT Stanowisko, AVG(LENGTH(NumerTel)) as SredniaDlugoscNumeru
FROM Pracownicy
GROUP BY Stanowisko
HAVING AVG(LENGTH(NumerTel)) > 8;

ALTER TABLE Pracownicy
ADD CONSTRAINT unique_numer_tel UNIQUE (NumerTel);

SELECT Imie, Nazwisko, Stanowisko AS PracowniczeStanowisko
FROM Pracownicy;

SELECT SUM(LENGTH(NumerTel)) as SumaDlugosciNumerow FROM Pracownicy;

-- Samochody

SELECT *
FROM Samochody
WHERE RokProd BETWEEN 2017 AND 2020;

SELECT SamochodID, Marka, Model, RokProd
FROM Samochody
WHERE RokProd < 2020;

UPDATE Samochody
SET RokProd = 2019
WHERE SamochodID = 2;

UPDATE Samochody
SET Silnik = 'Benzyna'
WHERE RokProd < 2020;

DELETE FROM Samochody WHERE SamochodID = 5;

DELETE FROM Samochody WHERE Silnik = 'Diesel';

SELECT Silnik, COUNT(*) as LiczbaSamochodow
FROM Samochody
GROUP BY Silnik
HAVING COUNT(*) > 1;

ALTER TABLE Samochody
ADD CONSTRAINT unique_model UNIQUE (Model);

SELECT Marka, Model AS NazwaModelu
FROM Samochody;

SELECT MAX(RokProd) as NajnowszyRokProdukcji FROM Samochody;

-- Lokalizacje

SELECT * FROM Lokalizacje;

SELECT LokalizacjaID, Miasto, Panstwo
FROM Lokalizacje
WHERE Miasto LIKE 'W%';

UPDATE Lokalizacje
SET KodPocztowy = '50-005'
WHERE LokalizacjaID = 4;

UPDATE Lokalizacje
SET Panstwo = 'Poland'
WHERE Panstwo = 'Polska';

DELETE FROM Lokalizacje WHERE LokalizacjaID = 2;

DELETE FROM Lokalizacje WHERE Miasto LIKE 'W%';

SELECT Panstwo, COUNT(*) as LiczbaOddzialow
FROM Oddzialy
JOIN Lokalizacje ON Oddzialy.LokalizacjaID = Lokalizacje.LokalizacjaID
GROUP BY Panstwo
HAVING COUNT(*) > 1;

ALTER TABLE Lokalizacje
ADD CONSTRAINT unique_kod_pocztowy UNIQUE (KodPocztowy);

SELECT Miasto, Panstwo AS NazwaPanstwa
FROM Lokalizacje;

SELECT COUNT(DISTINCT Panstwo) as LiczbaKrajow FROM Lokalizacje;

-- Platnosci

SELECT * FROM Platnosci;

SELECT PlatnoscID, Kwota, TypPlatnosci
FROM Platnosci
WHERE Kwota > 100;

UPDATE Platnosci
SET Kwota = 150.00
WHERE PlatnoscID = 3;

UPDATE Platnosci
SET TypPlatnosci = 'Karta'
WHERE TypPlatnosci = 'Gotówka';

DELETE FROM Platnosci WHERE PlatnoscID = 7;

DELETE FROM Platnosci WHERE TypPlatnosci = 'Kartą';

SELECT TypPlatnosci, AVG(Kwota) as SredniaKwota
FROM Platnosci
GROUP BY TypPlatnosci
HAVING AVG(Kwota) > 90.00;

ALTER TABLE Platnosci
ADD CONSTRAINT unique_typ_platnosci UNIQUE (TypPlatnosci);

SELECT Kwota, TypPlatnosci AS RodzajPlatnosci
FROM Platnosci;

SELECT SUM(Kwota) as SumaKwot FROM Platnosci;

-- Oddzialy

SELECT * FROM Oddzialy;

SELECT OddzialID, NazwaOddzialu, NumerTelOddzialu
FROM Oddzialy
WHERE NumerTelOddzialu LIKE '%111%';

UPDATE Oddzialy
SET NazwaOddzialu = 'Oddział Gdańsk-Nowy'
WHERE OddzialID = 5;

UPDATE Oddzialy
SET NumerTelOddzialu = '111222333'
WHERE LokalizacjaID = 2;

DELETE FROM Oddzialy WHERE OddzialID = 3;

DELETE FROM Oddzialy WHERE PracownikID IS NULL;

SELECT NazwaOddzialu, COUNT(*) as LiczbaPracownikow
FROM Pracownicy
JOIN Oddzialy ON Pracownicy.PracownikID = Oddzialy.PracownikID
GROUP BY NazwaOddzialu
HAVING COUNT(*) > 1;

ALTER TABLE Oddzialy
ADD CONSTRAINT unique_numer_tel_oddzialu UNIQUE (NumerTelOddzialu);

SELECT NazwaOddzialu, NumerTelOddzialu AS KontaktOddzialu
FROM Oddzialy;

SELECT AVG(LENGTH(NazwaOddzialu)) as SredniaDlugoscNazwy FROM Oddzialy;

-- Wypozyczenie

SELECT *
FROM Wypozyczenie
WHERE KlientID IN (2, 4, 6);

SELECT WypozyczenieID, DaataOd, DataDo
FROM Wypozyczenie
WHERE DataDo > '2023-11-20';

UPDATE Wypozyczenie
SET DataDo = '2023-11-25'
WHERE WypozyczenieID = 7;

UPDATE Wypozyczenie
SET KlientID = 2
WHERE DaataOd < '2023-11-10';

DELETE FROM Wypozyczenie WHERE WypozyczenieID = 6;

DELETE FROM Wypozyczenie WHERE DaataOd < '2023-11-10';

SELECT KlientID, COUNT(*) as LiczbaWypozyczen
FROM Wypozyczenie
GROUP BY KlientID
HAVING COUNT(*) > 2;

ALTER TABLE Wypozyczenie
ADD CONSTRAINT unique_data_od UNIQUE (DaataOd);

SELECT WypozyczenieID, DaataOd AS DataRozpoczeciaWypozyczenia
FROM Wypozyczenie;

SELECT WypozyczenieID, DATEDIFF(DataDo, DaataOd) as RoznicaDni
FROM Wypozyczenie;

-- SamochodWypozyczenie

SELECT * FROM SamochodWypozyczenie;

SELECT SamochodWypozyczenie, SamochodID
FROM SamochodWypozyczenie
WHERE WypozyczenieID = 2;

UPDATE SamochodWypozyczenie
SET SamochodID = 3
WHERE SamochodWypozyczenie = 12;

UPDATE SamochodWypozyczenie
SET WypozyczenieID = 8
WHERE SamochodID = 6;

DELETE FROM SamochodWypozyczenie WHERE SamochodWypozyczenie = 5;

DELETE FROM SamochodWypozyczenie WHERE SamochodID = 6;

SELECT WypozyczenieID, COUNT(*) as LiczbaSamochodow
FROM SamochodWypozyczenie
GROUP BY WypozyczenieID
HAVING COUNT(*) > 1;

ALTER TABLE SamochodWypozyczenie
ADD CONSTRAINT unique_samochod_id UNIQUE (SamochodID);

SELECT SamochodWypozyczenie AS IDWypozyczenia, SamochodID AS IDSamochodu
FROM SamochodWypozyczenie;

SELECT SamochodID, COUNT(DISTINCT WypozyczenieID) as LiczbaWypozyczen
FROM SamochodWypozyczenie
GROUP BY SamochodID;

-- Truncate

truncate table wypozyczenie;

truncate table klienci;


