USE Hospital
GO

CREATE TABLE Seguimiento.Ronda (
    idRonda INT PRIMARY KEY,
    turnoRonda NVARCHAR(20) NOT NULL,
    dia NVARCHAR(20) NOT NULL
);
GO
