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

  useEffect(() => {
    fetch("/api/personas/pacientes")
        .then((r) => r.json())
        .then(setPacientes);

    fetch("/api/internaciones")
        .then((r) => r.json())
        .then(setInternaciones);
  }, []);

  async function getPersonas() {
    fetch("/api/personas")
        .then((r) => r.json())
        .then(setData);
  }
  async function getPacientes() {
    fetch("/api/personas/pacientes")
        .then((r) => r.json())
        .then(setData);
  }
  async function getDetalleCamasDisponibles() {
    fetch("/api/camas/detalle")
        .then((r) => r.json())
        .then(setData);
  }

  async function getCantidadCamasDisponibles() {
    fetch("/api/camas/disponibles")
        .then((r) => r.json())
        .then(setData);
  }
  async function getCantidadCamasPorcentajeDisponibles() {
    fetch("/api/camas/porcentaje")
        .then((r) => r.json())
        .then(setData);
  }

  async function getMedicos() {
    fetch("/api/personas/medicos").then((r) => r.json())
        .then(setData);
  }
  async function getMedicosEspecializados() {
    fetch("/api/personas/medicos/especializados")
        .then((r) => r.json())
        .then(setData);
  }
  async function getInternaciones() {
    fetch("/api/internaciones")
        .then((r) => r.json())
        .then(setData);
  }

  async function getPacienteByDNI(dni: string) {
    fetch(`/api/personas/pacientes/${dni}`)
        .then((r) => r.json())
        .then(setData);
  }

  async function getComentariosPorInternacion(id: string) {
    fetch(`/api/internaciones/${id}/comentarios`)
        .then((r) => r.json())
        .then(setData);
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
            Hospital – Dashboard / <span className="text-neutral-600"><Link href="/auditorias"> Auditorias </Link> /<Link href="/recorridos"> Recorridos </Link> </span>
        </h1>

        <div className="flex gap-4 mb-8">

            {/* SELECT PACIENTES */}
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

            {/* SELECT INTERNACIONES */}
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
