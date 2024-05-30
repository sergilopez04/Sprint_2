SELECT apellido1, apellido2, nombre FROM universidad.persona ORDER BY apellido1 ASC, apellido2 ASC,  nombre ASC;
SELECT nombre, apellido1, apellido2 FROM universidad.persona WHERE telefono IS NULL;
SELECT nombre, apellido1, apellido2 FROM universidad.persona WHERE YEAR(fecha_nacimiento) = 1999;