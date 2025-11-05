USE [HospitalInternaciones];
GO

-- Specialized Medic

CREATE TABLE RRHH.MedicoEspecializado (
    Matricula [dbo].[Matricula] NOT NULL,
    idEsp [dbo].[Name] NOT NULL,
    tomaGuardia BIT NOT NULL,
    PRIMARY KEY (idEsp, Matricula),
);

ALTER TABLE RRHH.MedicoEspecializado
ADD CONSTRAINT FK_Matricula
    FOREIGN KEY (Matricula)
    REFERENCES RRHH.Medico
    ON DELETE CASCADE;

ALTER TABLE RRHH.MedicoEspecializado
ADD CONSTRAINT FK_idEsp
    FOREIGN KEY (idEsp)
    REFERENCES RRHH.Especializacion
    ON DELETE CASCADE;

GO