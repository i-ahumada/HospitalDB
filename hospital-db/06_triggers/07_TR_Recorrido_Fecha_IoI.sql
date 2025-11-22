USE Hospital;
GO

CREATE OR ALTER TRIGGER Seguimiento.TR_Recorrido_Fecha_IoI
ON Seguimiento.Recorrido
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;
    SET LANGUAGE Spanish;

    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE i.fecha < GETDATE()  -- recorrido original es futuro
    )
    BEGIN
        RAISERROR(
            'No se puede cambiar la fecha del recorrido a una fecha que ya paso.',
            16, 1
        );
        RETURN;
    END

    INSERT INTO Seguimiento.Recorrido (idRonda, fecha, matricula)
    SELECT i.idRonda, i.fecha, i.matricula
    FROM inserted i;
END
GO
