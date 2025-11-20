import { getPool } from "@/lib/db";

export async function GET(
  req: Request,
  { params }: { params: { dni: string } }
) {
    try {
        const {dni} = await params;
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
            WHERE pa.dni = ${dni}
        `;

        const result = await pool.request().query(query);
        return Response.json(result.recordset);
    } catch (err: any) {
        return Response.json({ ok: false, error: err.message }, { status: 500 });
    }
}
