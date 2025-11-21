USE [Hospital];
GO

-- Tabla Internacion.Sector
INSERT INTO Internacion.Sector (descripcion) VALUES
('Cardiología'),                -- 1
('Pediatría'),                  -- 2
('Traumatología'),              -- 3
('Gastroenterología'),          -- 4
('Neurología'),                 -- 5
('Dermatología'),               -- 6
('Oftalmología'),               -- 7
('Urología'),                   -- 8
('Nefrología'),                 -- 9
('Infectología'),               -- 10
('Hematología'),                -- 11
('Psiquiatría'),                -- 12
('Cirugía General'),            -- 13
('Ginecología'),                -- 14
('Obstetricia'),                -- 15
('Cuidados Intensivos'),        -- 16
('Emergencias'),                -- 17
('Radiología'),                 -- 18
('Laboratorio Clínico'),        -- 19
('Kinesiología y Rehabilitación'), -- 20
('Farmacia Hospitalaria'),      -- 21
('Unidad Coronaria'),           -- 22
('Guardia General'),            -- 23
('Unidad de Quemados'),         -- 24
('Neonatología'),               -- 25
('Transplantes');               -- 26


-- Tabla Internacion.Habitacion
-- Piso 0 (PB): Emergencias, Guardia, Radiología, Laboratorio, Farmacia
INSERT INTO Internacion.Habitacion (piso, orientacion, idSector) VALUES
(0, 'Norte', 17), -- Emergencias
(0, 'Sur', 17),   -- Emergencias
(0, 'Este', 17),  -- Emergencias
(0, 'Oeste', 17), -- Emergencias
(0, 'Norte', 23), -- Guardia General
(0, 'Sur', 23),   -- Guardia General
(0, 'Este', 23),  -- Guardia General
(0, 'Oeste', 23), -- Guardia General
(0, 'Norte', 18), -- Radiología
(0, 'Sur', 19),   -- Laboratorio Clínico
(0, 'Este', 21);  -- Farmacia Hospitalaria

-- Piso 1: Pediatría, Neonatología, Obstetricia, Ginecología
INSERT INTO Internacion.Habitacion (piso, orientacion, idSector) VALUES
(1, 'Norte', 2),  -- Pediatría
(1, 'Sur', 2),    -- Pediatría
(1, 'Este', 25),  -- Neonatología
(1, 'Oeste', 25), -- Neonatología
(1, 'Norte', 15), -- Obstetricia
(1, 'Sur', 14);   -- Ginecología

-- Piso 2: Clínica médica general (Cardiología, Gastro, Neurología)
INSERT INTO Internacion.Habitacion (piso, orientacion, idSector) VALUES
(2, 'Norte', 1),  -- Cardiología
(2, 'Sur', 1),    -- Cardiología
(2, 'Este', 4),   -- Gastroenterología
(2, 'Oeste', 4),  -- Gastroenterología
(2, 'Norte', 5),  -- Neurología
(2, 'Sur', 5);    -- Neurología

-- Piso 3: Cirugía, Traumatología, Urología, Nefrología
INSERT INTO Internacion.Habitacion (piso, orientacion, idSector) VALUES
(3, 'Norte', 13), -- Cirugía General
(3, 'Sur', 13),   -- Cirugía General
(3, 'Este', 3),   -- Traumatología
(3, 'Oeste', 3),  -- Traumatología
(3, 'Norte', 8),  -- Urología
(3, 'Sur', 9);    -- Nefrología

-- Piso 4: Cuidados Intensivos, Unidad Coronaria
INSERT INTO Internacion.Habitacion (piso, orientacion, idSector) VALUES
(4, 'Norte', 16), -- Cuidados Intensivos
(4, 'Sur', 16),   -- Cuidados Intensivos
(4, 'Este', 16),  -- Cuidados Intensivos
(4, 'Oeste', 16), -- Cuidados Intensivos
(4, 'Este', 22),  -- Unidad Coronaria
(4, 'Oeste', 22); -- Unidad Coronaria

