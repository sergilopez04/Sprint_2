-- First 20 of Tienda

SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SHOW COLUMNS FROM producto;
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
SELECT * FROM fabricante LIMIT 3, 2;
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE codigo = 2;

-- Firsts 9 queries Universidad

SELECT apellido1, apellido2, nombre FROM universidad.persona WHERE tipo LIKE 'alumno' ORDER BY apellido1 ASC, apellido2 ASC,  nombre ASC;
SELECT nombre, apellido1, apellido2 FROM universidad.persona WHERE tipo LIKE 'alumno' AND telefono IS NULL;
SELECT nombre, apellido1, apellido2, fecha_nacimiento FROM universidad.persona WHERE YEAR(fecha_nacimiento) = 1999 AND tipo LIKE 'alumno';
SELECT nombre, apellido1, apellido2, nif FROM universidad.persona WHERE tipo LIKE 'profesor' AND telefono IS NULL AND nif LIKE '%K';
SELECT nombre FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND  id_grado = 7;
SELECT persona.nombre, persona.apellido1, persona.apellido2, departamento.nombre AS nombreDepartamento FROM persona JOIN profesor ON persona.id = profesor.id_profesor JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY persona.apellido1, persona.apellido2, persona.nombre;
SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin FROM asignatura a JOIN alumno_se_matricula_asignatura asa ON a.id = asa.id_asignatura JOIN curso_escolar ce ON asa.id_curso_escolar = ce.id JOIN persona p ON asa.id_alumno = p.id WHERE p.NIF = '26902806M';
SELECT DISTINCT d.nombre FROM departamento d JOIN profesor p ON d.id = p.id_departamento JOIN asignatura a ON p.id_profesor = a.id_profesor JOIN grado g ON a.id_grado = g.id WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
SELECT DISTINCT p.nombre, p.apellido1, p.apellido2 FROM persona p JOIN alumno_se_matricula_asignatura asa ON p.id = asa.id_alumno JOIN curso_escolar ce ON asa.id_curso_escolar = ce.id WHERE ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019;

-- Left/Right Join

SELECT DISTINCT d.nombre AS nom_departament, p.apellido1 AS primer_cognom, p.apellido2 AS segon_cognom, p.nombre AS nom_professor FROM universidad.persona p LEFT JOIN universidad.profesor pr ON pr.id_profesor = p.id LEFT JOIN universidad.departamento d ON d.id = pr.id_departamento WHERE p.tipo = "profesor" ORDER BY d.nombre ASC, p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;
SELECT p.apellido1 AS primer_cognom, p.apellido2 AS segon_cognom, p.nombre AS nom_professor FROM universidad.persona p LEFT JOIN universidad.profesor pr ON pr.id_profesor = p.id LEFT JOIN universidad.departamento d ON d.id = pr.id_departamento WHERE p.tipo = 'profesor' AND pr.id_departamento IS NULL;
SELECT d.nombre AS nom_departament FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento WHERE pr.id_departamento IS NULL;
SELECT a.nombre AS nom_assignatura FROM asignatura a LEFT JOIN profesor pr ON a.id_profesor = pr.id_profesor WHERE a.id_profesor IS NULL;
SELECT d.nombre FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento LEFT join asignatura a ON pr.id_profesor = a.id_profesor WHERE a.id IS NULL;
SELECT COUNT(*) AS totalAlumnes FROM persona p JOIN alumno_se_matricula_asignatura asma ON p.id = asma.id_alumno;

-- Queries Resum

SELECT COUNT(*) AS totalAlumnes99 FROM persona p JOIN alumno_se_matricula_asignatura asma ON p.id = asma.id_alumno WHERE YEAR(p.fecha_nacimiento) = 1999;
SELECT d.nombre AS nomDepartamento, COUNT(pr.id_profesor) AS nomProfesor FROM departamento d JOIN profesor pr ON d.id = pr.id_departamento GROUP BY d.nombre ORDER BY nomProfesor DESC;
SELECT d.nombre AS nomDepartamento, COUNT(pr.id_profesor) AS nomProfesores FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento GROUP BY d.nombre;
SELECT g.nombre AS nomGrado, COUNT(a.id) AS nomAsignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre Order BY nomAsignaturas DESC;
SELECT g.nombre AS nomGrado, COUNT(a.id) AS nomAsignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre HAVING nomAsignaturas > 40;
SELECT g.nombre AS nomGrado, a.tipo AS tipoAsignatura, SUM(a.creditos) AS sumaCreditos FROM grado g JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre, a.tipo;
SELECT ce.anyo_inicio, COUNT(DISTINCT asma.id_alumno) AS nomAlumnos FROM curso_escolar ce JOIN alumno_se_matricula_asignatura asma ON ce.id = asma.id_curso_escolar GROUP BY ce.anyo_inicio;
SELECT DISTINCT d.nombre AS nom_departament, p.apellido1 AS primer_cognom, p.apellido2 AS segon_cognom, p.nombre AS nom_professor FROM universidad.persona p LEFT JOIN universidad.profesor pr ON pr.id_profesor = p.id LEFT JOIN universidad.departamento d ON d.id = pr.id_departamento WHERE p.tipo = 'profesor' ORDER BY d.nombre ASC, p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;
SELECT * FROM universidad.persona WHERE persona.tipo = 'alumno' ORDER BY persona.fecha_nacimiento DESC LIMIT 1;
SELECT persona.id, persona.nombre, persona.apellido1 FROM universidad.persona JOIN universidad.profesor ON persona.id = profesor.id_profesor LEFT JOIN universidad.asignatura ON profesor.id_profesor = asignatura.id_profesor INNER JOIN universidad.departamento ON profesor.id_departamento = departamento.id WHERE asignatura.id IS NULL;