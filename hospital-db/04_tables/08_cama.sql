USE [Hospital]
GO

CREATE TABLE Internacion.Cama (
    idHabitacion INT NOT NULL,
    nroCama TINYINT NOT NULL,
    ocupada BIT NOT NULL,
    PRIMARY KEY (idHabitacion, nroCama),
);

GO
