CREATE OR ALTER PROCEDURE Seguimiento.ListarComentariosInternacion
(
    @idInternacion INT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        SELECT 
            cd.idInternacion,
            cd.idRonda,
            cd.fecha AS fechaComentario,
            cd.comentario,
            r.matricula AS medicoMatricula,
            p.apellido + ', ' + p.nombre AS medicoNombre
        FROM ComentadaDurante cd
        JOIN Recorrido r 
            ON cd.idRonda = r.idRonda AND cd.fecha = r.fecha
        JOIN Medico m 
            ON m.matricula = r.matricula
        JOIN Persona p
            ON p.dni = m.dni
        WHERE cd.idInternacion = @idInternacion
        ORDER BY cd.fecha;
    END TRY
    BEGIN CATCH
        THROW;  -- Reenvía el error al cliente
    END CATCH;
END;