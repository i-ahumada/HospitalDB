import { getPool } from "@/lib/db";

export async function GET() {
    const pool = await getPool();

    const query = `
        SELECT
            me.matricula,
            pe.apellido,
            pe.nombre,
            pe.sexo,
            me.cantMaxGuardia,
            mes.tomaGuardia,
            e.Description
        FROM Internacion.Persona pe
        JOIN Internacion.Medico me 
            ON pe.dni = me.dni
        JOIN Guardias.MedicoEspecializado mes 
            ON mes.matricula = me.matricula
        JOIN Guardias.Especializacion e 
            ON e.idEsp = mes.idEsp
        ORDER BY me.matricula;
    `;

    const result = await pool.request().query(query);
    return Response.json(result.recordset);
}