-- Piso 5: Psiquiatría, Kinesiología, Transplantes, Quemados, Dermatología, Oftalmología, Infectología, Hematología
INSERT INTO Internacion.Habitacion (piso, orientacion, idSector) VALUES
(5, 'Norte', 12), -- Psiquiatría
(5, 'Sur', 20),   -- Kinesiología y Rehabilitación
(5, 'Este', 26),  -- Transplantes
(5, 'Oeste', 24), -- Unidad de Quemados
(5, 'Norte', 6),  -- Dermatología
(5, 'Sur', 7),    -- Oftalmología
(5, 'Este', 10),  -- Infectología
(5, 'Oeste', 11); -- Hematología

-- Piso 0 (PB)
-- Habitaciones: Emergencias (17) y Guardia General (23)
-- idHabitacion 1 a 7 según orden insertado
INSERT INTO Internacion.Cama (idHabitacion, nroCama, ocupada) VALUES
-- Habitaciones Emergencias (idHabitacion 1-4)
(1, 1, 1), (1, 2, 0), (1, 3, 0),
(2, 1, 0), (2, 2, 0), (2, 3, 0),
(3, 1, 1), (3, 2, 1), (3, 3, 0),
(4, 1, 1), (4, 2, 1), (4, 3, 0),
-- Habitaciones Guardia General (idHabitacion 5-8)
(5, 1, 1), (5, 2, 1), (5, 3, 0),
(6, 1, 1), (6, 2, 0), (6, 3, 0),
(7, 1, 0), (7, 2, 0), (7, 3, 0);

-- Piso 0 (PB) otras habitaciones: Radiología, Laboratorio, Farmacia (idHabitacion 9-11)
INSERT INTO Internacion.Cama (idHabitacion, nroCama, ocupada) VALUES
(9, 1, 0), (9, 2, 0), (9, 3, 0),  -- Radiología (18)
(10, 1, 0), (10, 2, 0), (10, 3, 0), -- Laboratorio Clínico (19)
(11, 1, 0), (11, 2, 0), (11, 3, 0); -- Farmacia Hospitalaria (21)

-- Piso 1: Pediatría, Neonatología, Obstetricia, Ginecología
-- idHabitacion 12-17
INSERT INTO Internacion.Cama (idHabitacion, nroCama, ocupada) VALUES
-- Pediatría (2)
(12, 1, 1), (12, 2, 0), (12, 3, 0),
(13, 1, 0), (13, 2, 0), (13, 3, 0),
-- Neonatología (25)
(14, 1, 1), (14, 2, 0), (14, 3, 0),
(15, 1, 0), (15, 2, 0), (15, 3, 0),
-- Obstetricia y Ginecología (15, 14)
(16, 1, 0), (16, 2, 0), (16, 3, 0),
(17, 1, 0), (17, 2, 0), (17, 3, 0);

-- Piso 2: Clínica médica general (Cardiología, Gastro, Neurología)
-- idHabitacion 18-23
INSERT INTO Internacion.Cama (idHabitacion, nroCama, ocupada) VALUES
-- Cardiología (1)
(18, 1, 1), (18, 2, 0), (18, 3, 0),
(19, 1, 0), (19, 2, 0), (19, 3, 0),
-- Gastroenterología (4)
(20, 1, 0), (20, 2, 0), (20, 3, 0),
(21, 1, 0), (21, 2, 0), (21, 3, 0),
-- Neurología (5)
(22, 1, 0), (22, 2, 0), (22, 3, 0),
(23, 1, 0), (23, 2, 0), (23, 3, 0);

