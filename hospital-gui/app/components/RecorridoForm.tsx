"use client";

import { useState } from "react";

export default function RecorridoForm({ onResult }: any) {
  const [idRonda, setIdRonda] = useState("");
  const [fechaActual, setFechaActual] = useState("");
  const [nuevaFecha, setNuevaFecha] = useState("");

  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);

  async function handleSubmit(e: any) {
    e.preventDefault();
    setError(null);
    setLoading(true);

    try {
      const body = {
        usuario: idRonda,
        accion: fechaActual,
        fecha: nuevaFecha,
      };

      const res = await fetch("/api/recorridos", {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(body),
      });

      if (!res.ok) {
        const errText = await res.text();
        throw new Error(errText || "Error desconocido en el servidor");
      }

      const data = await res.json();
      onResult(data);
      
    } catch (err: any) {
      setError(err.message || "Error al procesar la solicitud");
    } finally {
      setLoading(false);
    }
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

      {error && (
        <div className="text-red-400 text-sm border border-red-700 p-2 rounded bg-red-900/20">
          {error}
        </div>
      )}

      <button
        type="submit"
        disabled={loading}
        className="bg-neutral-700 hover:bg-neutral-600 disabled:bg-neutral-800 disabled:text-neutral-500 text-neutral-200 px-4 py-2 rounded transition"
      >
        {loading ? "Procesando..." : "Actualizar"}
      </button>
    </form>
  );
}
