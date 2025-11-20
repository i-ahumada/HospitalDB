USE Hospital
GO

CREATE TABLE Seguimiento.Recorrido (
    idRonda INT NOT NULL,
    fecha DATE NOT NULL,
    matricula matricula_type NOT NULL,
    PRIMARY KEY (idRonda, fecha),
);

GO