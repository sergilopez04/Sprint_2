SELECT apellido1, apellido2, nombre FROM universidad.persona WHERE tipo LIKE 'alumno' ORDER BY apellido1 ASC, apellido2 ASC,  nombre ASC;
SELECT nombre, apellido1, apellido2 FROM universidad.persona WHERE tipo LIKE 'alumno' AND telefono IS NULL;
SELECT nombre, apellido1, apellido2, fecha_nacimiento FROM universidad.persona WHERE YEAR(fecha_nacimiento) = 1999 AND tipo LIKE 'alumno';
SELECT nombre, apellido1, apellido2, nif FROM universidad.persona WHERE tipo LIKE 'profesor' AND telefono IS NULL AND nif LIKE '%K';
SELECT nombre FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND  id_grado = 7;
SELECT persona.nombre, persona.apellido1, persona.apellido2, departamento.nombre AS nombreDepartamento FROM persona JOIN profesor ON persona.id = profesor.id_profesor JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY persona.apellido1, persona.apellido2, persona.nombre;
SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin FROM asignatura a JOIN alumno_se_matricula_asignatura asa ON a.id = asa.id_asignatura JOIN curso_escolar ce ON asa.id_curso_escolar = ce.id JOIN persona p ON asa.id_alumno = p.id WHERE p.NIF = '26902806M';
SELECT DISTINCT d.nombre FROM departamento d JOIN profesor p ON d.id = p.id_departamento JOIN asignatura a ON p.id_profesor JOIN grado g ON a.id_grado = g.id WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
SELECT DISTINCT p.nombre, p.apellido1, p.apellido2 FROM persona p JOIN alumno_se_matricula_asignatura asa ON p.id = asa.id_alumno JOIN curso_escolar ce ON asa.id_curso_escolar = ce.id WHERE ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019;


