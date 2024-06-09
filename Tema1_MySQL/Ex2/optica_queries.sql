-- Llista el total de compres d’un client/a
SELECT c.Nom, COUNT(v.ID_Venda) AS Total_Compres FROM Clients c JOIN Vendes v ON c.ID_Client = v.Client_ID WHERE c.ID_Client = 1 GROUP BY c.Nom;

-- Llista les diferents ulleres que ha venut un empleat durant un any
SELECT u.Marca, u.Tipus_muntura, u.Color_muntura, u.Preu FROM Ulleres u JOIN Vendes v ON u.ID_Ullera = v.Ullera_ID JOIN Empleats e ON v.Empleat_ID = e.ID_Empleat WHERE e.ID_Empleat = 1 AND YEAR(v.Data_venda) = 2024 GROUP BY u.Marca, u.Tipus_muntura, u.Color_muntura, u.Preu;
