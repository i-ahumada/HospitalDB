USE [Hospital]
GO

CREATE OR ALTER PROCEDURE Internacion.ListadoPorcentajeCamasDisponiblesPorSector
AS
BEGIN
    SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- Serializable es excesivo para este problema

    BEGIN TRY
        BEGIN TRAN;

        DECLARE @camasDisponiblesPorSector TABLE (
            idSector  INT PRIMARY KEY,
            CantidadCamasDisponibles INT
        );

        DECLARE @camasTotalesPorSector TABLE (
            idSector  INT PRIMARY KEY,
            CantidadCamas INT
        );
        
        INSERT INTO @camasDisponiblesPorSector (idSector, CantidadCamasDisponibles)
        SELECT 
            s.idSector,
            COUNT(*) AS CantidadCamasDisponibles
        FROM 
            Sector s
            INNER JOIN Habitacion h ON s.idSector = h.idSector
            INNER JOIN Cama c ON h.idHabitacion = c.idHabitacion
        WHERE c.ocupada = 0
        GROUP BY s.idSector;

        INSERT INTO @camasTotalesPorSector (idSector, CantidadCamas)
        SELECT 
            s.idSector,
            COUNT(*) AS CantidadCamas
        FROM 
            Sector s
            INNER JOIN Habitacion h ON s.idSector = h.idSector
            INNER JOIN Cama c ON h.idHabitacion = c.idHabitacion
        GROUP BY s.idSector;

        SELECT 
            cd.idSector,
            s.descripcion,
            CAST(cd.CantidadCamasDisponibles AS DECIMAL(10,2)) 
                / CAST(ct.CantidadCamas AS DECIMAL(10,2)) * 100 AS PorcentajeDisponible
        FROM @camasDisponiblesPorSector cd
        JOIN @camasTotalesPorSector ct ON ct.idSector = cd.idSector 
        JOIN Sector s ON s.idSector = cd.idSector
        ORDER BY 
            CAST(cd.CantidadCamasDisponibles AS DECIMAL(10,2)) 
            / CAST(ct.CantidadCamas AS DECIMAL(10,2)) * 100 DESC;

        COMMIT TRAN;

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRAN;
        
        THROW;
    END CATCH
END;
GO
