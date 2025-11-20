USE [Hospital];
GO
CREATE TRIGGER Internacion.TR_UbicadaEn_FechaEntrada
ON Internacion.UbicadaEn
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        INNER JOIN Internacion.Internacion t ON i.idInternacion = t.idInternacion
        WHERE i.fechaYHora < t.fechaInicio
    )
    BEGIN
        RAISERROR(N'Error de Validación: La fecha de la asignación de cama no puede ser anterior a la fecha de inicio de la internación.', 16, 1);
        ROLLBACK TRANSACTION; 
        RETURN;
    END
END
GO
