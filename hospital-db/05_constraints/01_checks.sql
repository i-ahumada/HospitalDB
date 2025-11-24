Use Hospital
GO

ALTER TABLE Guardias.Guardia
ADD CONSTRAINT CK_Guardia_Turno
CHECK (
    UPPER(turno COLLATE Latin1_General_CI_AI) IN ('MANANA','TARDE','NOCHE')
);

ALTER TABLE Internacion.Vacacion
ADD CONSTRAINT CK_Vacacion_Fechas
CHECK (fechaFinVacacion >= fechaInicioVacacion);
GO
