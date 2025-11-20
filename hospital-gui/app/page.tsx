import Link from "next/link";

export default function HomePage() {
  return (
    <div>
      <h1 className="text-3xl font-bold mb-4">Hospital – Dashboard</h1>

      <ul className="list-disc pl-6 text-blue-600">
        <li>
          <Link href="/internaciones/comentarios" className="underline">
            Comentarios por Internación
          </Link>
        </li>
      </ul>
    </div>
  );
}
