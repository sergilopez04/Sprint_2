SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, precio, precio * (1.08090) FROM producto;
SELECT nombre as nombreProducto, precio as precioEuro, precio * (1.08090) as precioDolarEstadounidenc FROM producto;
SELECT UPPER(nombre) as nombre, precio FROM producto;
SELECT LOWER(nombre) as nombre, precio FROM producto;
SELECT nombre, UPPER(LEFT(nombre, 2)) as inicials FROM fabricante;
SELECT nombre, ROUND(precio, 2) AS precioRedondeado FROM producto;
SELECT nombre, TRUNCATE(precio, 0) AS precioSinDecimales FROM producto;
SELECT codigo FROM producto;
SELECT DISTINCT codigo FROM producto;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC; 
SELECT * FROM fabricante LIMIT 5;
SELECT fabricante 