USE [Hospital];
GO

-- VACIAR TODAS LAS TABLAS
DELETE FROM Seguimiento.ComentadaDurante;
DELETE FROM Seguimiento.Recorrido;
DELETE FROM Seguimiento.FormaParteDe;
DELETE FROM Guardias.Cubre;
DELETE FROM Seguimiento.Ronda;

DELETE FROM Internacion.UbicadaEn;
DELETE FROM Internacion.Internacion;
DELETE FROM Internacion.Cama;
DELETE FROM Internacion.Vacacion;

DELETE FROM Internacion.Habitacion;
DELETE FROM Guardias.Guardia;
DELETE FROM Guardias.MedicoEspecializado;
DELETE FROM Internacion.Medico;
DELETE FROM Guardias.Especializacion;
DELETE FROM Internacion.Sector;

DELETE FROM Internacion.Paciente;
DELETE FROM Internacion.Persona;

-- Reiniciar identidades (IDs automáticos)
DBCC CHECKIDENT ('Internacion.Habitacion', RESEED, 0);
DBCC CHECKIDENT ('Guardias.Especializacion', RESEED, 0);
DBCC CHECKIDENT ('Internacion.Sector', RESEED, 0);
DBCC CHECKIDENT ('Internacion.Internacion', RESEED, 0);
DBCC CHECKIDENT ('Auditoria.LogGuardias', RESEED, 0);

GO