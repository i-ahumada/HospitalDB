import { getPool } from "@/lib/db";

export async function GET() {
    const pool = await getPool();
    const result = await pool.request()
        .execute("Internacion.ListadoCantCamasDisponiblesPorSector");
    return Response.json(result.recordset);
}
