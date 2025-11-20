import { getPool } from "@/lib/db";

export async function GET() {
  try {
    const pool = await getPool();

    const result = await pool.request().query(`
      SELECT TOP 1 descripcion FROM Internacion.Sector
    `);

    return Response.json({
      ok: true,
      rows: result.recordset
    });
  } catch (err: any) {
    return new Response(
      JSON.stringify({
        ok: false,
        error: err.message,
        stack: err.stack
      }),
      { status: 500 }
    );
  }
}
