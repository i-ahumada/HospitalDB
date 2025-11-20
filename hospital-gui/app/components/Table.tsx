"use client";

export default function Table({ data }: any) {
  if (!data || data.length === 0) return <p>No hay datos.</p>;

  const columns = Object.keys(data[0]);

  return (
    <table className="min-w-full border">
      <thead>
        <tr>
          {columns.map(c => (
            <th key={c} className="border p-2 bg-gray-200">{c}</th>
          ))}
        </tr>
      </thead>
      <tbody>
        {data.map((row: any, i: number) => (
          <tr key={i}>
            {columns.map(c => (
              <td key={c} className="border p-2">
                {String(row[c])}
              </td>
            ))}
          </tr>
        ))}
      </tbody>
    </table>
  );
}