-- Piso 3: Cirugía, Traumatología, Urología, Nefrología
-- idHabitacion 24-29
INSERT INTO Internacion.Cama (idHabitacion, nroCama, ocupada) VALUES
-- Cirugía General (13)
(24, 1, 1), (24, 2, 0), (24, 3, 0),
(25, 1, 0), (25, 2, 0), (25, 3, 0),
-- Traumatología (3)
(26, 1, 0), (26, 2, 0), (26, 3, 0),
(27, 1, 0), (27, 2, 0), (27, 3, 0),
-- Urología (8)
(28, 1, 0), (28, 2, 0), (28, 3, 0),
-- Nefrología (9)
(29, 1, 0), (29, 2, 0), (29, 3, 0);

-- Piso 4: Cuidados Intensivos, Unidad Coronaria
-- idHabitacion 30-35
INSERT INTO Internacion.Cama (idHabitacion, nroCama, ocupada) VALUES
-- Cuidados Intensivos (16)
(30, 1, 1), (30, 2, 0), (30, 3, 0),
(31, 1, 0), (31, 2, 0), (31, 3, 0),
-- Unidad Coronaria (22)
(32, 1, 1), (32, 2, 0), (32, 3, 0),
(33, 1, 0), (33, 2, 0), (33, 3, 0);

-- Piso 5: Psiquiatría, Kinesiología, Transplantes, Quemados, Dermatología, Oftalmología, Infectología, Hematología
-- idHabitacion 36-43
INSERT INTO Internacion.Cama (idHabitacion, nroCama, ocupada) VALUES
-- Psiquiatría (12)
(36, 1, 0), (36, 2, 0), (36, 3, 0),
-- Kinesiología (20)
(37, 1, 0), (37, 2, 0), (37, 3, 0),
-- Transplantes (26)
(38, 1, 0), (38, 2, 0), (38, 3, 0),
-- Unidad de Quemados (24)
(39, 1, 0), (39, 2, 0), (39, 3, 0),
-- Dermatología (6)
(40, 1, 0), (40, 2, 0), (40, 3, 0),
-- Oftalmología (7)
(41, 1, 0), (41, 2, 0), (41, 3, 0),
-- Infectología (10)
(42, 1, 0), (42, 2, 0), (42, 3, 0),
-- Hematología (11)
(43, 1, 0), (43, 2, 0), (43, 3, 0);

-- Tabla Guardias.Especializacion
INSERT INTO Guardias.Especializacion (Description) VALUES
('Cardiología'),                    -- id 1
('Pediatría'),                      -- id 2
('Traumatología'),                  -- id 3
('Gastroenterología'),              -- id 4
('Neurología'),                     -- id 5
('Dermatología'),                   -- id 6
('Oftalmología'),                   -- id 7
('Urología'),                       -- id 8
('Nefrología'),                     -- id 9
('Infectología'),                   -- id 10
('Hematología'),                    -- id 11
('Psiquiatría'),                    -- id 12
('Cirugía General'),                -- id 13
('Ginecología'),                    -- id 14
('Obstetricia'),                    -- id 15
('Cuidados Intensivos'),            -- id 16
('Unidad Coronaria'),               -- id 17
('Unidad de Quemados'),             -- id 18
('Neonatología'),                   -- id 19
('Transplantes');                   -- id 20

-- Personas para los médicos 
INSERT INTO Internacion.Persona (dni, apellido, nombre, sexo, fechaNacimiento) VALUES
(12345678, 'Figueroa', 'Carlos', 'M', '1980-01-01'),   -- 1001
(87654321, 'Domínguez', 'Laura', 'F', '1982-02-02'),   -- 1002
(11223344, 'Benítez', 'Fernando', 'M', '1979-03-03'),  -- 1003
(55667788, 'Alvarez', 'Marcela', 'F', '1985-04-04'),   -- 1004
(66778899, 'Cabrera', 'Roberto', 'M', '1983-05-05'),   -- 1005
(99887766, 'Ibarra', 'Sofía', 'F', '1984-06-06'),      -- 1006
(44556677, 'Rey', 'Natalia', 'F', '1986-07-07'),       -- 1007
(33445566, 'Delgado', 'Luis', 'M', '1987-08-08'),      -- 1008
(22334455, 'Molina', 'Ana', 'F', '1981-09-09'),        -- 1009
(55664433, 'Cortés', 'Diego', 'M', '1988-10-10'),      -- 1010
(66775544, 'Villar', 'Mariana', 'F', '1989-11-11'),    -- 1011
(77886655, 'Ríos', 'Javier', 'M', '1990-12-12'),       -- 1012
(88997766, 'Ferrari', 'Verónica', 'F', '1991-01-01');  -- 1013

