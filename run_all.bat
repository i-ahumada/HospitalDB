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
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "05_constraints\foreign_keys.sql"

echo ========================================
echo CARGANDO DATOS INICIALES
echo ========================================
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "06_data\carga.sql"

echo ========================================
echo APLICANDO PROCEDURES
echo ========================================
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "08_procedures\cant_camas_disponibles_procedure.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "08_procedures\comentarios_procedure.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "08_procedures\consultar_auditorias_procedure.sql"
sqlcmd -S %SERVER% %AUTH% -d %DATABASE% -i "08_procedures\detalle_camas_disponibles_procedure.sql"

echo ========================================
echo TODO FINALIZADO EXITOSAMENTE
echo ========================================
pause
