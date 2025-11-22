"use client";

import { useState } from "react";
import RecorridoForm from "../components/RecorridoForm";
import Link from "next/link";
import Table from "../components/Table";

export default function RecorridosPage() {
  const [data, setData] = useState<any>(null);

  return (
    <div className="min-h-screen bg-neutral-900 text-neutral-200 p-6">
      <h1 className="text-4xl font-semibold mb-6 text-neutral-100">
        Hospital – <span className="text-neutral-600"><Link href="/">Dashboard /</Link> <Link href="/auditorias"> Auditorias /</Link></span>  Recorridos
      </h1>

      <div className="w-[30%]">
        <RecorridoForm onResult={setData} />
      </div>

      <Table data={data} />
    </div>
  );
}