-- Algunos médicos también como pacientes
INSERT INTO Internacion.Paciente (dni) VALUES
(12345678), -- Carlos Figueroa (Cardiología + Unidad Coronaria + Cuidados Intensivos)
(87654321), -- Laura Domínguez (Pediatría + Neonatología)
(66778899), -- Roberto Cabrera (Gastroenterología)
(99887766); -- Sofía Ibarra (Urología + Nefrología)

-- Medicos
INSERT INTO Internacion.Medico (matricula, cuil, cantMaxGuardia, fechaIngreso, foto, dni) VALUES
(1001, '20-12345678-9', 5, '2020-01-10', 0x0, 12345678),
(1002, '20-87654321-0', 4, '2021-05-12', 0x0, 87654321),
(1003, '20-11223344-5', 4, '2019-09-20', 0x0, 11223344),
(1004, '20-55667788-1', 3, '2022-03-15', 0x0, 55667788),
(1005, '20-66778899-2', 2, '2021-11-05', 0x0, 66778899),
(1006, '20-99887766-3', 3, '2020-07-18', 0x0, 99887766),
(1007, '20-44556677-4', 2, '2022-01-20', 0x0, 44556677),
(1008, '20-33445566-5', 2, '2021-09-10', 0x0, 33445566),
(1009, '20-22334455-6', 2, '2022-02-12', 0x0, 22334455),
(1010, '20-55664433-7', 2, '2020-06-25', 0x0, 55664433),
(1011, '20-66775544-8', 2, '2021-03-08', 0x0, 66775544),
(1012, '20-77886655-9', 2, '2019-08-19', 0x0, 77886655),
(1013, '20-88997766-0', 2, '2022-07-01', 0x0, 88997766);

-- Tabla Guardias.MedicoEspecializado
INSERT INTO Guardias.MedicoEspecializado (matricula, idEsp, tomaGuardia) VALUES
-- 1001
(1001, 1, 1),   -- Cardiología
(1001, 17, 1),  -- Unidad Coronaria
(1001, 16, 1),  -- Cuidados Intensivos
-- 1002
(1002, 2, 1),   -- Pediatría
(1002, 19, 1),  -- Neonatología
-- 1003
(1003, 3, 1),   -- Traumatología
(1003, 13, 1),  -- Cirugía General
-- 1004
(1004, 13, 1),  -- Cirugía General
-- 1005
(1005, 4, 1),   -- Gastroenterología
-- 1006
(1006, 8, 1),   -- Urología
(1006, 9, 1),   -- Nefrología
-- 1007
(1007, 15, 1),  -- Obstetricia
(1007, 14, 1),  -- Ginecología
-- 1008
(1008, 6, 1),   -- Dermatología
-- 1009
(1009, 10, 1),  -- Infectología
(1009, 11, 1),  -- Hematología
-- 1010
(1010, 12, 1),  -- Psiquiatría
-- 1011
(1011, 18, 1),  -- Unidad de Quemados
(1011, 16, 1);  -- Cuidados Intensivos

-- 1012: Médico sin especializacion
-- 1013: Médico sin especialización
-- Sectores sin médicos especializados: Oftalmología (7) ,Transplantes (26), Neurología(5)

