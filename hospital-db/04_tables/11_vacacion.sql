USE Hospital
GO

CREATE TABLE Internacion.Vacacion (
    matricula matricula_type NOT NULL,
    fechaInicioVacacion DATE NOT NULL,
    fechaFinVacacion DATE NOT NULL,
    PRIMARY KEY (matricula, fechaInicioVacacion),
);

GO