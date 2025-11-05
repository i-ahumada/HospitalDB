USE Hospital;
GO

CREATE SCHEMA Internacion;
GO
CREATE SCHEMA Seguimiento;
GO
CREATE SCHEMA Guardias;
GO
CREATE SCHEMA Auditoria;
GO

USE Hospital;
GO

CREATE TABLE Internacion.Persona (
    dni BIGINT PRIMARY KEY,
    apellido NVARCHAR(50),
    nombre NVARCHAR(50),
    sexo CHAR(1),
    fechaNacimiento DATE
);

CREATE TABLE Internacion.Paciente (
    dni BIGINT PRIMARY KEY,
    CONSTRAINT FK_Paciente_Persona FOREIGN KEY (dni) REFERENCES Internacion.Persona(dni)
);

CREATE TABLE Internacion.Medico (
    matricula INT PRIMARY KEY,
    cuil BIGINT UNIQUE NOT NULL,
    cantMaxGuardia INT,
    fechaIngreso DATE,
    foto VARBINARY(MAX),
    dni BIGINT UNIQUE NOT NULL,
    CONSTRAINT FK_Medico_Persona FOREIGN KEY (dni) REFERENCES Internacion.Persona(dni)
);

CREATE TABLE Internacion.Sector (
    idSector INT PRIMARY KEY,
    descripcion NVARCHAR(50)
);

CREATE TABLE Internacion.Habitacion (
    idHabitacion INT PRIMARY KEY,
    piso INT,
    orientacion NVARCHAR(20),
    idSector INT,
    CONSTRAINT FK_Habitacion_Sector FOREIGN KEY (idSector) REFERENCES Internacion.Sector(idSector)
);

CREATE TABLE Internacion.Cama (
    idHabitacion INT,
    nroCama INT,
    ocupada BIT,
    PRIMARY KEY (idHabitacion, nroCama),
    CONSTRAINT FK_Cama_Habitacion FOREIGN KEY (idHabitacion) REFERENCES Internacion.Habitacion(idHabitacion)
);

CREATE TABLE Internacion.Internacion (
    idInternacion INT PRIMARY KEY,
    fechaInicio DATE NOT NULL,
    fechaFin DATE,
    matricula INT NOT NULL,
    dni BIGINT NOT NULL,
    CONSTRAINT FK_Internacion_Medico FOREIGN KEY (matricula) REFERENCES Internacion.Medico(matricula),
    CONSTRAINT FK_Internacion_Paciente FOREIGN KEY (dni) REFERENCES Internacion.Paciente(dni)
);

CREATE TABLE Internacion.UbicadaEn (
    idHabitacion INT,
    nroCama INT,
    fechaYHora DATETIME,
    idInternacion INT,
    PRIMARY KEY (idHabitacion, nroCama, fechaYHora),
    CONSTRAINT FK_UbicadaEn_Cama FOREIGN KEY (idHabitacion, nroCama) REFERENCES Internacion.Cama(idHabitacion, nroCama),
    CONSTRAINT FK_UbicadaEn_Internacion FOREIGN KEY (idInternacion) REFERENCES Internacion.Internacion(idInternacion)
);

CREATE TABLE Internacion.Vacacion (
    matricula INT,
    fechaInicioVacacion DATE,
    fechaFinVacacion DATE,
    PRIMARY KEY (matricula, fechaInicioVacacion),
    CONSTRAINT FK_Vacacion_Medico FOREIGN KEY (matricula) REFERENCES Internacion.Medico(matricula)
);



CREATE TABLE Seguimiento.Ronda (
    idRonda INT PRIMARY KEY,
    turnoRonda NVARCHAR(20),
    dia DATE
);

CREATE TABLE Seguimiento.Recorrido (
    idRonda INT,
    fecha DATE,
    matricula INT,
    PRIMARY KEY (idRonda, fecha),
    CONSTRAINT FK_Recorrido_Ronda FOREIGN KEY (idRonda) REFERENCES Seguimiento.Ronda(idRonda),
    CONSTRAINT FK_Recorrido_Medico FOREIGN KEY (matricula) REFERENCES Internacion.Medico(matricula)
);

CREATE TABLE Seguimiento.ComentadaDurante (
    idInternacion INT,
    idRonda INT,
    fecha DATE,
    comentario NVARCHAR(MAX),
    PRIMARY KEY (idInternacion, idRonda, fecha),
    CONSTRAINT FK_CD_Internacion FOREIGN KEY (idInternacion) REFERENCES Internacion.Internacion(idInternacion),
    CONSTRAINT FK_CD_Ronda FOREIGN KEY (idRonda) REFERENCES Seguimiento.Ronda(idRonda)
);

CREATE TABLE Seguimiento.FormaParteDe (
    idHabitacion INT,
    idRonda INT,
    PRIMARY KEY (idHabitacion, idRonda),
    CONSTRAINT FK_FPD_Habitacion FOREIGN KEY (idHabitacion) REFERENCES Internacion.Habitacion(idHabitacion),
    CONSTRAINT FK_FPD_Ronda FOREIGN KEY (idRonda) REFERENCES Seguimiento.Ronda(idRonda)
);

CREATE TABLE Guardias.Especializacion (
    idEsp INT PRIMARY KEY,
    descripcion NVARCHAR(100)
);

CREATE TABLE Guardias.MedicoEspecializado (
    matricula INT,
    idEsp INT,
    tomaGuardia BIT,
    PRIMARY KEY (matricula, idEsp),
    CONSTRAINT FK_ME_Medico FOREIGN KEY (matricula) REFERENCES Internacion.Medico(matricula),
    CONSTRAINT FK_ME_Especializacion FOREIGN KEY (idEsp) REFERENCES Guardias.Especializacion(idEsp)
);

CREATE TABLE Guardias.Guardia (
    idGuardia INT PRIMARY KEY,
    turno NVARCHAR(20)
);

CREATE TABLE Guardias.Cubre (
    matricula INT,
    idEsp INT,
    idGuardia INT,
    fecha DATE,
    PRIMARY KEY (matricula, idEsp, idGuardia, fecha),
    CONSTRAINT FK_Cubre_ME FOREIGN KEY (matricula, idEsp) REFERENCES Guardias.MedicoEspecializado(matricula, idEsp),
    CONSTRAINT FK_Cubre_Guardia FOREIGN KEY (idGuardia) REFERENCES Guardias.Guardia(idGuardia)
);

CREATE TABLE Auditoria.LogGuardias (
    idLog INT IDENTITY PRIMARY KEY,
    usuario NVARCHAR(100),
    accion NVARCHAR(200),
    fecha DATETIME
);


GO