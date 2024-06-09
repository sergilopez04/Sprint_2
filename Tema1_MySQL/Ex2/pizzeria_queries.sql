-- Llista quants productes de tipus “Begudes” s'han venut en una determinada localitat
SELECT COUNT(dc.ID_Detall) AS Quantitat_Begudes FROM Detalls_Comandes dc JOIN Productes p ON dc.Producte_ID = p.ID_Producte JOIN Comandes c ON dc.Comanda_ID = c.ID_Comanda JOIN Botigues b ON c.Botiga_ID = b.ID_Botiga WHERE p.Nom = 'Beguda' AND b.Ciutat = '[LOCALITAT]';

-- Llista quantes comandes ha efectuat un determinat empleat/da
SELECT e.Nom, e.Cognoms, COUNT(c.ID_Comanda) AS Total_Comandes FROM Empleats e JOIN Comandes c ON e.ID_Empleat = c.Repartidor_ID WHERE e.ID_Empleat = 1 GROUP BY e.Nom, e.Cognoms;
