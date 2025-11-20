USE [Hospital];
GO

-- Especialización

CREATE TABLE Guardias.Especializacion (
    idEsp INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Description NVARCHAR(100) NOT NULL, 
);

GO