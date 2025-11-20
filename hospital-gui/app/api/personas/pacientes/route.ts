import { getPool } from "@/lib/db";

export async function GET() {
    const pool = await getPool();

    const query = `
        SELECT
            pa.dni,
            pe.apellido,
            pe.nombre,
            pe.sexo,
            pe.fechaNacimiento
        FROM Internacion.Persona pe
        JOIN Internacion.Paciente pa ON pe.dni = pa.dni

    `;

    const result = await pool.request().query(query);
    return Response.json(result.recordset);
}
