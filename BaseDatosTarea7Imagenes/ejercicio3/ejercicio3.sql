-- Crear tipo de objeto "Cursos"
CREATE OR REPLACE TYPE Cursos AS OBJECT(
    codigo INTEGER,
    nombre VARCHAR2(20),
    refProfe REF Profesor,
    max_alum INTEGER,
    fecha_inic DATE,
    fecha_fin DATE,
    num_horas INTEGER,

    MAP MEMBER FUNCTION OrdenarCursos RETURN VARCHAR2
);

-- Método MAP "OrdenarCursos" para el tipo "Cursos"
CREATE OR REPLACE TYPE BODY Cursos AS
    MAP MEMBER FUNCTION OrdenarCursos RETURN VARCHAR2 IS
    BEGIN
        RETURN self.refProfe.getNombreCompleto();
    END OrdenarCursos;
END;