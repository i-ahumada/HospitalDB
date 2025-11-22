USE Hospital;
GO

CREATE OR ALTER PROCEDURE Seguimiento.ActualizarFechaRecorrido
(
    @idRonda INT,
    @fechaActual DATE,
    @nuevaFecha DATE
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN;

        UPDATE Seguimiento.Recorrido
        SET fecha = @nuevaFecha
        WHERE idRonda = @idRonda
          AND fecha = @fechaActual;

        IF @@ROWCOUNT = 0
        BEGIN
            DECLARE @fechaStr VARCHAR(10) = CONVERT(VARCHAR(10), @fechaActual, 120);
            RAISERROR(
                'No se encontró el recorrido a actualizar (idRonda=%d, fecha=%s).',
                16, 1, @idRonda, @fechaStr
            );
            ROLLBACK TRAN;
            RETURN;
        END

        COMMIT TRAN;

        SELECT *
        FROM Seguimiento.Recorrido
        WHERE idRonda = @idRonda
          AND fecha = @nuevaFecha;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRAN;

        THROW;
    END CATCH
END;
GO
