USE [Hospital];
GO


CREATE OR ALTER TRIGGER Internacion.TR_Habitacion_Orientacion
ON Internacion.Habitacion
INSTEAD OF INSERT -- Por el identity, sino si falla el rollback se come un indice y pasa de ej 99 a 101
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE i.orientacion NOT IN ('Norte', 'Sur', 'Este', 'Oeste')
    )
    BEGIN
        RAISERROR(N'Error de Validación: La orientación debe ser uno de los siguientes valores: Norte, Sur, Este u Oeste.', 16, 1);
        RETURN;
    END

    INSERT INTO Internacion.Habitacion (
        piso, 
        orientacion, 
        idSector
    )
    SELECT
        i.piso,
        i.orientacion,
        i.idSector
    FROM inserted i;
END
GO