-- Crear tipo de objeto "Profesor" heredado de "MiembroEscolar"
CREATE OR REPLACE TYPE Profesor UNDER MiembroEscolar(
    especialidad VARCHAR2(20),
    antiguedad INTEGER,

    CONSTRUCTOR FUNCTION Profesor(
        codigo INTEGER,
        nombre VARCHAR2,
        apellido1 VARCHAR2,
        apellido2 VARCHAR2,
        especialidad VARCHAR2
    ) RETURN SELF AS RESULT,

    MEMBER FUNCTION getNombreCompleto RETURN VARCHAR2
);

-- Método constructor para el tipo de objetos "Profesor"
CREATE OR REPLACE TYPE BODY Profesor AS
    CONSTRUCTOR FUNCTION Profesor (
        codigo INTEGER,
        nombre VARCHAR2,
        apellido1 VARCHAR2,
        apellido2 VARCHAR2,
        especialidad VARCHAR2
    ) RETURN SELF AS RESULT IS
    BEGIN
        self.codigo := codigo;
        self.nombre := nombre;
        self.apellidos := apellido1 || ' ' || apellido2;
        self.especialidad := especialidad;
        RETURN;
    END;

    MEMBER FUNCTION getNombreCompleto RETURN VARCHAR2 IS
    BEGIN
        RETURN SELF.nombre || ' ' || SELF.apellidos;
    END;

END;