USE [HospitalInternaciones];
GO

-- Speciality

CREATE TABLE Internacion.Especializacion (
    idEsp [dbo].[Name] NOT NULL PRIMARY KEY,
    Description NVARCHAR(200) NOT NULL, 
);

GO