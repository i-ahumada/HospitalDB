USE [Hospital]
GO

CREATE OR ALTER PROCEDURE Internacion.ListadoDetalleCamasDisponiblesPorSector
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY   
        SELECT
            s.idSector,
            s.descripcion AS Sector,
            h.idHabitacion,
            h.piso,
            h.orientacion,
            c.nroCama
        FROM 
            Sector s
            INNER JOIN Habitacion h ON s.idSector = h.idSector
            INNER JOIN Cama c ON h.idHabitacion = c.idHabitacion
        WHERE c.ocupada = 0
        ORDER BY s.idSector, s.descripcion, h.idHabitacion, c.nroCama;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH;
END;
GO