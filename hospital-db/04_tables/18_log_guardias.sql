USE Hospital;
GO

CREATE TABLE Auditoria.LogGuardias (
    idLog INT IDENTITY(1,1) PRIMARY KEY,

    usuario VARCHAR(100) NOT NULL,
    accion VARCHAR(20) NOT NULL,
    fecha DATETIME NOT NULL,

    matricula_antes VARCHAR(50) NULL,
    idEsp_antes INT NULL,
    idGuardia_antes INT NULL,
    fechaGuardia_antes DATE NULL,

    matricula_despues VARCHAR(50) NULL,
    idEsp_despues INT NULL,
    idGuardia_despues INT NULL,
    fechaGuardia_despues DATE NULL
);
GO