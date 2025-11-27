"use client";

import { useEffect, useState } from "react";
import Table from "./components/Table";
import Link from "next/link";

export default function HomePage() {
  const [data, setData] = useState([]);

  const [pacientes, setPacientes] = useState([]);
  const [internaciones, setInternaciones] = useState([]);

  const [selectedPaciente, setSelectedPaciente] = useState("");
  const [selectedInternacion, setSelectedInternacion] = useState("");

  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);


  async function safeFetch(url: string, setter: Function) {
    try {
      setError(null);
      setLoading(true);

      const res = await fetch(url);

      if (!res.ok) {
        const txt = await res.text();
        throw new Error(txt || "Error al conectar con la base de datos");
      }

      const json = await res.json();
      setter(json);
    } catch (err: any) {
      setError(err.message || "Error realizando la consulta");
    } finally {
      setLoading(false);
    }
  }


  useEffect(() => {
    safeFetch("/api/personas/pacientes", setPacientes);
    safeFetch("/api/internaciones", setInternaciones);
  }, []);


  function getPersonas() {
    safeFetch("/api/personas", setData);
  }
  function getPacientes() {
    safeFetch("/api/personas/pacientes", setData);
  }
  function getDetalleCamasDisponibles() {
    safeFetch("/api/camas/detalle", setData);
  }
  function getCantidadCamasDisponibles() {
    safeFetch("/api/camas/disponibles", setData);
  }
  function getCantidadCamasPorcentajeDisponibles() {
    safeFetch("/api/camas/porcentaje", setData);
  }
  function getMedicos() {
    safeFetch("/api/personas/medicos", setData);
  }
  function getMedicosEspecializados() {
    safeFetch("/api/personas/medicos/especializados", setData);
  }
  function getInternaciones() {
    safeFetch("/api/internaciones", setData);
  }
  function getPacienteByDNI(dni: string) {
    safeFetch(`/api/personas/pacientes/${dni}`, setData);
  }
  function getComentariosPorInternacion(id: string) {
    safeFetch(`/api/internaciones/${id}/comentarios`, setData);
  }


  function handlePacienteSelect(e: any) {
    const dni = e.target.value;
    setSelectedPaciente(dni);
    if (dni) getPacienteByDNI(dni);
  }

  function handleInternacionSelect(e: any) {
    const id = e.target.value;
    setSelectedInternacion(id);
    if (id) getComentariosPorInternacion(id);
  }

  return (
    <div className="min-h-screen bg-neutral-900 text-neutral-200 p-6">

      <h1 className="text-4xl font-semibold mb-6 text-neutral-100">
        Hospital – Dashboard /
        <span className="text-neutral-600">
          <Link href="/auditorias"> Auditorías </Link> /
          <Link href="/recorridos"> Recorridos </Link>
        </span>
      </h1>

      {/* ERROR */}
      {error && (
        <div className="text-red-400 mb-4 border border-red-800 p-3 rounded bg-red-900/20">
          {error}
        </div>
      )}

      {/* LOADING */}
      {loading && (
        <div className="text-neutral-400 mb-4">
          Cargando…
        </div>
      )}

      <div className="flex gap-4 mb-8">

        <select
          value={selectedPaciente}
          onChange={handlePacienteSelect}
          className="bg-neutral-800 text-neutral-200 border border-neutral-700 p-2 rounded focus:outline-none focus:ring-2 focus:ring-neutral-600"
        >
          <option value="">Filtrar por Paciente</option>
          {pacientes.map((p: any) => (
            <option key={p.dni} value={p.dni}>
              {p.dni} – {p.nombre} {p.apellido}
            </option>
          ))}
        </select>

        <select
          value={selectedInternacion}
          onChange={handleInternacionSelect}
          className="bg-neutral-800 text-neutral-200 border border-neutral-700 p-2 rounded focus:outline-none focus:ring-2 focus:ring-neutral-600"
        >
          <option value="">Filtrar por Internación</option>
          {internaciones.map((internacion: any) => (
            <option
              key={internacion.idInternacion}
              value={internacion.idInternacion}
            >
              {internacion.dni} – {internacion.fechaInicio}
            </option>
          ))}
        </select>
      </div>

      {/* BOTONES */}
      <div className="flex gap-4 flex-wrap mb-6">
        <button onClick={getPersonas} className="link-btn">Personas</button>
        <button onClick={getPacientes} className="link-btn">Pacientes</button>
        <button onClick={getMedicos} className="link-btn">Médicos</button>
        <button onClick={getMedicosEspecializados} className="link-btn">Especializados</button>
        <button onClick={getInternaciones} className="link-btn">Internaciones</button>
        <button onClick={getDetalleCamasDisponibles} className="link-btn">Detalle Camas Disponibles</button>
        <button onClick={getCantidadCamasDisponibles} className="link-btn">Cantidad Camas Disponibles</button>
        <button onClick={getCantidadCamasPorcentajeDisponibles} className="link-btn">Porcentaje Camas Disponibles</button>
      </div>

      <Table data={data} />
    </div>
  );
}
