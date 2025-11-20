import { getPool } from "@/lib/db";

export async function GET(req: Request, { params }: { params: {id: string}} ) {
    const id = params.id;
    const pool = await getPool();

    const result = await pool.request()
        .input("idInternacion", id)
        .execute("Seguimiento.ListarComentariosInternacion");

    return Response.json(result.recordset);
}
