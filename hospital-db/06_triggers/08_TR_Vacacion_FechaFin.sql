USE [Hospital];
GO


CREATE TRIGGER Internacion.TR_Vacacion_FechaFin
ON Internacion.Vacacion
INSTEAD OF INSERT, UPDATE -- Por el identity, sino si falla el rollback se come un indice y pasa de ej 99 a 101
AS
BEGIN
    -- FechaFinVacacion no debe ser menor a FechaInicioVacacion
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE fechaFinVacacion < fechaInicioVacacion
    )
    BEGIN
        RAISERROR(N'La fecha de fin de vacaciones no puede ser menor que la fecha de inicio.', 16, 1);
        RETURN;
    END;

    INSERT INTO Internacion.Vacacion (
        matricula,
        fechaInicioVacacion,
        fechaFinVacacion
    )
    SELECT i.matricula, i.fechaInicioVacacion, i.fechaFinVacacion
    FROM inserted i;
END
GO