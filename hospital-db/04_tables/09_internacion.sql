USE Hospital
GO

CREATE TABLE Internacion.Internacion (
    idInternacion INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    fechaInicio DATE NOT NULL,
    fechaFin DATE NOT NULL,
    matricula matricula_type NOT NULL,
    dni dni_type NOT NULL,
);

GO
