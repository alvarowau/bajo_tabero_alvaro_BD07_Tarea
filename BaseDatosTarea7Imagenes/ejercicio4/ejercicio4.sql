-- Crear tipo de objeto "Alumno" heredado de "MiembroEscolar"
CREATE OR REPLACE TYPE Alumno UNDER MiembroEscolar(
    cursoAlumno Cursos
);