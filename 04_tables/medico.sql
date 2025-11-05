USE [HospitalInternaciones];
GO

-- Medic

CREATE TABLE Internacion.Medico (
    Matricula [dbo].[Matricula] NOT NULL PRIMARY KEY,
    Cuil VARCHAR(13) NOT NULL,
    CantMaxGuardia INT NOT NULL,
    FechaIngreso DATETIME NOT NULL,
    Foto [dbo].[img] NOT NULL,
    Dni [dbo].[Dni] NOT NULL,
);

ALTER TABLE Internacion.Medico
ADD CONSTRAINT FK_Dni
    FOREIGN KEY (Dni)
    REFERENCES dbo.Persona
    ON DELETE CASCADE;
    
GO
