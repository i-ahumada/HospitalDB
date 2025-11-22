USE [Hospital]
GO

CREATE TABLE Internacion.Habitacion (
    idHabitacion INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    piso TINYINT NOT NULL,
    orientacion NVARCHAR(20) NOT NULL, -- CAMBIAR
    idSector INT NOT NULL,
);

GO