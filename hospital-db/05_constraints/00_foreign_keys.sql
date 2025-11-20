USE [Hospital]
GO

-- Paciente

ALTER TABLE Internacion.Paciente
ADD CONSTRAINT FK_Paciente_Persona
    FOREIGN KEY (dni)
    REFERENCES Internacion.Persona(dni)

GO

-- Medico

ALTER TABLE Internacion.Medico
ADD CONSTRAINT FK_Medico_Persona
    FOREIGN KEY (dni)
    REFERENCES Internacion.Persona
    ON DELETE CASCADE;

GO

-- Medico especializado

ALTER TABLE Guardias.MedicoEspecializado
ADD CONSTRAINT FK_MedicoEspecializado_Medico
    FOREIGN KEY (matricula)
    REFERENCES Internacion.Medico
    ON DELETE CASCADE;

ALTER TABLE Guardias.MedicoEspecializado
ADD CONSTRAINT FK_MedicoEspecializado_Especializacion
    FOREIGN KEY (idEsp)
    REFERENCES Guardias.Especializacion
    ON DELETE CASCADE;

GO

-- Habitacion

ALTER TABLE Internacion.Habitacion
ADD CONSTRAINT FK_Habitacion_Sector 
    FOREIGN KEY (idSector) 
    REFERENCES Internacion.Sector(idSector)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

GO

-- Cama

ALTER TABLE Internacion.Cama
ADD CONSTRAINT FK_Cama_Habitacion 
    FOREIGN KEY (idHabitacion) 
    REFERENCES Internacion.Habitacion(idHabitacion)
    ON DELETE CASCADE;

GO

-- Internacion

ALTER TABLE Internacion.Internacion
ADD CONSTRAINT FK_Internacion_Medico 
    FOREIGN KEY (matricula) 
    REFERENCES Internacion.Medico(matricula)
    ON DELETE CASCADE;

ALTER TABLE Internacion.Internacion
ADD CONSTRAINT FK_Internacion_Paciente 
    FOREIGN KEY (dni) 
    REFERENCES Internacion.Paciente(dni)

GO

-- Ubicada En

ALTER TABLE Internacion.UbicadaEn
ADD CONSTRAINT FK_UbicadaEn_Cama 
    FOREIGN KEY (idHabitacion, nroCama) 
    REFERENCES Internacion.Cama(idHabitacion, nroCama)
    ON DELETE CASCADE;

ALTER TABLE Internacion.UbicadaEn
ADD CONSTRAINT FK_UbicadaEn_Internacion 
    FOREIGN KEY (idInternacion) 
    REFERENCES Internacion.Internacion(idInternacion)
    ON DELETE CASCADE;

GO

-- Vacacion

ALTER TABLE Internacion.Vacacion
ADD CONSTRAINT FK_Vacacion_Medico 
    FOREIGN KEY (matricula) 
    REFERENCES Internacion.Medico(matricula)
    ON DELETE CASCADE;

GO

-- Recorrido

ALTER TABLE Seguimiento.Recorrido
ADD CONSTRAINT FK_Recorrido_Ronda 
    FOREIGN KEY (idRonda) 
    REFERENCES Seguimiento.Ronda(idRonda)
    ON DELETE CASCADE;

ALTER TABLE Seguimiento.Recorrido
ADD CONSTRAINT FK_Recorrido_Medico 
    FOREIGN KEY (matricula) 
    REFERENCES Internacion.Medico(matricula)
    ON DELETE CASCADE;

GO

-- Comentada durante

ALTER TABLE Seguimiento.ComentadaDurante
ADD CONSTRAINT FK_CD_Internacion 
    FOREIGN KEY (idInternacion) 
    REFERENCES Internacion.Internacion(idInternacion)
    ON DELETE CASCADE;

ALTER TABLE Seguimiento.ComentadaDurante
ADD CONSTRAINT FK_CD_Ronda 
    FOREIGN KEY (idRonda) 
    REFERENCES Seguimiento.Ronda(idRonda)
    ON DELETE CASCADE;

GO

-- Forma parte de

ALTER TABLE Seguimiento.FormaParteDe
ADD CONSTRAINT FK_FPD_Habitacion 
    FOREIGN KEY (idHabitacion) 
    REFERENCES Internacion.Habitacion(idHabitacion)
    ON DELETE CASCADE;

ALTER TABLE Seguimiento.FormaParteDe
ADD CONSTRAINT FK_FPD_Ronda 
    FOREIGN KEY (idRonda) 
    REFERENCES Seguimiento.Ronda(idRonda)
    ON DELETE CASCADE;

GO

-- Cubre

ALTER TABLE Guardias.Cubre
ADD CONSTRAINT FK_Cubre_ME 
    FOREIGN KEY (idEsp, matricula) 
    REFERENCES Guardias.MedicoEspecializado(idEsp, matricula);

ALTER TABLE Guardias.Cubre
ADD CONSTRAINT FK_Cubre_Guardia 
    FOREIGN KEY (idGuardia) 
    REFERENCES Guardias.Guardia(idGuardia);

GO

-- 
