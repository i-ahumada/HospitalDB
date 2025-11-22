USE Hospital
GO

CREATE TABLE Internacion.UbicadaEn (
    idHabitacion INT NOT NULL,
    nroCama TINYINT NOT NULL,
    fechaYHora DATETIME NOT NULL,
    idInternacion INT NOT NULL,
    PRIMARY KEY (idHabitacion, nroCama, fechaYHora),
);

GO

