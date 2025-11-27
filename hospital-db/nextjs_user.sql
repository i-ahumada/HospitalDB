USE master;
GO

CREATE LOGIN hospital_user WITH PASSWORD = 'Hospital2025!';

GO

USE Hospital;
GO

CREATE USER hospital_user FOR LOGIN hospital_user;
ALTER ROLE db_owner ADD MEMBER hospital_user;
GO
