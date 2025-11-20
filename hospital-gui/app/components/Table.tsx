"use client";

export default function Table({ data }: any) {
  if (!data || data.length === 0)
    return <p className="text-neutral-400">No hay datos.</p>;

  const columns = Object.keys(data[0]);

  return (
    <div className="overflow-auto rounded-lg border border-neutral-800 bg-neutral-900">
      <table className="min-w-full">
        <thead>
          <tr>
            {columns.map((c) => (
              <th
                key={c}
                className="border-b border-neutral-800 p-3 bg-neutral-800 text-left text-neutral-300 font-medium"
              >
                {c}
              </th>
            ))}
          </tr>
        </thead>

        <tbody>
          {data.map((row: any, i: number) => (
            <tr
              key={i}
              className="hover:bg-neutral-800 transition"
            >
              {columns.map((c) => (
                <td
                  key={c}
                  className="border-b border-neutral-800 p-3 text-neutral-200"
                >
                  {String(row[c])}
                </td>
              ))}
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
