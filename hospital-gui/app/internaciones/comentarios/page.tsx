"use client";

import { useEffect, useState } from "react";

export default function ComentariosInternacionPage() {
  const [internaciones, setInternaciones] = useState([]);
  const [comentarios, setComentarios] = useState([]);
  const [selected, setSelected] = useState("");

  useEffect(() => {
    fetch("/api/internaciones")
      .then(r => r.json())
      .then(setInternaciones);
  }, []);

  function cargarComentarios(id: string) {
    setSelected(id);
    fetch(`/api/internaciones/${id}/comentarios`)
      .then(r => r.json())
      .then(setComentarios);
  }

  return (
    <div>
      <h1 className="text-2xl font-bold mb-4">
        Comentarios por Internación
      </h1>

      <label className="block mb-2 font-semibold">Seleccionar internación:</label>

      <select
        value={selected}
        onChange={(e) => cargarComentarios(e.target.value)}
        className="border p-2 rounded mb-6"
      >
        <option value="">Seleccione...</option>
        {internaciones.map((i: any) => (
          <option key={i.idInternacion} value={i.idInternacion}>
            {i.idInternacion} — {i.Paciente}
          </option>
        ))}
      </select>

      {comentarios.length > 0 && (
        <table className="min-w-full border rounded">
          <thead className="bg-gray-200">
            <tr>
              <th className="p-2 border">Fecha</th>
              <th className="p-2 border">Comentario</th>
              <th className="p-2 border">Médico</th>
            </tr>
          </thead>

          <tbody>
            {comentarios.map((c: any, i: number) => (
              <tr key={i} className="odd:bg-gray-50">
                <td className="p-2 border">
                  {c.fechaComentario?.substring(0, 10)}
                </td>
                <td className="p-2 border">
                  {c.comentario}
                </td>
                <td className="p-2 border">
                  {c.medicoNombre} (Mat: {c.medicoMatricula})
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      )}

      {selected && comentarios.length === 0 && (
        <p className="text-gray-600">Esta internación no tiene comentarios.</p>
      )}
    </div>
  );
}
