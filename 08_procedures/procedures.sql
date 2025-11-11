CREATE OR ALTER PROCEDURE Internacion.ListadoCantCamasDisponiblesPorSector
AS
BEGIN
    SET NOCOUNT ON;

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
END;
GO

CREATE OR ALTER PROCEDURE Internacion.ListadoDetalleCamasDisponiblesPorSector
AS
BEGIN
    SET NOCOUNT ON;
    
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
    ORDER BY s.idHabitacion, s.descripcion, h.idHabitacion, c.nroCama;
END;
GO

CREATE OR ALTER PROCEDURE Internacion.ListadoComentariosEnInternacion
@dniPaciente dni_type,
@idInternacion INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT cd.comentario, cd.fecha
    FROM 
        Seguimiento.ComentadaDurante cd
    INNER JOIN Internacion i ON i.idInternacion = cd.idInternacion
    WHERE i.dni = @dniPaciente
    AND i.idInternacion = @idInternacion
    ORDER BY cd.fecha
END;
GO
