import { getPool } from "@/lib/db";

export async function GET() {
    const pool = await getPool();

    const query = `
        SELECT 
            i.idInternacion,
            i.dni,
            p.apellido + ', ' + p.nombre AS Paciente,
            i.fechaInicio,
            i.fechaFin
        FROM Internacion.Internacion i
        JOIN Internacion.Persona p ON p.dni = i.dni
        ORDER BY i.idInternacion;
    `;

    const result = await pool.request().query(query);
    return Response.json(result.recordset);
}
