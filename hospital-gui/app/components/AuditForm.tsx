"use client";

import { useState } from "react";

export default function AuditForm({ onResult }: any) {
  const [usuario, setUsuario] = useState("");
  const [accion, setAccion] = useState("");
  const [fecha, setFecha] = useState("");

  async function handleSubmit(e: any) {
    e.preventDefault();

    const body = {
      usuario: usuario || null,
      accion: accion || null,
      fecha: fecha || null,
    };

    const res = await fetch("/api/auditorias", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(body),
    });

    const data = await res.json();
    onResult(data);
  }

  return (
    <form
      onSubmit={handleSubmit}
      className="bg-neutral-900 border border-neutral-700 p-4 rounded-lg mb-6 space-y-4"
    >
        <h2 className="text-xl font-semibold text-neutral-200">
            Filtro de Auditorías
        </h2>
            
        <div className="flex flex-col gap-1">
            <label className="text-neutral-400">Usuario</label>
            <input
            type="text"
            value={usuario}
            onChange={(e) => setUsuario(e.target.value)}
            className="bg-neutral-800 text-neutral-200 border border-neutral-700 p-2 rounded focus:ring-2 focus:ring-neutral-600 outline-none"
            />
        </div>

        <div className="flex flex-col gap-1">
            <label className="text-neutral-400">Acción</label>
            <select
            value={accion}
            onChange={(e) => setAccion(e.target.value)}
            className="bg-neutral-800 text-neutral-200 border border-neutral-700 p-2 rounded focus:ring-2 focus:ring-neutral-600 outline-none"
            >
            <option value="">(todas)</option>
            <option value="INSERT">INSERT</option>
            <option value="UPDATE">UPDATE</option>
            <option value="DELETE">DELETE</option>
            </select>
        </div>

        <div className="flex flex-col gap-1">
            <label className="text-neutral-400">Fecha exacta</label>
            <input
            type="datetime-local"
            value={fecha}
            onChange={(e) => setFecha(e.target.value)}
            className="bg-neutral-800 text-neutral-200 border border-neutral-700 p-2 rounded focus:ring-2 focus:ring-neutral-600 outline-none"
            />
        </div>

        <button
            type="submit"
            className="bg-neutral-700 hover:bg-neutral-600 text-neutral-200 px-4 py-2 rounded transition"
        >
            Consultar
        </button>
    </form>
  );
}
