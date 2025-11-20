import { getPool } from "@/lib/db";

export async function GET(
  req: Request,
  { params }: { params: { id: string } }
) {
  try {
    console.log("Entro")
    const {id} = await params;
    console.log("ID: ", id)

    const pool = await getPool();
    const result = await pool
      .request()
      .input("idInternacion", parseInt(id))
      .execute("Seguimiento.ListarComentariosInternacion");

    return Response.json(result.recordset);
  } catch (err: any) {
    return Response.json({ ok: false, error: err.message }, { status: 500 });
  }
}
