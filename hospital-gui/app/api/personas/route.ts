import { getPool } from "@/lib/db";

export async function GET() {
    const pool = await getPool();

    const query = `
        SELECT *
        FROM Internacion.Persona
    `;

    const result = await pool.request().query(query);
    return Response.json(result.recordset);
}
