import * as sql from "mssql";

const config = {
  user: "hospital_user",
  password: "Hospital2025!",
  server: "localhost",
  database: "Hospital",
  options: {
    trustServerCertificate: true
  }
};

let pool:any;

export async function getPool() {
  if (!pool) {
    pool = await sql.connect(config);
  }
  return pool;
}
