USE [Hospital]
GO

CREATE TABLE Internacion.Sector (
    idSector INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    descripcion NVARCHAR(50) NOT NULL
);

GO