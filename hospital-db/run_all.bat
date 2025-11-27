@echo off
REM ======================================================
REM Script: run_all.bat
REM Descripción: Ejecuta todos los scripts .sql en orden
REM Requiere: SQLCMD (incluido con SQL Server)
REM ======================================================

REM Cambiar estos valores si tu base de datos o servidor tienen otro nombre
SET SERVER=.
SET DATABASE=Hospital
SET AUTH=-E

echo ========================================
echo CREANDO BASE DE DATOS
echo ========================================
sqlcmd -S %SERVER% %AUTH% -i "01_create_database.sql"

echo ========================================
echo CREANDO TIPOS PERSONALIZADOS
echo ========================================
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "02_user_types\personalized_types.sql"

echo ========================================
echo CREANDO SCHEMAS
echo ========================================
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "03_schemas\auditoria_schema.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "03_schemas\guardias_schema.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "03_schemas\internacion_schema.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "03_schemas\seguimiento_schema.sql"

echo ========================================
echo CREANDO TABLAS
echo ========================================
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "04_tables\01_persona.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "04_tables\02_paciente.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "04_tables\03_medico.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "04_tables\04_especializacion.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "04_tables\05_medico_especializado.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "04_tables\06_sector.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "04_tables\07_habitacion.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "04_tables\08_cama.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "04_tables\09_internacion.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "04_tables\10_ubicada_en.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "04_tables\11_vacacion.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "04_tables\12_ronda.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "04_tables\13_recorrido.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "04_tables\14_comentada_durante.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "04_tables\15_forma_parte_de.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "04_tables\16_guardia.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "04_tables\17_cubre.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "04_tables\18_log_guardias.sql"

echo ========================================
echo APLICANDO CONSTRAINTS
echo ========================================
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "05_constraints\00_foreign_keys.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "05_constraints\01_checks.sql"

echo ========================================
echo APLICANDO TRIGGERS
echo ========================================
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "06_triggers\01_TR_Internacion_FechaFin.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "06_triggers\02_TR_UbicadaEn_FechaAsignacion.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "06_triggers\03_TR_Habitacion_Orientacion.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "06_triggers\04_TR_Internacion_DistintoPacienteYMedico.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "06_triggers\05_TR_Cubre_LogGuardias.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "06_triggers\06_TR_Recorrido_Fecha_IoU.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "06_triggers\08_TR_Cubre_TomaGuardia_MaxGuardias.sql"

echo ========================================
echo CARGANDO DATOS INICIALES
echo ========================================
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "07_data\00_carga.sql"

echo ========================================
echo APLICANDO PROCEDURES
echo ========================================
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "08_procedures\00_SP_cant_camas_disponibles.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "08_procedures\01_SP_comentarios.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "08_procedures\02_SP_consultar_auditorias.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "08_procedures\03_SP_detalle_camas_disponibles.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "08_procedures\04_SP_modificar_fecha_recorridos.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "08_procedures\05_SP_procentaje_camas_disponibles.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "06_triggers\07_TR_Recorrido_Fecha_IoI.sql"

echo ========================================
echo TODO FINALIZADO EXITOSAMENTE
echo ========================================
pause
