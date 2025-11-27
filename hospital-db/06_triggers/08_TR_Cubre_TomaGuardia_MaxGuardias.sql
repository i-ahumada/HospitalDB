USE [Hospital];
GO


CREATE TRIGGER Guardias.TR_Cubre_TomaGuardia_MaxGuardias
ON Guardias.Cubre
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted i
        INNER JOIN Guardias.MedicoEspecializado m ON i.matricula = m.matricula
        WHERE m.tomaGuardia = 0
    )
    BEGIN
        RAISERROR(N'Error de Validación: El medico seleccionado no toma guardias de esa especialidad.', 16, 1);
        RETURN;
    END

    IF EXISTS (
        SELECT 1
        FROM inserted i
        INNER JOIN Internacion.Medico m ON i.matricula = m.matricula
        WHERE m.cantMaxGuardia <= (
            SELECT COUNT(*)
            FROM Cubre c
            WHERE c.matricula = m.matricula 
                AND MONTH(c.fecha) = MONTH(GETDATE())
        )
    )
    BEGIN
        RAISERROR(N'Error de Validación: El medico seleccionado no puede tomar mas guardias este mes.', 16, 1);
        RETURN;
    END

    INSERT INTO Cubre(matricula, idEsp, idGuardia, fecha)
    SELECT i.matricula, i.idEsp, i.idGuardia, i.fecha
    FROM inserted i
END
GO