-- Pacientes nuevos que no son médicos
INSERT INTO Internacion.Persona (dni, apellido, nombre, sexo, fechaNacimiento) VALUES
(11111111, 'Magliotti', 'Gian Franco', 'M', '1986-06-12'),
(22222222, 'Arce', 'Ezequiel', 'M', '2010-09-05'),
(33333333, 'Ahumada', 'Iván', 'M', '1978-01-20'),
(44444444, 'Cármenes', 'Santiago', 'M', '2000-12-30'),
(55555555, 'Borgnia', 'Erik', 'M', '1998-04-10'),
(66666666, 'Rasso', 'Micaela', 'F', '2001-07-22'),
(77777777, 'Civiero', 'Tomas', 'M', '1999-03-14'),
(88888888, 'Rodríguez', 'Sofía', 'F', '1999-08-25'),
(99999999, 'Romero', 'Nicolás', 'M', '1983-11-02'),
(10101010, 'López', 'Camila', 'F', '1995-02-18'),
(12121212, 'Torres', 'Agustina', 'F', '2001-06-30'),
(13131313, 'Sánchez', 'Joaquín', 'M', '1987-09-09'),
(14141414, 'Vega', 'María', 'F', '1993-12-05'),
(15151515, 'Castro', 'Eliana', 'F', '1989-01-28'),
(16161616, 'Navarro', 'Tomás', 'M', '1997-10-11'),
(17171717, 'Silva', 'Martina', 'F', '1998-03-19'),
(18181818, 'Rojas', 'Franco', 'M', '1994-07-01'),
(19191919, 'Herrera', 'Julieta', 'F', '1991-05-22'),
(20202020, 'Arias', 'Lucas', 'M', '2002-09-16'),
(21212121, 'Mendoza', 'Antonella', 'F', '1999-04-07');

-- Pacientes no medicos 
INSERT INTO Internacion.Paciente (dni) VALUES
(11111111), (22222222), (33333333), (44444444), (55555555), (66666666), (77777777), (88888888), (99999999), (10101010),
(12121212), (13131313), (14141414), (15151515), (16161616), (17171717), (18181818), (19191919), (20202020), (21212121);

-- Internaciones de pacientes que son médicos
INSERT INTO Internacion.Internacion (fechaInicio, fechaFin, matricula, dni) VALUES
('2025-11-01', '2025-11-05', 1007, 12345678), -- Carlos Figueroa
('2025-11-03', '2025-11-08', 1008, 87654321), -- Laura Domínguez
('2025-11-02', '2025-11-06', 1009, 66778899), -- Roberto Cabrera
('2025-11-04', '2025-11-09', 1010, 99887766); -- Sofía Ibarra

-- Internaciones de pacientes que no son médicos
INSERT INTO Internacion.Internacion (fechaInicio, fechaFin, matricula, dni) VALUES
('2025-10-01', '2025-12-2', 1001, 11111111), -- Gian Franco Magliotti
('2025-10-01', '2025-12-2', 1002, 22222222), -- Ezequiel Arce
('2025-10-01', '2025-12-2', 1003, 33333333), -- Iván Ahumada
('2025-10-01', '2025-12-2', 1004, 44444444), -- Santiago Cármenes
('2025-10-01', '2025-12-2', 1007, 55555555), -- Erik Borgnia
('2025-10-01', '2025-12-2', 1008, 66666666), -- Micaela Rasso
('2025-10-01', '2025-12-2', 1009, 77777777), -- Tomas Civiero
('2025-10-25', '2025-11-02', 1010, 88888888), -- Sofía Rodríguez
('2025-10-27', '2025-11-05', 1011, 99999999), -- Nicolás Romero
('2025-10-29', '2025-11-06', 1012, 10101010), -- Camila López
('2025-11-01', '2025-11-09', 1013, 12121212), -- Agustina Torres
('2025-11-03', '2025-11-11', 1003, 13131313), -- Joaquín Sánchez
('2025-11-05', '2025-11-13', 1004, 14141414), -- María Vega
('2025-11-07', '2025-12-15', 1005, 15151515), -- Eliana Castro
('2025-11-09', '2025-12-17', 1006, 16161616), -- Tomás Navarro
('2025-11-11', '2025-12-19', 1007, 17171717), -- Martina Silva
('2025-11-13', '2025-12-21', 1008, 18181818), -- Franco Rojas
('2025-11-15', '2025-12-23', 1009, 19191919), -- Julieta Herrera
('2025-11-17', '2025-12-25', 1010, 20202020), -- Lucas Arias
('2025-11-19', '2025-12-27', 1011, 21212121); -- Antonella Mendoza

