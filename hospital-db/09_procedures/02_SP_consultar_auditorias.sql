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
    SET NOCOUNT ON;

    SELECT 
        *
    FROM Auditoria.LogGuardias
    
    --Filtra por los parámetros proporcionados, son todos opcionales
    WHERE
        (@usuario IS NULL OR usuario = @usuario)
        AND (@accion IS NULL OR accion = @accion)
        AND (@fecha IS NULL OR fecha = @fecha)
    ORDER BY fecha DESC, idLog DESC;
END;

GO