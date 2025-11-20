import "./globals.css"

export const metadata = {
  title: "Hospital Internaciones",
  description: "Sistema de consultas hospitalarias",
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="es">
      <body>
        <main>
          {children}
        </main>
      </body>
    </html>
  );
}