-- Ubicaciones de internación con nombres de pacientes (ISO 8601)
INSERT INTO Internacion.UbicadaEn (idHabitacion, nroCama, fechaYHora, idInternacion) VALUES
(22, 1, '20251101 08:00:00', 1),  -- Carlos Figueroa
(22, 2, '20251103 09:00:00', 2),  -- Laura Domínguez
(23, 1, '20251102 10:00:00', 3),  -- Roberto Cabrera
(23, 2, '20251104 11:00:00', 4),  -- Sofía Ibarra
(3, 1, '20251001 08:00:00', 5),   -- Gian Franco Magliotti
(3, 2, '20251001 09:00:00', 6),   -- Ezequiel Arce
(4, 1, '20251001 10:00:00', 7),   -- Iván Ahumada
(4, 2, '20251001 11:00:00', 8),   -- Santiago Cármenes
(5, 1, '20251001 12:00:00', 9),   -- Erik Borgnia
(5, 2, '20251001 13:00:00', 10),  -- Micaela Rasso
(6, 1, '20251001 14:00:00', 11),  -- Tomas Civiero
(6, 2, '20251025 15:00:00', 12),  -- Sofía Rodríguez
(7, 1, '20251027 16:00:00', 13),  -- Nicolás Romero
(7, 2, '20251029 17:00:00', 14),  -- Camila López
(42, 1, '20251101 08:30:00', 15),  -- Agustina Torres
(42, 2, '20251103 09:30:00', 16),  -- Joaquín Sánchez
(9, 1, '20251105 10:30:00', 17),  -- María Vega
(1, 1, '20251107 11:30:00', 18),  -- Eliana Castro
(12, 1, '20251109 12:30:00', 19), -- Tomás Navarro
(14, 1, '20251111 13:30:00', 20), -- Martina Silva
(18, 1, '20251113 14:30:00', 21), -- Franco Rojas
(24, 1, '20251115 15:30:00', 22), -- Julieta Herrera
(31, 1, '20251117 16:30:00', 23), -- Lucas Arias
(32, 2, '20251130 17:30:00', 24); -- Antonella Mendoza

-- Tabla Seguimiento.Ronda: 3 rondas por día de la semana
INSERT INTO Seguimiento.Ronda (idRonda, turnoRonda, dia) VALUES
-- Lunes
(1, 'Mañana', 'Lunes'), (2, 'Tarde', 'Lunes'), (3, 'Noche', 'Lunes'),
-- Martes
(4, 'Mañana', 'Martes'), (5, 'Tarde', 'Martes'), (6, 'Noche', 'Martes'),
-- Miércoles
(7, 'Mañana', 'Miércoles'), (8, 'Tarde', 'Miércoles'), (9, 'Noche', 'Miércoles'),
-- Jueves
(10, 'Mañana', 'Jueves'), (11, 'Tarde', 'Jueves'), (12, 'Noche', 'Jueves'),
-- Viernes
(13, 'Mañana', 'Viernes'), (14, 'Tarde', 'Viernes'), (15, 'Noche', 'Viernes'),
-- Sábado
(16, 'Mañana', 'Sábado'), (17, 'Tarde', 'Sábado'), (18, 'Noche', 'Sábado'),
-- Domingo
(19, 'Mañana', 'Domingo'), (20, 'Tarde', 'Domingo'), (21, 'Noche', 'Domingo');

