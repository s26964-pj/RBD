-- Update

-- Klienci

UPDATE Klienci
SET NumerTel = '555000111'
WHERE Nazwisko = 'Wójcik';

UPDATE Klienci
SET Nazwisko = 'Nowacki'
WHERE DataUr < '1990-01-01';

-- Pracownicy

UPDATE Pracownicy
SET Stanowisko = 'Specjalista ds. Klientów'
WHERE PracownikID = 3;

UPDATE Pracownicy
SET NumerTel = '123456777'
WHERE NumerTel LIKE '%777';

-- Samochody

UPDATE Samochody
SET RokProd = 2019
WHERE SamochodID = 2;

UPDATE Samochody
SET Silnik = 'Benzyna'
WHERE RokProd < 2020;

-- Lokalizacje

UPDATE Lokalizacje
SET KodPocztowy = '50-005'
WHERE LokalizacjaID = 4;

UPDATE Lokalizacje
SET Panstwo = 'Poland'
WHERE Panstwo = 'Polska';

-- Platnosci

UPDATE Platnosci
SET Kwota = 150.00
WHERE PlatnoscID = 3;

UPDATE Platnosci
SET TypPlatnosci = 'Karta'
WHERE TypPlatnosci = 'Gotówka';

-- Oddzialy

UPDATE Oddzialy
SET NazwaOddzialu = 'Oddział Gdańsk-Nowy'
WHERE OddzialID = 5;

UPDATE Oddzialy
SET NumerTelOddzialu = '111222333'
WHERE LokalizacjaID = 2;

-- Wypozyczenie

UPDATE Wypozyczenie
SET DataDo = '2023-11-25'
WHERE WypozyczenieID = 7;

UPDATE Wypozyczenie
SET KlientID = 2
WHERE DaataOd < '2023-11-10';

-- SamochodWypozyczenie

UPDATE SamochodWypozyczenie
SET SamochodID = 3
WHERE SamochodWypozyczenie = 12;

UPDATE SamochodWypozyczenie
SET WypozyczenieID = 8
WHERE SamochodID = 6;

-- Delete

-- Klienci

DELETE FROM Pracownicy WHERE PracownikID = 2;
DELETE FROM Klienci WHERE NumerTel LIKE '555%';

-- Pracownicy

DELETE FROM Samochody WHERE SamochodID = 1;
DELETE FROM Pracownicy WHERE Stanowisko = 'Recepcjonistka';

-- Samochody

DELETE FROM Samochody WHERE SamochodID = 5;
DELETE FROM Samochody WHERE Silnik = 'Diesel';

-- Lokalizacje

DELETE FROM Lokalizacje WHERE LokalizacjaID = 2;
DELETE FROM Lokalizacje WHERE Miasto LIKE 'W%';

-- Platnosci

DELETE FROM Platnosci WHERE PlatnoscID = 7;
DELETE FROM Platnosci WHERE TypPlatnosci = 'Kartą';

-- Oddzialy

DELETE FROM Oddzialy WHERE OddzialID = 3;
DELETE FROM Oddzialy WHERE PracownikID IS NULL;

-- Wypozyczenie

DELETE FROM Wypozyczenie WHERE WypozyczenieID = 6;
DELETE FROM Wypozyczenie WHERE DaataOd < '2023-11-10';

-- SamochodWypozyczenie

DELETE FROM SamochodWypozyczenie WHERE SamochodWypozyczenie = 5;
DELETE FROM SamochodWypozyczenie WHERE SamochodID = 6;

TRUNCATE TABLE wypozyczenie;