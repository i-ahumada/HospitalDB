"use client";

import { useState } from "react";

export default function RecorridoForm({ onResult }: any) {
  const [idRonda, setIdRonda] = useState("");
  const [fechaActual, setFechaActual] = useState("");
  const [nuevaFecha, setNuevaFecha] = useState("");

  async function handleSubmit(e: any) {
    e.preventDefault();

    const body = {
      usuario: idRonda,            // mapea a idRonda
      accion: fechaActual,         // mapea a fechaActual
      fecha: nuevaFecha,           // mapea a nuevaFecha
    };

    const res = await fetch("/api/recorridos", {
      method: "PUT",
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
        Actualizar Recorrido
      </h2>

      <div className="flex flex-col gap-1">
        <label className="text-neutral-400">ID de Ronda</label>
        <input
          type="number"
          required
          value={idRonda}
          onChange={(e) => setIdRonda(e.target.value)}
          className="bg-neutral-800 text-neutral-200 border border-neutral-700 p-2 rounded focus:ring-2 focus:ring-neutral-600 outline-none"
        />
      </div>

      <div className="flex flex-col gap-1">
        <label className="text-neutral-400">Fecha Actual</label>
        <input
          type="datetime-local"
          required
          value={fechaActual}
          onChange={(e) => setFechaActual(e.target.value)}
          className="bg-neutral-800 text-neutral-200 border border-neutral-700 p-2 rounded focus:ring-2 focus:ring-neutral-600 outline-none"
        />
      </div>

      <div className="flex flex-col gap-1">
        <label className="text-neutral-400">Nueva Fecha</label>
        <input
          type="datetime-local"
          required
          value={nuevaFecha}
          onChange={(e) => setNuevaFecha(e.target.value)}
          className="bg-neutral-800 text-neutral-200 border border-neutral-700 p-2 rounded focus:ring-2 focus:ring-neutral-600 outline-none"
        />
      </div>

      <button
        type="submit"
        className="bg-neutral-700 hover:bg-neutral-600 text-neutral-200 px-4 py-2 rounded transition"
      >
        Actualizar
      </button>
    </form>
  );
}
