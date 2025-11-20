USE [Hospital];
GO

-- Persona

CREATE TABLE Internacion.Persona (
    dni dni_type PRIMARY KEY NOT NULL,
    apellido nombre_type NOT NULL,
    nombre nombre_type NOT NULL,
    sexo CHAR(1) NOT NULL,
    fechaNacimiento DATE NOT NULL
);

GO