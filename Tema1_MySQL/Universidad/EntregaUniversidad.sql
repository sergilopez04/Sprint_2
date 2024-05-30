SELECT apellido1, apellido2, nombre FROM universidad.persona WHERE tipo LIKE 'alumno' ORDER BY apellido1 ASC, apellido2 ASC,  nombre ASC;
SELECT nombre, apellido1, apellido2 FROM universidad.persona WHERE tipo LIKE 'alumno' AND telefono IS NULL;
SELECT nombre, apellido1, apellido2, fecha_nacimiento FROM universidad.persona WHERE YEAR(fecha_nacimiento) = 1999 AND tipo LIKE 'alumno';
SELECT nombre, apellido1, apellido2, nif FROM universidad.persona WHERE tipo LIKE 'profesor' AND telefono IS NULL AND nif LIKE '%K';
SELECT nombre FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND  id_grado = 7;

SELECT persona.nombre, persona.apellido1, persona.apellido2, departamento.nombre AS nombreDepartamento FROM persona 
JOIN profesor ON persona.id = profesor.id_profesor 
JOIN departamento ON profesor.id_departamento = departamento.id
ORDER BY persona.apellido1, persona.apellido2, persona.nombre;

SELECT asignatura.nombre persona;