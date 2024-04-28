-- Crear tipo de objeto "MiembroEscolar"
CREATE OR REPLACE TYPE MiembroEscolar AS OBJECT(
    codigo INTEGER,
    dni VARCHAR2(10),
    nombre VARCHAR2(30),
    apellidos VARCHAR2(30),
    sexo VARCHAR2(1),
    fecha_nac DATE
) NOT FINAL;