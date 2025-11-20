USE Hospital;
GO

-- Medico

CREATE TABLE Internacion.Medico (
    matricula matricula_type PRIMARY KEY,
    cuil VARCHAR(13) NOT NULL,
    cantMaxGuardia INT NOT NULL,
    fechaIngreso DATE NOT NULL,
    foto imagen_type NOT NULL,
    dni dni_type NOT NULL,
);

GO
