-- Klienci

UPDATE Klienci
SET NumerTel = '555000111'
WHERE KlientID = 1;

UPDATE Klienci
SET Nazwisko = 'Nowacki'
WHERE DataUr < '1990-01-01';

Pracownicy

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