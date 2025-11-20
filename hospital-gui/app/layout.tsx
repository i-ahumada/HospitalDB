export const metadata = {
  title: "Hospital Internaciones",
  description: "Sistema de consultas hospitalarias",
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="es">
      <body className="bg-gray-100 text-black min-h-screen p-6">
        <main className="max-w-4xl mx-auto bg-white shadow p-6 rounded-xl">
          {children}
        </main>
      </body>
    </html>
  );
}
