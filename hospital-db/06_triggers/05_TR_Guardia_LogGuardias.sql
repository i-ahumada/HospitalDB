USE Hospital;
GO

CREATE OR ALTER TRIGGER Guardias.trg_LogGuardias
ON Guardias.Cubre
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @usuario VARCHAR(100) = SUSER_SNAME();
    DECLARE @fecha DATETIME = GETDATE();

    -- INSERT
    INSERT INTO Auditoria.LogGuardias (
        usuario, accion, fecha,
        matricula_despues, idEsp_despues, idGuardia_despues, fechaGuardia_despues
    )
    SELECT
        @usuario,
        'INSERT',
        @fecha,
        i.matricula, i.idEsp, i.idGuardia, i.fecha
    FROM inserted i
    WHERE NOT EXISTS (SELECT 1 FROM deleted);

    -- DELETE
    INSERT INTO Auditoria.LogGuardias (
        usuario, accion, fecha,
        matricula_antes, idEsp_antes, idGuardia_antes, fechaGuardia_antes
    )
    SELECT
        @usuario,
        'DELETE',
        @fecha,
        d.matricula, d.idEsp, d.idGuardia, d.fecha
    FROM deleted d
    WHERE NOT EXISTS (SELECT 1 FROM inserted);

    -- UPDATE
    INSERT INTO Auditoria.LogGuardias (
        usuario, accion, fecha,
        matricula_antes, idEsp_antes, idGuardia_antes, fechaGuardia_antes,
        matricula_despues, idEsp_despues, idGuardia_despues, fechaGuardia_despues
    )
    SELECT
        @usuario,
        'UPDATE',
        @fecha,
        d.matricula, d.idEsp, d.idGuardia, d.fecha,   -- BEFORE
        i.matricula, i.idEsp, i.idGuardia, i.fecha    -- AFTER
    FROM inserted i
    INNER JOIN deleted d
        ON d.matricula = i.matricula
       AND d.idEsp = i.idEsp
       AND d.idGuardia = i.idGuardia
       AND d.fecha = i.fecha;
END;
GO
