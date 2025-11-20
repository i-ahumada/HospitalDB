USE Hospital;
GO

CREATE TABLE Guardias.Cubre (
    matricula matricula_type NOT NULL,
    idEsp INT NOT NULL,
    idGuardia INT NOT NULL,
    fecha DATE NOT NULL,
    PRIMARY KEY (matricula, idEsp, idGuardia, fecha),
);

GO