USE [Hospital];
GO


CREATE OR ALTER TRIGGER Internacion.TR_Internacion_FechaFin
ON Internacion.Internacion
AFTER UPDATE -- Porque deberia ser NULL fechaFin y se updatea cuando ese valor cuando se termina la internacion
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE i.fechaFin <= i.fechaInicio
    )
    BEGIN
        RAISERROR(N'Error de Validación: La fecha de finalizacion de la internación debe ser mayor que la del inicio de esta.', 16, 1);
        RETURN;
    END
    IF EXISTS (
        SELECT 1
        FROM inserted i
        INNER JOIN Internacion.UbicadaEn u ON u.idInternacion = i.idInternacion
        WHERE i.fechaFin < u.fechaYHora 
    )
    BEGIN
        RAISERROR(N'Error de Validación: La fecha de finalizacion de la internación debe ser mayor o igual que la fecha de la última cama asignada a esta', 16, 2);
        RETURN;
    END
END
GO