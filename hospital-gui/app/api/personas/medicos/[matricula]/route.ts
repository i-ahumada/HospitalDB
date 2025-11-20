import { getPool } from "@/lib/db";

export async function GET(
  req: Request,
  { params }: { params: { matricula: string } }) 
{
    try {
        const {matricula} = await params;
        const pool = await getPool();
        const query = `
            SELECT
                pe.dni,
                me.matricula,
                me.cuil,
                me.cantMaxGuardia,
                me.fechaIngreso,
                me.foto,
                pe.apellido,
                pe.nombre,
                pe.sexo,
                pe.fechaNacimiento
            FROM Internacion.Persona pe
            JOIN Internacion.Medico me ON pe.dni = me.dni
            WHERE me.matricula = ${matricula}

        `;
        const result = await pool.request().query(query);
        return Response.json(result.recordset);
    } catch(e) {

    }
}