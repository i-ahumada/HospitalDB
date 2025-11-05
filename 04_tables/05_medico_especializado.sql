USE [Hospital];
GO

-- Medico especializado

CREATE TABLE Guardias.MedicoEspecializado (
    matricula matricula_type NOT NULL,
    idEsp INT NOT NULL,
    tomaGuardia BIT NOT NULL,
    PRIMARY KEY (idEsp, matricula),
);

GO