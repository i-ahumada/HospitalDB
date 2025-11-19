USE [Hospital]
GO

CREATE OR ALTER PROCEDURE Guardias.ConsultarAuditoriaAsignacionGuardias
(
    @usuario       VARCHAR(100) = NULL,
    @tablaAfectada VARCHAR(50) = NULL,
    @operacion     VARCHAR(10) = NULL,
    @fechaDesde    DATETIME = NULL,
    @fechaHasta    DATETIME = NULL,
    @clavePK       VARCHAR(200) = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        idAuditoria,
        usuario,
        fechaHora,
        tablaAfectada,
        operacion,
        clavePrimaria,
        datosAnteriores,
        datosNuevos
    FROM AuditoriaAsignacionGuardias
    --Filtra por los parámetros proporcionados, son todos opcionales
    WHERE
        (@usuario IS NULL OR usuario = @usuario)
        AND (@tablaAfectada IS NULL OR tablaAfectada = @tablaAfectada)
        AND (@operacion IS NULL OR operacion = @operacion)
        AND (@clavePK IS NULL OR clavePrimaria = @clavePK)
        AND (
                @fechaDesde IS NULL 
                OR fechaHora >= @fechaDesde
            )
        AND (
                @fechaHasta IS NULL 
                OR fechaHora <= @fechaHasta
            )
    ORDER BY fechaHora DESC, idAuditoria DESC;
END;

GO