-- Cada fila muestra las rondas en las que participa cada habitacion
INSERT INTO Seguimiento.FormaParteDe (idHabitacion, idRonda) VALUES
--  Piso 0 (PB)
(1, 1), (1, 10), (1, 19),
(2, 1), (2, 10), (2, 20),
(3, 1), (3, 10), (3, 19),
(4, 1), (4, 7), (4, 15),
(5, 3), (5, 12), (5, 19),
(6, 2), (6, 11), (6, 20),
(7, 2), (7, 11), (7, 20),
(8, 2), (8, 11), (8, 20),
(9, 2), (9, 11), (9, 20),
(10, 2), (10, 12), (10, 20),
(11, 3), (11, 12), (11, 21),
-- Piso 1
(12, 3), (12, 12), (12, 21),
(13, 3), (13, 12), (13, 21),
(14, 3), (14, 12), (14, 21),
(15, 3), (15, 12), (15, 21),
(16, 4), (16, 13), (16, 21),
(17, 4), (17, 13), (17, 21),
-- Piso 2
(18, 4), (18, 13), (18, 21),
(19, 4), (19, 13), (19, 21),
(20, 5), (20, 14), (20, 21),
(21, 5), (21, 14), (21, 21),
(22, 5), (22, 14), (22, 21),
(23, 5), (23, 14), (23, 21),
-- Piso 3
(24, 6), (24, 15), (24, 21),
(25, 6), (25, 15), (25, 21),
(26, 6), (26, 15), (26, 21),
(27, 6), (27, 15), (27, 21),
(28, 6), (28, 15), (28, 21),
(29, 6), (29, 15), (29, 21),
-- Piso 4
(30, 7), (30, 16), (30, 21),
(31, 7), (31, 16), (31, 21),
(32, 7), (32, 16), (32, 21),
(33, 7), (33, 16), (33, 21),
(34, 8), (34, 17), (34, 21),
(35, 8), (35, 17), (35, 21),
-- Piso 5
(36, 8), (36, 17), (36, 21),
(37, 8), (37, 17), (37, 21),
(38, 9), (38, 18), (38, 21),
(39, 9), (39, 18), (39, 21),
(40, 9), (40, 18), (40, 21),
(41, 9), (41, 18), (41, 21),
(42, 9), (42, 18), (42, 21),
(43, 9), (43, 18), (43, 21);

-- Tabla Seguimiento.Recorrido: recorridos de médicos (que no están internados)
INSERT INTO Seguimiento.Recorrido (idRonda, fecha, matricula) VALUES
-- Lunes
(1, '2025-10-13', 1009),
(2, '2025-10-13', 1009),
(3, '2025-10-13', 1012),
-- Martes
(4, '2025-10-07', 1012),
(5, '2025-10-07', 1008),
(6, '2025-10-07', 1003),
-- Miércoles
(7, '2025-10-01', 1012),
(8, '2025-10-01', 1004),
(9, '2025-10-01', 1008),
-- Jueves
(10, '2025-10-23', 1003),
(11, '2025-10-23', 1013),
(12, '2025-10-23', 1013),
-- Viernes
(13, '2025-10-31', 1009),
(14, '2025-10-31', 1003),
(15, '2025-10-31', 1004);


