CREATE OR ALTER TRIGGER Seguimiento.TR_Recorrido_Fecha_Before
ON Seguimiento.Recorrido
INSTEAD OF UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    SET LANGUAGE Spanish;

    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Seguimiento.Ronda r ON r.idRonda = i.idRonda
        WHERE DATENAME(WEEKDAY, i.fecha) <> r.dia
    )
    BEGIN
        RAISERROR('La fecha no coincide con el día de la ronda.', 16, 1);
        RETURN;
    END

    IF EXISTS (
        SELECT 1
        FROM deleted d
        WHERE d.fecha < CONVERT(date, GETDATE())
    )
    BEGIN
        RAISERROR('No se pueden modificar recorridos del pasado.', 16, 1);
        RETURN; 
    END

    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN deleted d
          ON d.idRonda = i.idRonda
         AND d.fecha   = i.fecha
    )
    BEGIN
        RAISERROR('No se puede actualizar un recorrido a su mismos valores anteriores.', 16, 1);
        RETURN; 
    END

    DELETE r
    FROM Seguimiento.Recorrido r
    JOIN deleted d
      ON r.idRonda = d.idRonda
     AND r.fecha   = d.fecha;

    INSERT INTO Seguimiento.Recorrido (idRonda, fecha, matricula)
    SELECT i.idRonda, i.fecha, i.matricula
    FROM inserted i;
END
GO
