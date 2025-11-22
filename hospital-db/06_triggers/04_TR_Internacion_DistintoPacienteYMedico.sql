USE [Hospital];
GO


CREATE OR ALTER TRIGGER Internacion.TR_Internacion_DistintoPacienteYMedico
ON Internacion.Internacion
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        INNER JOIN Internacion.Medico m ON m.matricula = i.matricula
        WHERE i.dni = m.dni
    )
    BEGIN
        RAISERROR(N'Error de Validación: Un paciente no puede ser su propio médico.', 16, 1);
        RETURN;
    END

    INSERT INTO Internacion.Internacion (
        fechaInicio, 
        fechaFin, 
        matricula,
        dni
    )
    SELECT
        i.fechaInicio,
        i.fechaFin,
        i.matricula,
        i.dni
    FROM inserted i;

END
GO