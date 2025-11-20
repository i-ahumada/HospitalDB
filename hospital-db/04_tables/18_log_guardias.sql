USE Hospital;
GO

CREATE TABLE Auditoria.LogGuardias (
    idLog INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    usuario VARCHAR(100) NOT NULL,
    accion VARCHAR(100) NOT NULL,
    fecha DATETIME NOT NULL
);

GO