USE [Hospital]
GO

CREATE OR ALTER PROCEDURE Guardias.ConsultarLogGuardias
(
    @usuario    VARCHAR(100) = NULL,
    @accion     VARCHAR(20) = NULL,
    @fecha      DATETIME = NULL
)
AS
BEGIN
    SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

    BEGIN TRY
        BEGIN TRAN;

        SELECT 
            *
        FROM Auditoria.LogGuardias
        WHERE
            (@usuario IS NULL OR usuario = @usuario)
            AND (@accion IS NULL OR accion = @accion)
            AND (@fecha IS NULL OR fecha = @fecha)
        ORDER BY fecha DESC, idLog DESC;

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK;

        THROW;
    END CATCH
END;
GO
