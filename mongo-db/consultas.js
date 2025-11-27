/**
 * Practica 6 - Grupo 6: Redundancia y Consistencia
 * Script de operaciones realizadas en MongoDB Shell
 * Base de Datos: TiendaComputacion
 */

// 1. Selección de la base de datos
use TiendaComputacion

// 2. Inserción de datos con estructura base (Documento Laptop)
db.productos.insertOne({
    sku: "LAP-001",
    nombre: "Laptop Gamer X",
    precio: 1500,
    categoria: "Computadoras",
    stock: 10,
    especificaciones: {
        ram: "16GB",
        procesador: "Intel i7",
        disco: "1TB SSD"
    }
})

// 3. Demostración de Polimorfismo (Documento Mouse con estructura distinta)
db.productos.insertOne({
    sku: "MOU-001",
    nombre: "Mouse Óptico",
    precio: 20,
    stock: 50,
    categoria: "Accesorios",
    dpi: 12000,            // Campo específico
    inalambrico: true      // Campo específico
})

// 4. Actualización de datos (Update)
// Actualizar precio
db.productos.updateOne(
    { sku: "LAP-001" },
    { $set: { precio: 1400 } }
)

// Agregar campo nuevo (Evolución de esquema)
db.productos.updateOne(
    { sku: "MOU-001" },
    { $set: { marca: "Logitech" } }
)

// 5. Operación Upsert (Insertar si no existe)
// Esto garantiza consistencia en operaciones repetidas
db.productos.updateOne(
    { sku: "TEC-003" },
    { 
        $set: { 
            nombre: "Teclado Mecánico", 
            precio: 100, 
            categoria: "Periféricos" 
        } 
    },
    { upsert: true }
)

// 6. Eliminación de datos (Delete)
db.productos.deleteMany({ precio: { $lt: 50 } })

// 7. Consulta final para verificar estado
db.productos.find()