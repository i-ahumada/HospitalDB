USE [HospitalInternaciones];
GO

-- Person

CREATE TABLE Internacion.Persona (
    dni BIGINT PRIMARY KEY NOT NULL,
    apellido NVARCHAR(50) NOT NULL,
    nombre NVARCHAR(50) NOT NULL,
    sexo CHAR(1) NOT NULL,
    fechaNacimiento DATE NOT NULL
);

GO