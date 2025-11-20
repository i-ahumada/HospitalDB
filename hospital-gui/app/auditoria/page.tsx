"use client";

import { useEffect, useState } from "react";
import Table from "../components/Table";

export default function AuditoriaPage() {
  const [data, setData] = useState([]);

  useEffect(() => {
    fetch("/api/auditoria")
      .then(r => r.json())
      .then(setData);
  }, []);

  return (
    <div>
      <h1 className="text-2xl mb-4">Auditoría de Guardias</h1>
      <Table data={data} />
    </div>
  );
}
