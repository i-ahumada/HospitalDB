"use client";

import { useEffect, useState } from "react";
import Table from "../components/Table";

export default function InternacionesPage() {
  const [data, setData] = useState([]);

  useEffect(() => {
    fetch("/api/internaciones")
      .then(r => r.json())
      .then(setData);
  }, []);

  return (
    <div>
      <h1 className="text-2xl mb-4">Internaciones</h1>
      <Table data={data} />
    </div>
  );
}
