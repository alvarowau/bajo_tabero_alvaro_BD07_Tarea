-- Bloque de código PL/SQL
DECLARE
	ListaCursos1 ListaCursos;

	Curso1 Cursos;
	Curso2 Cursos;

	profe REF Profesor;

	unAlumno Alumno;
BEGIN
	SELECT REF(p) INTO profe FROM profesorado p WHERE p.codigo = 3;
	Curso1 := new Cursos(1,'Curso1',profe,20,'06-01-2011','06-30-2011',30);

	SELECT REF(p) INTO profe FROM profesorado p WHERE p.dni = '51083099F';
	Curso2 := new Cursos(2,'Curso2',profe,20,'06-01-2011','06-30-2011',30);

	listacursos1 := ListaCursos(Curso1,Curso2);

	INSERT INTO Alumnado VALUES (Alumno(100,'76401092Z','MANUEL','SUAREZ IBAÑEZ','M','06-30-1990',ListaCursos1(1)));
	INSERT INTO Alumnado VALUES (Alumno(102,'6915588V','MILAGROSA','DIAZ PEREZ','F','10-28-1984',ListaCursos1(2)));

	SELECT VALUE(a) INTO unAlumno FROM Alumnado a WHERE a.codigo = 100;

	UPDATE Alumnado
	SET codigo=101, cursoAlumno = listacursos1(2)
	WHERE codigo = unAlumno.codigo;


END;