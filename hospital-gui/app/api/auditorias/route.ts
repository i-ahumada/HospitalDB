import { getPool } from "@/lib/db";

export async function POST(req: Request) {
  try {
    const {
      usuario,
      accion,
      fecha
    } = await req.json();


    const pool = await getPool();
    const result = await pool.request()
        .input("usuario", usuario ?? null)
        .input("accion", accion ?? null)
        .input("fecha", fecha ?? null)
        .execute("Guardias.ConsultarLogGuardias");

    return Response.json(result.recordset);
  } catch (err: any) {
    return Response.json({ error: err.message }, { status: 500 });
  }
}
