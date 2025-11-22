import { getPool } from "@/lib/db";
import sql from "mssql";

export async function PUT(req: Request) {
  try {
    const { usuario, accion, fecha } = await req.json();

    const pool = await getPool();
    const result = await pool.request()
      .input("idRonda", sql.Int, usuario)
      .input("fechaActual", sql.DateTime, new Date(accion))
      .input("nuevaFecha", sql.DateTime, new Date(fecha))
      .execute("Seguimiento.ActualizarFechaRecorrido");
    console.log(result.recordset)
    return Response.json(result.recordset);
  } catch (err: any) {
    return Response.json({ error: err.message }, { status: 500 });
  }
}
