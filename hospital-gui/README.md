# Conexión a SQL Server (SQLEXPRESS) desde Next.js

Este documento explica cómo configurar **SQL Server Express** en Windows para que Next.js pueda conectarse correctamente usando el paquete `mssql`.

Incluye:

* Activar TCP/IP
* Habilitar SQL Server Browser
* Habilitar autenticación SQL en SSMS
* Conectarse desde Next.js
* Endpoint `/api/testdb` para comprobar la conexión
* Sección de problemas comunes (troubleshooting)

---

# 1- Habilitar TCP/IP

Abrí (`CTRL + r`):

```
SQLServerManager16.msc
```

Luego:

1. **SQL Server Network Configuration**
2. **Protocols for SQLEXPRESS**
3. Activar **TCP/IP**
4. Doble clic en TCP/IP → pestaña **IP Addresses**
5. En **IPAll**, establecer:

```
TCP Port = 1433
```

> Puerto estándar usado por el driver `mssql`.

---

# 2- Habilitar SQL Server Browser

En el mismo panel (`SQLServerManager16.msc`):

1. **SQL Server Services**
2. Buscar **SQL Server Browser**
3. Click derecho → **Start**
4. Propiedades → Startup type → **Automatic**

> Necesario para que `localhost\SQLEXPRESS` funcione sin problemas.

---

# 3- Habilitar SQL Authentication (Mixed Mode)

Abrí **SQL Server Management Studio (SSMS)**:

1. Conectarse con **Windows Authentication**
2. Click derecho sobre la instancia → **Properties**
3. Ir a **Security**
4. Seleccionar:

```
SQL Server and Windows Authentication mode
```

5. **Reiniciar SQL Server (SQLEXPRESS)**
   Desde *SQLServerManager16.msc* → SQL Server (SQLEXPRESS) → Restart

> Si esto no está habilitado, los logins SQL NO funcionan.

---

# 4- Crear la base de datos

Asegurate de que tu base **Hospital** exista en:

```
localhost\SQLEXPRESS
```

Podés chequearlo en SSMS.

---

# 5- Configurar Next.js para conectarse a SQL Server

Instalar el driver:

```bash
npm install mssql
```

### Archivo `lib/db.js`

```js
import sql from "mssql";

export async function getConnection() {
    try {
        const pool = await sql.connect({
            server: "localhost",
            database: "Hospital",
            user: "hospital_user",
            password: "Hospital2025!",
            options: {
                encrypt: false,
                trustServerCertificate: true
            }
        });

        return pool;
    } catch (err) {
        console.error("DB ERROR:", err);
        throw err;
    }
}
```

---

# Realizar un GET para confirmar conexión en el endpoint `/api/testdb`

Probar en navegador:

```
http://localhost:3000/api/testdb
```

---

# Troubleshooting (Errores comunes y soluciones)

### **ENOTFOUND localhost\SQLEXPRESS**

Causa:

* SQL Server Browser apagado
* TCP/IP deshabilitado
* Puerto 1433 no está configurado
* No se reinició el servicio

Solución:

* Activar SQL Browser
* Activar TCP/IP
* Asegurar `TCP Port = 1433`
* Reiniciar SQLEXPRESS

---

### **Error de inicio de sesión del usuario ''**

Causa:

* SQL Authentication deshabilitado (modo solo Windows)

Solución:

* SSMS → Properties → Security → **SQL Server and Windows Authentication mode**
* Reiniciar server

---

### **Error de inicio de sesión del usuario 'hospital_user'**

Causa:

* Contraseña incorrecta
* Login deshabilitado

Solución:

```sql
ALTER LOGIN hospital_user ENABLE;
```

---

### `ConnectionError: Failed to connect in 15000ms`

Causa:

* Servicio SQL Server detenido
* Puerto 1433 no accesible
* Driver tardó demasiado

Solución:

* SQLServerManager16.msc → iniciar **SQL Server (SQLEXPRESS)**
* Asegurar TCP/IP + SQL Browser

---

### JSON vacío en Next.js

Causa:

* El endpoint `/api/testdb` arrojó error sin body

Solución:

* Envolver errores en `NextResponse.json()`
