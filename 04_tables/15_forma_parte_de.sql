USE Hospital
GO

CREATE TABLE Seguimiento.FormaParteDe (
    idHabitacion INT NOT NULL,
    idRonda INT NOT NULL,
    PRIMARY KEY (idHabitacion, idRonda),
);

GO