-- Tabla Seguimiento.ComentadaDurante
INSERT INTO Seguimiento.ComentadaDurante (idInternacion, idRonda, fecha, comentario) VALUES
-- Internacion Gian
(5, 1, '2025-10-13', 'Paciente estable, signos vitales normales'),
(5, 10, '2025-10-23', 'Se administró medicación según indicaciones médicas'),
-- Internacion Eze
(6, 1, '2025-10-13', 'Revisión de presión arterial, todo en rango'),
(6, 10, '2025-10-23', 'Paciente se encuentra alerta y sin complicaciones'),
-- Internacion Ivan
(7, 1, '2025-10-13', 'Se realizó control de glucemia, resultados normales'),
(7, 15, '2025-10-31', 'Paciente estable, sin signos de infección'),
-- Internacion Santiago
(8, 1, '2025-10-13', 'Observación de evolución, paciente responde bien a tratamiento'),
(8, 15, '2025-10-31', 'Se ajustó medicación, evolución favorable'),
-- Internacion Erik
(9, 3, '2025-10-13', 'Se administró medicación, paciente estable'),
(9, 12, '2025-10-23', 'Control de signos vitales, todo dentro de los parámetros'),
-- Internacion Mica
(10, 3, '2025-10-13', 'Paciente en recuperación, sin complicaciones'),
(10, 12, '2025-10-23', 'Se realizó control de temperatura y presión arterial, normal'),
-- Internacion Tomas
(11, 2, '2025-10-13', 'Revisión de evolución, paciente estable'),
(11, 11, '2025-10-23', 'Administración de medicación y observación de signos vitales');

-- Guardias
INSERT INTO Guardias.Guardia (idGuardia, turno) VALUES
(1, 'Mañana'),
(2, 'Tarde'),
(3, 'Noche');

-- Tabla Guardias.Cubre
INSERT INTO Guardias.Cubre (matricula, idEsp, idGuardia, fecha) VALUES
-- Médico 1001 (Cardiología, UC, Cuidados Intensivos)
(1001, 1, 1, '2025-10-01'),
(1001, 17, 2, '2025-10-02'),
(1001, 16, 3, '2025-10-03'),
-- Médico 1002 (Pediatría, Neonatología)
(1002, 2, 1, '2025-10-01'),
(1002, 19, 2, '2025-10-02'),
-- Médico 1003 (Traumatología, Cirugía General)
(1003, 3, 1, '2025-10-01'),
(1003, 13, 2, '2025-10-02'),
-- Médico 1004 (Cirugía General)
(1004, 13, 3, '2025-10-03'),
-- Médico 1005 (Gastroenterología)
(1005, 4, 1, '2025-10-01'),
-- Médico 1006 (Urología, Nefrología)
(1006, 8, 2, '2025-10-02'),
(1006, 9, 3, '2025-10-03'),
-- Médico 1007 (Obstetricia, Ginecología)
(1007, 15, 1, '2025-10-01'),
(1007, 14, 2, '2025-10-02'),
-- Médico 1008 (Dermatología)
(1008, 6, 3, '2025-10-03'),
-- Médico 1009 (Infectología, Hematología)
(1009, 10, 1, '2025-10-01'),
(1009, 11, 2, '2025-10-02'),
-- Médico 1010 (Psiquiatría)
(1010, 12, 3, '2025-10-03'),
-- Médico 1011 (Unidad de Quemados, Cuidados Intensivos)
(1011, 18, 1, '2025-10-01'),
(1011, 16, 2, '2025-10-02');

-- Vacaciones de médicos
INSERT INTO Internacion.Vacacion (matricula, fechaInicioVacacion, fechaFinVacacion) VALUES
(1001, '2025-11-01', '2025-11-15'), -- Carlos Figueroa
(1002, '2025-12-01', '2025-12-10'), -- Laura Domínguez
(1003, '2025-10-20', '2025-10-30'), -- Fernando Benítez
(1004, '2025-11-10', '2025-11-20'), -- Marcela Alvarez
(1005, '2025-12-05', '2025-12-15'), -- Roberto Cabrera
(1006, '2025-11-25', '2025-12-05'), -- Sofía Ibarra
(1007, '2025-10-15', '2025-10-25'), -- Natalia Rey
(1008, '2025-11-05', '2025-11-15'), -- Luis Delgado
(1009, '2025-12-10', '2025-12-20'), -- Ana Molina
(1010, '2025-10-28', '2025-11-07'), -- Diego Cortés
(1011, '2025-11-12', '2025-11-22'), -- Mariana Villar
(1012, '2025-12-01', '2025-12-10'), -- Javier Ríos
(1013, '2025-11-20', '2025-11-30'); -- Verónica Ferrari
GO