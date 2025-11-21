"use client";

import { useState } from "react";
import Table from "../components/Table";
import AuditForm from "../components/AuditForm";
import Link from "next/link";

export default function AuditPage() {
  const [data, setData] = useState([]);

  return (
    <div className="min-h-screen bg-neutral-900 text-neutral-200 p-6">
      <h1 className="text-4xl font-semibold mb-6 text-neutral-100">
        Hospital – <Link href="/"> <span className="text-neutral-600">Dashboard</span> / Auditorias</Link>
      </h1>
      <div className="w-[30%]">
        <AuditForm onResult={setData} />
      </div>

      <Table data={data} />
    </div>
  );
}
