USE Hospital
GO

CREATE TABLE Seguimiento.ComentadaDurante (
    idInternacion INT NOT NULL,
    idRonda INT NOT NULL,
    fecha DATE NOT NULL,
    comentario NVARCHAR(MAX) NOT NULL,
    PRIMARY KEY (idInternacion, idRonda, fecha),
);

GO