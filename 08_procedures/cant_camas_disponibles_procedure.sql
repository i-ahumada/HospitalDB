CREATE OR ALTER PROCEDURE Internacion.ListadoCantCamasDisponiblesPorSector
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        SELECT 
            s.idSector,
            s.descripcion AS Sector,
            COUNT(*) AS CantidadCamasDisponibles
        FROM 
            Sector s
            INNER JOIN Habitacion h ON s.idSector = h.idSector
            INNER JOIN Cama c ON h.idHabitacion = c.idHabitacion
        WHERE c.ocupada = 0
        GROUP BY s.idSector, s.descripcion
        END TRY
    BEGIN CATCH
        THROW; --Reenví­a el error al cliente
    END CATCH
END;