SELECT
    o.NazwaOddzialu,
    l.Miasto AS Lokalizacja,
    GROUP_CONCAT(p.Imie, ' ', p.Nazwisko) AS Pracownicy,
    SUM(COUNT(w.WypozyczenieID)) OVER (PARTITION BY o.NazwaOddzialu) AS OgolnaIloscWypozyczenOddzialu,
    GROUP_CONCAT(k.Imie, ' ', k.Nazwisko) AS NajczestszyKlient
FROM
    Oddzialy o
JOIN
    Lokalizacje l ON o.LokalizacjaID = l.LokalizacjaID
JOIN
    Pracownicy p ON o.PracownikID = p.PracownikID
LEFT JOIN
    Wypozyczenie w ON o.OddzialID = w.OddzialID
LEFT JOIN
    Klienci k ON w.KlientID = k.KlientID
GROUP BY
    o.NazwaOddzialu, l.Miasto
ORDER BY
    OgolnaIloscWypozyczenOddzialu DESC, o.NazwaOddzialu, l.Miasto;